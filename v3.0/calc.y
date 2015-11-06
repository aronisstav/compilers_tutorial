/* Reverse polish notation calculator. */

%{
#include "lexer.h"
#include "calc.h"

int yyerror (char *s);

int ans = 0;

%}

%output  "calc.c"
%defines "calc.h"

%token NUM ANS
%left '-' '+'
%left '*'
%left NEG     /* negation--unary minus */

%% /* Grammar rules and actions follow */

input:    /* empty */
        | input line
;

line:     '\n'
        | exp '\n'   { printf ("\tAns: %d\n", $1);
                       ans = $1; }
        | error '\n' { yyerrok; }
;

exp:      NUM               { $$ = $1;      }
        | exp '+' exp       { $$ = $1 + $3; }
        | exp '-' exp       { $$ = $1 - $3; }
        | exp '*' exp       { $$ = $1 * $3; }
        | '-' exp %prec NEG { $$ = -$2;     }
        | '(' exp ')'       { $$ = $2;      }
        | ANS               { $$ = ans;     }
;
%%

int yyerror (char *s) {
  /* Called by yyparse on error */
  printf ("%s\n", s);
  return 0;
}

int main () {
  yyparse();
  return 0;
}
