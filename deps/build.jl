require("BinDeps")
prefix = Pkg.dir("TestU01/deps/")
s = @build_steps begin
	ChangeDirectory(joinpath(prefix, "TestU01-1.2.3"))
    `./configure`
    `make`
end
s |= @build_steps begin
    ChangeDirectory(prefix)
    `make`
end
run(s)