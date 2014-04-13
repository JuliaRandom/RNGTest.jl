ifeq ($(OS), Windows_NT)
	CC = gcc
	SLIB = dll
else
	UNAME := $(shell uname)
	ifeq ($(UNAME), Darwin)
		CC = gcc
		SLIB = dylib
	else
		CC = cc
		SLIB = so
	endif
endif
CFLAGS = -std=c99 -shared -fPIC -O2 -I TestU01/include


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
		TestU01/src/wdist.c \
		TestU01/src/extractors.c

all:
	$(CC) $(CFLAGS) $(OBJ) -o libtestu01wrapper.$(SLIB)

clean:
	rm *.$(SLIB)