%{
#include <stdio.h>
#include <string.h>
int count = 0;
%}
%%
[a-zA-Z]+ {
    if (yytext[0] == 'A' || yytext[0] == 'a')
        count++;
}
[ \t\n]+    ;
.           ;
%%
int yywrap() { return 1; }

int main() {
    printf("Enter input text:\n");
    yylex();
    printf("Number of words starting with 'A' or 'a': %d\n", count);
    return 0;
}