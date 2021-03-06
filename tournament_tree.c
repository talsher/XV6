#include "tournament_tree.h"
#include "types.h"
#include "user.h"


struct trnmnt_node* tree_alloc(int depth, struct trnmnt_node* parent)
{
    // is leaf
    if(depth == 0){
        struct trnmnt_node *leaf = malloc(sizeof (struct trnmnt_node));
        leaf->mutex = -1;
        leaf->parent = parent;
        leaf->right = 0;
        leaf->left = 0;
        leaf->id_owner = -1;
        return leaf;
    }

    struct trnmnt_node *node = malloc(sizeof (struct trnmnt_node));
    node->mutex = kthread_mutex_alloc();
    if(node->mutex == -1){
        ///error - free all the tree
        //return 0;
        printf(1, "no mutex\n");
    }
    node->parent = parent;
    node->id_owner = -1;
    node->right = tree_alloc(depth-1, node);
    node->left = tree_alloc(depth-1, node);

    return node;
}
/* Allocates a new tournament tree lock and initializes it. 
The function returns a pointer to the initialized tree,
 or 0 upon failure. Depth indicates the depth of the tree,
  at least 1. As such the tree can accommodate 2^depth threads. */
struct trnmnt_tree* trnmnt_tree_alloc(int depth)
{
    if(depth <= 0 || depth > MAX_DEPTH)
        return 0;    

    int tree_mutex = kthread_mutex_alloc(); 
    if(tree_mutex < -1)
        return 0;

    struct trnmnt_tree* tree = malloc(sizeof (struct trnmnt_tree)) ;
    
    tree->main_mutex = tree_mutex;
    tree->depth = depth;
    tree->root = tree_alloc(tree->depth, 0);
    return tree;
}

// check if tree is empty (no threads)
int is_empty(struct trnmnt_node* tree)
{
    if(tree == 0)
        return 1;
    if(tree->id_owner != -1)
        return is_empty(tree->right) && is_empty(tree->left);
    
    return 0;
}

int tree_dealloc(struct trnmnt_node* tree)
{
    if(tree == 0)
        return 0;
    kthread_mutex_dealloc(tree->mutex);
    tree_dealloc(tree->right);
    tree_dealloc(tree->left);
    free(tree);
    return 0;
}

/*
De-allocates the tournament tree lock, which is no longer needed. Returns 0 upon success and -1 upon
failure (e.g., if there are threads waiting).
*/
int trnmnt_tree_dealloc(struct trnmnt_tree* tree)
{
    if(!is_empty(tree->root))
        return -1;
    
    kthread_mutex_lock(tree->main_mutex);
    tree_dealloc(tree->root);
    kthread_mutex_unlock(tree->main_mutex);

    kthread_mutex_dealloc(tree->main_mutex);
    free(tree);
    return 0;
}


int pow(int num, int n) // num^n
{
    if(n == 0)
        return 1;
    for(;n>1;n--){
        num *= num;
    }
    return num;
}

struct trnmnt_node* add_thread(struct trnmnt_node* root, int hight, int ID)
{
    if(root->right == 0 && root->left == 0) //leaf
    {
        if(root->id_owner != -1)
            return 0;
        
        root->id_owner = ID;
        return root;
    }
    //printf(1, "pow %d %d\n", hight, pow(2, hight-1));

    if(pow(2, hight-1) <= ID){ // 2^hight-1 <= ID , go to right
        //printf(2, "right acq id: %d\n\n\n", ID);
        return add_thread(root->right, hight-1, ID - pow(2, hight-1));
    }
    else{
        //printf(2, "left acq id: %d\n\n\n", ID);
        return add_thread(root->left, hight-1, ID);
    }
}

/*
This function is used by a thread to lock the tree specified by the argument trnmnt tree. ID indicates
the ID of the lock acquirer thread, a number between 0 and 2^ depth − 1. It is not necessarily the Thread ID.
There should be no 2^depth threads in the tree with the same ID
*/
int trnmnt_tree_acquire(struct trnmnt_tree* tree,int ID)
{
    if(ID <0 || ID > pow(2, tree->depth) - 1)
        return -1;

    kthread_mutex_lock(tree->main_mutex);
    struct trnmnt_node* node = add_thread(tree->root, tree->depth, ID);
    kthread_mutex_unlock(tree->main_mutex);
    if(!node){ 
        //printf(1, "null\n");
        return -1;
    }

    node = node->parent;
    while(node != 0) {
        //  kthread_mutex_lock(0);
        // printf(2, "\n%d waiting for %d\n", ID, node->id_owner);
        // kthread_mutex_unlock(0);
        kthread_mutex_lock(node->mutex);
        node->id_owner = ID;
        node = node->parent;
    }
    //printf(2, "the winner is --- %d\n", tree->root->id_owner);
    return 0;
    
}


void release_thread(struct trnmnt_node* root, int hight, int ID, int originalID)
{

    if(root->right == 0 && root->left == 0) //leaf
    {
        root->id_owner = -1;
        return;
    }

    if(root->id_owner == originalID){
        root->id_owner = -1;
        kthread_mutex_unlock(root->mutex);
        //  kthread_mutex_lock(0);
        // printf(2, "free mutex, owner id was: %d \n", originalID);
        //  kthread_mutex_unlock(0);
    }

   
    if(pow(2, hight-1) <= ID){ // 2^hight-1 <= ID , go to right
        //printf(1, "right child \n");
        release_thread(root->right, hight-1, ID - pow(2, hight-1), originalID);

    }
    else{
        //printf(1, "left child \n");
        release_thread(root->left, hight-1, ID, originalID);
    }
}

/*
This function is used by a thread to release the tree specified by the argument trnmnt tree. ID indicates
the ID of the lock acquirer thread, a number between 0 and 2^depth − 1. It should be the same as the one
used by the thread in acquiring the lock.
*/
int trnmnt_tree_release(struct trnmnt_tree* tree,int ID)
{
    if(ID <0 || ID > pow(2, tree->depth) - 1){
        return -1;
    }
        

    release_thread(tree->root, tree->depth, ID, ID);
    return 0;
}