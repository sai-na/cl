%{
#include <stdio.h>
void yyerror(const char *s);
%}

%token NUMBER PLUS MINUS MULTIPLY DIVIDE LPAREN RPAREN EOL

%%
calclist: /* nothing */
        | calclist expr EOL { printf("= %d\n", $2); }
        ;

expr: NUMBER
    | expr PLUS expr      { $$ = $1 + $3; }
    | expr MINUS expr     { $$ = $1 - $3; }
    | expr MULTIPLY expr  { $$ = $1 * $3; }
    | expr DIVIDE expr    { $$ = $1 / $3; }
    | LPAREN expr RPAREN  { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    printf("Enter an expression:\n");
    yyparse();
    return 0;
}
