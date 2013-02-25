// Extractors written by Andreas Noack Jensen
#include "sres.h"
#include "sknuth.h"
#include "sstring.h"
#include "swalk.h"

double getPValPoisson (sres_Poisson *res)
{
   return (res->pVal2);
}

double getPValChi2 (sres_Chi2 *res)
{
   return (res->pVal2[gofw_Mean]);
}

double getPValRes1 (sknuth_Res1 *res)
{
   return (res->Bas->pVal2[gofw_Mean]);
}

double getPValRes2 (sknuth_Res2 *res)
{
   return (res->Pois->pVal2);
}

double getPValStringRes (sstring_Res *res)
{
   return (res->Bas->pVal2[gofw_Mean]);
}

void getPVal_Walk (swalk_Res *res, double pvals[5])
{
	pvals[0] = res->H[0]->pVal2[gofw_Mean];
	pvals[1] = res->M[0]->pVal2[gofw_Mean];
	pvals[2] = res->J[0]->pVal2[gofw_Mean];
	pvals[3] = res->R[0]->pVal2[gofw_Mean];
	pvals[4] = res->C[0]->pVal2[gofw_Mean];
}