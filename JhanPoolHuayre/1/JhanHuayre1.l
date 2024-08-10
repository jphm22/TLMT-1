%option noyywrap
%{
    #include <stdio.h>
    #include <string.h>
%}

%%

"if"        { printf("Palabra clave 'if'\n"); }
"else"      { printf("Palabra clave 'else'\n"); }
[0-9]+      { printf("Numero entero: %s\n", yytext); }
[a-zA-Z]+   { printf("Palabra clave '%s'\n", yytext); }
.           { printf("Caracter no reconocido: %s\n", yytext); }

%%

int main()
{
    yyin = stdin;
    yylex();
    return 0;
}