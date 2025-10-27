%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex(void); // Declare yylex to avoid implicit declaration warning
int tempCount = 1;
char* createTemp() {
    char* temp = (char*) malloc(10);
    sprintf(temp, "t%d", tempCount++);
    return temp;
}
void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}
%}
%union {
    int ival;
    char* sval;
}
%token <ival> NUM
%token <sval> ID
%type <sval> expr
%left '+' '-'
%left '*' '/'
%%
stmt: expr '\n' { printf("\n"); };
expr: expr '+' expr {
        char* temp = createTemp();
        printf("%s = %s + %s\n", temp, $1, $3);
        $$ = temp;
    }
    | expr '-' expr {
        char* temp = createTemp();
        printf("%s = %s - %s\n", temp, $1, $3);
        $$ = temp;
    }
    | expr '*' expr {
        char* temp = createTemp();
        printf("%s = %s * %s\n", temp, $1, $3);
        $$ = temp;
    }
    | expr '/' expr {
        char* temp = createTemp();
        printf("%s = %s / %s\n", temp, $1, $3);
        $$ = temp;
    }
    | '(' expr ')' {
        $$ = $2;
    }
    | ID {
        $$ = $1;
    }
    | NUM {
        char* temp = (char*) malloc(10);
        sprintf(temp, "%d", $1);
        $$ = temp;
    }
;
%%
int main() {
    printf("Enter arithmetic expression:\n");
    yyparse();
    return 0;
}