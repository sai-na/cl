%{
#include <stdio.h>
#include <string.h>
%}

%token IF ELSE WHILE DO FOR INT FLOAT

%%
program :
   | program statement
   ;

statement :
     IF
     {
       printf("IF ");
     }
   | ELSE
     {
       printf("ELSE ");
     }
   | WHILE
     {
       printf("WHILE ");
     }
   | DO
     {
       printf("DO ");
     }
   | FOR
     {
       printf("FOR ");
     }
   | INT
     {
       printf("INT ");
     }
   | FLOAT
     {
       printf("FLOAT ");
     }
   ;
%%
int main(void)
{
   yyparse();
   return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
