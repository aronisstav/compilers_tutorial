/* calc.lex */

%{
#include <stdio.h>
#include "calc.h"
%}

%option outfile="lexer.c" header-file="lexer.h"
%option noinput nounput noyywrap

%%

"Ans"        { return ANS;}
<<EOF>>      { return 0; }
[0-9]+       { yylval = atoi(yytext);
               return NUM; }
[\+\-\*\n]   { return yytext[0]; }
[[:space:]]  { /* nothing */ }
