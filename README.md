# The Crush test suite of l'Ecuyer for Julia

[![CI](https://github.com/JuliaRandom/RNGTest.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/JuliaRandom/RNGTest.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/JuliaRandom/RNGTest.jl/branch/master/graph/badge.svg?token=6FFGnqkZzu)](https://codecov.io/gh/JuliaRandom/RNGTest.jl)

The package is a Julia interface to the test suite TestU01 of Pierre l'Ecuyer. All the tests included in the SmallCrush and BigCrush test batteries can be called as Julia functions.
The first argument to the test function must be either

* a function without arguments, which must return a `Float64` between zero and one, or

* a wrapped `AbstractRNG` obtained via the function `wrap(rng, T)`
   where `T` is the type of the variates produced by `rng` that one
   wants tested (currently `T` must be one of the standard
   finite-precision Julia `Integer` or `FloatingPoint` types).

The output from the test is a p-value.
The package also includes the Small- and the BigCrush batteries. Some examples:
```julia
julia> using RNGTest
julia> RNGTest.smallcrushJulia(rand)
julia> using Distribtions
julia> gf() = cdf(Gamma(), rand(Gamma()));
julia> RNGTest.bigcrushJulia(gf)
julia> rng = RNGTest.wrap(MersenneTwister(), UInt32)
julia> RNGTest.bigcrushTestU01(rng)
```
Note that the BigCrush test battery takes about twelve hours on a normal computer.

## Homepage of the test suite
http://simul.iro.umontreal.ca/testu01/tu01.html
