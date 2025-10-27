%{
#include <stdio.h>
#include <stdlib.h>
#define YYSTYPE int

int stack[100];
int top = -1;

#define PUSH(v) (stack[++top] = (v))
#define POP()  (stack[top--])

void yyerror(const char *s);
int yylex(void);
%}

%token NUMBER

%%
input:
      /* empty */
    | input line
    ;

line:
      elements '\n'        { 
                              if (top >= 0) {
                                printf("Result = %d\n", stack[top]);
                                /* reset stack for next line */
                                top = -1;
                              } else {
                                printf("No result (empty expression)\n");
                              }
                            }
    ;

elements:
      /* zero or more elements (numbers or operators) */
    | elements element
    ;

element:
      NUMBER                { PUSH($1); }
    | '+'                   { 
                              if (top < 1) { yyerror("not enough operands for +"); }
                              else { int b = POP(); int a = POP(); PUSH(a + b); }
                            }
    | '-'                   {
                              if (top < 1) { yyerror("not enough operands for -"); }
                              else { int b = POP(); int a = POP(); PUSH(a - b); }
                            }
    | '*'                   {
                              if (top < 1) { yyerror("not enough operands for *"); }
                              else { int b = POP(); int a = POP(); PUSH(a * b); }
                            }
    | '/'                   {
                              if (top < 1) { yyerror("not enough operands for /"); }
                              else { int b = POP(); int a = POP();
                                     if (b == 0) { yyerror("division by zero"); }
                                     else PUSH(a / b);
                                   }
                            }
    ;
%%
void yyerror(const char *s) {
    /* simple error printer - doesn't exit parser to let other lines be read */
    fprintf(stderr, "Error: %s\n", s);
    /* reset stack to avoid cascading errors */
    top = -1;
}

int main(void) {
    printf("Postfix evaluator (enter one postfix expression per line):\n");
    yyparse();
    return 0;
}
