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
"true" {return TRUE;}


"!" {return NOT;}
";" {return SEMICOLON;}
"(" {return LPAREN;}
")" {return RPAREN;}
"{" {return LBRACE;}
"}" {return RBRACE;}

"fn" {return FN;}
"main" {return MAIN;}

"println("[.*]");" {return PRINTLN;}

{identifier} {return ID;}


[\t\n \f\v]+ { }

. {printf("Invalid character %s\n", yytext);}
%%

int yywrap() {return 1;}