
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

trnmnt_tree* trnmnt_tree_alloc(int depth);
int trnmnt_tree_dealloc(trnmnt_tree* tree);
int trnmnt_tree_acquire(trnmnt_tree* tree,int ID);
int trnmnt_tree_release(trnmnt_tree* tree,int ID);
