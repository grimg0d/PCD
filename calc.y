%{
   /* Definition section */
  #include <stdio.h>
  int flag = 0;
%}

%token NUMBER

%left '+' '-'

%left '*' '/' '%'

%left '(' ')'

/* Rule Section */
%%

ArithmeticExpression: E{
         printf("\nResult = %d\n", $$);
         return 0;
        };

E:E'+'E {$$ = $1 + $3;}
 |E'-'E {$$ = $1 - $3;}
 |E'*'E {$$ = $1 * $3;}
 |E'/'E {$$ = $1 / $3;}
 |E'%'E {$$ = $1 % $3;}
 |'('E')' {$$ = $2;}
 | NUMBER {$$ = $1;}
 ;
%%

void main()
{
   printf("\nEnter any arithmetic expression which can have operations +, -, *, / and ():\n");

   yyparse();
   if(flag == 0)
      printf("\nValid arithmetic expression\n\n");
}

void yyerror()
{
   printf("\nInvalid arithmetic expression\n\n");
   flag = 1;
}
