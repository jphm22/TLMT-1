%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);

%}

%token NUMBER

%%

expr   : expr '+' term   { $$ = $1 + $3; }
       | expr '-' term   { $$ = $1 - $3; }
       | term            { $$ = $1; }
       ;

term   : term '*' factor { $$ = $1 * $3; }
       | term '/' factor { $$ = $1 / $3; }
       | factor          { $$ = $1; }
       ;

factor : '(' expr ')'    { $$ = $2; }
       | NUMBER          { $$ = $1; }
       ;

%%

int main(void) {
    printf("Ingrese una expresión: ");
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

