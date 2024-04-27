use my_module::my_function as func;
 
let someValue: &str = "random";

// // Function returning an integer
fn add1(x: i32, y: i32) -> i32 {
    let w;
    let z = 4;
    return x + y;
}

fn main() {
    //TODO: Syntax Error occured at line 13: parse error
    let boolVar = true;
    let boolVar2 : bool = false;

    let num : &str = someValue;
    let name : &str = someValue;

    let number = 2;
    let b : bool;
    let s : &str;
    let f : f64;
    println!("name: {}", name);

    if number % 2 == 0 {
        let z;
        println!("{} is even.", number);
    } else {
        println!("{} is odd.", number);
    }
}

