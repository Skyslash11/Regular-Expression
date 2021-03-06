%{
#include<stdio.h>
#include<string.h>
#include "P1.tab.h"

void yyerror(char *);
int yyparse();
%}

%%
[ \t\n]	; // ignore space   
"//".*\n  ; 
";"	       		 {yylval.str=strdup(yytext);
                         return SEMICOLON;}
","			 {yylval.str=strdup(yytext);
			 return COMA;}
"("	   		 {yylval.str=strdup(yytext);
			 return O_P;}
")"	   		 {yylval.str=strdup(yytext);
			 return C_P;}
"{"	   		 {yylval.str=strdup(yytext);
			 return O_B;}
"}"	   		 {yylval.str=strdup(yytext);
			 return C_B;}
"["	   		 {yylval.str=strdup(yytext);
			 return O_BR;}
"]"	   		 {yylval.str=strdup(yytext);
			 return C_BR;}
"&"         		 {yylval.str=strdup(yytext);
			 return AND;}
"<"        		 {yylval.str=strdup(yytext);
			 return LESS;}
"+"        		 {yylval.str=strdup(yytext);
			 return PLUS;}
"-"        		 {yylval.str=strdup(yytext);
			 return MINUS;}
"*"        		 {yylval.str=strdup(yytext);
			 return MULT;}
"/"        		 {yylval.str=strdup(yytext); 
                         return DIVIDE;}
"."        		 {yylval.str=strdup(yytext);
			 return DOT;}
"="			 {yylval.str=strdup(yytext);
                         return EQUAL;}
"class"    		 {yylval.str=strdup(yytext);
                         return Class;} 
"public"     		 {yylval.str=strdup(yytext);
                         return Public;}
"static"     		 {yylval.str=strdup(yytext);
			 return Static;}
"void"       		 {yylval.str=strdup(yytext);
			 return Void;}
"main"       		 {yylval.str=strdup(yytext);
                         return Main;}
"String"      		 {yylval.str=strdup(yytext);
			 return String;}
"System.out.println"     {yylval.str=strdup(yytext);
			 return System;}
"extends" 		 {yylval.str=strdup(yytext);
			 return Extends;}
"int"			 {yylval.str=strdup(yytext);
			 return Int;}
"boolean" 		 {yylval.str=strdup(yytext);
			 return Boolean;}
"if"  			 {yylval.str=strdup(yytext);
			 return IF;}
"while" 		 {yylval.str=strdup(yytext);
			 return WHILE;}
"else"			 {yylval.str=strdup(yytext);
			 return ELSE;}
"true" 		         {yylval.str=strdup(yytext);
			 return TRUE;}
"false"			 {yylval.str=strdup(yytext);
			 return FALSE;}
"?"  			 {yylval.str=strdup(yytext);
			 return QST;}
"return"		 {yylval.str=strdup(yytext);
			 return Return;}
"this"		         {yylval.str=strdup(yytext);
			 return THIS;}
"new"		 	 {yylval.str=strdup(yytext);
			 return NEW;}
"!"		         {yylval.str=strdup(yytext);
			 return EXCLAM;}
"#define"		 {yylval.str=strdup(yytext);
			 return HASH_DEF;}
"length"                 {yylval.str=strdup(yytext);
			 return LENGTH;}
[_a-zA-Z][_a-zA-Z0-9]*   {yylval.str=strdup(yytext);
			 return IDENTIFIER;}
[0-9][0-9]*              {yylval.str=strdup(yytext);
			 return INTEGER_LITERAL;}
%%

void yyerror(char *str) {
	fprintf(stderr,"// Failed to parse macrojava code.");
}
int yywrap() {return 0;}
int main(){
	yyparse();
}
