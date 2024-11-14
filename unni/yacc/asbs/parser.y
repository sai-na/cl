%{
#include <stdio.h>
%}

%token a b
%start S

%%

S: A B { printf("\n"); }
  | error {printf("Error!\n");}
  ;

A: a A | /* empty */ 
  ;

B: b B | /* empty */ 
  ;

%%

int main() {
    yyparse();
    return 0;
}


void yyerror(const char *s) {
    printf("Error: %s\n", s);
}