<a name="banner"/>
# The Crush test suite of l'Ecuyer for Julia

## How I made work
1. I installed testu01 on my machine such that ld could find it
2. ld could not find the image of libRmath before I set LD_LIBRARY_PATH
3. clang src/crushtests.c -ltestu01 -lRmath -I $HOME/git/julia/deps/random/ -L $HOME/git/julia/usr/lib
4. ./a.out

## Homepage of the test suite
http://www.iro.umontreal.ca/~simardr/testu01