%{

#include <iostream>
#include <stdio.h>
//#include "decl.h"
#include "test.y.hpp"

#define YYSTYPE float

extern "C" int yywrap(void)
{
	return 1;
}

%}

/* %option noyywrap */

 	
DIGIT    [0-9]
ID       [a-z][a-z0-9]*


%%
{DIGIT}+    {
	//printf( "An integer: %s (%d)\n", yytext,
	//         atoi( yytext ) );
	yylval = (float)atof(yytext);
	return NUM;
}

{DIGIT}+"."{DIGIT}*        {
	// printf( "A float: %s (%g)\n", yytext,
	//         atof( yytext ) );
	
	yylval = (float)atof(yytext);
	return NUM;
}

"+"|"-"|"*"|"/"|"^"|"\n"  {
	//printf( "An operator: %s\n", yytext );
	return yytext[0];
}

[ \t\r]+		 /* printf( "An whitespace: \n", yytext ); eat up whitespace */

.				printf( "Unrecognized character: %s\n", yytext );

%%