%{
#include "parser.tab.h"
%}

%%

a   { return a; }
b   { return b; }
.   { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
