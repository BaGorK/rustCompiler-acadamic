%{
    #include <stdio.h>
    extern int yylex();
    int yyerror(char* s);
    #include<string.h>
    void test_parser();
    int result;
%}
%token MAIN
%token FN
%token PRINTLN

%token ID

%token TRUE  
%token STRING

%token NOT              // Logical NOT operator

%token SEMICOLON        // Semicolon
%token SPACE

%token LPAREN           // Left parenthesis
%token RPAREN           // Right parenthesis
%token LBRACE           // Left brace
%token RBRACE           // Right brace

%token ANY_TYPE        // INCLUDES ANY TYPE LIKE BOOLEAN OR STRING OR NUMBER

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