%{
#include "parser.tab.h"
extern int yylval;
%}

%%

[a-zA-Z][a-zA-Z0-9]*  {
                        yylval = strdup(yytext);
                        return IDENTIFIER;
                      }
\n                    { return 0; }
[ \t]                 ;
.                      { 
                        return 0; 
                      }

%%

int yywrap(void) {
    return 1;
}