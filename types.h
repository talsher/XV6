#pragma once

typedef unsigned int      uint;
typedef unsigned short  ushort;
typedef unsigned char    uchar;
typedef uint             pde_t;
typedef int            boolean;

struct perf {
int ctime;    // creating time
int ttime;    // terminate time
int stime;    // sleep time
int retime;   // runnable time
int rutime;   // running time
};



#define null 0

#ifndef __cplusplus

#define false 0
#define true 1

#endif