%{
#include <stdio.h>
#include <string.h>
#include <ctype.h>
int lc = 0, sc = 0, wc = 0, ch = 0;
int comment_count = 0, keyword_count = 0, identifier_count = 0;
char *keywords[] = {
    "auto","break","case","char","const","continue","default","do","double",
    "else","enum","extern","float","for","goto","if","int","long","register",
    "return","short","signed","sizeof","static","struct","switch","typedef",
    "union","unsigned","void","volatile","while"
};
int isKeyword(const char *word) {
    for(int i = 0; i < sizeof(keywords)/sizeof(keywords[0]); i++) {
        if(strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}
%%
"/*"([^*]|\*+[^*/])*\*+\/         { comment_count++; ch += yyleng; }
"//".*                            { comment_count++; ch += yyleng; }
[a-zA-Z_][a-zA-Z0-9_]*            {
                                    ch += yyleng;
                                    wc++;
                                    if (isKeyword(yytext))
                                        keyword_count++;
                                    else
                                        identifier_count++;
                                  }
[ \t]+                            { sc += yyleng; ch += yyleng; }
\n                                { lc++; ch += yyleng; }
.                                 { ch += yyleng; }
%%
int yywrap() { return 1; }
int main() {
    printf("Enter the code (Ctrl+D to end):\n");
    yylex();
    printf("\n---- ANALYSIS RESULT ----\n");
    printf("Lines: %d\n", lc);
    printf("Spaces/Tabs: %d\n", sc);
    printf("Words: %d\n", wc);
    printf("Characters: %d\n", ch);
    printf("Comments: %d\n", comment_count);
    printf("Keywords: %d\n", keyword_count);
    printf("Identifiers: %d\n", identifier_count);
    return 0;
}