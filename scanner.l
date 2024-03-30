%{
  #include "y.tab.h"
%}

%option yylineno

/* Definitions */
digit           [0-9]
letter          [a-zA-Z]
array_literal   \[[^\[\]]*\]
 
%%
"true" {return TRUE;}
"false" {return FALSE;}

"let" {return LET;}
"mut" {return MUT;}

"pub" {return PUB;}
"return" {return RETURN;}
"enum" {return ENUM;}
"use" {return USE;}
"mod" {return MOD;}

"fn" {return FN;}
"println!" {return PRINTLN;}

"if" {return IF;}
"else" {return ELSE;}

"loop" {return LOOP;}
"while" {return WHILE;}
"for" {return FOR;}
"in" {return IN;}
"break" {return BREAK;}
"continue" {return CONTINUE;}

"i32" {return INT;}
"f64" {return FLOAT;}
"bool" {return BOOL;}
"&str" {return STRSLICE;}
"->" {return ARROW;}

\"([^\"\\]|\\.)*\" {return STRING;}
array_literal {return ARRAY;}

{letter}((\_|\-)*{letter}|{digit})*  {return ID;}
{digit} {return NUMBER;}


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

int yywrap() {return 1;}