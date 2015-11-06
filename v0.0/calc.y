/* Reverse polish notation calculator. */

%{
#include "lexer.h"
#include "calc.h"

int yyerror (char *s);

%}

%output  "calc.c"
%defines "calc.h"

%% /* Grammar rules and actions follow */

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
