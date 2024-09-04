%{
#include <stdio.h>
#include <string.h>

int is_valid_lambda = 0;

int yywrap() {
    return 1;
}
%}

%%

[ \t]+                { /* Ignorar espacios en blanco */ }
"#".*                 { /* Ignorar comentarios en Python */ }

[a-zA-Z_][a-zA-Z0-9_]*  { 
                        printf("Identificador: %s\n", yytext);
                        printf("Estado actual: %d\n", is_valid_lambda);
                        if (is_valid_lambda == 0) is_valid_lambda = 1; 
                      }
"="                     { 
                        printf("Signo igual: %s\n", yytext);
                        printf("Estado antes de '=': %d\n", is_valid_lambda);
                        if (is_valid_lambda == 1) is_valid_lambda = 2; 
                        printf("Estado después de '=': %d\n", is_valid_lambda);
                      }
"lambda"                { 
                        printf("Palabra clave lambda: %s\n", yytext);
                        printf("Estado antes de 'lambda': %d\n", is_valid_lambda);
                        if (is_valid_lambda == 2) is_valid_lambda = 3; 
                        printf("Estado después de 'lambda': %d\n", is_valid_lambda);
                      }
":"                     { 
                        printf("Dos puntos: %s\n", yytext);
                        printf("Estado antes de ':': %d\n", is_valid_lambda);
                        if (is_valid_lambda == 3) is_valid_lambda = 4; 
                        printf("Estado después de ':': %d\n", is_valid_lambda);
                      }
[-+*/a-zA-Z0-9_ \t]+    { 
                        printf("Expresión: %s\n", yytext);
                        printf("Estado antes de expresión: %d\n", is_valid_lambda);
                        if (is_valid_lambda == 4) is_valid_lambda = 5; 
                        printf("Estado después de expresión: %d\n", is_valid_lambda);
                      }
\n                      { 
                        if (is_valid_lambda == 5) {
                            printf("ACEPTA\n");
                        } else {
                            printf("NO ACEPTA\n");
                        }
                        is_valid_lambda = 0; 
                      }

.                       { 
                        printf("Símbolo desconocido: %s\n", yytext);
                        is_valid_lambda = 0; 
                      }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            printf("No se pudo abrir el archivo %s\n", argv[1]);
            return 1;
        }
        yyin = file;
        yylex();
        fclose(file);
    } else {
        printf("Uso: %s <archivo.txt>\n", argv[0]);
    }
    return 0;
}
