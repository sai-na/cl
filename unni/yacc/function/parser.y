%{
#include<stdio.h>
#include "parser.tab.h"
%}

%token COMMA ID BUILTIN SC NL RP LP FUNCT INT FLOAT CHAR

%%

program: var LP paramlist RP SC { printf("Function declaration\n"); } ;

var: datatype ID 
   ;

datatype: BUILTIN { $$ = BUILTIN; }
        | INT { $$ = INT; }
        | FLOAT { $$ = FLOAT; }
        | CHAR { $$ = CHAR; }
        ;


paramlist: paramlist COMMA param 
         | param 
         | /* empty */ 
         ;

param: datatype ID ;

%%
int yyerror(const char *str) { printf("error: %s\n", str); }

int main() { yyparse(); return 0; }