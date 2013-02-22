<a name="banner"/>
# The Crush test suite of l'Ecuyer for Julia
The package is a Julia interface to the test suite TestU01 of Pierre l'Ecuyer. There are five methods named `smallcrush`, `crush`, `bigcrush`, `diehard` and `fips_140_2` respectively and they all take a function as argument. The function passed to the test methods must have zero arguments and return a `Float64` between zero and one. Some examples:
```julia
julia> RNGTest
julia> RNGTest.smallcrush(rand)
julia> using Distribtions
julia> gf = cdf(Gamma(), rand(Gamma()));
julia> RNGTest.crush(gf)
```

## Homepage of the test suite
http://www.iro.umontreal.ca/~simardr/testu01