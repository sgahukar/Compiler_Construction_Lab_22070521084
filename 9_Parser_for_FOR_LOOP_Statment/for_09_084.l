%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
[ \t]+    ; /* Skip all whitespace characters */
"for" { return FOR; }
"(" { return LPAREN; }
")" { return RPAREN; }
"{" { return LBRACE; }
"}" { return RBRACE; }
";" { return SEMICOLON; }
"=" { return ASSIGN; }
[a-zA-Z]+ { return IDENTIFIER; }
[0-9]+ { return NUMBER; }
. { printf("Invalid character:%s\n", yytext); }
%%
int yywrap(void) { return 1; }
