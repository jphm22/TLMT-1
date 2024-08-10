%{
#include "y.tab.h"
#include <stdio.h>
%}

%%

[0-9]+  { yylval = atoi(yytext); return NUMBER; }
[ \t\n] ;
.       { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
