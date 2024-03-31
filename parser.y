%{
    #include <stdio.h>
    #include <stdlib.h>
    extern int yylex();
    int yyerror(char* s);
    #include<string.h>

  extern int search_symbol_table(char *name);
  extern void add_to_symbol_table(char *name, int type);
  extern void displaySymbolTable();

  typedef struct {
    char* strval;
    int intval;
  } YYSTYPE;
  #define YYSTYPE_IS_DECLARED

%}

%name myparser  // this will fix the error : parser.y:98 parser name defined to default :"parse"

%union {
  int intval;
  char* strval;
}

// %type <intval> NUMBER

%token LET            //Immutable variable declaration with type annotation     let x: i32 = 42;
%token MUT            //Mutable variable declaration without initialization let mut z;

%token ENUM
%token EXTERN         //EXTERN: This keyword is often used to declare functions or variables that are implemented outside the current source code file. 
%token IMPL
%token MATCH          //MATCH:This keyword is used for pattern matching in Rust
%token PUB
%token REF
%token RETURN
%token SELF
%token STATIC
%token SUPER
%token TRAIT
%token TYPE
%token UNSAFE
%token WHERE
%token ASYNC
%token AWAIT
%token USE           // you use the use keyword to import items (functions, types, constants, etc.)
%token MOD          //Importing the module mod my_module;

%token MAIN
%token FN
%token PRINTLN
%token STRINTERPOLATION   // The {} syntax you're referring to is part of Rust's string formatting mechanism.     println!("Hello, {}! You are {} years old.", name, age);


%token TRUE  
%token FALSE

%token ID               // Identifier (Variable name)
%token  INT              // integer type (i32)
%token FLOAT              // let float: f64 = 3.14;
%token BOOL             // Boolean type (bool)
%token STRUCT           // allows to create custom data types

%token STRING
%token <intval> NUMBER           // NUMBER from 0-9
%token ARRAY

%token STRSLICE              // String type(&str)
%token ARROW            // single arrow to specify the return type(->)


%token IF
%token ELSE

%token LOOP             // Loop: Executes a block of code indefinitely until explicitly exited using a break 
%token WHILE                // while loop   
%token FOR                // for in loop
%token IN
%token BREAK
%token CONTINUE
%token AS

// LOGICAL OPERATORS IN Rust

%token LOGICALNOT              // Logical NOT operator(!)
%token LOGICALAND               // Logical AND &&
%token LOGICALOR                 // Logical OR ||

// ARITHMETIC OPERATORS IN Rust

%token ADD              // Addition operator +
%token SUBTRACT        // Subtraction operator -
%token MULTIPLY        // Multiplication operator *
%token DIVIDE           // Division operator /
%token ASSIGN           // Assignment operator =
%token REMAINDER              // REMAINDER operator %
%token ADDEQ          // Addition and Assignment +=
%token SUBTRACTEQ       // Subtraction and Assignment -=
%token MULTIPLYEQ         // Multiplication and Assignment *=
%token DIVIDEEQ         //Division and Assignment /= 
%token REMAINDEREQ            //Remainder and Assignment %=

// CONDITIONAL OPERATORS IN Rust
%token EQUALTO          //Equal to == Returns true if the operands are equal, otherwise returns false.
%token NOTEQUALTO       //Not equal to != Returns true if the operands are not equal, otherwise returns false.
%token GT               //Greater than > Returns true if the left operand is greater than the right operand, otherwise returns false.
%token GTEQ             //Greater than or equal to >= Returns true if the left operand is greater than or equal to the right operand, otherwise returns false.
%token LT                //Less than < Returns true if the left operand is less than the right operand, otherwise returns false.
%token LTEQ             // Less than or equal to <= Returns true if the left operand is less than or equal to the right operand, otherwise returns false.

%token SEMICOLON        // Semicolon ;
%token COMMA            // comma ,
%token PERIOD           // PERIOD .
%token COLON            // COLON :
%token QUESTION_MARK    // QUESTION_MARK ?

%token LPAREN           // Left parenthesis (
%token RPAREN           // Right parenthesis )
%token LBRACE           // Left brace {
%token RBRACE           // Right brace }
%token LSQUAREBRAC      // Left square bracket [
%token RSQUAREBRAC      // Right square bracket ]

%token COMMENT        // comment //

%%
start: import_module program ;
import_module: USE ID COLON COLON ID SEMICOLON| USE ID COLON COLON ID AS ID SEMICOLON | {printf("importing modules.\n")};
program: main_function | main_function function ;

main_function:FN MAIN LPAREN RPAREN function_body {printf("main function declaration.\n")};

function:FN ID LPAREN parameter RPAREN return_value  function_body  function
        | {printf("function declaration.\n")}
        ;

comma: COMMA | ;
return_value:ARROW return_type | ;

function_body:block;

block: LBRACE expression RBRACE | LBRACE statements RBRACE | LBRACE RBRACE;

statements: var_decl statements {printf("variable declaration\n");}
          | print_stmt statements {printf("print statement.\n");}
          | if_statement statements {printf("if statement.\n");}
          | if_else_statement statements {printf("if else statement.\n");}
          | loop_statement {printf("loop statement\n")}
          | for_loop_statement {printf("for loop statement\n");}
          | while_loop_statement {printf("while loop statement\n");}
          | RETURN expression SEMICOLON {printf("return statement.\n");}
          |;  // | println!("Hello!");

print_stmt: PRINTLN LPAREN operand COMMA operand RPAREN SEMICOLON print_stmt
          | PRINTLN LPAREN operand RPAREN SEMICOLON print_stmt // | println!("Hello!");
          |; 

var_decl: LET ID ASSIGN expression SEMICOLON var_decl  //let x = 1 + 2;
        | LET ID SEMICOLON var_decl                     // let name;
        | LET ID COLON return_type SEMICOLON  // let sum: i32 ;
        | LET ID COLON return_type ASSIGN expression SEMICOLON //  let id : i32 = 1 + 3;
        | LET ID ASSIGN operand SEMICOLON var_decl    // let name = 10;
        | LET ID ASSIGN expression var_decl    // let name = 10;
        | ;

return_type: INT
          | FLOAT
          | BOOL 
          | STRSLICE
          | LPAREN RPAREN
          |;

if_statement: IF expression block if_statement| ;

if_else_statement: if_statement ELSE block if_else_statement | ;

loop_statement: LOOP block loop_statement | ;

while_loop_statement: WHILE expression block while_loop_statement | ;

for_loop_statement: FOR ID IN expression block for_loop_statement | ;

expression: operand operator operand expression  // 1 + 4
          | operand operator operand operator operand expression; // 1 + 4 == 5

          | ID LPAREN parameter RPAREN SEMICOLON //greet("allice");
          | ID LPAREN parameter RPAREN   //is_even(number)

          | ID LPAREN RPAREN SEMICOLON {printf("function call.\n");}   //is_even();
          | ID LPAREN RPAREN   //is_even()

          | ID PERIOD ID LPAREN  RPAREN SEMICOLON  // array.slice();
          | ID PERIOD ID LPAREN  RPAREN   // array.slice()

          | ID PERIOD ID LPAREN parameter RPAREN SEMICOLON// array.slice(1, 5);
          | ID PERIOD ID LPAREN parameter RPAREN // array.slice(1, 5)

          | ARRAY
          | operand
          | ;

parameter: ID COLON return_type comma parameter //add(x: i32, y: i32) 
         | ID COLON return_type //add(x: i32)
         | operand COMMA operand // add(3, 4)
         | operand // add(3)
         | operand COMMA parameter // add(3, 4, 3)
         | ;

operand: ID 
    | NUMBER { 
                char buf[16];
                sprintf(buf, "%d", $1);
            }
    | BOOL | STRING;

operator: LOGICALNOT | LOGICALAND | LOGICALOR | ADD | SUBTRACT | MULTIPLY | DIVIDE | REMAINDER | ADDEQ | SUBTRACTEQ
        | MULTIPLYEQ | DIVIDEEQ | REMAINDEREQ | EQUALTO |NOTEQUALTO | GT | GTEQ | LT | LTEQ | ASSIGN;

%%


int main(int argc, char *argv[]) {
  extern FILE *yyin;
  yyin = fopen( argv[1], "r");

  if (yyin == NULL) {
      perror("Error opening file");
      return 1;
  }

  yyparse ();

  fclose(yyin);
  return 0;
}

int yyerror(char *s){
    extern int yylineno;
    fprintf(stderr,"Error occured at line %d: %s\n",yylineno,s);
    return 0;
}