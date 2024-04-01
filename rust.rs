use my_module::my_function as func;

fn main() {
    let sum = add(3, 5);
    println!("Sum: {}", sum); // Output: Sum: 8

    let number = 7;
    if is_even(number) {
        println!("{} is even.", number);
    } else {
        println!("{} is odd.", number);
    } // Output: 7 is odd.

    // TODO
    let numbers = [1, 2, 3, 4, 5];
    
    // let numbers = [];

    for num in numbers.iter() {
        println!("Current number: {}", num);
    }
}

// Function returning an integer
fn add(x: i32, y: i32) -> i32 {
    return x + y;
}

// Function returning a boolean
/**
* MULTILINE COMMENTS
*/
fn is_even(num: i32) -> bool {
    num % 2 == 0 // Returns true if the number is even, false otherwise
}

// Function returning nothing (unit)
fn greet(name: &str) -> () {
    println!("Hello, {}!", name);
    // No return statement needed, or you can explicitly return ()
}
