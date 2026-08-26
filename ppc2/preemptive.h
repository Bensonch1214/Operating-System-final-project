#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4   /* maximum number of concurrent threads */

typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr fp);
void ThreadYield(void);
void ThreadExit(void);

#endif /* __PREEMPTIVE_H__ */