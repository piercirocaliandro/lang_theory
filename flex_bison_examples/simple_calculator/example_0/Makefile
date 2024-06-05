OBJ=calc

calc:	calc.l
	flex calc.l
	gcc -c -o scanner.o lex.yy.c -Wno-implicit
	gcc -o ${OBJ} scanner.o -lfl

clean:
	rm *.yy.c *.o ${OBJ}
