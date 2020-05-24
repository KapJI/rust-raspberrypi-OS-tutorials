// SPDX-License-Identifier: MIT OR Apache-2.0
//
// Copyright (c) 2018-2020 Andre Richter <andre.o.richter@gmail.com>

.section ".text._start"

.global _start

_start:
    @ mov     r9, #0x3f
    @ lsl     r9, r9, #8
    @ add     r9, #0x20
    @ lsl     r9, r9, #8
    @ add     r9, #0x10
    @ lsl     r9, r9, #8
    @ mov     r10, #0x52
    @ str     r10, [r9]
    @ str     r10, [r9]
    @ str     r10, [r9]
    @ b       1f
    ldr     r1, =_start     // Load address of function "_start()"
    mov     sp, r1          // Set start of stack to before our code, aka first
                            // address before "_start()"
    bl      runtime_init    // Jump to the "runtime_init()" kernel function
1:  wfe                     // We should never reach here. But just in case,
    b       1b              // park this core aswell
