%option noyywrap
%{
        #include <stdio.h>
        #include "md_to_html.tab.h"
%}
%%

[#]{1}                          { return H1; }
[#]{2}                          { return H2; }
[#]{3}                          { return H3; }
[#]{4}                          { return H4; }
[A-Za-z0-9]+                    { yylval.str = yytext; return TEXT; }
^[<].+[>].*[</].+[>]$           { return HTML_TAG; }
[*]{1}[ \t]*                    { return LI; }
[0-9]+[.][ \t]*                 { return LI; }
\n                              { return EOL; }

%%
