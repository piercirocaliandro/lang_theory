md_lex:
	flex md_to_html.l
	cc -o md_lex -Wno-implicit -lfl lex.yy.c

md_parse: md_to_html.l md_to_html.y
	bison -d md_to_html.y
	flex md_to_html.l
	cc -o $@ md_to_html.tab.c lex.yy.c -lfl -Wno-implicit
