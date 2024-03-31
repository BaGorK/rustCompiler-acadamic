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

#line 22 "parser.y"
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
#define	LET	258
#define	MUT	259
#define	ENUM	260
#define	EXTERN	261
#define	IMPL	262
#define	MATCH	263
#define	PUB	264
#define	REF	265
#define	RETURN	266
#define	SELF	267
#define	STATIC	268
#define	SUPER	269
#define	TRAIT	270
#define	TYPE	271
#define	UNSAFE	272
#define	WHERE	273
#define	ASYNC	274
#define	AWAIT	275
#define	USE	276
#define	MOD	277
#define	MAIN	278
#define	FN	279
#define	PRINTLN	280
#define	STRINTERPOLATION	281
#define	TRUE	282
#define	FALSE	283
#define	ID	284
#define	INT	285
#define	FLOAT	286
#define	BOOL	287
#define	STRUCT	288
#define	STRING	289
#define	NUMBER	290
#define	ARRAY	291
#define	STRSLICE	292
#define	ARROW	293
#define	IF	294
#define	ELSE	295
#define	LOOP	296
#define	WHILE	297
#define	FOR	298
#define	IN	299
#define	BREAK	300
#define	CONTINUE	301
#define	AS	302
#define	LOGICALNOT	303
#define	LOGICALAND	304
#define	LOGICALOR	305
#define	ADD	306
#define	SUBTRACT	307
#define	MULTIPLY	308
#define	DIVIDE	309
#define	ASSIGN	310
#define	REMAINDER	311
#define	ADDEQ	312
#define	SUBTRACTEQ	313
#define	MULTIPLYEQ	314
#define	DIVIDEEQ	315
#define	REMAINDEREQ	316
#define	EQUALTO	317
#define	NOTEQUALTO	318
#define	GT	319
#define	GTEQ	320
#define	LT	321
#define	LTEQ	322
#define	SEMICOLON	323
#define	COMMA	324
#define	PERIOD	325
#define	COLON	326
#define	QUESTION_MARK	327
#define	LPAREN	328
#define	RPAREN	329
#define	LBRACE	330
#define	RBRACE	331
#define	LSQUAREBRAC	332
#define	RSQUAREBRAC	333
#define	COMMENT	334


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
static const int ID;
static const int INT;
static const int FLOAT;
static const int BOOL;
static const int STRUCT;
static const int STRING;
static const int NUMBER;
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
	,LET=258
	,MUT=259
	,ENUM=260
	,EXTERN=261
	,IMPL=262
	,MATCH=263
	,PUB=264
	,REF=265
	,RETURN=266
	,SELF=267
	,STATIC=268
	,SUPER=269
	,TRAIT=270
	,TYPE=271
	,UNSAFE=272
	,WHERE=273
	,ASYNC=274
	,AWAIT=275
	,USE=276
	,MOD=277
	,MAIN=278
	,FN=279
	,PRINTLN=280
	,STRINTERPOLATION=281
	,TRUE=282
	,FALSE=283
	,ID=284
	,INT=285
	,FLOAT=286
	,BOOL=287
	,STRUCT=288
	,STRING=289
	,NUMBER=290
	,ARRAY=291
	,STRSLICE=292
	,ARROW=293
	,IF=294
	,ELSE=295
	,LOOP=296
	,WHILE=297
	,FOR=298
	,IN=299
	,BREAK=300
	,CONTINUE=301
	,AS=302
	,LOGICALNOT=303
	,LOGICALAND=304
	,LOGICALOR=305
	,ADD=306
	,SUBTRACT=307
	,MULTIPLY=308
	,DIVIDE=309
	,ASSIGN=310
	,REMAINDER=311
	,ADDEQ=312
	,SUBTRACTEQ=313
	,MULTIPLYEQ=314
	,DIVIDEEQ=315
	,REMAINDEREQ=316
	,EQUALTO=317
	,NOTEQUALTO=318
	,GT=319
	,GTEQ=320
	,LT=321
	,LTEQ=322
	,SEMICOLON=323
	,COMMA=324
	,PERIOD=325
	,COLON=326
	,QUESTION_MARK=327
	,LPAREN=328
	,RPAREN=329
	,LBRACE=330
	,RBRACE=331
	,LSQUAREBRAC=332
	,RSQUAREBRAC=333
	,COMMENT=334


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
