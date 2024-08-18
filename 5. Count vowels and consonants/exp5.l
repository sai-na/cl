%{
#include<stdio.h>
int vow_count=0;
int const_count =0;
%}

%%
[aeiouAEIOU] {vow_count++;}
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ] {const_count++;}
%%

int main()
{
    yylex();
    printf("Vowels = %d and Consonants = %d\n",vow_count,const_count);
    return 0;
}

int yywrap()
{
    return 1;
}
