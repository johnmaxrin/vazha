%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "incFile.h"
extern FILE* yyin; 

FILE* outfile;
    

nodeType *opr(int oper, int nops, ...);
nodeType *id(int i);
nodeType *con(int value);
int genStmt(nodeType *p, FILE *);
void freeNode(nodeType *p);

int yylex(void);
void yyerror(char *);


%}


%union {
    int iValue;
    char sIndex;
    nodeType *nPtr;
};

%token <iValue>INTEGER;
%token ANENGI ALLENGI IPPO KANIKU
%left CHERUTH VALUTH SAMAM

%type <nPtr> expression statement


%%
program:    
        function                                                    {exit(0);}    
        ;

function:
        function statement                                          {genStmt($2,outfile); freeNode($2);}
        |
        ;

statement:
           ';'                                                      {;}
           | expression ';'                                         {$$ = $1;}
           | KANIKU expression ';'                                  {$$ = opr(KANIKU,1,$2);}
           | IPPO expression ANENGI statement ALLENGI statement     {$$ = opr(IPPO,3,$2,$4,$6);}
           |
           ;

expression:
            INTEGER                          {$$ = con($1);}
            | expression CHERUTH expression  {$$ = opr(CHERUTH,2,$1,$3);}
            | expression VALUTH expression   {$$ = opr(VALUTH,2,$1,$3);}
            | expression SAMAM expression   {$$ = opr(SAMAM,2,$1,$3);}
            | '(' expression ')'             {$$ = $2;}
            |
            ;
%%


nodeType *con(int value) {
    nodeType *p;

    /* allocate node */
    if ((p = malloc(sizeof(nodeType))) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeCon;
    p->con.value = value;

    return p;
}

nodeType *id(int i) {
    nodeType *p;

    /* allocate node */
    if ((p = malloc(sizeof(nodeType))) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeId;
    p->id.i = i;

    return p;
}

nodeType *opr(int oper, int nops, ...) {
    va_list ap;
    nodeType *p;
    int i;

    /* allocate node, extending op array */
    if ((p = malloc(sizeof(nodeType) + (nops-1) * sizeof(nodeType *))) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeOpr;
    p->opr.oper = oper;
    p->opr.nops = nops;
    va_start(ap, nops);
    for (i = 0; i < nops; i++)
        p->opr.op[i] = va_arg(ap, nodeType*);
    va_end(ap);
    return p;
}

void freeNode(nodeType *p) {
    int i;

    if (!p) return;
    if (p->type == typeOpr) {
        for (i = 0; i < p->opr.nops; i++)
            freeNode(p->opr.op[i]);
    }
    free (p);
}



void yyerror(char *s) {
fprintf(stderr, "Eda code kutti thetti poyeda. Saramilla nee shoopera. \n%s\n", s);
}

int main(int argc, char* argv[])
{

outfile = fopen("output.c", "w");
    if (outfile == NULL) {
    printf("Eda file ondakoyappo ntho scene ondayi!\n");
    return 0;
  }


    if (argc < 2) {
        fprintf(stderr, "Usage: %s input_file\n", argv[0]);
        return 1;
    }
    
    FILE* file = fopen(argv[1], "r");
    if (!file) {
        fprintf(stderr, "Eda file kutti illeda!: %s\n", argv[1]);
        return 1;
    }
    
    yyin = file; 
    yyparse();
    return 0;
}