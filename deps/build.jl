require("BinDeps")
prefix = Pkg.dir("RNGTest/deps")
s = @build_steps begin
	ChangeDirectory(joinpath(prefix, "TestU01-1.2.3"))
	`ls`
    `./configure`
    # `make`
end
s |= @build_steps begin
    ChangeDirectory(prefix)
    `make`
    CCompile("TestU01-1.2.3/mylib/*.c TestU01-1.2.3/probdist/*.c TestU01-1.2.3/testu01/*.c", "libtestu01wrapper.$shlib_ext", ["-fPIC"], [""])
end
run(s)