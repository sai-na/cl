%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);

%}

%token FOR LPAREN RPAREN SEMICOLON ID

%%

program: for_loop { printf("Valid for loop declaration\n"); }
       | error { /* Handle syntax error */ }

for_loop: FOR LPAREN ID SEMICOLON ID SEMICOLON ID RPAREN { /* Actions for a valid for loop */ }

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
