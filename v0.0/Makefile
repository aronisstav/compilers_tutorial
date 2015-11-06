CFLAGS = -Wall -pedantic

calc: calc.o lexer.o
	$(CC) $(CFLAGS) -o $@ $^ -lm -lfl

calc.c calc.h: calc.y lexer.h
	bison $<

lexer.c lexer.h: lexer.l
	flex $<

.PHONY: clean
clean:
	rm -f *.c *.h *.o

.PHONY: distclean
distclean: clean
	rm -f calc
