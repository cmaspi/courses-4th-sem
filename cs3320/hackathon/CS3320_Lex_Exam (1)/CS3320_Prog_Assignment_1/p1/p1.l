d8		[1-8]
D 		[1-9][0-9]*
pieces	[KQRBN]
promo   [QRBN]

%{
#include <stdio.h>
#include <stdlib.h>

char board[8][8] = {{'R','N','B','Q','K','B','N','R'},
					{'P','P','P','P','P','P','P','P'},
					{' ',' ',' ',' ',' ',' ',' ',' '},
					{' ',' ',' ',' ',' ',' ',' ',' '},
					{' ',' ',' ',' ',' ',' ',' ',' '},
					{' ',' ',' ',' ',' ',' ',' ',' '},
					{'P','P','P','P','P','P','P','P'},
					{'R','N','B','Q','K','B','N','R'}};

void move();
void promote();
void printer();
%}


%%
{D}*.(" "{pieces}?[a-h]{d8}[-x][a-h]{d8}){2} 				{move();}
{D}*.(" "{pieces}?[a-h]{d8}[-x][a-h]{d8}([=]{promo})?){2}	{promote();}
'\0'														{return 0;}
.															{/*ignore bad characters*/}
%%

int yywrap(void){return 1;}

int main()
{	
	yylex();
	printer();
	return 0;
}

void printer()
{
	extern char board[8][8];
	printf("\ta\tb\tc\td\te\tf\tg\th\n");
	for(int i = 0; i<8; i++)
	{
		printf("%d\t",i+1);
		for(int j = 0; j<8; j++)
		{
			printf("%c\t",board[i][j]);		
		}
		printf("\n");
	}
}

void move()
{
	extern char board[8][8];
	int idx = 3;
	if(yytext[idx] < 97)
	{
		idx += 1;
	}
	int strt_y = int(yytext[idx])-97;
	idx+=1;
	int strt_x = int(yytext[idx])-49;
	idx+=2;
	int end_y = int(yytext[idx])-97;
	idx+=1;
	int end_x = int(yytext[idx])-49;
	idx += 2;


	board[end_x][end_y] = board[strt_x][strt_y];
	board[strt_x][strt_y] = ' ';


	if(yytext[idx] < 97)
	{
		idx += 1;
	}
	strt_y = int(yytext[idx])-97;
	idx+=1;
	strt_x = int(yytext[idx])-49;
	idx+=2;
	end_y = int(yytext[idx])-97;
	idx+=1;
	end_x = int(yytext[idx])-49;
	idx += 2;

	board[end_x][end_y] = board[strt_x][strt_y];
	board[strt_x][strt_y] = ' ';
}

void promote(void)
{
	char promotion_piece = ' ';
	extern char board[8][8];
	int idx = 3;
	if(yytext[idx] < 97)
	{
		idx += 1;
	}
	int strt_y = int(yytext[idx])-97;
	idx+=1;
	int strt_x = int(yytext[idx])-49;
	idx+=2;
	int end_y = int(yytext[idx])-97;
	idx+=1;
	int end_x = int(yytext[idx])-49;
	idx += 1;
	if(yytext[idx] == '=')
	{
		idx += 1;
		promotion_piece = yytext[idx];
		idx += 2;
	}

	board[end_x][end_y] = board[strt_x][strt_y];
	board[strt_x][strt_y] = ' ';
	if(promotion_piece != ' ')
	{
		board[end_x][end_y] = promotion_piece;
	}
	else idx+=1;

	promotion_piece = ' ';

	if(yytext[idx] < 97)
	{
		idx += 1;
	}
	strt_y = int(yytext[idx])-97;
	idx+=1;
	strt_x = int(yytext[idx])-49;
	idx+=2;
	end_y = int(yytext[idx])-97;
	idx+=1;
	end_x = int(yytext[idx])-49;
	idx += 1;
	if(yytext[idx] == '=')
	{
		idx += 1;
		promotion_piece = yytext[idx];
		idx += 2;
	}
	else idx+=1;

	board[end_x][end_y] = board[strt_x][strt_y];
	board[strt_x][strt_y] = ' ';

	if(promotion_piece != ' ')
	{
		board[end_x][end_y] = promotion_piece;
	}

}
