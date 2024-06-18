%{
        #include <stdio.h>
%}

%union{
  char *str;
}

/* declare tokens */
        %token<str> TEXT
        %token H1 H2 H3 H4 LI
        %token HTML_TAG
        %token EOL
%%

line: 
        | line content EOL {}
;

content: H1 TEXT { printf("<h1>%s</h1>\n", $2); }
        | H2 TEXT { printf("<h2>%s</h2>\n", $2); }
        | LI TEXT { printf("<li>%s</li>\n", $2); }
        | TEXT { printf("This is text: %s\n", $1); }
        | html_tag
;

html_tag: HTML_TAG
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
