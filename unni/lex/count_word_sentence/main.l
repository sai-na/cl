%{
    int charCount = 0;
    int wordCount = 0;
    int sentenceCount = 0;
%}

%%
[a-zA-Z]    { charCount++; }
[.!?]       { sentenceCount++; }
[a-zA-Z]+   { wordCount++; charCount += yyleng; }
[ \t\n]     ; /* Skip whitespace */
.           ;
%%

int main() {
    yylex();
    printf("\nCharacter count: %d\n", charCount);
    printf("Word count: %d\n", wordCount);
    printf("Sentence count: %d\n", sentenceCount);
    return 0;
}
