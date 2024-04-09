%{
  #include "y.tab.h"
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>

  struct symbol_entry {
    char name[50];
    char data_type[20];
    int token_type;
    int lineno;

    int scope;
    int scope_id;
    // Add more attributes as needed
  };

  struct symbol_entry symbol_table[100];
  int symbol_count = 0; // Counter to track the number of entries in symbol table
  int scope_count = 0;
  int scope_id_count = 0;

void add_to_symbol_table(char *name, int type, int lineno) {
    strcpy(symbol_table[symbol_count].name, name);
    symbol_table[symbol_count].token_type = type;
    symbol_table[symbol_count].lineno = lineno;

    symbol_table[scope_count].scope = scope_count;
    symbol_table[scope_count].scope_id = scope_id_count;

    symbol_count++;
}

int search_symbol_table(char *name, int scope, int scope_id) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbol_table[i].name, name) == 0 
            && symbol_table[i].scope == scope 
            && symbol_table[i].scope_id == scope_id
            ) {
                return symbol_table[i].token_type; // Return token if found
            }
    }
    return -1; // Return -1 if not found
}

void displaySymbolTable() {
    // printf("------------------------------------------------------------------------------------------------------------\n");
    printf("-------------------------------------------SYMBOL TABLE--------------------------------------------------------------------------------------\n\n");
    printf("---------------------------------------------------------------------------------------------------------------------------------------------\n");
    printf("%-25s | %-25s | %-20s |%-15s |%-15s |%-15s\n", "| TOKEN NAME ", "| Type |", "Token Type |" , "Line Number |" , "Scope Number |", "Scope Id|");
    printf("----------------------------------------------------------------------------------------------------------------------------------------------\n");
    for (int i = 0; i < symbol_count; i++) {
     printf("| %-25s | %-25s | %-20d |%-15d |%-15d |%-15d |\n", symbol_table[i].name,     symbol_table[i].data_type, symbol_table[i].token_type, symbol_table[i].lineno, symbol_table[i].scope, symbol_table[i].scope_id);

    }
    printf("----------------------------------------------------------------------------------------------------------------------------------------------\n");
}


%}

%option yylineno

/* Definitions */
digit           [0-9]
letter          [a-zA-Z]
 
%%
"true" {return TRUE;}
"false" {return FALSE;}

"mut" {return MUT;}

"let" { strcpy(symbol_table[symbol_count].data_type, "variable declaration");  return LET;}
"main" {add_to_symbol_table(yytext, MAIN, yylineno); return MAIN;}
"fn" { strcpy(symbol_table[symbol_count].data_type, "function"); return FN;}
"use" {strcpy(symbol_table[symbol_count].data_type, "function"); return USE;}
"as" {strcpy(symbol_table[symbol_count].data_type, "variable"); return AS;}

"i32" {strcpy(symbol_table[symbol_count - 1].data_type, "integer number"); return INT;}
"f64" {strcpy(symbol_table[symbol_count - 1].data_type, "float point number"); return FLOAT;}
"bool" {strcpy(symbol_table[symbol_count - 1].data_type, "boolean variable"); return BOOL;}
"&str" {strcpy(symbol_table[symbol_count - 1].data_type, "string"); return STRSLICE;}

"pub" {return PUB;}
"return" {return RETURN;}
"enum" {return ENUM;}
"mod" {return MOD;}

"println!" {return PRINTLN;}

"if" {return IF;}
"else" {return ELSE;}

"loop" {return LOOP;}
"while" {return WHILE;}
"for" {return FOR;}
"in" {return IN;}
"break" {return BREAK;}
"continue" {return CONTINUE;}

"String" {return STRING; }

"->" {return ARROW;}

\[[^[\]]*\] {strcpy(symbol_table[symbol_count - 1].data_type, "array");  return ARRAY;}

{digit}+ {yylval.intval = atoi(yytext);  return NUMBER;}
{letter}((\_|\-)*{letter}|{digit})*  { yylval.strval = strdup(yytext);
                          int index = search_symbol_table(yytext,-1,-1);
                          if (index == -1) {
                              return ID;
                          }
                          else {
                              return ID;
                          }
                        }
                
\"[^\"]*\"      { return STRING;}


"!" {return LOGICALNOT;}
"&&" {return LOGICALAND;}
"||" {return LOGICALOR;}

"+" {return ADD;}
"-" {return SUBTRACT;}
"*" {return MULTIPLY;}
"/" {return DIVIDE;}
"=" {return ASSIGN;}
"%" {return REMAINDER;}

"+=" {return ADDEQ;}
"-=" {return SUBTRACTEQ;}
"*=" {return MULTIPLYEQ;}
"/=" {return DIVIDEEQ;}
"%/" {return REMAINDEREQ;}

"==" {return EQUALTO;}
"!=" {return NOTEQUALTO;}
">" {return GT;}
">=" {return GTEQ;}
"<" {return LT;}
"<=" {return LTEQ;}

";" {return SEMICOLON;}
"," {return COMMA;}
"." {return PERIOD;}
":" {return COLON;}
"?" {return QUESTION_MARK;}

"(" {return LPAREN;}
")" {return RPAREN;}

"{" {symbol_count++; scope_id_count++; return LBRACE;}
"}" {symbol_count--; return RBRACE;}

"[" {return LSQUAREBRAC;}
"]" {return RSQUAREBRAC;}

(\/\/.*|\/\*([^*]|\*[^\/])*\*\/) ;
[ \t\n]+  ;

. {printf("Invalid character sequence %s\n", yytext);}

%%

int yywrap() {
  displaySymbolTable(); // Call displaySymbolTable at the end of processing

  return 1;
}
