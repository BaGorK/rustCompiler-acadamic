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
    // Add more attributes as needed
  };

  struct symbol_entry symbol_table[100];
  int symbol_count = 0; // Counter to track the number of entries in symbol table

char* token_strings[] = {
    "LET", "MUT", "ENUM", "EXTERN", "IMPL", "MATCH", "PUB", "REF", "RETURN", "SELF", "STATIC",
    "SUPER", "TRAIT", "TYPE", "UNSAFE", "WHERE", "ASYNC", "AWAIT", "USE", "MOD", "MAIN", "FN",
    "PRINTLN", "STRINTERPOLATION", "TRUE", "FALSE", "ID", "INT", "FLOAT", "BOOL", "STRUCT",
    "STRING", "NUMBER", "ARRAY", "STRSLICE", "ARROW", "IF", "ELSE", "LOOP", "WHILE", "FOR", "IN",
    "BREAK", "CONTINUE", "LOGICALNOT", "LOGICALAND", "LOGICALOR", "ADD", "SUBTRACT",
    "MULTIPLY", "DIVIDE", "ASSIGN", "REMAINDER", "ADDEQ", "SUBTRACTEQ", "MULTIPLYEQ",
    "DIVIDEEQ", "REMAINDEREQ", "EQUALTO", "NOTEQUALTO", "GT", "GTEQ", "LT", "LTEQ",
    "SEMICOLON", "COMMA", "PERIOD", "COLON", "QUESTION_MARK", "LPAREN", "RPAREN",
    "LBRACE", "RBRACE", "LSQUAREBRAC", "RSQUAREBRAC", "COMMENT", "AS"
};

int search_symbol_table(char *name) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbol_table[i].name, name) == 0)
            return symbol_table[i].token_type; // Return token if found
    }
    return -1; // Return -1 if not found
}

void add_to_symbol_table(char *name, int token, int lineno) {
    strcpy(symbol_table[symbol_count].name, name);
    symbol_table[symbol_count].token_type = token;
    symbol_table[symbol_count].lineno = lineno;

    symbol_count++;
}

void displaySymbolTable() {
    printf("------------------------------------------------------------------------------------------------------------\n");
    printf("-------------------------------------------SYMBOL TABLE-----------------------------------------------------\n\n");
    printf("--------------------------------------------------------------------------------------------------------------\n");
    printf("%-25s | %-25s | %-20s |%-15s\n", "| TOKEN NAME ", "| Data Type |", "Token Type |" , "Line Number |");
    printf("---------------------------------------------------------------------------------------------------------------\n");
    for (int i = 0; i < symbol_count; i++) {
     printf("| %-25s | %-25s | %-20d |%-15d |\n", symbol_table[i].name,     symbol_table[i].data_type, symbol_table[i].token_type, symbol_table[i].lineno);

    }
    printf("---------------------------------------------------------------------------------------------------------------\n");
}

char* search_symbol_tableByname(char *name) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbol_table[i].name, name) == 0)
            return token_strings[symbol_table[i].token_type]; // Return token name if found
    }
    return "UNKNOWN"; // Return "UNKNOWN" if not found
}


%}

%option yylineno

/* Definitions */
digit           [0-9]
letter          [a-zA-Z]
 
%%
"true" {return TRUE;}
"false" {return FALSE;}

"let" { strcpy(symbol_table[symbol_count].data_type, "variable declaration");  return LET;}
"mut" {return MUT;}

"main" {add_to_symbol_table(yytext, MAIN, yylineno); return MAIN;}

"pub" {return PUB;}
"return" {return RETURN;}
"enum" {return ENUM;}
"use" {strcpy(symbol_table[symbol_count].data_type, "IMPORTING MOstrcpy(symbol_table[symbol_count].data_type, "function");DULE"); return USE;}
"mod" {return MOD;}
"as" {strcpy(symbol_table[symbol_count].data_type, "variable"); return AS;}

"fn" { strcpy(symbol_table[symbol_count].data_type, "function"); return FN;}
"println!" {return PRINTLN;}

"if" {add_to_symbol_table(yytext, MAIN, yylineno); return IF;}
"else" {return ELSE;}

"loop" {return LOOP;}
"while" {return WHILE;}
"for" {return FOR;}
"in" {return IN;}
"break" {return BREAK;}
"continue" {return CONTINUE;}

"String" {return STRING; }
"i32" {strcpy(symbol_table[symbol_count - 1].data_type, "integer number"); return INT;}
"f64" {strcpy(symbol_table[symbol_count - 1].data_type, "float point number"); return FLOAT;}
"bool" {strcpy(symbol_table[symbol_count - 1].data_type, "boolean variable"); return BOOL;}
"&str" {strcpy(symbol_table[symbol_count - 1].data_type, "string"); return STRSLICE;}

"->" {return ARROW;}

\[[^[\]]*\] {strcpy(symbol_table[symbol_count - 1].data_type, "array");  return ARRAY;}


{digit}+ {yylval.intval = atoi(yytext);  return NUMBER;}

{letter}((\_|\-)*{letter}|{digit})*  {
        yylval.strval = strdup(yytext); 
        int index = search_symbol_table(yytext);
        if (index == -1) {
            add_to_symbol_table(yytext, ID, yylineno);
            return ID; // Return IDENTIFIER token
        }
        else {
            strcpy(symbol_table[symbol_count - 1].data_type, "IDENTIFIER"); 
            return ID; // Return type of the identifier
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
"{" {return LBRACE;}
"}" {return RBRACE;}
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
