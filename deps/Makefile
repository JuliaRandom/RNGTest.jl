UNAME := $(shell uname)

ifeq ($(UNAME), Darwin)
	SLIB = dylib
else
	SLIB = so
endif

OBJ = 	TestU01/src/unif01.c \
		TestU01/src/swrite.c \
		TestU01/src/bbattery.c \
		TestU01/src/scomp.c \
		TestU01/src/sknuth.c \
		TestU01/src/smarsa.c \
		TestU01/src/smultin.c \
		TestU01/src/snpair.c \
		TestU01/src/sres.c \
		TestU01/src/sspectral.c \
		TestU01/src/sstring.c \
		TestU01/src/svaria.c \
		TestU01/src/swalk.c \
		TestU01/src/ufile.c \
		TestU01/src/vectorsF2.c \
		TestU01/src/chrono.c \
		TestU01/src/gdef.c \
		TestU01/src/num.c \
		TestU01/src/util.c \
		TestU01/src/bitset.c \
		TestU01/src/mystr.c \
		TestU01/src/tables.c \
		TestU01/src/num2.c \
		TestU01/src/gofw.c \
		TestU01/src/fbar.c \
		TestU01/src/fdist.c \
		TestU01/src/gofs.c \
		TestU01/src/fmass.c \
		TestU01/src/statcoll.c \
		TestU01/src/wdist.c

all:
	cc -shared -O2 $(OBJ) -o libtestu01wrapper.$(SLIB) -I TestU01/include

clean:
	rm *.dylib