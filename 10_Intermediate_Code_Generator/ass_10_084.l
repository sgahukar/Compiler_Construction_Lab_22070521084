%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>

extern YYSTYPE yylval;
%}

%%
[0-9]+                      { yylval.ival = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*      { yylval.sval = strdup(yytext); return ID; }
[ \t]                       ; // skip whitespace
\n                          return '\n';
"+"                         return '+';
"-"                         return '-';
"*"                         return '*';
"/"                         return '/';
"("                         return '(';
")"                         return ')';
.                           return yytext[0];
%%
int yywrap() { return 1; }
