and [Aa][Nn][Dd]
or [Oo][Rr]
not [Nn][Oo][Tt]
true [Tt][Rr][Uu][Ee]
false [Ff][Aa][Ll][Ss][Ee]

%%
[\n()]    return yytext[0];
[ \t]		;
{or}	{ return or;}
{and}	{ return and;}
{not}	{ return not;}
{true}	{ yylval = 1; return (true); }
{false} { yylval = 0; return (false); }
%% 

int yywrap(void)
{
	return 0;
}