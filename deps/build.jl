p = pwd()
cd(Pkg.dir("RNGTest/deps/"))
run(`make`)
cd(p)