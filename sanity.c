#include "types.h"
#include "stat.h"
#include "user.h"
#include "kthread.h"

int lock=0;

void
thread_func()
{
    
    kthread_mutex_lock(lock);
    printf(2, "thread %d running\n", kthread_id());
    kthread_mutex_unlock(lock);
    
    kthread_exit();
}

int
main(int argc, char *argv[])
{

    int threads[10];
    char* stacks[10];
    for(int i=0;i<10;i++)
        stacks[i] = malloc(MAX_STACK_SIZE);


    lock = kthread_mutex_alloc();
    
    for(int i=0;i<5;i++)
    {
        for(int i=0;i<10;i++)
            threads[i] = kthread_create(thread_func, stacks[i]);

        for(int i=0;i<10;i++)
            kthread_join(threads[i]);
    }
    exit();
}
