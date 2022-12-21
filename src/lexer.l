%{
    #include "parser.tab.h"
%}

%option noyywrap

%%

[1-9][0-9]* {
    yylval = strtol(yytext, NULL, 10);
    return NUM;
}

0[0-7]* {
    yylval = strtol(yytext, NULL, 8);
    return NUM;
}

0[xX][0-9a-fA-F]+ {
    yylval = strtol(yytext, NULL, 16);
    return NUM;
}

"+" {
    return '+';
}

"-" {
    return '-';
}

"*" {
    return '*';
}

"/" {
    return '/';
}

"^" {
    return '^';
}

"(" {
    return '(';
}

")" {
    return ')';
}

"\n" {
    return '\n';
}

%%
