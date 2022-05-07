main : parser.o lexicalanalyzer.o main.o
	gcc -o main main.o parser.o lexicalanalyzer.o

main.o : lexicalanalyzer.h token.h parser.h
	gcc -c main.c -o main.o

lexicalanalyzer.o : lexicalanalyzer.c lexicalanalyzer.h token.h
	gcc -c lexicalanalyzer.c -o lexicalanalyzer.o

parser.o : parser.h parser.c token.h
	gcc -c parser.c -o parser.o

clean:
	rm main main.o parser.o lexicalanalyzer.o