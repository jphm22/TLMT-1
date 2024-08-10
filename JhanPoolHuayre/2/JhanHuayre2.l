%option noyywrap
%{
    #include <stdio.h>
    #include <string.h>

    int has_upper = 0;
    int has_lower = 0;
    int has_digit = 0;
    int has_special = 0;

    void bandera() {
        has_upper = 0;
        has_lower = 0;
        has_digit = 0;
        has_special = 0;
    }

    void verificar_contraseña() {
        if (has_upper && has_lower && has_digit && has_special) {printf("CONTRASEÑA SEGURA\n");} 
        else {printf("CONTRASEÑA INSEGURA\n");}
    }
%}

MAYUSCULA   [A-Z]
MINUSCULA   [a-z]
DIGITOS   [0-9]
ESPECIAL [!@#$%^&*()]

%%

{MAYUSCULA}    { has_upper = 1; }
{MINUSCULA}    { has_lower = 1; }
{DIGITOS}    { has_digit = 1; }
{ESPECIAL}  { has_special = 1; }
\n         { verificar_contraseña(); bandera(); }
.          { ; } 

%%

int main() {
    yyin = stdin;
    yylex();
    return 0;
}
