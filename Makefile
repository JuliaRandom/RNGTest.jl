all:
	cc -O3 -finline-functions -fomit-frame-pointer crushtests.c -I ./deps/TestU01-1.2.3/include/ -DDSFMT_MEXP=19937 -msse2 -DHAVE_SSE2 -o crushtests ./deps/TestU01-1.2.3/testu01/.libs/libtestu01.a ./deps/TestU01-1.2.3/probdist/.libs/libprobdist.a ./deps/TestU01-1.2.3/mylib/.libs/libmylib.a 

clean:
	rm -f crushtests *~

