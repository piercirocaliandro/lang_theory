%option noyywrap

%{
        #include <stdio.h>
        #include <stdint.h>
        #include <strings.h>

        int64_t chars = 0;
        int64_t words = 0;
        int64_t lines = 0;
%}

%%

[a-zA-Z]+       { words++; chars += strlen(yytext); }
[\n]            { chars++; lines++; }
.               { chars++; }

%%

int main(int argc, char **argv)
{
        if (argc > 1) {
                if(!(yyin = fopen(argv[1], "r"))) {
                        fprintf(stderr, "Cannot open file at %s\n", argv[1]);
                        return 1;
                }
        } else {
                fprintf(stderr, "Usage: ./flex_wc <path_to_file>");
                return 1;
        }

        yylex();
        printf("chars: %ld, words: %ld, lines: %ld\n", chars, words, lines);
}
