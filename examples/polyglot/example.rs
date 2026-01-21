// A simple Rust function
// Rust ensures memory safety, so look for 'panic' checks in the IR!

#[no_mangle] // Keep the name 'add_numbers' in the LLVM IR
pub fn add_numbers(a: i32, b: i32) -> i32 {
    a + b
}

pub fn main() {
    let sum = add_numbers(5, 10);
    println!("Sum is: {}", sum);
}
