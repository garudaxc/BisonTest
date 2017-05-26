/* Reverse polish notation calculator. */
%{
#include <stdio.h>
#include <math.h>
int yylex (void);
void yyerror (char const *);
%}
%define api.value.type {float}
%verbose
%debug
%token NUM
%left '+' '-'
%left '*' '/'
%right '^'
%% /* Grammar rules and actions follow. */
aaaa:
%empty
| aaaa line
;
line:
'\n'
| exp '\n' { printf ("%.3f\n", $1); }
;

exp:
NUM { $$ = $1; }
| exp '+' exp { $$ = $1 + $3; }
| exp '-' exp { $$ = $1 - $3; }
| exp '*' exp { $$ = $1 * $3; }
| exp '/' exp { $$ = $1 / $3; }
| exp '^' exp { $$ = pow ($1, $3); } /* Exponentiation */
;

%%