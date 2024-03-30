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
#ifndef YY_USE_CLASS
# ifndef YYSTYPE
#  define YYSTYPE int
#  define YYSTYPE_IS_TRIVIAL 1
# endif
#endif

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
#define	STRING	288
#define	STRUCT	289
#define	STR	290
#define	ARROW	291
#define	IF	292
#define	ELSE	293
#define	LOOP	294
#define	WHILE	295
#define	FOR	296
#define	IN	297
#define	BREAK	298
#define	CONTINUE	299
#define	LOGICALNOT	300
#define	LOGICALAND	301
#define	LOGICALOR	302
#define	ADD	303
#define	SUBTRACT	304
#define	MULTIPLY	305
#define	DIVIDE	306
#define	REMAINDER	307
#define	NEGATION	308
#define	ADDEQ	309
#define	SUBTRACTEQ	310
#define	MULTIPLYEQ	311
#define	DIVIDEEQ	312
#define	REMAINDEREQ	313
#define	SEMICOLON	314
#define	COMMA	315
#define	PERIOD	316
#define	COLON	317
#define	QUESTION_MARK	318
#define	LPAREN	319
#define	RPAREN	320
#define	LBRACE	321
#define	RBRACE	322
#define	LSQUAREBRAC	323
#define	RSQUAREBRAC	324
#define	SLCOMMENT	325
#define	MLCOMMENT	326


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
static const int STRING;
static const int STRUCT;
static const int STR;
static const int ARROW;
static const int IF;
static const int ELSE;
static const int LOOP;
static const int WHILE;
static const int FOR;
static const int IN;
static const int BREAK;
static const int CONTINUE;
static const int LOGICALNOT;
static const int LOGICALAND;
static const int LOGICALOR;
static const int ADD;
static const int SUBTRACT;
static const int MULTIPLY;
static const int DIVIDE;
static const int REMAINDER;
static const int NEGATION;
static const int ADDEQ;
static const int SUBTRACTEQ;
static const int MULTIPLYEQ;
static const int DIVIDEEQ;
static const int REMAINDEREQ;
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
static const int SLCOMMENT;
static const int MLCOMMENT;


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
	,STRING=288
	,STRUCT=289
	,STR=290
	,ARROW=291
	,IF=292
	,ELSE=293
	,LOOP=294
	,WHILE=295
	,FOR=296
	,IN=297
	,BREAK=298
	,CONTINUE=299
	,LOGICALNOT=300
	,LOGICALAND=301
	,LOGICALOR=302
	,ADD=303
	,SUBTRACT=304
	,MULTIPLY=305
	,DIVIDE=306
	,REMAINDER=307
	,NEGATION=308
	,ADDEQ=309
	,SUBTRACTEQ=310
	,MULTIPLYEQ=311
	,DIVIDEEQ=312
	,REMAINDEREQ=313
	,SEMICOLON=314
	,COMMA=315
	,PERIOD=316
	,COLON=317
	,QUESTION_MARK=318
	,LPAREN=319
	,RPAREN=320
	,LBRACE=321
	,RBRACE=322
	,LSQUAREBRAC=323
	,RSQUAREBRAC=324
	,SLCOMMENT=325
	,MLCOMMENT=326


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
