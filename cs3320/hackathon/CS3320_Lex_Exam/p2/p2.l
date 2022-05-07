select			[S|s][E|e][L|l][E|e][C|c][T|t]
delay			[D|d][E|e][L|l][A|a][Y|y]
if				[I|i][F|f]
else 			[E|e][L|l][S|s][E|e]
input 			[a-zA-Z]+[_a-zA-Z0-9]+[:][ ][I|i][N|n][T|t]
readInt			[a-zA-Z]+[_a-zA-Z0-9]+[ ]?[=][ ]?[R|r][E|e][A|a][D|d][I|i][N|n][T|t]
%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	FILE *ptr = fopen("output.c","w");
	void beginner();
	void set_current_display();
	void delay();
	void set_digits();
	void ifff();
	void elsee();
	void inputer();
	void readinputer();
	char indent = ' ';
	char var_name[100];
%}


%%
[#][^\n]*												{/*this is a comment*/}
[I|i][N|n][I|i][T|t]									{/* to initiate the progran*/ beginner();}
{select}[:][" "][0-9]+									{/*to set the current display to something*/ set_current_display();}
{delay}[:][" "][0-9]+									{/*to set the current display to something*/ delay();}
{if}[ ][a-zA-Z]+[ ][=><!]{1,2}[ ][0-9]+[:]				{/*if statement*/ ifff();}
{else}[:]												{/*else statement*/ elsee();}
{input}													{/* */ inputer();}
{readInt}												{readinputer();}
([\t| ][0-1]){8} 										{/* on off signals*/set_digits();}
'0'														{printf("wtf");return 0;}
"exit"													{return 0;}
.														{/*ignore bad characters*/ printf("%s",yytext);}

%%

int yywrap(void){return 1;}

int main()
{
	extern FILE* ptr;
	yylex();
	fprintf(ptr,"\t}\n}");
	fclose(ptr);
	return 0;
}

void inputer()
{
	extern FILE* ptr;
	fseek(ptr, -13, SEEK_CUR);
	fprintf(ptr, "\tint ");
	extern char var_name[100];
	for(int i=0; i<strlen(yytext)-5; i++)
	{
		var_name[i] = yytext[i];
		fprintf(ptr, "%c", yytext[i]);
	}
	fprintf(ptr,";\n");
	fprintf(ptr,"\twhile(1)\n\t{\n");
}

void readinputer()
{
	extern FILE* ptr;
	extern char var_name[100];
	fprintf(ptr,"\t\t%s = readInt();\n",var_name);

}

void ifff()
{
	extern FILE* ptr;
	fprintf(ptr,"\t\tif(");
	for(int i = 0; i<strlen(yytext)-4; i++)
	{
		fprintf(ptr,"%c",yytext[i+3]);
	}
	fprintf(ptr,")\n");
	extern char indent;
	indent = '\t';
	fprintf(ptr,"\t\t{\n");
}

void elsee()
{
	extern FILE* ptr;
	fprintf(ptr,"\t\telse\n");
	extern char indent;
	indent = '\t';
	fprintf(ptr,"\t\t{\n");
}

void beginner()
{
	extern FILE* ptr;
	fprintf(ptr,"#include<stdio.h>\n#include<stdlib.h>\n#include<seven_segment.h>\nint main()\n{\n\tinit();\n\twhile(1)\n\t{\n");
}

void set_current_display()
{
	extern FILE* ptr;
	int size_num = sizeof(yytext) - 7;
	char num[size_num];
	for(int i = 0; i< size_num; i++)
	{
		num[i] = yytext[i+8];
	}
	int current_display = atoi(num);
	fprintf(ptr, "\t\tselect(%d);\n",current_display);
}

void delay()
{
	extern FILE* ptr;
	int size_num = sizeof(yytext) - 6;
	char num[size_num];
	for(int i = 0; i< size_num; i++)
	{
		num[i] = yytext[i+7];
	}
	int delay = atoi(num);
	fprintf(ptr, "\t\tdelay(%d);\n",delay);
}

void set_digits()
{
	extern char indent;
	extern FILE* ptr;
	int digits[8];
	for(int i = 0; i< 8;i++)
	{
		digits[i] = atoi(&yytext[2*i+1]);
	}	
	fprintf(ptr, "%c\t\twrite(strtol(\"",indent);
	for(int i =0;i<8;i++)
	{
		fprintf(ptr, "%d",digits[i]);
	}
	fprintf(ptr, "\"));\n");
	if(indent == '\t')
	{
		indent = ' ';
		fprintf(ptr,"\t\t}\n");
	}
}
