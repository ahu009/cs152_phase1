/* 
 * Sample Scanner2: 
 * Description: Count the number of characters and the number of lines 
 *              from standard input
 * Usage: (1) $ flex sample2.lex
 *        (2) $ gcc lex.yy.c -lfl
 *        (3) $ ./a.out
 *            stdin> whatever you like
 *	      stdin> Ctrl-D
 * Questions: Is it ok if we do not indent the first line?
 *            What will happen if we remove the second rule?
 */

%{
#define UNRECOGNIZED_SYMBOL 0x0
#define BAD_ID1             0x1
#define BAD_ID2             0x2

int row = 1;
int col = 1;

void yyerr(int, char *);
%}

DIGIT           [0-9]
ALPHA           [A-Za-z]
WHITE_SPACE     [ \t]+
ID              {ALPHA}(({ALPHA}|{DIGIT}|_)*({ALPHA}|{DIGIT}))?
NEW_LINE        \n
INTEGER         {DIGIT}+
COMMENT         ##.*

%%
function        printf("%s\n", "FUNCTION");
beginparams        printf("%s\n", "BEGING_PARAMS");
endparams        printf("%s\n", "END_PARAMS");
beginlocals        printf("%s\n", "BEGIN_LOCALS");
endlocals        printf("%s\n", "END_LOCALS");
beginbody        printf("%s\n", "BEGIN_BODY");
endbody        printf("%s\n", "END_BODY");
integer        printf("%s\n", "INTEGER");
array        printf("%s\n", "ARRAY");
of        printf("%s\n", "OF");
if{WHITE_SPACE}        printf("%s\n", "IF");
then        printf("%s\n", "THEN");
endif        printf("%s\n", "ENDIF");
else        printf("%s\n", "ELSE");
while        printf("%s\n", "WHILE");
do        printf("%s\n", "DO");
foreach        printf("%s\n", "FOREACH");
in        printf("%s\n", "IN");
beginloop        printf("%s\n", "BEGINLOOP");
endloop        printf("%s\n", "ENDLOOP");
continue        printf("%s\n", "CONTINUE");
read        printf("%s\n", "READ");
write        printf("%s\n", "WRITE");
and        printf("%s\n", "AND");
or        printf("%s\n", "OR");
not        printf("%s\n", "NOT");
true        printf("%s\n", "TRUE");
false        printf("%s\n", "FALSE");
return        printf("%s\n", "RETURN");

"-"        printf("%s\n", "SUB");
"+"        printf("%s\n", "ADD");
"*"        printf("%s\n", "MULT");
"/"        printf("%s\n", "DIV");
"%"        printf("%s\n", "MOD");

"=="        printf("%s\n", "EQ");
"<>"        printf("%s\n", "NEQ");
"<"        printf("%s\n", "LT");
">"        printf("%s\n", "GT");
"<="        printf("%s\n", "LTE");
">="        printf("%s\n", "GTE");

identifier(".+")            {printf("IDENT %s\n", yytext[11]);}
number(".+")       {printf("NUMBER %s\n", yytext);}

";"        printf("%s\n", "SEMICOLON");
":"        printf("%s\n", "COLON");
","        printf("%s\n", "COMMA");
\(({ALPHA}|{DIGIT})        printf("%s\n", "L_PAREN");
({ALPHA}|{DIGIT})\)        printf("%s\n", "R_PAREN");
"]"        printf("%s\n", "L_SQUARE_BRACKET");
"["        printf("%s\n", "R_SQUARE_BRACKET");
":="        printf("%s\n", "ASSIGN");

%%

main()
{
  yylex();
}

