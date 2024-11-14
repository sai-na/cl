%{
#include <stdio.h>
int valid = 1;
%}

%token A B

%%

start: expr { if (valid) printf("Valid\n"); else printf("Invalid\n"); }
      ;

expr: A expr
    | B expr
    | abb
    | /* empty */ { printf("Invalid\n"); valid = 0; }
    ;

abb: A B B { printf("Valid\n"); }
    ;

%%

int main() {
    yyparse();
    return 0;
}

int yywrap() {
    return 1;
}
