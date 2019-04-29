#include "types.h"
#include "stat.h"
#include "user.h"
#include "kthread.h"
#include "tournament_tree.h"

int lock=0;
struct trnmnt_tree* tree = 0;
int ID = 0;
// void
// thread_func()
// {
    
//     kthread_mutex_lock(lock);
//     printf(2, "thread %d running\n", kthread_id());
//     kthread_mutex_unlock(lock);
    
//     kthread_exit();
// }

void
thread_func()
{
    int myid = 0;

    kthread_mutex_lock(lock);
    //printf(2, "thread ID %d\n", ID);
    myid = ID;
    ID++;
    
    kthread_mutex_unlock(lock);

    //trnmnt_tree_acquire(tree,myid);
    if(trnmnt_tree_acquire(tree,myid)==0){
        // kthread_mutex_lock(0);
        // printf(2, "acquire sucsses, thread %d running\n", myid);
        // kthread_mutex_unlock(0);
    }

//printf(2, "acquire sucsses, thread %d running\n", myid);
    //sleep(300);
    //trnmnt_tree_release(tree,myid);

    if(trnmnt_tree_release(tree,myid) == 0)
    {
        // kthread_mutex_lock(0);
        //     printf(2, "release sucsses, thread %d stopping\n", myid);
        //     kthread_mutex_unlock(0);
    }

    
    kthread_exit();
}

int
main(int argc, char *argv[])
{

    // int threads[10];
    // char* stacks[10];
    // for(int i=0;i<10;i++)
    //     stacks[i] = malloc(MAX_STACK_SIZE);


    lock = kthread_mutex_alloc();
    
    // for(int i=0;i<5;i++)
    // {
    //     for(int i=0;i<10;i++)
    //         threads[i] = kthread_create(thread_func, stacks[i]);

    //     for(int i=0;i<10;i++)
    //         kthread_join(threads[i]);
    // }
    tree = trnmnt_tree_alloc(5);
    if(!tree){
            printf(1, "alloc tree fail\n");

    }
    int num = 20;
    int threads[num];
    char* stacks[num];

    for(int i=0;i<num;i++)
        stacks[i] = malloc(MAX_STACK_SIZE);

    for(int i=0;i<num;i++){
        threads[i] = kthread_create(thread_func, stacks[i]);
        //printf(2, "thread: %d\n", threads[i]);
    }

    for(int i=0;i<num;i++)
        kthread_join(threads[i]);

    
    
//     trnmnt_tree_acquire(tree, 3);
//     printf(1, "here!\n");
//     trnmnt_tree_release(tree, 3);
// printf(1, "here!\n");
    trnmnt_tree_dealloc(tree);

    exit();
}
