#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4   /* maximum number of concurrent threads */

typedef char ThreadID;
typedef void (*FunctionPtr)(void);

/*
 * CNAME(s): convert a C variable name to its assembler symbol.
 * SDCC prefixes globals with '_', so CNAME(foo) expands to _foo,
 * which is the name the assembler sees.
 */
#define CNAME(s) _ ## s

/*
 * SemaphoreCreate(s, n): initialise counting semaphore s to n.
 * A simple assignment is sufficient for the busy-wait version.
 */
#define SemaphoreCreate(s, n)  (s = (n))

/*
 * SemaphoreSignal(s): atomically increment semaphore s.
 * INC is a single 8051 instruction, so no race condition.
 */
#define SemaphoreSignal(s)         \
    {                              \
        __asm                      \
        INC CNAME(s)               \
        __endasm;                  \
    }

/*
 * SemaphoreWaitBody(S, label): busy-wait until S > 0, then decrement.
 * label must be unique per call site — use SemaphoreWait() below
 * which generates a unique label automatically via __COUNTER__.
 *
 * Logic:
 *   label:  ACC = S
 *           if ACC == 0  → jump back (zero means unavailable)
 *           if ACC < 0   → jump back (negative means unavailable)
 *           fall-through → S-- (acquired)
 */
#define SemaphoreWaitBody(S, label)  \
    {                                \
        __asm                        \
        label:                       \
        MOV  A, CNAME(S)             \
        JZ   label                   \
        JB   ACC.7, label            \
        DEC  CNAME(S)                \
        __endasm;                    \
    }

/*
 * SemaphoreWait(s): public API — busy-wait on semaphore s.
 *
 * Unique label generation:
 *   __COUNTER__ increments each time it is expanded.
 *   The ## operator concatenates tokens WITHOUT expanding macros first,
 *   so we need two levels of indirection:
 *     _SLABEL(x)        — level 1: pastes x and $ together
 *     _SLABEL_EXPAND(x) — level 2: forces __COUNTER__ to expand to a
 *                         number BEFORE it is handed to _SLABEL.
 *   Result: each SemaphoreWait call gets a label like 0$, 1$, 2$, ...
 *   which SDCC guarantees not to conflict with its own generated labels.
 */
#define _SLABEL(x)        x ## $
#define _SLABEL_EXPAND(x) _SLABEL(x)
#define SemaphoreWait(s)  SemaphoreWaitBody(s, _SLABEL_EXPAND(__COUNTER__))

ThreadID ThreadCreate(FunctionPtr fp);
void ThreadYield(void);
void ThreadExit(void);

#endif /* __PREEMPTIVE_H__ */