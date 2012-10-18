#include "./deps/TestU01-1.2.3/include/bbattery.h"
#include "swrite.h"
#include "./deps/dsfmt-2.2/dSFMT.c"
#include "./deps/randmtzig.c"

// Normal dist. From Marsaglia 2004
double Phi(double x)
{
    long double s=x,t=0,b=x,q=x*x,i=1;
    while(s!=t) s=(t=s)+(b*=q/(i+=2));
    return .5+s*exp(-.5*q-.91893853320467274178L);
}
double randntoU01(void)
{
    return Phi(randmtzig_randn());
}
// End normal

// Exponential dist.
double pexp(double x)
{
	return 1.0 - exp(-x);
}
double exprndtoU01(void)
{
	return pexp(randmtzig_exprnd());
}
// End Exponential

// Naive exponential dist. Just to test that one works.
double naive_exprnd(void)
{
	return -log(1.0 - randu());
}
double naive_exprndtoU01(void)
{
	return pexp(naive_exprnd());
}
// End Naive exp.

int main (void)
{
	dsfmt_gv_init_gen_rand(117);
	randmtzig_create_ziggurat_tables();
	unif01_Gen *gen;
	swrite_Basic = FALSE;
	
	// Uniform distribution
	gen = unif01_CreateExternGen01("randu", randu);
	bbattery_SmallCrush(gen); 		// 30 seconds test
	unif01_DeleteExternGen01(gen);

	// Normal ditribution
	gen = unif01_CreateExternGen01("randmtzig_randn", randntoU01);
	bbattery_SmallCrush(gen); 		// 30 seconds test
	unif01_DeleteExternGen01(gen);

	// Exponential distribution
	gen = unif01_CreateExternGen01("randmtzig_exprnd", exprndtoU01);
	bbattery_SmallCrush(gen); 		// 30 seconds test
	unif01_DeleteExternGen01(gen);

	gen = unif01_CreateExternGen01("naive_exprnd", naive_exprndtoU01);
	bbattery_SmallCrush(gen); 		// 30 seconds test
	unif01_DeleteExternGen01(gen);

	// bbattery_Crush (gen); 		// 2 hours test
	// bbattery_Crush (gen);		// Many hours test
	return 0;
}
