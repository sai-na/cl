%{
#include <stdio.h>
#include <string.h>
extern char* yytext;
int errors = 0; // Counter for syntax errors
%}

%token IDENTIFIER

%%

start:
    IDENTIFIER { printf("Valid identifier: %s\n", yytext); }
    ;

%%

int main(void) {
    yyparse();
    if (errors > 0) {
        printf("Invalid identifier detected.\n");
    }
    return 0;
}

void yyerror(char *s) {
    if (!errors) {
        fprintf(stderr, "Error: %s\n", s);
    }
    errors++;
}