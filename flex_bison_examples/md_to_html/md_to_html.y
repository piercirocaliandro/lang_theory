%{
        #include <stdio.h>
%}

%union{
  char *str;
}

/* declare tokens */
        %token<str> TEXT
        %token H1 H2
        %token EOL
%%

line: 
        | line tag EOL {}
;

tag: H1 TEXT { printf("<h1>%s</h1>\n", $2); }
        | H2 TEXT { printf("<h2>%s</h2>\n", $2); }
;

%%

main(int argc, char **argv)
{
        yyparse();
}

yyerror(char *s)
{
        fprintf(stderr, "error: %s\n", s);
}
