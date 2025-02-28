%{
    /*definition section*/

#include <stdio.h>  
int yylex();        
void yyerror(char* s);  


    
%}

%union {
    int num;
    char sym;
}

%token<num> NUMBER
%token<sym> VARIABLE
%token EOL
%token PLUS MINUS MULT DIV

%left PLUS MINUS
%left MULT DIV 

%type<num> exp  


%%

input: 
      exp EOL {printf("%d\n", $1);}
|     EOL;
exp:
    NUMBER { $$ = $1; }
    | VARIABLE { $$ = 0; printf("Variable: %c (default value 0)\n", $1); }
    | exp PLUS exp { $$ = $1 + $3; }
    | exp MINUS exp { $$ = $1 - $3; }
    | exp MULT exp { $$ = $1 * $3; }
    | exp DIV exp { if ($3 == 0) { yyerror("Division by zero"); $$ = 0; } else { $$ = $1 / $3; } }
    ;


%%

int main() {
    printf("Enter an expression:\n");
    yyparse();
    return 0;
}
void yyerror(char* s){
 printf("ERROR: %s\n", s);


}

