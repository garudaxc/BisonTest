%{

#include <iostream>
#include <stdio.h>
//#include <io.h>
//#include <process.h>
#include "decl.h"
//#include "json.y.hpp"

#define YY_NO_UNISTD_H

%}

%option noyywrap


int [+-]*[0-9]+ 
num [+-]*([0-9]|\.)* 
string \"(\\.|[^\\"])*\"
ignore_char [ \t\r]
identifier [a-zA-Z_][a-zA-Z0-9_]*
op [+-*/]

%%
{identifier} {
			IdentifierTest(true);
            return TRUE;
}

{num}  {
		NumberTest(yytext);
        return NUM;
    }/*要区分浮点数*/


{string}  {
    /*去掉前后引号的处理，存到TData里面不需要引号*/
    /**/
	StringTest(yytext);
    return STRING;
}
"{" {return L_BRACE;}
"}" {return R_BRACE;}
"[" {return L_BRACKET;}
"]" {return R_BRACKET;}
":" {return COLON;}
";" {return SEMICOLON;}
"," {return COMMA;}
"\n" {return '\n';}
{ignore_char}

%%