and [Aa][Nn][Dd]
or [Oo][Rr]
not [Nn][Oo][Tt]

%%
[\n()]    return yytext[0];
[ \t]		;
{or}	{ return or;}
{and}	{ return and;}
{not}	{ return not;}
%% 

int yywrap(void)
{
	return 0;
}