%{
  #include "y.tab.h"
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>

  struct symbol_entry {
    char name[50];
    char kind[20];
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


int search_symbol_table(char *name, int scope, int scope_id) {
    for (int i = 0; i < symbol_count; i++) {
        //  if (strcmp(symbol_table[i].name, name) == 0 && symbol_table[i].scope < scope){
        //     return symbol_table[i].token_type;
        // }
        // else 
        if (strcmp(symbol_table[i].name, name) == 0 && symbol_table[i].scope == scope && symbol_table[i].scope_id == scope_id) {
            return symbol_table[i].token_type;
        }
    }
    return -1; // Return -1 if not found
}


void add_to_symbol_table(char *name, char *kind, int tokentype, int lineno, char *datatype) {
  int index = search_symbol_table(name, scope_count, scope_id_count);
  if (index != -1) {
    printf("Error: Variable %s already declared in the same scope at line number %d with scope of %d and scope id of %d\n", name, lineno, scope_count, scope_id_count);
    exit(1);
  }

    strcpy(symbol_table[symbol_count].name, name);
    strcpy(symbol_table[symbol_count].kind, kind);
    strcpy(symbol_table[symbol_count].data_type, datatype);

    symbol_table[symbol_count].token_type = tokentype;
    symbol_table[symbol_count].lineno = lineno;

    symbol_table[symbol_count].scope = scope_count;
    symbol_table[symbol_count].scope_id = scope_id_count;

    symbol_count++;
}

void displaySymbolTable() {
    // printf("------------------------------------------------------------------------------------------------------------\n");
    printf("-------------------------------------------SYMBOL TABLE--------------------------------------------------------------------------------------\n\n");
    printf("---------------------------------------------------------------------------------------------------------------------------------------------\n");
    printf("%-25s | %-25s | %-20s |%-15s |%-15s |%-15s |%-15s\n", "| TOKEN NAME ", "| Type |", "Token Type |" , "Line Number |" , "Scope Number |", "Scope Id|", "data type|");
    printf("----------------------------------------------------------------------------------------------------------------------------------------------\n");
    for (int i = 0; i < symbol_count; i++) {
     printf("| %-25s | %-25s | %-20d |%-15d |%-15d |%-15d | %-25s |\n", symbol_table[i].name,     symbol_table[i].kind, symbol_table[i].token_type, symbol_table[i].lineno, symbol_table[i].scope, symbol_table[i].scope_id, symbol_table[i].data_type);

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

"let" {  return LET;}
"main" {yylval.strval = strdup(yytext); return MAIN;}
"fn" {  return FN;}
"use" {return USE;}
"as" {return AS;}

"i32" { return INT;}
"f64" {return FLOAT;}
"bool" {yylval.strval = strdup(yytext); return BOOL;}
"&str" { return STRSLICE;}

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

"String" {return STRINGK; }

"->" {return ARROW;}

\[[^[\]]*\] {yylval.strval = strdup(yytext);  return ARRAY;}

{digit}+ {yylval.strval = strdup(yytext);  return NUMBER;}
{letter}((\_|\-)*{letter}|{digit})*  { yylval.strval = strdup(yytext);
                              return ID;
                        }
                
\"[^\"]*\"      { yylval.strval = strdup(yytext); return STRING;}


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

"{" {scope_id_count++; scope_count++; return LBRACE;}

"}" {scope_count--; return RBRACE;}

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
