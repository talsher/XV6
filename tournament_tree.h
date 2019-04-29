
struct trnmnt_tree {
    int main_mutex;
    struct trnmnt_node* root;
    int depth;
};


struct trnmnt_node {
    int mutex; //-1 for leaf
    struct trnmnt_node* parent;
    struct trnmnt_node* right;
    struct trnmnt_node* left;
    int id_owner;
};

#define MAX_DEPTH 6

struct trnmnt_tree* trnmnt_tree_alloc(int depth);
int trnmnt_tree_dealloc(struct trnmnt_tree* tree);
int trnmnt_tree_acquire(struct trnmnt_tree* tree,int ID);
int trnmnt_tree_release(struct trnmnt_tree* tree,int ID);
