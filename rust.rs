// Function returning an integer
fn add(x: i32, y: i32) -> i32 {
    x + y // The last expression is implicitly returned
}

// Function returning a boolean
fn is_even(num: i32) -> bool {
    num % 2 == 0 // Returns true if the number is even, false otherwise
}

// Function returning nothing (unit)
fn greet(name: &str) -> () {
    println!("Hello, {}!", name);
    // No return statement needed, or you can explicitly return ()
}

fn main() {
    let sum = add(3, 5);
    println!("Sum: {}", sum); // Output: Sum: 8

    let number = 7;
    if is_even(number) {
        println!("{} is even.", number);
    } else {
        println!("{} is odd.", number);
    } // Output: 7 is odd.

    greet("Alice"); // Output: Hello, Alice!

    let numbers = [1, 2, 3, 4, 5];

    for num in numbers.iter() {
        println!("Current number: {}", num);
    }
}
