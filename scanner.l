%{
  #include "y.tab.h"
%}

%option yylineno

/* Definitions */
digit           [0-9]
letter          [a-zA-Z]
identifier      {letter}((\_|\-)*{letter}|{digit})* 
 
%%
\"([^\"\\]|\\.)*\" {return STRING;}

"let" {return LET;}
"mut" {return MUT;}

"pub" {return PUB;}
"return" {return RETURN;}
"enum" {return ENUM;}
"use" {return USE;}
"mod" {return MOD;}

"main" {return MAIN;}
"fn" {return FN;}
"println!" {return PRINTLN;}
"{}"    {return STRINTERPOLATION;}

"true" {return TRUE;}
"false" {return FALSE;}

"i32" {return INT;}
"f64" {return FLOAT;}
"bool" {return BOOL;}
"&str" {return STRSLICE;}
"->" {return ARROW;}

"if" {return IF;}
"else" {return ELSE;}

"loop" {return LOOP;}
"while" {return WHILE;}
"for" {return FOR;}
"in" {return IN;}
"break" {return BREAK;}
"continue" {return CONTINUE;}

"!" {return LOGICALNOT;}
"&&" {return LOGICALAND;}
"||" {return LOGICALOR;}

"+" {return ADD;}
"-" {return SUBTRACT;}
"*" {return MULTIPLY;}
"/" {return DIVIDE;}
"%" {return REMAINDER;}
"+=" {return ADDEQ;}
"-=" {return SUBTRACTEQ;}
"*=" {return MULTIPLYEQ;}
"/=" {return DIVIDEEQ;}
"%/" {return REMAINDEREQ;}

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

(\/\/.*|\/\*([^*]|\*[^\/])*\*\/) {return COMMENT;}




{identifier} {return ID;}


[\t\n \f\v]+  ;
.* {printf("Invalid character %s\n", yytext);}

%%

int yywrap() {return 1;}