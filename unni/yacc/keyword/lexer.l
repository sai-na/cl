%{
#include "parser.tab.h"
%}

%%
"if"    { return IF; }
"else"  { return ELSE; }
"while" { return WHILE; }
"do"    { return DO; }
"for"   { return FOR; }
"int"   { return INT; }
"float" { return FLOAT; }
%% 
