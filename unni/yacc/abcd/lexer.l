%{
#include "parser.tab.h"
%}

%%

a { return A; }
b { return B; }
c { return C; }
d { return D; }
\n { return EOL; }
. { return yytext[0]; }

%%

int yywrap(void) {
    return 1;
}
