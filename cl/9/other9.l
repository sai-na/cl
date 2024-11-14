%{
  #include <stdio.h>
  #include <ctype.h>  // For toupper function

  FILE *fp;
  FILE *fp1;
  extern FILE *yyin;  // Declare yyin explicitly
%}

%%

[a-z]    { fprintf(fp1, "%c", toupper(yytext[0])); }  // Convert to uppercase and write to output file
.        { fprintf(fp1, "%c", yytext[0]); }  // Write other characters as they are

%%

int main(int argc, char **argv) {
  // Open input file for reading
  fp = fopen("input.txt", "r");
  if (!fp) {
    printf("Input file not found\n");
    return 0;
  }
  // Open output file for writing
  fp1 = fopen("b.txt", "w");
  if (!fp1) {
    printf("Output file not found\n");
    return 0;
  }



  // Set yyin to the input file
  yyin = fp;  // This sets the input to 'input.txt'

  // Perform lexical analysis
  yylex();

  // Close the files after processing
  fclose(fp);
  fclose(fp1);

  return 0;
}

int yywrap() {
    return 1;
}

