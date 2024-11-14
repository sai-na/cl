%{
#include "y.tab.h"
%}

%%
a+             { if (yyleng >= 10 && yytext[yyleng - 1] == 'b') return AB_PATTERN; }
.              ; /* Ignore other characters */
%%

int yywrap() {
    return 1;
}
