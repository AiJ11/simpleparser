%{
/* definitions */
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>

%}
/* rules section */
%%
[0-9_]+ {yylval.num=atoi(yytext); return NUMBER;}
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.sym = yytext[0]; return VARIABLE; }


\+  { return PLUS; }
\-  { return MINUS; }
\*  { return MULT; }
\/  { return DIV; }
\n    {return EOL;}
%%

int yywrap() {
    return 1;  
}




