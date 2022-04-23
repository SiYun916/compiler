#include <stdio.h>

#ifdef LEX_SELF
#include "myflex.h"
#else
#include "calculator_lex.h"
#endif

#include "calculator_yacc.h"

#ifndef LEX_MAIN

extern int yyparse(void);

int main(int argc, char *argv[]) 
{
    // 词法分析的输入文件指针，默认指向终端
    yyin = stdin;

    if (argc > 1) {
        
        // 若指定有参数，则作为词法分析的输入文件
        if ((yyin = fopen(argv[1], "r")) == NULL) {
            printf("Can't open file %s\n", argv[1]);
            return -1;
        }
    }

    yyparse();

    return 0;
}

#else

YYSTYPE yylval;

int main(int argc, char** argv)
{
    int c;
    FILE *pout;

    yyin = stdin;

    if(argc > 1) {

        if((yyin = fopen(argv[1],"r"))==NULL) {
            printf("Can't open file %s\n",argv[1]); 
            exit(-1);
        }
    }

    pout = fopen("result.dat","w");

    int i = 0;
    while(c = yylex()) {
        if(c != '\n') {
            fprintf(pout,"(%4d,  %s)\t", c, yytext); 
        } else {
            fprintf(pout,"(%4d,  \\n)\t", c); 
        }

        i++;

        if( i % 4 == 0) fprintf(pout,"\n");
    }

    fclose(pout);

    return 0;
}
#endif
