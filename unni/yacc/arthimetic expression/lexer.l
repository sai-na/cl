%{
#include "parser.tab.h"
%}

%%

[0-9]+("."[0-9]+)?    {
                        yylval = atof(yytext);
                        return NUMBER;
                      }
[+\-*/()]             { return yytext[0]; }
\n                    { return 0; }
[ \t]                 ;
.                      { yyerror("Invalid character"); }

%%