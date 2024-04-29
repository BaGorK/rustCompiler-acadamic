use my_module::my_function as func;

//TODO:
// let valId : &str = 5 + "str";


// let  N =  "n";
let m : &str;

// // Function returning an integer
fn add1 (x: i32, y: i32) -> i32 {
    println!("hello");
    let w;
    //let ;
    //let t
    let outofscope = 5;
    w = 4;

    // let e : i32 = true; data type mismatch;
    let  e: bool = false;

    let varR = 4;

    return x + y;
}


fn main() {
     // println!(outofscope);
     // let testing = outofscope;
    
    let valueOfAdd = add1(3, 4);
    
    // let boolVar = varR;
    let boolVar2 : bool = false;
    //TODO: ALSO FOR BOOLEAN ASSIGNMENT
    //boolVar2 = "some";
    
    // VARIABLE NOT DECLARED ERROR
    // let bool5 = unk;
    //someValue = fjadaf;
    let someValue = "val";

     let num : &str = someValue;
    let name : &str = someValue;

    // let test4 :i32 = 32;
    // let test5 :&str = "32";
    // let test6 =  test4 + test5;

    let number = 1;
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
    let str : &str;
   // let adding = str * number2;
    // adding = 8;

    //TODO: DATA TYPE CHECK FOR DIFFERENT DATA TYPES IMPLEMENTED
    // let test = 4 + "num";

    // let num =  5 / 4;
    // let test2 : bool = true;
    // let test1 : &str = "test";
    // let test3 = test1 + test2;
    //test2 = fja;
    

    //TODO: VARIABLE USAGE BEFORE INITIALIZATION
    //let random = str;
}
