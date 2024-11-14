%{
#include <stdio.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%

calculation:
    expression                  { printf("Valid expression\n"); }
    ;

expression:
    NUMBER                      { $$ = $1; }
    | expression '+' expression { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '/' expression { $$ = $1 / $3; }
    | '-' expression %prec UMINUS { $$ = -$2; }
    | '(' expression ')'        { $$ = $2; }
    ;

%%

int main(void) {
    if (!yyparse()) {
        printf("No syntax error.\n");
    } else {
        printf("Syntax error.\n");
    }
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "Invalid expression: %s\n", s);
}