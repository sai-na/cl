%{
#include <stdio.h>
#include <string.h>

int valid = 1;

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

%}

%token A B

%%

start: expr { if (valid) printf("Valid\n"); else printf("Invalid\n"); }
      ;

expr: A expr
    | B expr
    | /* empty */ { valid = 0; }
    ;

%%

int main() {
    yyparse();
    return 0;
}

int yywrap() {
    return 1;
}
