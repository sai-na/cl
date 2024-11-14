%{
#include "parser.tab.h"
%}

%%

a { return A; }
b { return B; }
c { return C; }

. { return yytext[0]; }

%%

int yywrap(void) {
    return 1;
}
