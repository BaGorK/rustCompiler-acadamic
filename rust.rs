use my_module::my_function as func;


fn main() {
    let z : i32 = "name";

    let name = "bagor";
    let number = 2;
    let b : bool;
    let s : &str;
    let f : f64;
    println!("name: {}", name);
    // println!("name: {}", UN);

    if number % 2 == 0 {
        // let z;
        println!("{} is even.", number);
    } else {
        println!("{} is odd.", number);
    } // Output: 7 is odd.
}


// Function returning an integer
// fn add(x: i32, y: i32) -> i32 {
//     let w;
//         let x;


//     let z = 4;
//     return x + y;
// }

// // Function returning an integer
fn add1(x: i32, y: i32) -> i32 {
    let w;

    let z = 4;
    return x + y;
}

// Function returning a boolean

/**
*
*/
// fn is_even(num: i32) -> bool {
//     let sum3;
//     println!("{} is even.", sum);
//    return num % 2 == 0; // Returns true if the number is even, false otherwise
// }

// // Function returning nothing (unit)
// fn greet(name: &str) -> () {
//     println!("Hello, {}!", name);
//     // No return statement needed, or you can explicitly return ()
// }
