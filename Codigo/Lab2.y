%{
	#include <ctype.h>
	#include <stdio.h>
	#include <stdlib.h>
	extern int yylex();
	void yyerror (char *msg);
%}

%token or and not true false boolean

%%

lines : lines bexpr '\n'   {printf($2 ? "true\n" : "false\n") ;}
      | lines '\n'
	  |
	  ;
 

bexpr  : bexpr or bterm    { $$ = $1 || $3}
      | bterm;
	  
bterm  : bterm and bfactor { $$ = $1 && $3}
      | bfactor;

bfactor : not bfactor      {$$ = !$2}
       | '(' bexpr ')' 	{$$ = $2}
	   | true			{$$=$1}
	   | false			{$$=$1};


%%

#include "lex.yy.c";

void yyerror(char *msg)
{
	printf("Syntax error");
	exit(0);
}

main()
{
	yyparse();
	return 0;
}