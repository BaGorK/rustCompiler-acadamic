%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>
    #include <regex.h>
    #include<string.h>
    extern int yylex();
    int yyerror(char* s);


  extern void add_to_symbol_table(char *name, char *kind, int tokentype,int line_number, char *datatype);
  extern void add_functions_to_symbol_table(char *name, char *kind, int tokentype,int line_number);
  extern int search_symbol_table(char *name, int scope, int scope_id);
  extern char* search_by_name(char *name);

  extern int yylineno;
  extern int scope_count;
  extern int scope_count;
  extern int scope_id_count;

  extern FILE *yyin;
  extern int yylex();



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
%type <strval> return_type operand
%token <strval> STRING_LITERAL NUMBER ID

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

%token <strval> MAIN
%token FN
%token PRINTLN
%token STRINTERPOLATION   // The {} syntax you're referring to is part of Rust's string formatting mechanism.     println!("Hello, {}! You are {} years old.", name, age);


%token TRUE  
%token FALSE

%token <strval> INT              // integer type (i32)
%token <strval> FLOAT              // let float: f64 = 3.14;
%token <strval> BOOL             // Boolean type (bool)
%token STRUCT           // allows to create custom data types
%token STRINGK
%token <strval> STRING
%token <strval> ARRAY

%token <strval> STRSLICE         // String type(&str)
%token ARROW            // single arrow to specify the return type(->)


%token IF
%token ELSE

%token LOOP             // Loop: Executes a block of code indefinitely until explicitly exited using a break 
%token WHILE            // while loop   
%token FOR              // for in loop
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

%start program
%%

program: import_module statements  main_function  function;

import_module: USE ID COLON COLON ID SEMICOLON| USE ID COLON COLON ID AS ID SEMICOLON | ; // {printf("importing modules.\n")};

main_function:FN MAIN LPAREN RPAREN block |  ; //{printf("main function declaration.\n")};

function:FN ID {
            add_functions_to_symbol_table($2, "function", ID, yylineno );
            } 
        LPAREN parameter RPAREN return_value  block  function
        | // {printf("function declaration.\n")}
        ;

return_value:ARROW return_type | ;

block: LBRACE statements RBRACE;

statements: var_decl statements// {printf("variable declaration\n");}
          | print_stmt statements// {printf("print statement.\n");}
          | if_statement // {printf("if statement.\n");}
          | if_else_statement // {printf("if else statement.\n");}
          | loop_statement // {printf("loop statement\n")}
          | for_loop_statement // {printf("for loop statement\n");}
          | while_loop_statement // {printf("while loop statement\n");}
          | RETURN expression SEMICOLON // {printf("return statement.\n");}
          | ID LPAREN parameter RPAREN SEMICOLON statements// {printf("function call statement.\n");}
          |;  // | println!("Hello!");

print_stmt: PRINTLN LPAREN STRING COMMA operand RPAREN SEMICOLON {
                char *name= strdup(search_by_name($5));
                if(strcmp(name,"NULL") == 0){
                    printf("Error: Variable %s is not declared at line num %d\n", $5, yylineno);
                    exit(1);
                }
}
          | PRINTLN LPAREN STRING RPAREN SEMICOLON 
          | PRINTLN LPAREN operand RPAREN SEMICOLON {
                char *name= strdup(search_by_name($3));
                if(strcmp(name,"NULL") == 0){
                    printf("Error: Variable %s is not declared at line num %d\n", $3, yylineno);
                    exit(1);
                }
              } // | println!("Hello!");
          |; 

var_decl: LET ID  {add_to_symbol_table($2, "variable", ID, yylineno, "dynamic");} SEMICOLON
        | LET ID  {add_to_symbol_table($2, "variable", ID, yylineno, "dynamic");}  ASSIGN operand SEMICOLON   // let name = 10;
        | LET ID   {add_to_symbol_table($2, "variable", ID, yylineno, "dynamic");} ASSIGN expression SEMICOLON//let x = 1 + 2;                  // let name;
        | LET ID  COLON return_type SEMICOLON {add_to_symbol_table($2, "variable", ID, yylineno, $4);} // let sum: i32 ;
        | LET ID  COLON return_type ASSIGN STRING SEMICOLON  {
            //   regex_t regex;
            //   int reti;
            //   char msgbuf[100];
            //   /* Compile regular expression */
            //   reti = regcomp(&regex, "\\\".*\\\"", 0);
            //   if (reti) {
            //       fprintf(stderr, "Could not compile regex\n");
            //       exit(1);
            //   }
            //   /* Execute regular expression */
            // reti = regexec(&regex, $6, 0, NULL, 0); // 0 if string and 1 if not string
            // printf("%d\n",reti);
            // if (strcmp("i32",$4) == 0 && strcmp("\"num\"",$6) == 0 && !(reti == 0)) {
            //   printf("Type Error: at line num %d\n", yylineno);
            //   exit(1);
            // } else {
            //   printf("checked");
            // }
              printf("\n");
              add_to_symbol_table($2, "variable", ID, yylineno, $4);
        }//  let id : i32 = 1 + 3;
        | LET ID  COLON return_type ASSIGN expression SEMICOLON {add_to_symbol_table($2, "variable", ID, yylineno, $4);} //  let id : i32 = 1 + 3;
        ;

return_type:INT
          | FLOAT
          | BOOL 
          | STRSLICE
          | LPAREN RPAREN


if_statement: IF expression block| ;

if_else_statement: if_statement ELSE block | ;

loop_statement: LOOP block loop_statement | ;

while_loop_statement: WHILE expression block while_loop_statement | ;

for_loop_statement: FOR ID IN expression block for_loop_statement | ;

expression: operand operator operand  // 1 + 4
          | operand operator operand operator operand  // 1 + 4 == 5
          | operand LPAREN parameter RPAREN //greet("allice");
          | operand PERIOD operand LPAREN  RPAREN   // array.slice() // array.slice(1, 5)
          ;

parameter: operand comma // greet("allice", 30)
         | ID COLON return_type comma {add_to_symbol_table($1, "parameter", ID, yylineno, $3);}  parameter  //add(x: i32, y: i32) 
         | ID  {add_to_symbol_table($1, "parameter", ID, yylineno, "dynamic");}  comma parameter // add(3, 4)
         | ;

operand:   ID {
                char *name1= strdup(search_by_name($1));
                if(strcmp(name1,"NULL") == 0){
                    printf("Error: Variable %s is not declared at line num %d\n", $1, yylineno);
                    exit(1);
                }
}
         | NUMBER
         | STRING
         | BOOL
         |;

operator: LOGICALNOT | LOGICALAND | LOGICALOR | ADD | SUBTRACT | MULTIPLY | DIVIDE | REMAINDER | ADDEQ | SUBTRACTEQ
        | MULTIPLYEQ | DIVIDEEQ | REMAINDEREQ | EQUALTO |NOTEQUALTO | GT | GTEQ | LT | LTEQ | ASSIGN;

comma: COMMA | ;



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
    fprintf(stderr,"Syntax Error occured at line %d: %s\n",yylineno,s);
    return 0;
}