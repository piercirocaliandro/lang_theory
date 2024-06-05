/* Lexer part: recognize tokens for the calculator and print them out 
 * This is the scanner, which uses flex
*/
%option noyywrap
%option header-file="lex.yy.h"

%{
        #include <stdio.h>
        #include "calc.tab.h"
%}

%%

"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"|"     { return ABS; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
[ \t]   { /* ignore whitespace */ }
.       { printf("Mystery character %c\n", *yytext); }

%%
