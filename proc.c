#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"
#include "kthread.h"

struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

struct kthread_mutex_t{
        struct spinlock lock;
        struct thread* lock_owner;
        enum mutex_state state;
};

struct spinlock mutexes_lock;
struct kthread_mutex_t mutexes[MAX_MUTEXES];

static struct proc *initproc;

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

void
pinit(void)
{
  initlock(&ptable.lock, "ptable");
  initlock(&mutexes_lock, "mutex lock");
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
}

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
  c = mycpu();
  p = c->proc;
  popcli();
  return p;
}

struct thread*
mythread(void) {
  struct cpu *c;
  struct thread *t;
  pushcli();
  c = mycpu();
  t = c->thread;
  popcli();
  return t;
}

void
update_proc_state(struct proc* p)
{
  for(struct thread* t = p->threads ; t < &(p->threads[NTHREAD]); t++){
    if(t->state == RUNNING){
      p->state = RUNNING;
      return;
    }
  }
  p->state = RUNNABLE;  
}

//PAGEBREAK: 32
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
  struct proc *p;
  struct thread *t;
  char *st;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
  for (int i = 0 ; i<NTHREAD ; i++){
    p->threads[i].state = UNUSED;
  }
  t = p->threads; //t points to the first thread in the array
  t->parent = p;
  t->state = EMBRYO;
  t->tid = p->pid * 100;

  release(&ptable.lock);

  // Allocate kernel stack.
  if((t->kstack = kalloc()) == 0){
    t->state = UNUSED;
    return 0;
  }
  st = t->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  st -= sizeof *t->tf;
  t->tf = (struct trapframe*)st;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  st -= 4;
  *(uint*)st = (uint)trapret;

  st -= sizeof *t->context;
  t->context = (struct context*)st;
  memset(t->context, 0, sizeof *t->context);
  t->context->eip = (uint)forkret;

  return p;
}

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
  struct proc *p;
  struct thread *t;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
  t = p->threads;

  //cprintf("\nthread tid %d\n\n", t->tid);

  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(t->tf, 0, sizeof(*t->tf));
  t->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  t->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  t->tf->es = t->tf->ds;
  t->tf->ss = t->tf->ds;
  t->tf->eflags = FL_IF;
  t->tf->esp = PGSIZE;
  t->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  p->state = RUNNABLE;
  t->state = RUNNABLE;

  release(&ptable.lock);
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc, mythread());
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
  int i, pid;
  struct proc *np;
  struct thread *nt;
  struct proc *curproc = myproc();
  struct thread *curthread = mythread();
  //cprintf("forking %s", curproc->name);

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
  }
  nt = np->threads;

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(nt->kstack);
    nt->kstack = 0;
    np->state = UNUSED;
    nt->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
  np->parent = curproc;
  *nt->tf = *curthread->tf;

  // Clear %eax so that fork returns 0 in the child.
  nt->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  pid = np->pid;

  acquire(&ptable.lock);

  np->state = RUNNABLE;
  nt->state = RUNNABLE;

  release(&ptable.lock);

  return pid;
}

void
kill_single_thread(void)
{
  struct thread *curthread = mythread();
  if(curthread->killed){
    acquire(&ptable.lock);
    curthread->state = ZOMBIE;
    wakeup1(curthread);
    sched();
  }
}

void
exit_threads(void)
{
  struct thread *curthread = mythread();
  acquire(&ptable.lock);
  for(struct thread *t = curthread->parent->threads; t < &curthread->parent->threads[NTHREAD]; t++){
      if(t->state != ZOMBIE && t->state != UNUSED && t != curthread)
      {
          t->killed=1;
          if(t->state == SLEEPING)
            t->state=RUNNABLE;
      }
  }
  
  // im the last !
  for(struct thread *t = curthread->parent->threads; t < &curthread->parent->threads[NTHREAD]; t++){
    if(t->state != ZOMBIE && t->state != UNUSED && t != curthread){
      sleep(t, &ptable.lock);
    }
  }
  release(&ptable.lock);
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
  struct thread *curthread = mythread();
  struct proc *curproc = curthread->parent;
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");

  exit_threads();

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
      if(p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
  curthread->state = ZOMBIE;
  curthread->killed = 1;
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
  struct proc *p;
  struct thread *t;
  int havekids, pid;
  struct proc *curproc = myproc();
  //struct thread *curthread = mythread();
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        for(t = p->threads; t < &p->threads[NTHREAD]; t++){
          if(t->state != UNUSED){
            kfree(t->kstack);
            t->kstack = 0;
            t->state = UNUSED;
            t->killed = 0;
            t->tid = 0;
            t->parent = 0;
          }
        }
        

        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}

//PAGEBREAK: 42
// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
  struct proc *p;
  struct thread *t;
  struct cpu *c = mycpu();
  c->proc = 0;
  c->thread = 0;
  
  for(;;){
    // Enable interrupts on this processor.
    sti();
    //cprintf("wowwwww \n");
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != RUNNABLE && p->state != RUNNING)
        continue;
    //cprintf("***************** wowwwww \n");

    for(t = p->threads; t < &p->threads[NTHREAD]; t++){
          if(t->state != RUNNABLE)
            continue;
      //cprintf("***************** wowwwww \n");
        // Switch to chosen process.  It is the process's job
        // to release ptable.lock and then reacquire it
        // before jumping back to us.
        c->proc = p;
        c->thread = t;

        switchuvm(p, t);
        p->state = RUNNING;
        t->state = RUNNING;

        swtch(&(c->scheduler), t->context);
        switchkvm();

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->thread = 0;
        //cprintf("---------------- wowwwww \n");

      }
      c->proc = 0;
      //  cprintf("-++++++++++++++++++- wowwwww \n");

    }
    release(&ptable.lock);

  }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
  int intena;
  //struct proc *p = myproc();
  struct thread *t = mythread();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(t->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&t->context, mycpu()->scheduler);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  mythread()->state = RUNNABLE;
  update_proc_state(myproc());

  sched();
  release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  struct thread *t = mythread();
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  //p->chan = chan;
  //p->state = SLEEPING;
  //cprintf("sleep!\n");
  t->chan = chan;
  t->state = SLEEPING;
  update_proc_state(p);

  sched();

  // Tidy up.
  p->chan = 0;
  t->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    for(struct thread* t = p->threads ; t<&(p->threads[NTHREAD]); t++)
      if(t->state == SLEEPING && t->chan == chan){
        t->state = RUNNABLE;
      }
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}
          



// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}

//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
  static char *states[] = {
  [UNUSED]    "unused",
  [EMBRYO]    "embryo",
  [SLEEPING]  "sleep ",
  [RUNNABLE]  "runble",
  [RUNNING]   "run   ",
  [ZOMBIE]    "zombie"
  };
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)mythread()->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}











int 
kthread_create(void (*start_func)(), void* stack)
{
  struct proc* p = myproc();
  struct thread* newthread;
  struct thread* curthread=mythread();
  char* st;

  acquire(&ptable.lock);
  int i=0;
  for(newthread=p->threads;newthread<&p->threads[NTHREAD];newthread++ ){
    if(newthread->state == UNUSED || newthread->state == ZOMBIE)
    {
      if(newthread->state == ZOMBIE){
          kfree(newthread->kstack);
          newthread->kstack = 0;
      }

      newthread->parent = p;
      newthread->killed = 0;
      newthread->chan = 0;
      newthread->state = EMBRYO;
      newthread->tid = p->pid * 100 + i;
      //release(&ptable.lock);
      
      // Allocate kernel stack.
      if((newthread->kstack = kalloc()) == 0){
        newthread->state = UNUSED;
        return -1;
      }
      
      st = newthread->kstack + KSTACKSIZE;

      // Leave room for trap frame.
      st -= sizeof *newthread->tf;
      newthread->tf = (struct trapframe*)st;
      
      // copy TrapFrame
      *newthread->tf = *curthread->tf;
      newthread->tf->esp = (uint)stack;
      newthread->tf->ebp = (uint)stack;
      newthread->tf->eip = (uint)start_func;
      newthread->tf->eax = 0;

      // Set up new context to start executing at forkret,
      // which returns to trapret.
      st -= 4;
      *(uint*)st = (uint)trapret;

      st -= sizeof *newthread->context;
      newthread->context = (struct context*)st;
      memset(newthread->context, 0, sizeof *newthread->context);
      newthread->context->eip = (uint)forkret;

      //acquire(&ptable.lock);
      newthread->state = RUNNABLE;
      update_proc_state(p);
      release(&ptable.lock);

      return newthread->tid;
    }
     i++;
  }
  release(&ptable.lock);
  return -1;
}

int kthread_id()
{
  return mythread()->tid;
}

void kthread_exit()
{
  struct thread* curthread = mythread();
  struct proc* curproc = myproc();
  //cprintf("kthread_exit: %d\n", curthread->tid);
  acquire(&ptable.lock);
  int i=0;
  for(struct thread* t = curproc->threads ; t < &(curproc->threads[NTHREAD]); t++){
    // im not the only one running, so just kill myself
    if(t->state != ZOMBIE && t->state != UNUSED && t->killed != 1 && t != curthread){
      //cprintf("killing: %d\n", curthread->tid);
      curthread->killed = 1;
      release(&ptable.lock);
      return;
    }
    i++;
  }
  release(&ptable.lock);
  exit();
}

int kthread_join(int thread_id)
{
  struct proc* curproc = myproc();
  //cprintf("kthread_join: %d waiting for %d\n", mythread()->tid, thread_id);
  acquire(&ptable.lock);
  for(struct thread* t = curproc->threads ; t < &(curproc->threads[NTHREAD]); t++)
  {
    if(t->tid == thread_id){
      // if already zombie dont wait
      if(t->state == ZOMBIE){
        release(&ptable.lock);
        return 0;
      }
      // error thread doesnt exist
      if(t->state == UNUSED){
        release(&ptable.lock);
        return -1;
      }
      
      //sleep on thread until he exits
      sleep(t, &ptable.lock);
      //cprintf("%d is done, wakeup!", thread_id);
      release(&ptable.lock);
      return 0;
    }
  }
  // not found
  release(&ptable.lock);
  return -1;
}



int kthread_mutex_alloc()
{
  acquire(&mutexes_lock);
  int mutex_num = 0;

  for(struct kthread_mutex_t* mutex = mutexes ; mutex < &mutexes[MAX_MUTEXES]; mutex++){
    if(mutex->state == M_UNUSED)
    {
      mutex->lock_owner = 0;
      mutex->state = M_UNLOCK;
      release(&mutexes_lock);
      return mutex_num;
    }
    mutex_num++;
  }
  release(&mutexes_lock);
  return -1;
}


int kthread_mutex_dealloc(int mutex_id)
{
  struct kthread_mutex_t *mutex = &mutexes[mutex_id];
  
  // cant dealloc locked mutex
  if(mutex->state == M_LOCK)
    return -1;

  acquire(&mutexes_lock);
  mutex->state = M_UNUSED;
  mutex->lock_owner = 0;
  release(&mutexes_lock);
  return 0;
}

int kthread_mutex_lock(int mutex_id)
{
  struct kthread_mutex_t* mutex = &mutexes[mutex_id];
  while(1) //keep trying taking the lock
  {
    acquire(&mutexes_lock);

    if(mutex->state == M_UNUSED){
      release(&mutexes_lock);
      return -1;
    }else if(mutex->state == M_LOCK)
    {
      if(mutex->lock_owner == mythread()){
        release(&mutexes_lock);
        return -1;
      } else {
        sleep(mutex, &mutexes_lock);
        release(&mutexes_lock);
      }
    } else if(mutex->state == M_UNLOCK){
      mutex->state = M_LOCK;
      mutex->lock_owner = mythread();
//      acquire(&mutex->lock);
      release(&mutexes_lock);
      return 0;
    }
  }

}


//This function unlocks the mutex specified by the argument mutex id if called by the owning thread,
//upon unlocking a mutex one of the threads which are waiting for it will wake up and acquire it, we leave the
//waking up order to you, can be in any way you prefer
int kthread_mutex_unlock(int mutex_id)
{
  struct kthread_mutex_t *mutex = &mutexes[mutex_id];

  acquire(&mutexes_lock);

  if(mutex->state == M_UNUSED || mutex->state == M_UNLOCK){
    release(&mutexes_lock);
    return -1;
  }

  if(mutex->state == M_LOCK)
  {
    if(mutex->lock_owner != mythread()){
      release(&mutexes_lock);
      return -1;
    } else {
      mutex->state=M_UNLOCK;
      mutex->lock_owner = 0 ;
      release(&mutexes_lock);
      wakeup(mutex);
      return 0;
    }
  }

  //unreachable
  return -1;
}