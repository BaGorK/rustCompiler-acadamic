// Scalar types
fn scalar_types() {
    // Integers
    let a: i32 = 42;
    let b: u64 = 123_456;
    let c = 99u8; // Type inference

    // Floating-point numbers
    let x = 3.14; // f64
    let y: f32 = 2.718; // f32

    // Boolean
    let is_rust_cool = true;
    let is_cold = false;

    // Characters
    let letter = 'A';
    let emoji = '😊';

    println!("Integers: {}, {}, {}", a, b, c);
    println!("Floating-point numbers: {}, {}", x, y);
    println!("Booleans: {}, {}", is_rust_cool, is_cold);
    println!("Characters: {}, {}", letter, emoji);
}

// Compound types
fn compound_types() {
    // Tuples
    let tuple: (i32, f64, char) = (42, 3.14, 'A');
    let (num, pi, letter) = tuple; // Destructuring tuple

    // Arrays
    let numbers = [1, 2, 3, 4, 5];
    let weekdays: [&str; 7] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

    println!("Tuple: ({}, {}, {})", num, pi, letter);
    println!("Array: {:?}", numbers);
    println!("Weekdays: {:?}", weekdays);
}

// Structs
struct Person {
    name: String,
    age: u32,
    is_adult: bool,
}

fn main() {
    scalar_types();
    compound_types();

    // Structs
    let person1 = Person {
        name: String::from("Alice"),
        age: 30,
        is_adult: true,
    };
    println!("Name: {}, Age: {}, Adult: {}", person1.name, person1.age, person1.is_adult);
}
