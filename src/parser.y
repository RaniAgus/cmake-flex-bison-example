/* Infix notation calculator. */

%{
  #include <math.h>
  #include <stdio.h>

  int yylex (void);
  void yyerror (char const *);
%}

/* Bison declarations. */
%define api.value.type {double}
%token NUM
%left '-' '+'
%left '*' '/'
%precedence NEG   /* negation--unary minus */
%right '^'        /* exponentiation */

%% /* The grammar follows. */
input:
  %empty       { printf ("Infix calculator.  Enter expressions"
                         " in infix notation.\n"); }
| input line
;

line:
  '\n'      { return 0; }
| exp '\n'  { printf ("= %.10g\n", $1); }
;

exp:
  NUM
| exp '+' exp        { $$ = $1 + $3;      }
| exp '-' exp        { $$ = $1 - $3;      }
| exp '*' exp        { $$ = $1 * $3;      }
| exp '/' exp        { $$ = $1 / $3;      }
| '-' exp  %prec NEG { $$ = -$2;          }
| exp '^' exp        { $$ = pow ($1, $3); }
| '(' exp ')'        { $$ = $2;           }
;
%%
