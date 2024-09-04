%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool valid_expression = true;
enum { NONE, VARIABLE, ASSIGNMENT, LAMBDA, COLON, EXPRESSION } state = NONE;
bool lambda_found = false;
bool colon_found = false;
bool assignment_found = false;
bool variable_found = false;

void print_error(const char* message) {
    fprintf(stderr, "Error: %s\n", message);
    valid_expression = false;
}
%}

%%

lambda        { 
                if (state == VARIABLE || state == ASSIGNMENT) {
                    lambda_found = true;
                    state = LAMBDA;
                    printf("Token: LAMBDA\n");
                } else {
                    print_error("Lambda should follow a variable or assignment.");
                }
              }
[a-zA-Z_][a-zA-Z0-9_]* {
                      if (state == NONE || state == VARIABLE) {
                          state = VARIABLE;
                          variable_found = true;
                          printf("Token: VARIABLE\n");
                      } else if (state == LAMBDA) {
                          state = COLON;
                          printf("Token: VARIABLE\n");
                      } else if (state == ASSIGNMENT) {
                          state = LAMBDA;
                          printf("Token: VARIABLE\n");
                      } else {
                          print_error("Unexpected variable placement.");
                      }
                      }
=              {
                if (state == VARIABLE) {
                    assignment_found = true;
                    state = ASSIGNMENT;
                    printf("Token: ASSIGNMENT\n");
                } else {
                    print_error("Assignment (=) should follow a variable.");
                }
              }
:              {
                if (state == LAMBDA) {
                    state = COLON;
                    printf("Token: COLON\n");
                } else {
                    print_error("Colon (:) should follow lambda.");
                }
              }
\*\*           { 
                if (state == EXPRESSION) {
                    printf("Token: EXPONENT\n");
                } else {
                    print_error("Exponent (**) should be in an expression context.");
                }
              }
\*             {
                if (state == EXPRESSION) {
                    printf("Token: MULTIPLY\n");
                } else {
                    print_error("Multiplication (*) should be in an expression context.");
                }
              }
\+             {
                if (state == EXPRESSION) {
                    printf("Token: PLUS\n");
                } else {
                    print_error("Plus (+) should be in an expression context.");
                }
              }
\-             {
                if (state == EXPRESSION) {
                    printf("Token: MINUS\n");
                } else {
                    print_error("Minus (-) should be in an expression context.");
                }
              }
\/             {
                if (state == EXPRESSION) {
                    printf("Token: DIVIDE\n");
                } else {
                    print_error("Divide (/) should be in an expression context.");
                }
              }
[0-9]+         {
                if (state == VARIABLE || state == COLON) {
                    state = EXPRESSION;
                }
                printf("Token: NUMBER\n");
              }
\n             {
                if (state == EXPRESSION) {
                    printf("End of line.\n");
                } else {
                    print_error("Line should end with a valid expression.");
                }
                state = NONE; // Reset state for new line
              }
[ \t]          { /* Ignorar espacios y tabulaciones */ }
.              { 
                print_error("Unknown token encountered.");
              }

%%

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <inputfile>\n", argv[0]);
        exit(1);
    }

    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        exit(1);
    }

    yyin = file;
    yylex();
    fclose(file);

    if (valid_expression && lambda_found && colon_found && assignment_found && variable_found) {
        printf("ACEPTADO\n");
    } else {
        printf("NO ACEPTADO\n");
    }

    return 0;
}
