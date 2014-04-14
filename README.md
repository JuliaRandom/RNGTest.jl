<a name="banner"/>
# The Crush test suite of l'Ecuyer for Julia
[![Build Status](https://travis-ci.org/andreasnoackjensen/RNGTest.jl.png)](https://travis-ci.org/andreasnoackjensen/RNGTest.jl)

The package is a Julia interface to the test suite TestU01 of Pierre l'Ecuyer. All the tests included in the SmallCrush and BigCrush test batteries can be called as Julia functions. The first argument to the test function must be a function without arguments and it must return a `Float64` between zero and one. The output from the test is a p-value. The package also includes the Small- and the BigCrush batteries. Some examples:
```julia
julia> using RNGTest
julia> RNGTest.smallcrushJulia(rand)
julia> using Distribtions
julia> gf() = cdf(Gamma(), rand(Gamma()));
julia> RNGTest.bigcrushJulia(gf)
```
Note that the BigCrush test battery takes about twelve hours on a normal computer.

## Homepage of the test suite
http://www.iro.umontreal.ca/~simardr/testu01