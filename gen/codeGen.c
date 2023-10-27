#include<stdio.h>
#include "../incFile.h"
#include "../y.tab.h"


int genStmt(nodeType *p, FILE *outfile)
{


    if(!p) return 0;

    switch (p->type)
    {
    case typeOpr:
        switch (p->opr.oper)
        {
        case KANIKU:
            fprintf(outfile,"printf(");
            genStmt(p->opr.op[0],outfile);
            fprintf(outfile,");\n");
            break;
        case IPPO:
            fprintf(outfile,"if(");
            genStmt(p->opr.op[0],outfile);
            fprintf(outfile,")\n{\n\t");
            genStmt(p->opr.op[1],outfile);
            fprintf(outfile,"}\nelse\n{\n\t");
            genStmt(p->opr.op[2],outfile);
            fprintf(outfile,"}\n");
            break;
        
        case CHERUTH:
            genStmt(p->opr.op[0],outfile);
            fprintf(outfile," < ");
            genStmt(p->opr.op[1],outfile);
            break;
        
        case VALUTH:
            genStmt(p->opr.op[0],outfile);
            fprintf(outfile," > ");
            genStmt(p->opr.op[1],outfile);
            break;

        case SAMAM:
            genStmt(p->opr.op[0],outfile);
            fprintf(outfile," == ");
            genStmt(p->opr.op[1],outfile);
            break;

        case CHERUTH_ALLENGI_SAMAM:
            genStmt(p->opr.op[0],outfile);
            fprintf(outfile," <= ");
            genStmt(p->opr.op[1],outfile);
            break;

        case VELUTH_ALLENGI_SAMAM:
            genStmt(p->opr.op[0],outfile);
            fprintf(outfile," >= ");
            genStmt(p->opr.op[1],outfile);
            break;

        default:
            break;
        }
        break;
        case typeCon:
            fprintf(outfile,"%d",p->con.value);
        break; 
    default:
        break;
    }
}