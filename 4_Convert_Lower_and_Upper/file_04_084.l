%{
#include <stdio.h>
%}
%%
[a-z]   { printf("%c", yytext[0] - 32); }   // lowercase to uppercase
[A-Z]   { printf("%c", yytext[0] + 32); }   // uppercase to lowercase
.       { printf("%c", yytext[0]); }
%%
int main() {
    yylex(); // Call the lexer
    return 0;
}
int yywrap() {
    return 1;
}