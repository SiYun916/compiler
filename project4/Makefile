CFLAGS = -g

all: calculator calculator_self calculator_lex

calculator: calculator_lex.o calculator_yacc.o expr.o main.o
	gcc $(CFLAGS) -o $@ $^

calculator_self: myflex.o calculator_yacc_self.o expr.o main_self.o
	gcc $(CFLAGS) -o $@ $^

calculator_lex: calculator_lex.o main_lex.o
	gcc $(CFLAGS) -o $@ $^

myflex.o: myflex.c myflex.h
	gcc -DLEX_SELF $(CFLAGS) -c -o $@ $<

expr.o: expr.c expr.h
	gcc $(CFLAGS) -c -o $@ $<

calculator_lex.o: calculator_lex.c calculator_yacc.h
	gcc $(CFLAGS) -c -o $@ $<

calculator_lex.c alculator_lex.h: calculator.l
	flex -o calculator_lex.c --header-file=calculator_lex.h calculator.l

calculator_yacc.o: calculator_yacc.c calculator_yacc.h calculator_lex.h
	gcc $(CFLAGS) -c -o $@ $<

calculator_yacc_self.o: calculator_yacc.c calculator_yacc.h calculator_lex.h
	gcc -DLEX_SELF $(CFLAGS) -c -o $@ $<

calculator_yacc.c calculator_yacc.h: calculator.y
	bison -d -o calculator_yacc.c calculator.y

main.o: main.c calculator_yacc.h calculator_lex.h
	gcc $(CFLAGS) -c -o $@ $<

main_self.o: main.c calculator_yacc.h myflex.h
	gcc -DLEX_SELF $(CFLAGS) -c -o $@ $<

main_lex.o: main.c calculator_yacc.h calculator_lex.h
	gcc -DLEX_MAIN $(CFLAGS) -c -o $@ $<


tmpclean:
	rm -rf *.o

clean:
	rm -rf *.o
	rm -rf *.dSYM
	rm -rf calculator_yacc.* calculator_lex.*
	rm -f calculator calculator_self calculator_lex

zip:
	tar --exclude *.tar.* -cvf calculator.tar *
	gzip -f calculator.tar
