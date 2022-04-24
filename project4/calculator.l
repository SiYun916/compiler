%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>

#include "calculator_yacc.h"
    
#define		ERRORCHAR	600

int line_no = 1;
%}

%option noyywrap

/************************************
*	MACRO DEFINITION	*
*************************************/
letter		[A-Za-z]
alnum		[A-Za-z0-9]
d			[0-9]
white		[\t\040]
white_line  [\n]

/*****************************************
*	RECOGNIION RULES	         *
*****************************************/
%%
{d}+		{
                yylval.number = (int)strtol(yytext, (char **)NULL, 10);
                return DIGIT;
            }
{d}\.{d}+  {
                yylval.double_number = (double)strtod(yytext, (char **)NULL);
                return FLOAT;
            }

"("			{return '(';}
")"			{return ')';}

"\."        {return '.';}
"*"			{return '*';}
"+"			{return '+';}
"-"			{return '-';}
"/"			{return '/';}
"%"			{return '%';}

{white}+		{/* ECHO; */}
{white_line}    { line_no ++;}
.			{
                printf("Invalid char %s\n",yytext);
                return ERRORCHAR;
            }

%%
