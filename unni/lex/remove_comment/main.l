%{
#include <stdio.h>
%}

%x IN_COMMENT
%x IN_SINGLE_LINE_COMMENT

%%
"/*"        { BEGIN(IN_COMMENT); }
<IN_COMMENT>"*/"   { BEGIN(INITIAL); }
<IN_COMMENT>.      ; /* Ignore characters inside multi-line comments */

"//"        { BEGIN(IN_SINGLE_LINE_COMMENT); }
<IN_SINGLE_LINE_COMMENT>\n   { BEGIN(INITIAL); }
<IN_SINGLE_LINE_COMMENT>.    ; /* Ignore characters inside single-line comments */

.           { putchar(yytext[0]); } /* Print other characters */
%%

int main() {
    yylex();
    return 0;
}
