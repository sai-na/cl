%{
#include <stdio.h>
%}

%x IN_TAG

%%
"<"             { BEGIN(IN_TAG); }
<IN_TAG>[^>]+   ; /* Ignore characters inside HTML tags */
<IN_TAG>>       { BEGIN(INITIAL); }
<IN_TAG>\n      ; /* Ignore newline characters inside tags */

[^<]+           { printf("%s", yytext); } /* Print other characters outside tags */
%%

int main() {
    yylex();
    return 0;
}
