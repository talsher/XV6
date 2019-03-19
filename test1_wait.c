#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    int pid;
    int status=123123;
    if((pid = fork()) > 0){
        if(wait(&status) < 0)
            printf(1, "No children!\n");
        else
             printf(1, "Exit with %d\n", status);
    } else if(pid == 0){
        exit(10);
    } else {
         printf(1, "Error while fork\n");
    }
    exit(0);
}
