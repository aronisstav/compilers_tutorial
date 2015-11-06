/* Reverse polish notation calculator. */

%{
#include "lexer.h"
#include "calc.h"

int yyerror (char *s);

%}

%output  "calc.c"
%defines "calc.h"

%token NUM

%% /* Grammar rules and actions follow */

input:    /* empty */
        | input line
;

line:     '\n'
        | exp '\n'  { printf ("\tAns: %d\n", $1); }
;

exp:      NUM             { $$ = $1;         }
        | exp exp '+'     { $$ = $1 + $2;    }
        | exp exp '-'     { $$ = $1 - $2;    }
        | exp exp '*'     { $$ = $1 * $2;    }
        | exp 'n'         { $$ = -$1;        }
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
