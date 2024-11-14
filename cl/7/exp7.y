%{
	#include<stdio.h>
	valid=1;
%}

%token num id op

%%
start: id '=' s ';'
s: id x| num x| '-' num x| '(' s ')' x ;
x: op s|'-' s|;
%%
int yyerror()
{
	printf("\nInvalid Arithmetic Expression!\n");
	valid=0;
	return 0;
}

int main()
{
	printf("\n Enter the Arithmetic Expression : \n");
	yyparse();
	if(valid)
	{
		printf("\n Valid Arithmetic Expression!");
		}
		return 0;
}
