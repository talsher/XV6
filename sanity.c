#include "types.h"
#include "stat.h"
#include "user.h"

void
thread_func()
{
    printf(1, "new thread!\n");
}

int
main(int argc, char *argv[])
{
    char stack[100];

    kthread_create(thread_func, stack);

    sleep(30);
    exit();
}
