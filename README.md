<a name="banner"/>
# The Crush test suite of l'Ecuyer for Julia
The package is a Julia interface to the test suite TestU01 of Pierre l'Ecuyer. There are three methods named `smallcrush`, `crush` and `bigcrush` respectively and they all take a function as argument. The function passed to the crush methods must have zero arguments and return a `Float64` between zero and one. Some examples:
```julia
julia> TestU01
julia> TestU01.smallcrush(rand)
julia> using Distribtions
julia> gf = cdf(Gamma(), rand(Gamma()));
julia> TestU01.crush(gf)
```

## Homepage of the test suite
http://www.iro.umontreal.ca/~simardr/testu01