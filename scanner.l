%{
  #include "y.tab.h"
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include <ctype.h>



  struct symbol_entry {
    char name[50];
    char kind[20];
    char data_type[20];
    int token_type;
    int lineno;
    int scope;
    int scope_id;
    char value[30];
    char checkType[30];
    // Add more attributes as needed
  };

  struct symbol_entry symbol_table[100];
  int symbol_count = 0; // Counter to track the number of entries in symbol table

  int scope_count = 0;
  int scope_id_count = 0;
  char *check_type = "val";

  struct check_type_entry {
    char value[40];
    char checkType[40];
  };

  struct check_type_entry check_table[300];
  int symbol_count_check_table = 0;




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





  char* search_by_name(char *name) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbol_table[i].name, name) == 0) {
            return symbol_table[i].name;
        }
    }
    return "NULL"; // Return -1 if not found
  }





  char* compareDataType(char *id1, char *id2) {
    char *type_for_id1 = "";
    char *type_for_id2 = "";

    for (int i = 0; i < symbol_count; i++) {
        if(strcmp(symbol_table[i].name, id1) == 0) {
          type_for_id1 = symbol_table[i].checkType;
        }
        if(strcmp(symbol_table[i].name, id2) == 0) {
          type_for_id2 = symbol_table[i].checkType;
        }
    }

    if(strcmp(type_for_id1, type_for_id2) == 0) {
      return type_for_id1;
    } else {
      return "";
    }
  }




int search_functions_symbol_table(char *name, int scope) {
    for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbol_table[i].name, name) == 0 && symbol_table[i].scope == scope) {
            return symbol_table[i].token_type;
        }
    }
    return -1; // Return -1 if not found
}




void add_to_symbol_table(char *name, char *kind, int tokentype, int lineno, char *datatype, char *value) {
  int index = search_symbol_table(name, scope_count, scope_id_count);
  if (index != -1) {
    printf("Error: Variable %s already declared in the same scope at line number %d with scope of %d and scope id of %d\n", name, lineno, scope_count, scope_id_count);
    exit(1);
  }

    if(strcmp(value, "") != 0) {
      strcpy(symbol_table[symbol_count].checkType, check_type);
    }



    strcpy(symbol_table[symbol_count].name, name);
    strcpy(symbol_table[symbol_count].kind, kind);
    strcpy(symbol_table[symbol_count].data_type, datatype);
    strcpy(symbol_table[symbol_count].value, value);

    symbol_table[symbol_count].token_type = tokentype;
    symbol_table[symbol_count].lineno = lineno;

    symbol_table[symbol_count].scope = scope_count;
    symbol_table[symbol_count].scope_id = scope_id_count;


    if(strcmp("i32", datatype) == 0) {
      strcpy(symbol_table[symbol_count].data_type, "Integer");
    }

    if(strcmp("bool", datatype) == 0) {
      strcpy(symbol_table[symbol_count].data_type, "Boolean");
    }

    if(strcmp("&str", datatype) == 0) {
      strcpy(symbol_table[symbol_count].data_type, "String");
    }
    if(strcmp("f64", datatype) == 0) {
      strcpy(symbol_table[symbol_count].data_type, "Integer");
    }

    

    if(strcmp("parameter", kind) == 0) {
      symbol_table[symbol_count].scope = scope_count + 1;
      symbol_table[symbol_count].scope_id = scope_id_count + 1;
    }

    if(strcmp(search_by_name(value), "NULL") != 0) {
      for (int i = 0; i < symbol_count; i++) {
        if (strcmp(symbol_table[i].name, value) == 0) {
          //TODO: new feature
          if(strcmp(symbol_table[i].value, "") == 0) {
            printf("\n\n\n\nError: Variable %s is has not been initialized at line num %d \tYou can not assign a variable that is not initialized already.\t You tried to assign a variable called %s on Line number %d to a variable %s.\n\n\n\n", value, symbol_table[i].lineno, symbol_table[i].name, yylineno, name );
            exit(1);
          }
          //TODO: TYPE CHECK
          if(strcmp(symbol_table[i].data_type, symbol_table[symbol_count].data_type) != 0 && strcmp(symbol_table[i].data_type, "dynamic") != 0 ) {
            printf("\n\n\nDATA TYPE MISMATCH Error: ");
            printf("Error ocured at line number %d. You tried to assign a variable \"%s\" with a data type of \"%s\" that is declared at line number \"%d\" to a variable \"%s\" with data type of \"%s\" that is declared at line number \"%d\".\n\n\n", lineno, symbol_table[i].name, symbol_table[i].data_type, symbol_table[i].lineno, name, symbol_table[symbol_count].data_type, lineno);
            exit(1);
          }

          strcpy(symbol_table[symbol_count].value, symbol_table[i].value);
          strcpy(symbol_table[symbol_count].checkType, symbol_table[i].checkType);
        }
      }
    }

    //TODO: added new feature
    if(strcmp(symbol_table[symbol_count].data_type, symbol_table[symbol_count].checkType) != 0 
    && strcmp(symbol_table[symbol_count].data_type, "dynamic") != 0
    && strcmp(symbol_table[symbol_count].value, "") != 0) {
      printf("\n\n\nDATA TYPE MISMATCH ERROR :");
      printf(" Error occured at line number %d. You tried to assing a value with a data type of \"%s\" to a variable called \"%s\" with data type of %s at line number %d.\n\n\n", lineno, symbol_table[symbol_count].checkType, name, symbol_table[symbol_count].data_type, lineno);
      exit(1);
    }

    symbol_count++;
}



void update_assignment_values(char *name, char *newValue) {
  for (int i = 0; i < symbol_count; i++) {
    if(strcmp(symbol_table[i].name, name) == 0) {
      if(strcmp(symbol_table[i].data_type, check_type) != 0 
       && strcmp(symbol_table[i].data_type, "dynamic") != 0) {
          printf("\n\n\nDATA TYPE MISMATCH ERROR : you tried to assign a value with a data type of \t\"%s\" to a value with a data type of \t\"%s\" at line number \t\"%d\n\n\n", symbol_table[i].data_type, check_type, yylineno);
          exit(1);
        }
      strcpy(symbol_table[i].value, newValue);
      strcpy(symbol_table[i].checkType, check_type);
    }
  }
}



void add_functions_to_symbol_table(char *name, char *kind, int tokentype, int lineno) {
  int index = search_functions_symbol_table(name, scope_count);
  if (index != -1) {
    printf("Function Redeclaration Error: function %s already declared in the same scope at line number %d with scope of %d\n", name, lineno, scope_count);
    exit(1);
  }

    strcpy(symbol_table[symbol_count].name, name);
    strcpy(symbol_table[symbol_count].kind, kind);

    symbol_table[symbol_count].token_type = tokentype;
    symbol_table[symbol_count].lineno = lineno;

    symbol_table[symbol_count].scope = scope_count;
    symbol_table[symbol_count].scope_id = scope_id_count;

    symbol_count++;
}

void displaySymbolTable() {

  for (int i = 0; i < symbol_count_check_table; i++) {
    printf("%s\t %s\n",check_table[i].value,check_table[i].checkType);
  }

    // printf("------------------------------------------------------------------------------------------------------------\n");
    printf("-------------------------------------------SYMBOL TABLE--------------------------------------------------------------------------------------\n\n");
    printf("---------------------------------------------------------------------------------------------------------------------------------------------\n");
    printf("%-13s | %-13s | %-14s |%-14s |%-14s |%-14s |%-14s |%-13s |%-13s |\n", "| TOKEN NAME ", "| Type |", "Token Type |" , "Line Number |" , "Scope Number |", "Scope Id|", "data type|", "Value|", "Check type");
    printf("----------------------------------------------------------------------------------------------------------------------------------------------\n");
    for (int i = 0; i < symbol_count; i++) {
     printf("| %-13s | %-13s | %-13d |%-13d |%-13d |%-13d | %-13s | %-13s | %-13s|\n", symbol_table[i].name,symbol_table[i].kind, symbol_table[i].token_type, symbol_table[i].lineno, symbol_table[i].scope, symbol_table[i].scope_id, symbol_table[i].data_type, symbol_table[i].value, symbol_table[i].checkType);

    }
    printf("----------------------------------------------------------------------------------------------------------------------------------------------\n");
}


void add_values_to_check_table(char *value, char *type){
  strcpy(check_table[symbol_count_check_table].value, value);
  strcpy(check_table[symbol_count_check_table].checkType, type);

  symbol_count_check_table++;
}

%}

%option yylineno

/* Definitions */
digit           [0-9]
letter          [a-zA-Z]
 
%%
"true" {check_type = "Boolean"; add_values_to_check_table(strdup(yytext), check_type); return TRUE;}
"false" {check_type = "Boolean"; add_values_to_check_table(strdup(yytext), check_type); return FALSE;}

"mut" {return MUT;}

"let" {  return LET;}
"fn" {  return FN;}
"use" {return USE;}
"as" {return AS;}

"i32" { yylval.strval = strdup(yytext); return INT;}
"f64" {yylval.strval = strdup(yytext); return FLOAT;}
"bool" {yylval.strval = strdup(yytext); return BOOL;}
"&str" {yylval.strval = strdup(yytext);  return STRSLICE;}

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

{digit}+ {yylval.strval = strdup(yytext); check_type = "Integer"; add_values_to_check_table(strdup(yytext), check_type);  return NUMBER;}
{letter}((\_|\-)*{letter}|{digit})*  { yylval.strval = strdup(yytext);
                              return ID;
                        }
                
\"[^\"]*\"      { yylval.strval = strdup(yytext); check_type = "String"; add_values_to_check_table(strdup(yytext), check_type); return STRING;}

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
