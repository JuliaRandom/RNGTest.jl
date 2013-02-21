require("BinDeps")
prefix = Pkg.dir("TestU01/deps/")
s = @build_steps begin
    ChangeDirectory(prefix)
    `make`
end
run(s)