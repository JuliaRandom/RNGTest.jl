module TestU01
	const libtestu01 = joinpath(Pkg.dir("TestU01"), "deps", "libtestu01wrapper")

	for (snm, fnm) in ((:SmallCrush, :smallcrush), (:Crush, :crush), (:BigCrush, :bigcrush), (:pseudoDIEHARD, :diehard), (:FIPS_140_2, :fips_140_2))
		@eval begin
			function $(fnm)(f::Function)
				for i in 1:100
					tmp = f()
					if typeof(tmp) != Float64 error("Function must return Float64") end
					if tmp < 0 || tmp > 1 error("Function must return values on [0,1]") end
				end
				cf = cfunction(f, Float64, ())
				unif_pointer = ccall((:unif01_CreateExternGen01, libtestu01), Ptr{Void}, (Ptr{Uint8}, Ptr{Void}), "Name of 		function 	to test", cf)
				ccall(($(string("bbattery_", snm)), libtestu01), Void, (Ptr{Void},), unif_pointer)
				ccall((:unif01_DeleteExternGen01, libtestu01), Void, (Ptr{Void},), unif_pointer)
			end
		end
	end
end