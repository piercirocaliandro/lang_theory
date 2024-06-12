/* Lexer part: recognize tokens for the calculator and print them out 
 * This is the scanner, which uses flex
*/
%option noyywrap
%option header-file="lex.yy.h"

%{
        #include <stdio.h>
        #include <stdlib.h>
        #include "calc.tab.h"
%}

%%

"+"             { return ADD; }
"-"             { return SUB; }
"*"             { return MUL; }
"/"             { return DIV; }
"&"             { return AND; }
"|"             { return ABS; }
[0-9]+          { yylval = strtol(yytext, NULL, 10); return NUMBER; }
0x[a-f0-9]+     { yylval = strtol(yytext, NULL, 16); return NUMBER; }
\n              { return EOL; }
[ \t]           { /* ignore whitespace */ }
"("             { return OP; }
")"             { return CP; }
"//".*          { return COMM; } /* ignore comments */
.               { printf("Mystery character %c\n", *yytext); }
%%
