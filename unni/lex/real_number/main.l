%{
#include <stdio.h>
%}


DIGIT       [0-9]
SIGN        [-+]?
EXPONENT    [Ee][+-]?{DIGIT}+
REAL        ({SIGN}{DIGIT}+\.?|\.{DIGIT}+){EXPONENT}?

%%
{REAL}      { printf("\nReal number: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}
