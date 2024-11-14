%{
#include <stdio.h>
%}

%%
"int"           { printf("Keyword: int\n"); }
"float"         { printf("Keyword: float\n"); }
"if"            { printf("Keyword: if\n"); }
"else"          { printf("Keyword: else\n"); }
"while"         { printf("Keyword: while\n"); }
"for"           { printf("Keyword: for\n"); }
"return"        { printf("Keyword: return\n"); }
"break"         { printf("Keyword: break\n"); }
"continue"      { printf("Keyword: continue\n"); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }

[0-9]+          { printf("Integer Constant: %s\n", yytext); }
[0-9]+\.[0-9]+  { printf("Float Constant: %s\n", yytext); }

"=="|"!="        { printf("Operator: %s\n", yytext); }
"="             { printf("Assignment Operator: %s\n", yytext); }
[+\-*/]         { printf("Arithmetic Operator: %s\n", yytext); }
"&&"|"||"       { printf("Logical Operator: %s\n", yytext); }

"("             { printf("Left Parenthesis\n"); }
")"             { printf("Right Parenthesis\n"); }
"{"             { printf("Left Brace\n"); }
"}"             { printf("Right Brace\n"); }
";"             { printf("Semicolon\n"); }
","             { printf("Comma\n"); }

[ \t\n]         ; /* Skip whitespace */
.               { printf("Unrecognized token: %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}
