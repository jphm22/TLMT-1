%{
#include <stdio.h>

void check_email(const char *email);
%}

%%
[a-zA-Z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}  { check_email(yytext); }
.                                      { printf("Email invalido\n"); }
%%

void check_email(const char *email) {
    printf("Email valido\n");
}

int main(void) {
    yylex();
    return 0;
}

int yywrap(void) {
    return 1;
}


