%{
        #include <stdio.h>
        #include <stdlib.h>

        extern int yylex();
        extern void yyerror(const char *s);
%}

/* declare tokens */
        %token NUMBER
        %token ADD SUB MUL DIV ABS
        %token AND
        %token EOL
        %token OP CP
        %token COMM
%%

calclist: %empty
        | calclist exp EOL { printf("Your result: hex = %2x, dec = %d\n", $2, $2); }
        | calclist COMM EOL { printf("Comment line, ignoring...\n"); }
;

exp: factor
        | exp ADD factor { $$ = $1 + $3; }
        | exp SUB factor { $$ = $1 - $3; }
        | exp AND factor { $$ = $1 & $3; }
;

factor: term
        | factor MUL term { $$ = $1 * $3; }
        | factor DIV term { $$ = $1 / $3; }
;

term: NUMBER
        | ABS term { printf("Matched abs\n"); $$ = $2 >= 0? $2 : - $2; }
        | OP exp CP { printf("Matched\n"); $$ = $2; }
;

%%
