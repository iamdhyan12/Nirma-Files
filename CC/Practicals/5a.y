%{
/* Definition section */
#include<stdio.h>
int flag=0;
extern int yylex();
void yyerror(const char* msg);
%}

%token NUMBER

%left '+' '-'

%left '*' '/' '%'

%left '(' ')'

/* Rule Section */
%%

ArithmeticExpression: E{

printf("\nResult=%d\n", $$);

return 0;

};
E:E'+'E {$$=$1+$3;}

|E'-'E {$$=$1-$3;}

|E'*'E {$$=$1*$3;}

|E'/'E {$$=$1/$3;}

|E'%'E {$$=$1%$3;}

|'('E')' {$$=$2;}

| NUMBER {$$=$1;}

;

%%

//driver code
void main()
{
printf("\nEnter Expression:\n");

yyparse();
if(flag==0)
printf("\nExpression is Valid Expression\n\n");
}

void yyerror(const char* msg)
{
printf("\nExpression is Invalid Expression\n\n");
flag=1;
}