%{
#include <stdio.h>

int nesting_level = 0;
%}

%token IF OPEN_BRACE CLOSE_BRACE

%%
start:
    if_block
    | /* Empty */
    ;

if_block:
    IF OPEN_BRACE { nesting_level++; printf("\nNesting level: %d\n", nesting_level); }
    if_block CLOSE_BRACE { nesting_level--; }
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
