%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <ctype.h>
    #include <regex.h>
    #include<string.h>
    extern int yylex();
    int yyerror(char* s);


  extern void add_to_symbol_table(char *name, char *kind, int tokentype,int line_number, char *datatype, char *value);
  extern void add_functions_to_symbol_table(char *name, char *kind, int tokentype,int line_number);
  extern int search_symbol_table(char *name, int scope, int scope_id);
  extern void update_assignment_values(char *name, char *newValue);
  extern char* compareDataType(char *id1, char *id2);
  extern char* search_by_name(char *name);
  extern   char* search_by_name_scope(char *name);

  extern int yylineno;
  extern int scope_count;
  extern int scope_count;
  extern int scope_id_count;

  struct check_type_entry {
    char value[40];
    char checkType[40];
  };

  extern struct check_type_entry check_table[300];
  extern int symbol_count_check_table ;

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

program: import_module var_decl  function;

import_module: USE ID COLON COLON ID SEMICOLON| USE ID COLON COLON ID AS ID SEMICOLON | ; // {printf("importing modules.\n")};

// main_function:FN MAIN LPAREN RPAREN block |  ; //{printf("main function declaration.\n")};

function:FN ID {
            add_functions_to_symbol_table($2, "function", ID, yylineno );
            } 
        LPAREN parameter RPAREN return_value  block  function

        // wrong
        | ID { printf("\n\n\nERROR Syntax Error Occured: You tried to declare a function without fn Keyword! at line num %d \t Please use fn before the function name.\n\n\n", yylineno); exit(1);} LPAREN parameter RPAREN return_value  block  function
        | FN  {printf("\n\n\nError Syntax Error Occured: You tried to declare a function with out a name.\n\n\n");exit(1);} LPAREN parameter RPAREN return_type block function
        | FN ID parameter RPAREN { printf("\n\n\nSyntax Error Occured: you are missing the left paranthesis at line num %d When declaring a function\n\n\n", yylineno); exit(1);} return_value  block    function 
        //FIXME: | FN ID LPAREN parameter {printf("\n\n\nSyntax Error Occured: you are missing the RIGHT paranthesis at line num %d When declaring a function\n\n\n", yylineno);exit(1);} return_value  block   function 
        |;


return_value:ARROW return_type 
            | return_type {printf("\n\n\n\nSYNTAX ERROR OCCURED: You are missing an arrow when adding a return type at line num %d.\n\n\n\n", yylineno); exit(1);}
            | ARROW {printf("\n\n\n\nSYNTAX ERROR OCCURED: You are missing a RETURN TYPE AFTER AN ARROW at line num %d.\n\n\n\n", yylineno); exit(1);}
            |  ;

block: LBRACE statements RBRACE 
      | LBRACE statements  {printf("\n\n\n\nSYNTAX ERROR OCCURED: You Are missing a Rignt brace in the block at line number %d\n\n\n", yylineno); exit(1);} 
      | statements RBRACE {printf("\n\n\n\nSYNTAX ERROR OCCURED: You Are missing a Left brace in the block at line number %d\n\n\n", yylineno); exit(1);} 
      |;

statements: var_decl statements// {printf("variable declaration\n");}
          | assignment statements
          | print_stmt statements// {printf("print statement.\n");}
          | if_statement statements// {printf("if statement.\n");}
          | if_else_statement statements// {printf("if else statement.\n");}
          | loop_statement statements// {printf("loop statement\n")}
          | for_loop_statement statements// {printf("for loop statement\n");}
          | while_loop_statement statements// {printf("while loop statement\n");}
          | RETURN expression SEMICOLON statements// {printf("return statement.\n");}
          | ID LPAREN parameter RPAREN SEMICOLON statements// {printf("function call statement.\n");}
          |;  // | println!("Hello!");

assignment: ID ASSIGN operand SEMICOLON {
  char *name1= strdup(search_by_name($1));
  if(strcmp(name1,"NULL") == 0){
      printf("\n\n\n\nVARIABLE NOT DECLARED ERROR: Variable %s is not declared at line number %d\n\n\n", $1, yylineno);
      exit(1);
  }
  update_assignment_values($1, $3);
}   | ID ASSIGN operand {printf("\n\n\n\nSYNTAX ERROR OCCURED: You Are missing a SEMICOLON  at line number %d  When assinging a value to a variable.\n\n\n", yylineno); exit(1);}
    | ASSIGN operand SEMICOLON {printf("\n\n\nSYNTAX ERROR OCCURED: You need to assign a value to a variable. This error occured at line number %d\n\n\n", yylineno); exit(1);}

    | ID ASSIGN TRUE SEMICOLON  {
          char *name1= strdup(search_by_name($1));
          if(strcmp(name1,"NULL") == 0){
              printf("\n\n\n\nVARIABLE NOT DECLARED ERROR: Variable %s is not declared at line num %d\n\n\n", $1, yylineno);
              exit(1);
          }
          update_assignment_values($1, "true");
        }
    | ID ASSIGN  {printf("\n\n\nSYNTAX ERROR OCCURED: You are missing a SEMICOLON. This error occured at line number %d\n\n\n", yylineno); exit(1);} TRUE

    | ID ASSIGN FALSE SEMICOLON  {
        char *name1= strdup(search_by_name($1));
        if(strcmp(name1,"NULL") == 0){
            printf("\n\n\n\nVARIABLE NOT DECLARED ERROR: Variable %s is not declared at line num %d\n\n\n", $1, yylineno);exit(1);
        }
        update_assignment_values($1, "false");
      };
    | ID ASSIGN FALSE {printf("\n\n\nSYNTAX ERROR OCCURED: You are missing a SEMICOLON When assinging a value to a variable. This error occured at line number %d\n\n\n", yylineno); exit(1);}

print_stmt: PRINTLN LPAREN STRING COMMA operand RPAREN SEMICOLON {
                char *name= strdup(search_by_name($5));
                if(strcmp(name,"NULL") == 0){
                    printf("\n\n\nVARIABLE NOT DECLARED ERROR: Variable %s is not declared at line num %d\n\n\n", $5, yylineno);
                    exit(1);
                }
}
          | PRINTLN LPAREN STRING RPAREN SEMICOLON 
          | PRINTLN LPAREN operand RPAREN SEMICOLON {
                char *name= strdup(search_by_name($3));
                if(strcmp(name,"NULL") == 0){
                    printf("\n\n\nVARIABLE NOT DECLARED Error: Variable %s is not declared at line num %d\n\n\n", $3, yylineno);
                    exit(1);
                }
              } // | println!("Hello!");
          | PRINTLN  {printf("\n\n\nSYNTAX ERROR OCCURED: you are missing a left parenthesis when using the println! function At line number %d\n\n\n", yylineno); exit(1);} STRING COMMA operand RPAREN SEMICOLON
          | PRINTLN LPAREN STRING  {printf("\n\n\nSYNTAX ERROR OCCURED: you are missing a Right parenthesis when using the println! function At line number %d\n\n\n", yylineno); exit(1);} SEMICOLON 
          | PRINTLN LPAREN STRING RPAREN  {printf("\n\n\nSYNTAX ERROR OCCURED: you are missing a SEMICOLON when using the println! function. At line number %d\n\n\n", yylineno); exit(1);}  
          | PRINTLN LPAREN ID RPAREN SEMICOLON{
            search_by_name_scope($3);
            }
          |; 

var_decl: LET ID  {add_to_symbol_table($2, "variable", ID, yylineno, "dynamic", ""); } SEMICOLON
        //wrong check
        | LET ID {printf("\n\nERROR OCCURED: There is a missing semicolon in the variable declaration at line num %d\n\n", yylineno); exit(1);} 
        | LET SEMICOLON {printf("\n\nERROR OCCURED: There is a missing ID | NAME in the variable declaration at line num %d\n\n", yylineno); exit(1);} 
        
        | LET ID ASSIGN TRUE SEMICOLON {add_to_symbol_table($2, "variable", ID, yylineno, "dynamic", "true");}

        | LET ID ASSIGN TRUE {printf("\n\nERROR OCCURED: There is a missing semicolon in the variable declaration at line num %d\n\n", yylineno); exit(1);}
        | LET  ASSIGN TRUE SEMICOLON {printf("\n\nERROR OCCURED: There is a missing ID in the variable declaration at line num %d\n\n", yylineno); exit(1);}

        | LET ID ASSIGN FALSE SEMICOLON {add_to_symbol_table($2, "variable", ID, yylineno, "dynamic", "true");}

        | LET ID ASSIGN FALSE {printf("\n\nERROR OCCURED: There is a missing semicolon in the variable declaration at line num %d\n\n", yylineno); exit(1);}
        | LET  ASSIGN FALSE SEMICOLON {printf("\n\nERROR OCCURED: There is a missing ID in the variable declaration at line num %d\n\n", yylineno); exit(1);}

        | LET ID COLON return_type ASSIGN TRUE SEMICOLON {add_to_symbol_table($2, "variable", ID, yylineno, $4, "true");}
        | LET ID COLON return_type ASSIGN TRUE {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing SEMICOLONG WHEN DECALRING A BOOLEAN VARIABLE. at line number %d\n\n\n", yylineno); exit(1);}
        | LET ID  return_type ASSIGN TRUE SEMICOLON {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing colon  When declaring a variable. at line number %d\n\n\n", yylineno); exit(1);}
        | LET ID COLON ASSIGN TRUE SEMICOLON {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing return type when declaring a variable. at line number %d\n\n\n", yylineno); exit(1);}
        | LET {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing ID / NAME when declaring a variable. at line number %d\n\n\n", yylineno); exit(1);} COLON ASSIGN TRUE SEMICOLON 
        
        | LET ID COLON return_type ASSIGN FALSE SEMICOLON {add_to_symbol_table($2, "variable", ID, yylineno, $4, "false");}
        | LET ID COLON return_type ASSIGN FALSE {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing missing SEMICOLONG when declaring a variable. at line number %d\n\n\n", yylineno); exit(1);}
        | LET ID  return_type ASSIGN FALSE SEMICOLON {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing colon  When declaring a variable. at line number %d\n\n\n", yylineno); exit(1);}
        | LET ID COLON ASSIGN FALSE SEMICOLON {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing return type when declaring a variable. at line number %d\n\n\n", yylineno); exit(1);}
        | LET {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing ID / NAME when declaring a variable. at line number %d\n\n\n", yylineno); exit(1);} COLON ASSIGN FALSE SEMICOLON 

        | LET ID ASSIGN operand {search_by_name_scope($4); add_to_symbol_table($2, "variable", ID, yylineno, "dynamic", $4);} SEMICOLON   // let name = 10;
        | LET ASSIGN operand {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing ID / NAME when declaring a variable. at line number %d\n\n\n", yylineno); exit(1);} SEMICOLON   // let name = 10;
        | LET ID ASSIGN operand {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing semicolon when declaring a variable. at line number %d\n\n\n", yylineno); exit(1);} 
        | LET ID operand {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing assign operator when declaring a variable. at line number %d\n\n\n", yylineno); exit(1);} SEMICOLON
        | LET ID ASSIGN {printf("\n\n\nSYNTAX ERROR OCCURED: there must be a variable to be assigned. at line number %d\n\n\n", yylineno); exit(1);} SEMICOLON

        | LET ID ASSIGN operand operator operand SEMICOLON 
         {

          char *name1= strdup(search_by_name($4));
          char *name2= strdup(search_by_name($6));

          // if $4 and $6 are Id, then they must be declared in the symbol table so I can compare their data type by using their check type
          char *data_type_of_operands = compareDataType($4, $6);
          if(strcmp(name1,"NULL") != 0,strcmp(name2,"NULL") != 0) {
            if (strcmp(data_type_of_operands, "") == 0) {
              printf("\n\nDATA TYPE MISMATCH ERROR: Data type of %s and %s does not match at line num %d. You tried to operate on two different data type values. \n\n", $4, $6, yylineno);
              exit(1);
            }
          }

          // check data type mismatch for values that are not IDs like let test = 4 + "str";
          if(strcmp(check_table[symbol_count_check_table - 2].value, $4) == 0 && strcmp(check_table[symbol_count_check_table - 1].value, $6) == 0 ) {
            // check if they have the same data type
            if(strcmp(check_table[symbol_count_check_table - 2].checkType, check_table[symbol_count_check_table - 1].checkType) != 0){              
              printf("\n\nDATA TYPE MISMATCH ERROR: You tried to operate on two different variables with a diferent data type.\tvalue one called \"%s\" with a data type of \"%s\" to an other value called \"%s\" with a data type \"%s\"\n\n\n\n",check_table[symbol_count_check_table - 2].value,check_table[symbol_count_check_table - 2].checkType,check_table[symbol_count_check_table - 1].value, check_table[symbol_count_check_table - 1].checkType );
               exit(1);
            }
          }
          // check if one of theme is a string => you cannot perform operations
          if(strcmp(check_table[symbol_count_check_table - 1].checkType, "String") == 0) {
            if(strcmp(check_table[symbol_count_check_table - 2].checkType, "String") == 0 ) {
              printf("\n\n\nhello\n\n\n");
              exit(1);
            }
          }

          add_to_symbol_table($2, "variable", ID, yylineno, "dynamic", "");
          }//let x = 1 + 2;

        | LET ID  COLON return_type SEMICOLON {add_to_symbol_table($2, "variable", ID, yylineno, $4, "");} // let sum: i32 ;
        | LET ID  COLON return_type {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing semicolon when declaring a variable. at line number %d\n\n\n", yylineno); exit(1);} 

        | LET ID  COLON return_type ASSIGN operand SEMICOLON  {
            add_to_symbol_table($2, "variable", ID, yylineno, $4, $6);
        }
        | LET ID  COLON return_type ASSIGN operand {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing semicolon when declaring a variable. at line number %d\n\n\n", yylineno); exit(1);} 
        | LET ID  COLON return_type ASSIGN expression SEMICOLON {add_to_symbol_table($2, "variable", ID, yylineno, $4, "");} //  let id : i32 = 1 + 3;
        | LET ID  COLON return_type ASSIGN expression {printf("\n\n\nSYNTAX ERROR OCCURED: There is a missing semicolon when declaring a variable. at line number %d\n\n\n", yylineno); exit(1);} 
        | LET ID ASSIGN ID LPAREN operand comma operand RPAREN SEMICOLON {
          
          //printf("\n\n\nfunction call\n");
          }
        |;
var_decl_wrong: 

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
         | ID COLON return_type comma {add_to_symbol_table($1, "parameter", ID, yylineno, $3, "");}  parameter  //add(x: i32, y: i32) 
         | ID  {add_to_symbol_table($1, "parameter", ID, yylineno, "dynamic", "");}  comma parameter // add(3, 4)
         | ;

operand:   ID {
                char *name1= strdup(search_by_name($1));
                if(strcmp(name1,"NULL") == 0){
                    printf("\n\n\nVARIABLE NOT DECLARED ERROR: Variable %s is not declared at line num %d\n\n\n", $1, yylineno);
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
    fprintf(stderr,"\n\n\n\nUNHANDLED SYNTAX ERROR OCCURED  AT LINE NUMBER %d: %s\n\n\n",yylineno,s);
    return 0;
}