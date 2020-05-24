// SPDX-License-Identifier: MIT OR Apache-2.0
//
// Copyright (c) 2018-2020 Andre Richter <andre.o.richter@gmail.com>

.section ".text._start"

.global _start

_start:
    ldr     r1, =_start     // Load address of function "_start()"
    mov     sp, r1          // Set start of stack to before our code, aka first
                            // address before "_start()"
    bl      runtime_init    // Jump to the "runtime_init()" kernel function
1:  wfe                     // We should never reach here. But just in case,
    b       1b              // park this core aswell
