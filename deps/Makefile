UNAME := $(shell uname)

ifeq ($(UNAME), Darwin)
	SLIB = dylib
else
	SLIB = so
endif

OBJ = 	TestU01-1.2.3/testu01/unif01.c \
		TestU01-1.2.3/testu01/swrite.c \
		TestU01-1.2.3/testu01/bbattery.c \
		TestU01-1.2.3/testu01/scomp.c \
		TestU01-1.2.3/testu01/sknuth.c \
		TestU01-1.2.3/testu01/smarsa.c \
		TestU01-1.2.3/testu01/smultin.c \
		TestU01-1.2.3/testu01/snpair.c \
		TestU01-1.2.3/testu01/sres.c \
		TestU01-1.2.3/testu01/sspectral.c \
		TestU01-1.2.3/testu01/sstring.c \
		TestU01-1.2.3/testu01/svaria.c \
		TestU01-1.2.3/testu01/swalk.c \
		TestU01-1.2.3/testu01/ufile.c \
		TestU01-1.2.3/testu01/vectorsF2.c \
		TestU01-1.2.3/mylib/chrono.c \
		TestU01-1.2.3/mylib/gdef.c \
		TestU01-1.2.3/mylib/num.c \
		TestU01-1.2.3/mylib/util.c \
		TestU01-1.2.3/mylib/bitset.c \
		TestU01-1.2.3/mylib/mystr.c \
		TestU01-1.2.3/mylib/tables.c \
		TestU01-1.2.3/mylib/num2.c \
		TestU01-1.2.3/probdist/gofw.c \
		TestU01-1.2.3/probdist/fbar.c \
		TestU01-1.2.3/probdist/fdist.c \
		TestU01-1.2.3/probdist/gofs.c \
		TestU01-1.2.3/probdist/fmass.c \
		TestU01-1.2.3/probdist/statcoll.c \
		TestU01-1.2.3/probdist/wdist.c

all:
	cc -shared -O2 $(OBJ) -o libtestu01wrapper.$(SLIB) -I TestU01-1.2.3/include -I TestU01-1.2.3/testu01

clean:
	rm *.dylib