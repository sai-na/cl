%{
#include <stdio.h>
#include "parser.tab.h"
%}

%%
"for" { return FOR; }
"(" { return LPAREN; }
")" { return RPAREN; }
";" { return SEMICOLON; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[ \t\n] { /* skip whitespace */ }
. { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}
