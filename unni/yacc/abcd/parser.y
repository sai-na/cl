%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}

%token A B C D EOL

%%
start: S EOL { printf("Valid string\n"); }
      | error EOL { printf("Invalid string\n"); }
      ;

S: epsilon 
  | A S D
  | X
  ;

X: B X C 
  | epsilon 
  ;

epsilon: /* empty */ ;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
