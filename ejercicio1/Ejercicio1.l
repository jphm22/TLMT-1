%{
#include <stdio.h>
#include <string.h>

// Función para validar el email
void validar_email(const char *email) {
    // Verificar la longitud mínima del dominio
    const char *dominio = strrchr(email, '.');
    if (dominio != NULL && strlen(dominio) > 2) {
        printf("Email valido\n");
    } else {
        printf("Email invalido\n");
    }
}

// Función yywrap
int yywrap(void) {
    return 1;
}

%}

%%
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+ {
    validar_email(yytext);
    return 0;
}

.|\n {
    printf("Email invalido\n");
    return 0;
}
%%

int main(int argc, char **argv) {
    char input[256];

    while (fgets(input, sizeof(input), stdin)) {
        // Remover el salto de línea si está presente
        input[strcspn(input, "\n")] = 0;

        // Reiniciar el escáner con la nueva entrada
        YY_BUFFER_STATE buffer = yy_scan_string(input);
        yylex();
        yy_delete_buffer(buffer);
    }

    return 0;
}
