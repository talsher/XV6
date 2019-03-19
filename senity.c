#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
    int pid;
    if((pid=fork()) == 0 ){
        sleep(100); // wait to detach
    } else if (pid > 0){
        if(detach(pid)<0)
            printf(1, "Error!"); // Error because child exists
        else
            printf(1, "Chiled detached!");

        if(detach(pid)<0)
            printf(1, "Greate!");  // OK because child detached
    } else {
        printf(1, "Error fork");
        exit(1);
    }
    exit(0);
}
