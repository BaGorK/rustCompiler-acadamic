%{
    #include <stdio.h>
    extern int yylex();
    int yyerror(char* s);
    #include<string.h>
    void test_parser();
    int result;
%}

%name myparser  // this will fix the error : parser.y:98 parser name defined to default :"parse"

%token LET            //Immutable variable declaration with type annotation     let x: i32 = 42;
%token MUT            //Mutable variable declaration without initialization let mut z;

%token ENUM
%token EXTERN 
%token IMPL
%token MATCH
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
%token INT              // integer type (i32)
%token FLOAT
%token BOOL             // Boolean type (bool)
%token STRING
%token STRUCT           // allows to create custom data types

%token STR              // String type(&str)
%token ARROW            // single arrow to specify the return type(->)


%token IF
%token ELSE

%token LOOP             // Loop: Executes a block of code indefinitely until explicitly exited using a break 
%token WHILE                // while loop   
%token FOR                // for in loop
%token IN
%token BREAK
%token CONTINUE

%token LOGICALNOT              // Logical NOT operator(!)
%token LOGICALAND               // Logical AND &&
%token LOGICALOR                 // Logical OR ||

%token ADD              // Addition operator +
%token SUBTRACT        // Subtraction operator -
%token MULTIPLY        // Multiplication operator *
%token DIVIDE           // Division operator /
%token REMAINDER              // REMAINDER operator %
%token NEGATION         // Negation operator -
%token ADDEQ          // Addition and Assignment +=
%token SUBTRACTEQ       // Subtraction and Assignment -=
%token MULTIPLYEQ         // Multiplication and Assignment *=
%token DIVIDEEQ         //Division and Assignment /= 
%token REMAINDEREQ            //Remainder and Assignment %=

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

%token SLCOMMENT        // single line comment //
%token MLCOMMENT        // multiline comment /**/

%%

function:FN MAIN LPAREN RPAREN LBRACE  PRINTLN  LBRACE;

%%


int main(int argc, char *argv[]) {
  extern FILE *yyin;
  yyin = fopen( argv[1], "r");
  yyparse ();

  return 0;
}

int yyerror(char *s){
    extern int yylineno;
    fprintf(stderr,"Error occured at line %d: %s\n",yylineno,s);
    return 0;
}