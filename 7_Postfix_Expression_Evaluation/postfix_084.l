%{
#include "y.tab.h"
extern int yylval;
%}
%%
[ \t]+           ;            /* skip whitespace */
[0-9]+           { 
                    /* convert yytext (string of digits) to integer */
                    int i = 0;
                    int val = 0;
                    while (yytext[i]) {
                      val = val * 10 + (yytext[i] - '0');
                      i++;
                    }
                    yylval = val;
                    return NUMBER;
                 }
\n               { return '\n'; }
"+"              { return '+'; }
"-"              { return '-'; }
"*"              { return '*'; }
"/"              { return '/'; }
.                { fprintf(stderr, "Unknown character: %s\n", yytext); }
%%
