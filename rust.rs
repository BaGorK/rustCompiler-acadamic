use my_module::my_function as func;

//TODO:
let valId : &str = 5 + "str";
 

// // Function returning an integer
fn add1(x: i32, y: i32) -> i32 {
    let w;
    let z = 4;
    return x + y;
}


fn main() {
    let someValue: &str = "STRING VAL";
    //FIXME: Syntax Error occured at line 13: parse error
    let boolVar = true;
    let boolVar2 : bool = false;
    //TODO: ALSO FOR BOOLEAN ASSIGNMENT
    boolVar = "some";

    // let num : &str = someValue;
    let name : &str = someValue;

    let number = 2;
    let number2: i32 = 6;
    let b : bool;
    let special;
    let s : &str;
    let f : f64;
    let test = "num1";
    //TODO: TWO FEATURE REASSIGN A VARIABLE
    // AND CHECK IT'S DATA TYPE
    test = 4;

    //TODO: ALSO FOR BOOLEANS
    test = true;

    //TODO: ALSO FOR STRINGS
    test = "another";
    println!("name: {}", name);

    if number % 2 == 0 {
        let special;
        let z;
        println!("{} is even.", number);
    } else {
        println!("{} is odd.", number);
    }

    //TODO: CHECK DATA TYPE OF VARIABLE ASSIGNMENT
    // let adding = number * number2;
    // adding = 8;

    //TODO: DATA TYPE CHECK FOR DIFFERENT DATA TYPES IMPLEMENTED
    // let test = 4 + "num";

    let num = 4 + 3;

}
