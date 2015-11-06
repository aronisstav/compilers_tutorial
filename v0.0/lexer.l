/* calc.lex */

%{
#include <stdio.h>
#include "calc.h"
%}

%option outfile="lexer.c" header-file="lexer.h"
%option noinput nounput noyywrap

%%

<<EOF>>      { return 0; }
[0-9]+       { yylval = atoi(yytext);
               return NUM; }
[\+\-\*n\n]  { return yytext[0]; }
