%option noyywrap
%{
        #include <stdio.h>
        #include "md_to_html.tab.h"
%}
%%

[#]{1}          { return H1; }
[#]{2}          { return H2; }
[A-Za-z0-9]+    { yylval.str = yytext; return TEXT; }
\n              { return EOL; }

%%
