%{
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

#include "expr.h"

#ifdef LEX_SELF
#include "myflex.h"
#else
#include "calculator_lex.h"
#endif

#include "calculator_yacc.h"

void yyerror(char * msg);

extern int line_no;

%}

%union
{
    struct expr * exp;
    int number;
    double double_number;
};

%start  Input

%left '+'
%left '-'
%left '*'
%left '/'

%token <number> DIGIT
%token <double_number> FLOAT

%type <exp> Expr
%type <exp> Term
%type <exp> Factor

%%
Input   : Line {} ;

Line   :  Line Expr 
            {
                expr_print($2);
            }
        | Expr 
            {
                expr_print($1);
            };

Expr   :  Expr '+' Term
            {   /* Expr = Expr + Term */
                expr_add($1, $3, $$);
            }
       |  Expr '-' Term
            {   /* Expr = Expr - Term */
                expr_sub($1, $3, $$);
            }
       |  Term 
            {
                /* Expr = Term */
                $$ = $1;
            };

Term   :  Term '*' Factor
            {
                /* Term=Term*Factor */
                expr_mult($1, $3, $$);
            }
       |  Term '/' Factor
            {
                /* Term=Term*Factor */
                expr_div($1, $3, $$);
            }
       |  Factor
            {
                /* Term = Factor */
                $$ = $1;
            };

Factor :  '(' Expr ')'
            {
                /* Factor=Expr */
                $$ = $2;
            }
       |  DIGIT
            {
                struct expr *tmp_node;

                tmp_node = expr_alloc(INT_TYPE, $1);
                if(NULL == tmp_node) {
                    printf("memory alloc failed\n");
                    exit(-1);
                }
              
                $$ = tmp_node;
            };
       |  FLOAT
            {
                struct expr *tmp_node;

                tmp_node = expr_alloc_float(REAL_TYPE, $1);
                if(NULL == tmp_node) {
                    printf("memory alloc failed\n");
                    exit(-1);
                }
              
                $$ = tmp_node;
            };
%%

void yyerror(char * msg)
{
    printf("Line(%d): %s\n", line_no, msg);
}
