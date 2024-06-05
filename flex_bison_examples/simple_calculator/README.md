# Calculator app

These repositories contain code for various steps towards building a simple pocket calculator application

## example\_0

This very first example makes use of `flex` only. `flex` is the lexer tool, so it scans the input and matches each token of the input against some defined _regular expressions_ (_regexp_).

In this example, the _regexp_ allows recognizing basic operations, integer numbers and trash characters (i.e. special chars etc...)

## example\_1

In this project, `flex` + `bison` are used. `bison` is the parser part: it allows to the user to specify a grammar (which __must be non-ambiguous__) and the rules of such grammar are used by `bison` to parse user input.
