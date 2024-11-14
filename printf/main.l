%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int write_count = 0;
int read_count = 0;
%}

%%

"printf"        { 
                    printf("writef"); 
                    write_count++; 
                 }
"scanf"         { 
                    printf("readf"); 
                    read_count++; 
                 }

.|\n            { printf("%c", yytext[0]); }

%%

int main() {
    FILE *input_file, *output_file;
    char ch;

    input_file = fopen("input.c", "r");
    if (!input_file) {
        printf("Error opening input file.\n");
        return 1;
    }

    output_file = fopen("output.c", "w");
    if (!output_file) {
        printf("Error opening output file.\n");
        return 1;
    }

    // Redirect stdin and stdout to files
    yyin = input_file;
    yyout = output_file;

    yylex(); // Start lexical analysis

    fclose(input_file);
    fclose(output_file);

    printf("\nNumber of 'writef' replacements: %d\n", write_count);
    printf("Number of 'readf' replacements: %d\n", read_count);

    return 0;
}
