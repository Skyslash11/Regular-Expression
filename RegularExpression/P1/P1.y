%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
extern int yylex();
extern void yyerror(char *);
char *code; 
char st1[100][255];
char st2[100][255];
int count=0;
//int i,macro_cnt=0;
//    str1=(char**)malloc(sizeof(char**)*256);
//    for(i=0;i<256;++i)
//	str1[i]=(char*)malloc(sizeof(char*)*256);
//    str1=(char**)malloc(sizeof(char**)*256);
//    for(i=0;i<256;++i)
//	str1[i]=(char*)malloc(sizeof(char*)*256);
%}

%union{
       char *str;
}

%type <str>	MAC_DEF_STAR;
%type <str>	TYP_DEC_STAR;
%type <str>	MainClass;
%type <str>	TypeDeclaration;
%type <str>	TYP_IDEN_STAR;
%type <str>	MET_DEC_STAR;	
%type <str>	MethodDeclaration;
%type <str>	LL_1;
%type <str>	STAT_STAR;
%type <str>	COMA_TYP_IDEN_STAR;
%type <str>	Type;
%type <str>	Statement;
%type <str>	EXP_STAR;
%type <str>	Expression;
%type <str>	PrimaryExpression;
%type <str>	MacroDefinition;
%type <str>	MacroDefStatement;
%type <str>	MacroDefExpression;
%type <str>	COMA_IDEN_STAR;
%type <str>	Identifier;




%token <str>	SEMICOLON;
%token <str>	COMA;
%token <str>	O_P;
%token <str>	C_P;
%token <str>	O_B;
%token <str>	C_B;
%token <str>	O_BR;
%token <str>	C_BR;
%token <str>	AND;
%token <str>	LESS;
%token <str>	PLUS;
%token <str>	MINUS;
%token <str>	MULT;
%token <str>	DIVIDE;
%token <str>	DOT;
%token <str>	EQUAL;
%token <str>	Class; 
%token <str>	Public;
%token <str>	Static;
%token <str>	Void;
%token <str>	Main;
%token <str>	String;
%token <str>	System;
%token <str>	Extends;
%token <str>	Int;
%token <str>	Boolean;
%token <str>	IF;
%token <str>	WHILE;
%token <str>	ELSE;
%token <str>	TRUE;
%token <str>	FALSE;
%token <str>	QST;
%token <str>	Return;
%token <str>	THIS;
%token <str>	NEW;
%token <str>	EXCLAM;
%token <str>	HASH_DEF;
%token <str>	LENGTH;
%token <str>	IDENTIFIER;
%token <str>	INTEGER_LITERAL;
%token <str>	ERROR;


/*%token <str> IDENTIFIER INTEGER_LITERAL SEMICOLON COMA O_P C_P O_B C_B O_BR C_BR AND LESS PLUS MINUS MULT DIVIDE DOT EQUAL Class Public Static Void Main String System Extends Int Boolean IF WHILE ELSE TRUE FALSE QST Return THIS NEW EXCLAM HASH_DEF LENGTH End_Of_File
ERROR*/

%start goal

%%
goal:	MAC_DEF_STAR MainClass TYP_DEC_STAR   {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s\n%s%s",code,$1,$2,$3);
 printf("%s\n",code);exit (0);}; 

MAC_DEF_STAR:	MacroDefinition MAC_DEF_STAR  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s\n%s",code,$1,$2);$$=strdup(code); }
	       | {$$="";}; 

TYP_DEC_STAR:	TypeDeclaration TYP_DEC_STAR  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s\n%s",code,$1,$2); $$=strdup(code);}
	       |{$$="";}; 

MainClass:	Class Identifier O_B Public Static Void Main O_P String O_BR C_BR Identifier C_P O_B System O_P Expression C_P SEMICOLON C_B C_B { code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$12);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s%s\n%s%s%s%s%s%s%s%s%s%s\n%s%s%s%s%s%s\n%s\n%s\n",code,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21);$$=strdup(code);}
else
{
sprintf(code,"%s%s%s%s\n%s%s%s%s%s%s%s%s%s%s\n%s%s%s%s%s%s\n%s\n%s\n",code,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,st2[i],$13,$14,$15,$16,$17,$18,$19,$20,$21);$$=strdup(code);
} };


TypeDeclaration:    Class Identifier O_B TYP_IDEN_STAR MET_DEC_STAR C_B   {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$2);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s\n%s\n%s%s\n%s\n",code,$1,$2,$3,$4,$5,$6);$$=strdup(code);}
else
{
sprintf(code,"%s%s%s\n%s\n%s%s\n%s\n",code,$1,st2[i],$3,$4,$5,$6);$$=strdup(code);}
}

		    | Class Identifier Extends Identifier O_B TYP_IDEN_STAR MET_DEC_STAR C_B  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s%s\n%s\n%s%s\n%s\n",code,$1,$2,$3,$4,$5,$6,$7,$8);$$=strdup(code); };

TYP_IDEN_STAR:    Type Identifier SEMICOLON TYP_IDEN_STAR {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s\n%s",code,$1,$2,$3,$4);$$=strdup(code); } 
		  |{$$="";}; 

MET_DEC_STAR:    MethodDeclaration MET_DEC_STAR  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s\n%s",code,$1,$2);               $$=strdup(code); }
		 |{$$="";};

MethodDeclaration:    Public Type Identifier O_P C_P O_B LL_1 Return Expression SEMICOLON C_B{code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s%s%s\n%s\n%s%s%s%s\n%s\n",code,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11); $$=strdup(code);}
		    | Public Type Identifier O_P Type Identifier COMA_TYP_IDEN_STAR C_P O_B LL_1 Return Expression SEMICOLON C_B    {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s%s%s%s%s%s\n%s\n%s%s%s%s\n%s\n",code,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14); $$=strdup(code);};

LL_1:    Type Identifier SEMICOLON LL_1 {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$2);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s%s\n%s",code,$1,$2,$3,$4);$$=strdup(code);}
else
{
sprintf(code,"%s%s%s%s\n%s",code,$1,st2[i],$3,$4);$$=strdup(code);
}
 }
	| STAT_STAR    {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s",code,$1);$$=strdup(code); };

STAT_STAR:    Statement STAT_STAR {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s",code,$1,$2);$$=strdup(code); }
	     |{$$="";}; 

COMA_TYP_IDEN_STAR:    COMA Type Identifier COMA_TYP_IDEN_STAR  {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$3);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s%s%s",code,$1,$2,$3,$4); $$=strdup(code);}
else
{
sprintf(code,"%s%s%s%s%s",code,$1,$2,st2[i],$4); $$=strdup(code);
}
} 
		      |{$$="";};

Type:    Int O_BR C_BR {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s ",code,$1,$2,$3); $$=strdup(code);}
	| Boolean      {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s ",code,$1);$$=strdup(code); }
        | Int 	       {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s ",code,$1);$$=strdup(code); }
        | Identifier   {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$1);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s ",code,$1); $$=strdup(code);}
else
{
sprintf(code,"%s%s ",code,st2[i]); $$=strdup(code);
}
};

Statement:    O_B STAT_STAR C_B  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s\n%s\n%s ",code,$1,$2,$3); $$=strdup(code);}
	    | System O_P Expression C_P SEMICOLON  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s%s%s\n",code,$1,$2,$3,$4,$5);$$=strdup(code); }
            | Identifier EQUAL Expression SEMICOLON {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$1);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s%s%s\n",code,$1,$2,$3,$4);    $$=strdup(code);}
else
{
sprintf(code,"%s%s%s%s%s\n",code,st2[i],$2,$3,$4);    $$=strdup(code);
}
 }
            | Identifier O_BR Expression C_B EQUAL Expression SEMICOLON {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$1);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s%s%s%s%s%s\n",code,$1,$2,$3,$4,$5,$6,$7); $$=strdup(code);}
else
{
sprintf(code,"%s%s%s%s%s\n",code,st2[i],$5,$6,$7); $$=strdup(code);
}
}
            | IF O_P Expression C_P Statement  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s%s%s\n",code,$1,$2,$3,$4,$5);       $$=strdup(code); }
            | IF O_P Expression C_P Statement ELSE Statement {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s%s%s%s%s\n",code,$1,$2,$3,$4,$5,$6,$7);$$=strdup(code); }
            | WHILE O_P Expression C_P Statement  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s%s%s\n",code,$1,$2,$3,$4,$5); $$=strdup(code);}
            | Identifier O_P C_P SEMICOLON {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$1);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s%s%s\n",code,$1,$2,$3,$4); $$=strdup(code);}
else
{
sprintf(code,"%s%s%s\n",code,st2[i],$4); $$=strdup(code);
}
}
	    | Identifier O_P Expression EXP_STAR C_P SEMICOLON  {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$1);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s%s%s%s%s\n",code,$1,$2,$3,$4,$5,$6); $$=strdup(code);}
else
{
sprintf(code,"%s%s%s\n",code,st2[i],$6); $$=strdup(code);
}
};

EXP_STAR:    COMA Expression EXP_STAR   {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s ",code,$1,$2,$3);$$=strdup(code); }
	    |{$$="";};

Expression:    PrimaryExpression AND PrimaryExpression        {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s",code,$1,$2,$3);$$=strdup(code); }
	     | PrimaryExpression LESS PrimaryExpression       {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s",code,$1,$2,$3);$$=strdup(code); }
	     | PrimaryExpression PLUS PrimaryExpression       {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s",code,$1,$2,$3);$$=strdup(code); }
	     | PrimaryExpression MINUS PrimaryExpression      {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s",code,$1,$2,$3);$$=strdup(code); }
	     | PrimaryExpression MULT PrimaryExpression       {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s",code,$1,$2,$3);$$=strdup(code); }
	     | PrimaryExpression DIVIDE PrimaryExpression     {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s",code,$1,$2,$3);$$=strdup(code); }
	     | PrimaryExpression O_BR PrimaryExpression C_BR  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s%s",code,$1,$2,$3,$4); $$=strdup(code);}
	     | PrimaryExpression DOT LENGTH		      {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s",code,$1,$2,$3);$$=strdup(code); }
	     | PrimaryExpression                              {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s",code,$1);        $$=strdup(code);}
	     | PrimaryExpression DOT Identifier O_P C_P       {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$3);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s%s%s%s",code,$1,$2,$3,$4,$5);$$=strdup(code);}
else
{
sprintf(code,"%s%s%s%s",code,$1,$2,st2[i]);$$=strdup(code);
}
 }
	     | PrimaryExpression DOT Identifier O_P Expression EXP_STAR C_P     {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$3);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s%s%s%s%s%s",code,$1,$2,$3,$4,$5,$6,$7); $$=strdup(code);}
else
{
sprintf(code,"%s%s%s%s",code,$1,$2,st2[i]); $$=strdup(code);
}
}
	     | Identifier O_P C_P                             {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$1);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s%s",code,$1,$2,$3);$$=strdup(code);}
else
{
sprintf(code,"%s%s",code,st2[i]);$$=strdup(code);
}
 }
	     | Identifier O_P Expression EXP_STAR C_P         {code=(char*)malloc(sizeof(char)*10000);int i,note=1;
for(i=0;i<count-1;++i)
{
note=strcmp(st1[i],$1);
if(note==0)
	break;
}
if(note!=0){
sprintf(code,"%s%s%s%s%s%s",code,$1,$2,$3,$4,$5);$$=strdup(code);}
else
{
sprintf(code,"%s%s",code,st2[i]);$$=strdup(code);
}
 };

PrimaryExpression:    INTEGER_LITERAL {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s",code,$1);$$=strdup(code); }
		     | TRUE           {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s",code,$1);$$=strdup(code);}
                     | FALSE          {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s",code,$1);$$=strdup(code); }
                     | Identifier     {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s",code,$1);$$=strdup(code); }
                     | THIS           {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s",code,$1);$$=strdup(code); }
                     | NEW Int O_BR Expression C_BR   {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s%s%s",code,$1,$2,$3,$4,$5);$$=strdup(code); }
                     | NEW Identifier O_P C_P         {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s%s",code,$1,$2,$3,$4); }
                     | EXCLAM Expression              {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s",code,$1,$2);   $$=strdup(code);}            
                     | O_P Expression C_P             {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s ",code,$1,$2,$3); $$=strdup(code);};

MacroDefinition:    MacroDefExpression {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s ",code,$1); $$=strdup(code);}
		   | MacroDefStatement {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s ",code,$1);$$=strdup(code); };

MacroDefStatement:  HASH_DEF Identifier O_P C_P O_B STAT_STAR C_B      {code=(char*)malloc(sizeof(char)*10000);                              sprintf(code,"%s%s %s%s%s%s%s%s\n",code,$1,$2,$3,$4,$5,$6,$7);$$="";sprintf(st1[count],"%s",$2);sprintf(st2[count],"%s\n%s\n%s",$5,$6,$7);++count;}
                  | HASH_DEF Identifier O_P Identifier COMA_IDEN_STAR C_P O_B STAT_STAR C_B {code=(char*)malloc(sizeof(char)*10000);    sprintf(code,"%s%s %s%s%s%s%s%s%s%s\n",code,$1,$2,$3,$4,$5,$6,$7,$8,$9); $$="";sprintf(st1[count],"%s",$2);sprintf(st2[count],"%s\n%s\n%s",$7,$8,$9);++count;};     
                   
MacroDefExpression: HASH_DEF Identifier O_P C_P O_P Expression C_P    {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s %s%s%s%s%s%s\n",code,$1,$2,$3,$4,$5,$6,$7); $$=""; sprintf(st1[count],"%s",$2);sprintf(st2[count],"%s\n%s\n%s",$5,$6,$7);++count;} 
		  | HASH_DEF Identifier O_P Identifier COMA_IDEN_STAR C_P O_P Expression C_P  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s %s%s%s%s%s%s%s%s\n",code,$1,$2,$3,$4,$5,$6,$7,$8,$9);$$="";sprintf(st1[count],"%s",$2);sprintf(st2[count],"%s\n%s\n%s",$7,$8,$9);++count; };
                   

COMA_IDEN_STAR: COMA Identifier COMA_IDEN_STAR  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s%s%s",code,$1,$2,$3); $$=strdup(code);}
               |{$$="";}; 

Identifier: IDENTIFIER  {code=(char*)malloc(sizeof(char)*10000);sprintf(code,"%s%s ",code,$1); $$=strdup(code);};

%%


