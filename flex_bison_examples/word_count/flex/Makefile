OBJ=flex_wc

wc:	wc.l
	flex wc.l
	gcc lex.yy.c -o ${OBJ} -lfl

clean:
	rm *.yy.c ${OBJ}
