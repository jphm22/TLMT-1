%{
#include <stdio.h>
%}

%%

if      { printf("IF\n"); }
else    { printf("ELSE\n"); }
while   { printf("WHILE\n"); }
return  { printf("RETURN\n"); }
[a-zA-Z][a-zA-Z0-9]* { printf("IDENTIFIER: %s\n", yytext); }
[ \t\n] ;
. { printf("UNKNOWN: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
