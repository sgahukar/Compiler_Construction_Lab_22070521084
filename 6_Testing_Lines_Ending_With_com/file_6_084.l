%{
#include <stdio.h>
%}

%%
.*com$    { printf("Line ending with 'com' found: %s", yytext); }
.*        { printf("Not found: %s", yytext); }
\n        { /* ignore newlines */ }
%%

int main() {
    yylex();
    return 0;
}
