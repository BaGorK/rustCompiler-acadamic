use my_module::my_function as func;
 
let someValue = "random";

// // // Function returning an integer
// fn add1(x: i32, y: i32) -> i32 {
//     let w;
//     let z = 4;
//     return x + y;
// }

fn main() {
    let num : i32 = 4 + 3;
    let name : i32 = someValue;

    let number = 2;
    // let b : bool;
    // let s : &str;
    // let f : f64;
    println!("name: {}", name);

    if number % 2 == 0 {
        let z;
        println!("{} is even.", number);
    } else {
        println!("{} is odd.", number);
    }
}

