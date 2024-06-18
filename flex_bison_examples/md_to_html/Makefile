md_parse: md_to_html.l md_to_html.y
	bison -d md_to_html.y
	flex md_to_html.l
	cc -o $@ md_to_html.tab.c lex.yy.c -lfl -Wno-implicit

clean:
	rm md_parse *.yy.c *.tab.h *.tab.c
