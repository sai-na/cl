%{
    int vow_count = 0;
    int const_count = 0;
%}

%%
[aeiouAEIOU] { vow_count++; }
[a-zA-Z] { if (!strchr("aeiouAEIOU", yytext[0])) const_count++; }
\n { printf("Vowels = %d\nConsonants = %d\n", vow_count, const_count); }
.    { /* Ignore other characters */ }
%%

int main()
{
    printf("Enter the string of vowels and consonants: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;  // Return 1 to indicate end of input
}

