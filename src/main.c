#include "parser.tab.h"
#include <stdio.h>

/* Called by yyparse on error. */
void
yyerror (char const *s)
{
  fprintf (stderr, "%s\n", s);
}

int
main (void)
{
  return yyparse ();
}
