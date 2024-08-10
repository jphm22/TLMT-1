%option noyywrap
%{
	#include <stdio.h>
%}

%%

"e"|"f"+        { printf("Letra 'e'o una o mas letras 'f'\n");}
("a"|"b"){2}    { printf("Es la letra 'a' o 'b'\n");}
"0"|"1"         { printf("CERO/UNO\n");}
[0-9]+     		{ printf("NUMERO ENTERO\n");}
[a-z]+    		{ printf("PALABRA MINUSCULA\n");}
[A-Z]+  		{ printf("PALABRA MAYUSCULA\n");}


%%

int main()
{
	yyin = stdin;
	yylex();
	return 0;
}