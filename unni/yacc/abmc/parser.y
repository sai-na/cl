%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}

%token A B C 

%%
start:  S { printf("Valid string\n"); };
      | error 

S: T X { /* Do nothing for TX */ } ;

T: epsilon { /* Do nothing for ε */ }
  | A T B { /* Do nothing for aAb */ }
  ;

X: epsilon { /* Do nothing for ε */ }
  | B X C { /* Do nothing for bBc */ }
  ;

epsilon: %empty ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
