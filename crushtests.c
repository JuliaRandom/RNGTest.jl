#include "./deps/TestU01-1.2.3/include/bbattery.h"
#include "./deps/dsfmt-2.2/dSFMT.c"
#include "./deps/randmtzig.c"

/* From Rmath
double pnorm5(double, double, double, int, int);
double randntorand(void)
{
	return pnorm5(randmtzig_randn(), 0.0, 1.0, 1, 0);
}
*/

// From Marsaglia 2004
double Phi(double x)
{
    long double s=x,t=0,b=x,q=x*x,i=1;
    while(s!=t) s=(t=s)+(b*=q/(i+=2));
    return .5+s*exp(-.5*q-.91893853320467274178L);
}

double randntorand(void)
{
    return Phi(randmtzig_randn());
}

int main (void)
{
	dsfmt_gv_init_gen_rand(117);
	randmtzig_create_ziggurat_tables();
	unif01_Gen *gen;
	// swrite_Basic = FALSE;
	gen = unif01_CreateExternGen01 ("randmtzig_randn", randntorand);
	bbattery_SmallCrush (gen); 	// 30 second test
	// bbattery_Crush (gen); 		// 2 hour test
	// bbattery_Crush (gen);		// Many hours test
	return 0;
}
