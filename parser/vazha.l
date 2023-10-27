
%{

#include<stdlib.h>
#include "incFile.h"
#include "y.tab.h"

void yyerror(char *);
%}

%%
[0-9]+		{yylval.iValue = atoi(yytext); return INTEGER;}
[()={};]		{return *yytext;}

"cheruth"				return CHERUTH;
"valuth"				return VALUTH;
"cheruth_allengi_samam"	return CHERUTH_ALLENGI_SAMAM;
"veluth_allenki_samam"	return VELUTH_ALLENGI_SAMAM;
"samam"					return SAMAM;
"ippo"					return IPPO;
"anengi"				return ANENGI;
"allengi"				return ALLENGI;
"kaniku"				return KANIKU;


[ \t\"\n]			;
.		{printf("%s ",yytext); yyerror("Eda ith enna?\n");}
%%

int yywarp(void)
{
	return 1;
}

