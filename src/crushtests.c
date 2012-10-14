#include "bbattery.h"
#include "dsfmt-2.2/dSFMT.c"
#include "randmtzig.c"

double pnorm5(double, double, double, int, int);
double randntorand(void)
{
	return pnorm5(randmtzig_randn(), 0.0, 1.0, 1, 0);
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