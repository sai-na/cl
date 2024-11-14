%{
#include <stdio.h>
%}

%token AB_PATTERN

%%
start:
    AB_PATTERN { printf("\nPattern recognized: a^nb (n >= 10)\n"); }
    | /* Empty */
    ;
%%

int main() {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 1;
}
