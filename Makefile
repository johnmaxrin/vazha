all:	program

program:	y.tab.c lex.yy.cc 
	gcc lex.yy.c y.tab.c gen/codeGen.c -o vazha -lfl

lex.yy.cc:	parser/vazha.l
	lex parser/vazha.l

y.tab.c:	parser/vazha.y
	yacc -d parser/vazha.y

clean: 
	rm -f parser/lex.yy.c parser/y.tab.c y.tab.h vazha