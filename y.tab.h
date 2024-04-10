#ifndef YY_myparser_h_included
#define YY_myparser_h_included
/*#define YY_USE_CLASS 
*/
#line 1 "/usr/share/bison++/bison.h"
/* before anything */
#ifdef c_plusplus
 #ifndef __cplusplus
  #define __cplusplus
 #endif
#endif


 #line 8 "/usr/share/bison++/bison.h"

#line 34 "parser.y"
typedef union {
  int intval;
  char* strval;
} yy_myparser_stype;
#define YY_myparser_STYPE yy_myparser_stype
#ifndef YY_USE_CLASS
#define YYSTYPE yy_myparser_stype
#endif

#line 21 "/usr/share/bison++/bison.h"
 /* %{ and %header{ and %union, during decl */
#ifndef YY_myparser_COMPATIBILITY
 #ifndef YY_USE_CLASS
  #define  YY_myparser_COMPATIBILITY 1
 #else
  #define  YY_myparser_COMPATIBILITY 0
 #endif
#endif

#if YY_myparser_COMPATIBILITY != 0
/* backward compatibility */
 #ifdef YYLTYPE
  #ifndef YY_myparser_LTYPE
   #define YY_myparser_LTYPE YYLTYPE
/* WARNING obsolete !!! user defined YYLTYPE not reported into generated header */
/* use %define LTYPE */
  #endif
 #endif
/*#ifdef YYSTYPE*/
  #ifndef YY_myparser_STYPE
   #define YY_myparser_STYPE YYSTYPE
  /* WARNING obsolete !!! user defined YYSTYPE not reported into generated header */
   /* use %define STYPE */
  #endif
/*#endif*/
 #ifdef YYDEBUG
  #ifndef YY_myparser_DEBUG
   #define  YY_myparser_DEBUG YYDEBUG
   /* WARNING obsolete !!! user defined YYDEBUG not reported into generated header */
   /* use %define DEBUG */
  #endif
 #endif 
 /* use goto to be compatible */
 #ifndef YY_myparser_USE_GOTO
  #define YY_myparser_USE_GOTO 1
 #endif
#endif

/* use no goto to be clean in C++ */
#ifndef YY_myparser_USE_GOTO
 #define YY_myparser_USE_GOTO 0
#endif

#ifndef YY_myparser_PURE

 #line 65 "/usr/share/bison++/bison.h"

#line 65 "/usr/share/bison++/bison.h"
/* YY_myparser_PURE */
#endif


 #line 68 "/usr/share/bison++/bison.h"

#line 68 "/usr/share/bison++/bison.h"
/* prefix */

#ifndef YY_myparser_DEBUG

 #line 71 "/usr/share/bison++/bison.h"

#line 71 "/usr/share/bison++/bison.h"
/* YY_myparser_DEBUG */
#endif

#ifndef YY_myparser_LSP_NEEDED

 #line 75 "/usr/share/bison++/bison.h"

#line 75 "/usr/share/bison++/bison.h"
 /* YY_myparser_LSP_NEEDED*/
#endif

/* DEFAULT LTYPE*/
#ifdef YY_myparser_LSP_NEEDED
 #ifndef YY_myparser_LTYPE
  #ifndef BISON_YYLTYPE_ISDECLARED
   #define BISON_YYLTYPE_ISDECLARED
typedef
  struct yyltype
    {
      int timestamp;
      int first_line;
      int first_column;
      int last_line;
      int last_column;
      char *text;
   }
  yyltype;
  #endif

  #define YY_myparser_LTYPE yyltype
 #endif
#endif

/* DEFAULT STYPE*/
#ifndef YY_myparser_STYPE
 #define YY_myparser_STYPE int
#endif

/* DEFAULT MISCELANEOUS */
#ifndef YY_myparser_PARSE
 #define YY_myparser_PARSE yyparse
#endif

#ifndef YY_myparser_LEX
 #define YY_myparser_LEX yylex
#endif

#ifndef YY_myparser_LVAL
 #define YY_myparser_LVAL yylval
#endif

#ifndef YY_myparser_LLOC
 #define YY_myparser_LLOC yylloc
#endif

#ifndef YY_myparser_CHAR
 #define YY_myparser_CHAR yychar
#endif

#ifndef YY_myparser_NERRS
 #define YY_myparser_NERRS yynerrs
#endif

#ifndef YY_myparser_DEBUG_FLAG
 #define YY_myparser_DEBUG_FLAG yydebug
#endif

#ifndef YY_myparser_ERROR
 #define YY_myparser_ERROR yyerror
#endif

#ifndef YY_myparser_PARSE_PARAM
 #ifndef __STDC__
  #ifndef __cplusplus
   #ifndef YY_USE_CLASS
    #define YY_myparser_PARSE_PARAM
    #ifndef YY_myparser_PARSE_PARAM_DEF
     #define YY_myparser_PARSE_PARAM_DEF
    #endif
   #endif
  #endif
 #endif
 #ifndef YY_myparser_PARSE_PARAM
  #define YY_myparser_PARSE_PARAM void
 #endif
#endif

/* TOKEN C */
#ifndef YY_USE_CLASS

 #ifndef YY_myparser_PURE
  #ifndef yylval
   extern YY_myparser_STYPE YY_myparser_LVAL;
  #else
   #if yylval != YY_myparser_LVAL
    extern YY_myparser_STYPE YY_myparser_LVAL;
   #else
    #warning "Namespace conflict, disabling some functionality (bison++ only)"
   #endif
  #endif
 #endif


 #line 169 "/usr/share/bison++/bison.h"
#define	STRING_LITERAL	258
#define	NUMBER	259
#define	ID	260
#define	LET	261
#define	MUT	262
#define	ENUM	263
#define	EXTERN	264
#define	IMPL	265
#define	MATCH	266
#define	PUB	267
#define	REF	268
#define	RETURN	269
#define	SELF	270
#define	STATIC	271
#define	SUPER	272
#define	TRAIT	273
#define	TYPE	274
#define	UNSAFE	275
#define	WHERE	276
#define	ASYNC	277
#define	AWAIT	278
#define	USE	279
#define	MOD	280
#define	MAIN	281
#define	FN	282
#define	PRINTLN	283
#define	STRINTERPOLATION	284
#define	TRUE	285
#define	FALSE	286
#define	INT	287
#define	FLOAT	288
#define	BOOL	289
#define	STRUCT	290
#define	STRINGK	291
#define	STRING	292
#define	ARRAY	293
#define	STRSLICE	294
#define	ARROW	295
#define	IF	296
#define	ELSE	297
#define	LOOP	298
#define	WHILE	299
#define	FOR	300
#define	IN	301
#define	BREAK	302
#define	CONTINUE	303
#define	AS	304
#define	LOGICALNOT	305
#define	LOGICALAND	306
#define	LOGICALOR	307
#define	ADD	308
#define	SUBTRACT	309
#define	MULTIPLY	310
#define	DIVIDE	311
#define	ASSIGN	312
#define	REMAINDER	313
#define	ADDEQ	314
#define	SUBTRACTEQ	315
#define	MULTIPLYEQ	316
#define	DIVIDEEQ	317
#define	REMAINDEREQ	318
#define	EQUALTO	319
#define	NOTEQUALTO	320
#define	GT	321
#define	GTEQ	322
#define	LT	323
#define	LTEQ	324
#define	SEMICOLON	325
#define	COMMA	326
#define	PERIOD	327
#define	COLON	328
#define	QUESTION_MARK	329
#define	LPAREN	330
#define	RPAREN	331
#define	LBRACE	332
#define	RBRACE	333
#define	LSQUAREBRAC	334
#define	RSQUAREBRAC	335
#define	COMMENT	336


#line 169 "/usr/share/bison++/bison.h"
 /* #defines token */
/* after #define tokens, before const tokens S5*/
#else
 #ifndef YY_myparser_CLASS
  #define YY_myparser_CLASS myparser
 #endif

 #ifndef YY_myparser_INHERIT
  #define YY_myparser_INHERIT
 #endif

 #ifndef YY_myparser_MEMBERS
  #define YY_myparser_MEMBERS 
 #endif

 #ifndef YY_myparser_LEX_BODY
  #define YY_myparser_LEX_BODY  
 #endif

 #ifndef YY_myparser_ERROR_BODY
  #define YY_myparser_ERROR_BODY  
 #endif

 #ifndef YY_myparser_CONSTRUCTOR_PARAM
  #define YY_myparser_CONSTRUCTOR_PARAM
 #endif
 /* choose between enum and const */
 #ifndef YY_myparser_USE_CONST_TOKEN
  #define YY_myparser_USE_CONST_TOKEN 0
  /* yes enum is more compatible with flex,  */
  /* so by default we use it */ 
 #endif
 #if YY_myparser_USE_CONST_TOKEN != 0
  #ifndef YY_myparser_ENUM_TOKEN
   #define YY_myparser_ENUM_TOKEN yy_myparser_enum_token
  #endif
 #endif

class YY_myparser_CLASS YY_myparser_INHERIT
{
public: 
 #if YY_myparser_USE_CONST_TOKEN != 0
  /* static const int token ... */
  
 #line 212 "/usr/share/bison++/bison.h"
static const int STRING_LITERAL;
static const int NUMBER;
static const int ID;
static const int LET;
static const int MUT;
static const int ENUM;
static const int EXTERN;
static const int IMPL;
static const int MATCH;
static const int PUB;
static const int REF;
static const int RETURN;
static const int SELF;
static const int STATIC;
static const int SUPER;
static const int TRAIT;
static const int TYPE;
static const int UNSAFE;
static const int WHERE;
static const int ASYNC;
static const int AWAIT;
static const int USE;
static const int MOD;
static const int MAIN;
static const int FN;
static const int PRINTLN;
static const int STRINTERPOLATION;
static const int TRUE;
static const int FALSE;
static const int INT;
static const int FLOAT;
static const int BOOL;
static const int STRUCT;
static const int STRINGK;
static const int STRING;
static const int ARRAY;
static const int STRSLICE;
static const int ARROW;
static const int IF;
static const int ELSE;
static const int LOOP;
static const int WHILE;
static const int FOR;
static const int IN;
static const int BREAK;
static const int CONTINUE;
static const int AS;
static const int LOGICALNOT;
static const int LOGICALAND;
static const int LOGICALOR;
static const int ADD;
static const int SUBTRACT;
static const int MULTIPLY;
static const int DIVIDE;
static const int ASSIGN;
static const int REMAINDER;
static const int ADDEQ;
static const int SUBTRACTEQ;
static const int MULTIPLYEQ;
static const int DIVIDEEQ;
static const int REMAINDEREQ;
static const int EQUALTO;
static const int NOTEQUALTO;
static const int GT;
static const int GTEQ;
static const int LT;
static const int LTEQ;
static const int SEMICOLON;
static const int COMMA;
static const int PERIOD;
static const int COLON;
static const int QUESTION_MARK;
static const int LPAREN;
static const int RPAREN;
static const int LBRACE;
static const int RBRACE;
static const int LSQUAREBRAC;
static const int RSQUAREBRAC;
static const int COMMENT;


#line 212 "/usr/share/bison++/bison.h"
 /* decl const */
 #else
  enum YY_myparser_ENUM_TOKEN { YY_myparser_NULL_TOKEN=0
  
 #line 215 "/usr/share/bison++/bison.h"
	,STRING_LITERAL=258
	,NUMBER=259
	,ID=260
	,LET=261
	,MUT=262
	,ENUM=263
	,EXTERN=264
	,IMPL=265
	,MATCH=266
	,PUB=267
	,REF=268
	,RETURN=269
	,SELF=270
	,STATIC=271
	,SUPER=272
	,TRAIT=273
	,TYPE=274
	,UNSAFE=275
	,WHERE=276
	,ASYNC=277
	,AWAIT=278
	,USE=279
	,MOD=280
	,MAIN=281
	,FN=282
	,PRINTLN=283
	,STRINTERPOLATION=284
	,TRUE=285
	,FALSE=286
	,INT=287
	,FLOAT=288
	,BOOL=289
	,STRUCT=290
	,STRINGK=291
	,STRING=292
	,ARRAY=293
	,STRSLICE=294
	,ARROW=295
	,IF=296
	,ELSE=297
	,LOOP=298
	,WHILE=299
	,FOR=300
	,IN=301
	,BREAK=302
	,CONTINUE=303
	,AS=304
	,LOGICALNOT=305
	,LOGICALAND=306
	,LOGICALOR=307
	,ADD=308
	,SUBTRACT=309
	,MULTIPLY=310
	,DIVIDE=311
	,ASSIGN=312
	,REMAINDER=313
	,ADDEQ=314
	,SUBTRACTEQ=315
	,MULTIPLYEQ=316
	,DIVIDEEQ=317
	,REMAINDEREQ=318
	,EQUALTO=319
	,NOTEQUALTO=320
	,GT=321
	,GTEQ=322
	,LT=323
	,LTEQ=324
	,SEMICOLON=325
	,COMMA=326
	,PERIOD=327
	,COLON=328
	,QUESTION_MARK=329
	,LPAREN=330
	,RPAREN=331
	,LBRACE=332
	,RBRACE=333
	,LSQUAREBRAC=334
	,RSQUAREBRAC=335
	,COMMENT=336


#line 215 "/usr/share/bison++/bison.h"
 /* enum token */
     }; /* end of enum declaration */
 #endif
public:
 int YY_myparser_PARSE(YY_myparser_PARSE_PARAM);
 virtual void YY_myparser_ERROR(char *msg) YY_myparser_ERROR_BODY;
 #ifdef YY_myparser_PURE
  #ifdef YY_myparser_LSP_NEEDED
   virtual int  YY_myparser_LEX(YY_myparser_STYPE *YY_myparser_LVAL,YY_myparser_LTYPE *YY_myparser_LLOC) YY_myparser_LEX_BODY;
  #else
   virtual int  YY_myparser_LEX(YY_myparser_STYPE *YY_myparser_LVAL) YY_myparser_LEX_BODY;
  #endif
 #else
  virtual int YY_myparser_LEX() YY_myparser_LEX_BODY;
  YY_myparser_STYPE YY_myparser_LVAL;
  #ifdef YY_myparser_LSP_NEEDED
   YY_myparser_LTYPE YY_myparser_LLOC;
  #endif
  int YY_myparser_NERRS;
  int YY_myparser_CHAR;
 #endif
 #if YY_myparser_DEBUG != 0
  public:
   int YY_myparser_DEBUG_FLAG;	/*  nonzero means print parse trace	*/
 #endif
public:
 YY_myparser_CLASS(YY_myparser_CONSTRUCTOR_PARAM);
public:
 YY_myparser_MEMBERS 
};
/* other declare folow */
#endif


#if YY_myparser_COMPATIBILITY != 0
 /* backward compatibility */
 /* Removed due to bison problems
 /#ifndef YYSTYPE
 / #define YYSTYPE YY_myparser_STYPE
 /#endif*/

 #ifndef YYLTYPE
  #define YYLTYPE YY_myparser_LTYPE
 #endif
 #ifndef YYDEBUG
  #ifdef YY_myparser_DEBUG 
   #define YYDEBUG YY_myparser_DEBUG
  #endif
 #endif

#endif
/* END */

 #line 267 "/usr/share/bison++/bison.h"
#endif
