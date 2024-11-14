%{
    #include <stdio.h>
%}

%%
[a-zA-Z_]+ { 
    char buffer[1024];
    int j = 0;
    
    for (int i = 0; i < yyleng; i++) {
        if (i <= yyleng - 3 && yytext[i] == 'a' && yytext[i + 1] == 'b' && yytext[i + 2] == 'c') {
            buffer[j++] = 'A';
            buffer[j++] = 'B';
            buffer[j++] = 'C';
            i += 2; // Skip the next two characters
        } else {
            buffer[j++] = yytext[i];
        }
    }
    buffer[j] = '\0'; // Null-terminate the string
    printf("%s", buffer);
}

[\t]+ ; // Ignore whitespace

\n { printf("\n"); } // Print newline properly

. { ECHO; } // Echo any other character

%% 

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

