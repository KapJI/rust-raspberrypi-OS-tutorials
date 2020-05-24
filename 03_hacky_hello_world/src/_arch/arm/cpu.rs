// SPDX-License-Identifier: MIT OR Apache-2.0
//
// Copyright (c) 2018-2020 Andre Richter <andre.o.richter@gmail.com>

//! Architectural processor code.

// Assembly counterpart to this file.
global_asm!(include_str!("cpu.S"));

//--------------------------------------------------------------------------------------------------
// Public Code
//--------------------------------------------------------------------------------------------------

/// Pause execution on the core.
#[inline(always)]
pub fn wait_forever() -> ! {
    unsafe {
        loop {
            llvm_asm!("wfe"
                    :             // outputs
                    :             // inputs
                    :             // clobbers
                    : "volatile") // options
        }
    }
}

#[inline(always)]
pub fn insert_label() {
    unsafe {
        llvm_asm!("mov r2, #0x42"
                :             // outputs
                :             // inputs
                :             // clobbers
                : "volatile"); // options
    }
}
