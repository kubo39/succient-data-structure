extern crate bitwise;

use std::mem;
use bitwise::word::*;

const W: usize = mem::size_of::<u64>() * 8;

fn rank1(x: usize, i: usize) -> u32 {
    let z = x << (W - i);
    z.count_ones()
}

#[inline(never)]
fn select1(x: usize, i: usize) -> u32 {
    let z: usize = 1 << (i - 1);
    let y: usize = z.parallel_bits_deposit(x);
    y.trailing_zeros()
}

fn main() {
    let x = 0b00110011_00110011_00110011_00110011;

    for i in 1..=(mem::size_of::<usize>()) {
        println!("{} {}", i, rank1(x, i));
    }

    for i in 1..=(mem::size_of::<usize>()) {
        println!("{} {}", i, select1(x, i));
    }
}
