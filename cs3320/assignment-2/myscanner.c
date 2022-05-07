#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char *names[] = {NULL, "db_type", "db_name", "db_table_prefix", "db_port"};

int main(void)
{
	int ntoken, vtoken;
	ntoken = yylex();
	while(ntoken)
	{
		printf("%d\n",ntoken);
		if(yylex() != COLON) 
		{
			printf("Syntax error in line %d, Expected a ':' but found %s\n", yylineno, yytext);
		}
		ntoken = yylex();
	}
	return 0;
}
