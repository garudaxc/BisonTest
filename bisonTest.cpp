// bisonTest.cpp : 定义控制台应用程序的入口点。
//
#include <stdio.h>
#include <tchar.h>
#include "gen.h"



void yyerror(const char* err)
{
	printf("errrr %s", err);
}
int
yyparse(void);

extern "C" int foo()
{	
	int a = 0;

	switch (a)
	{
	case 1:
		return 0;
		break;
	default:
		break;
	}
}


int _tmain(int argc, _TCHAR* argv[])
{
	char* filename = "D:/test/bisontest/input.txt";
	FILE *pf = fopen(filename, "r");
	if (pf == nullptr)
	{
		printf("can not open file %s\n", filename);
		return 0;
	}

	char buffer[2048];
	int size = fread(buffer, 1, 2048, pf);
	fclose(pf);

	if (size > 0)
	{
		buffer[size] = '\0';
	}


	yy_scan_string(buffer);

	//while (yylex() > 0)
	//{

	//}


	yyparse();

	return 0;
}

void IdentifierTest(bool b)
{
	//printf("IdentifierTest");
}

void NumberTest(const char* str)
{
	//printf("NumberTest");
	//yylval = (float)atof(str);
}

void StringTest(const char* str)
{
	//printf("StringTest");

}



