OBJ=calc

calc:	calc.l calc.y
	flex calc.l
	bison -d calc.y
	gcc -c -o scanner.o lex.yy.c
	gcc -c -o parser.o calc.tab.c
	gcc -c -o calc.o main.c

	gcc -o ${OBJ} parser.o scanner.o calc.o

clean:
	rm *.yy.h *.yy.c *.tab.c *.o *.tab.h ${OBJ}
