module RNGTest
	const libtestu01 = joinpath(Pkg.dir("RNGTest"), "deps", "libtestu01wrapper")

	# Generator type
	type Unif01
		ptr::Ptr{Array{Int32}}
		name::ASCIIString
		function Unif01(f::Function, genname)
			for i in 1:100
				tmp = f()
				if typeof(tmp) != Float64 error("Function must return Float64") end
				if tmp < 0 || tmp > 1 error("Function must return values on [0,1]") end
			end
			cf = cfunction(f, Float64, ())
			b = new(ccall((:unif01_CreateExternGen01, libtestu01), Ptr{Void}, (Ptr{Uint8}, Ptr{Void}), genname, cf))
			# finalizer(b, deleteUnif01)
			return b
		end
	end

	function deleteUnif01(obj::Unif01)
		ccall((:unif01_DeleteExternGen01, libtestu01), Void, (Ptr{Void},), obj.ptr)
	end

	# Tests
	function smarsa_BirthdaySpacings(gen::Function, N::Int, n::Int, r::Int, d::Int, t::Int, p::Int)
	 	unif01 = Unif01(gen, "")
	 	sres = ccall((:sres_CreatePoisson, libtestu01), Ptr{Void}, (), )
	 	ccall((:smarsa_BirthdaySpacings, libtestu01), Void, 
	 		(Ptr{Void}, Ptr{Void}, Int, Int, 
	 			Int32, Int, Int32, Int32), 
	 		unif01.ptr, sres, N, n, 
	 		r, d, t, p)
	 	deleteUnif01(unif01)
	 	a = ccall((:getPValPoisson, libtestu01), Float64, (Ptr{Void}, ), sres)
	 	ccall((:sres_DeletePoisson, libtestu01), Void, (Ptr{Void}, ), sres)
	 	return a
	end

	function sknuth_Collision(gen::Function, N::Int, n::Int, r::Int, d::Int, t::Int)
		unif01 = Unif01(gen, "")
		sres = ccall((:sknuth_CreateRes2, libtestu01), Ptr{Void}, (), )
		ccall((:sknuth_Collision, libtestu01), Void, 
			(Ptr{Void}, Ptr{Void}, Int, Int,
				Int32, Int, Int32),
			unif01.ptr, sres, N, n, 
			r, d, t)
		deleteUnif01(unif01)
	 	a = ccall((:getPValRes2, libtestu01), Float64, (Ptr{Void}, ), sres)
	 	ccall((:sknuth_DeleteRes2, libtestu01), Void, (Ptr{Void},), sres)
	 	return a
	end

	function sknuth_Gap(gen::Function, N::Int, n::Int, r::Int, Alpha::Real, Beta::Real)
		unif01 = Unif01(gen, "")
		sres = ccall((:sres_CreateChi2, libtestu01), Ptr{Void}, (), )
		ccall((:sknuth_Gap, libtestu01), Void, 
			(Ptr{Void}, Ptr{Void}, Int, Int,
				Int32, Float64, Float64),
			unif01.ptr, sres, N, n,
			r, Alpha, Beta)
		deleteUnif01(unif01)
		a = ccall((:getPValChi2, libtestu01), Float64, (Ptr{Void}, ), sres)
	 	ccall((:sres_DeleteChi2, libtestu01), Void, (Ptr{Void},), sres)
		return a
	end

	function sknuth_SimpPoker(gen::Function, N::Int, n::Int, r::Int, d::Int, k::Int)
		unif01 = Unif01(gen, "")
		sres = ccall((:sres_CreateChi2, libtestu01), Ptr{Void}, (), )
		ccall((:sknuth_SimpPoker, libtestu01), Void, 
			 (Ptr{Void}, Ptr{Void}, Int, Int, 
			 	Int32, Int32, Int32),
			 unif01.ptr, sres, N, n, 
			 r, d, k)
		deleteUnif01(unif01)
		a = ccall((:getPValChi2, libtestu01), Float64, (Ptr{Void}, ), sres)
	 	ccall((:sres_DeleteChi2, libtestu01), Void, (Ptr{Void},), sres)
		return a
	end		

	function sknuth_CouponCollector(gen::Function, N::Int, n::Int, r::Int, d::Int)
		unif01 = Unif01(gen, "")
		sres = ccall((:sres_CreateChi2, libtestu01), Ptr{Void}, (), )
		ccall((:sknuth_CouponCollector, libtestu01), Void, 
			 (Ptr{Void}, Ptr{Void}, Int, Int, 
			 	Int32, Int32),
			 unif01.ptr, sres, N, n, 
			 r, d)
		deleteUnif01(unif01)
		a = ccall((:getPValChi2, libtestu01), Float64, (Ptr{Void}, ), sres)
	 	ccall((:sres_DeleteChi2, libtestu01), Void, (Ptr{Void},), sres)
		return a
	end	

	function sknuth_MaxOft(gen::Function, N::Int, n::Int, r::Int, d::Int, t::Int)
		unif01 = Unif01(gen, "")
		sres = ccall((:sknuth_CreateRes1, libtestu01), Ptr{Void}, (), )
		ccall((:sknuth_MaxOft, libtestu01), Void, 
			 (Ptr{Void}, Ptr{Void}, Int, Int, 
			 	Int32, Int32, Int32),
			 unif01.ptr, sres, N, n, 
			 r, d, t)
		deleteUnif01(unif01)
		a = ccall((:getPValRes1, libtestu01), Float64, (Ptr{Void}, ), sres)
	 	ccall((:sknuth_DeleteRes1, libtestu01), Void, (Ptr{Void},), sres)
		return a
	end		

	function svaria_WeightDistrib(gen::Function, N::Int, n::Int, r::Int, k::Int, alpha::Real, beta::Real)
		unif01 = Unif01(gen, "")
		sres = ccall((:sres_CreateChi2, libtestu01), Ptr{Void}, (), )
		ccall((:svaria_WeightDistrib, libtestu01), Void, 
			 (Ptr{Void}, Ptr{Void}, Int, Int, 
			 	Int32, Int, Float64, Float64),
			 unif01.ptr, sres, N, n, 
			 r, k, alpha, beta)
		deleteUnif01(unif01)
		a = ccall((:getPValChi2, libtestu01), Float64, (Ptr{Void}, ), sres)
	 	ccall((:sres_DeleteChi2, libtestu01), Void, (Ptr{Void},), sres)
		return a
	end		

	function smarsa_MatrixRank(gen::Function, N::Int, n::Int, r::Int, s::Int, L::Int, k::Int)
		unif01 = Unif01(gen, "")
		sres = ccall((:sres_CreateChi2, libtestu01), Ptr{Void}, (), )
		ccall((:smarsa_MatrixRank, libtestu01), Void, 
			 (Ptr{Void}, Ptr{Void}, Int, Int, 
			 	Int32, Int32, Int32, Int32),
			 unif01.ptr, sres, N, n, 
			 r, s, L, k)
		deleteUnif01(unif01)
		a = ccall((:getPValChi2, libtestu01), Float64, (Ptr{Void}, ), sres)
	 	ccall((:sres_DeleteChi2, libtestu01), Void, (Ptr{Void},), sres)
		return a
	end

	function sstring_HammingIndep(gen::Function, N::Int, n::Int, r::Int, s::Int, L::Int, d::Int)
		unif01 = Unif01(gen, "")
		sres = ccall((:sstring_CreateRes, libtestu01), Ptr{Void}, (), )
		ccall((:sstring_HammingIndep, libtestu01), Void, 
			 (Ptr{Void}, Ptr{Void}, Int, Int, 
			 	Int32, Int32, Int32, Int32),
			 unif01.ptr, sres, N, n, 
			 r, s, L, d)
		deleteUnif01(unif01)
		a = ccall((:getPValStringRes, libtestu01), Float64, (Ptr{Void}, ), sres)
	 	ccall((:sstring_DeleteRes, libtestu01), Void, (Ptr{Void},), sres)
		return a
	end

	function swalk_RandomWalk1(gen::Function, N::Int, n::Int, r::Int, s::Int, L0::Int, L1::Int)
		unif01 = Unif01(gen, "")
		sres = ccall((:swalk_CreateRes, libtestu01), Ptr{Void}, (), )
		ccall((:swalk_RandomWalk1, libtestu01), Void, 
			 (Ptr{Void}, Ptr{Void}, Int, Int, 
			 	Int32, Int32, Int, Int),
			 unif01.ptr, sres, N, n, 
			 r, s, L0, L1)
		deleteUnif01(unif01)
		a = Array(Float64, 5)
		ccall((:getPVal_Walk, libtestu01), Void, (Ptr{Void}, Ptr{Float64}), sres, a)
	 	ccall((:swalk_DeleteRes, libtestu01), Void, (Ptr{Void},), sres)
		return a
	end

	# Test Batteries
	for (snm, fnm) in ((:SmallCrush, :smallcrush), (:Crush, :crush), (:BigCrush, :bigcrush), (:pseudoDIEHARD, :diehard), (:FIPS_140_2, :fips_140_2))
		@eval begin
			function $(fnm)(f::Function, fname::String)
				unif01 = Unif01(f, fname)
				ccall(($(string("bbattery_", snm)), libtestu01), Void, (Ptr{Void},), unif01.ptr)
				deleteUnif01(unif01)
			end
			$(fnm)(f::Function) = $(fnm)(f::Function, "")
		end
	end

	function juliasmallcrush(f::Function, pval::FloatingPoint)
		print("Test: ")
		print("BirthdaySpacings: ")
		println(smarsa_BirthdaySpacings(f, 1, 5000000, 0, 1073741824, 2, 1) < pval ? "Fail" : "OK")
		
		print("Test: ")
		print("Collision: ")
		println(sknuth_Collision(f, 1, 5000000, 0, 65536, 2) < pval ? "Fail" : "OK")

		print("Test: ")
		print("Gap: ")
		println(sknuth_Gap(f, 1, 200000, 22, 0.0, .00390625) < pval ? "Fail" : "OK")

		print("Test: ")
		print("SimpPoker: ")
		println(sknuth_SimpPoker(f, 1, 400000, 24, 64, 64) < pval ? "Fail" : "OK")

		print("Test: ")
		print("CouponCollector: ")
		println(sknuth_CouponCollector(f, 1, 500000, 26, 16) < pval ? "Fail" : "OK")

		print("Test: ")
		print("MaxOft: ")
		println(sknuth_MaxOft(f, 1, 2000000, 0, 100000, 6) < pval ? "Fail" : "OK")

		print("Test: ")
		print("WeightDistrib: ")
		println(svaria_WeightDistrib(f, 1, 200000, 27, 256, 0.0, 0.125) < pval ? "Fail" : "OK")

		print("Test: ")
		print("MatrixRank: ")
		println(smarsa_MatrixRank(f, 1, 20000, 20, 10, 60, 60) < pval ? "Fail" : "OK")

		print("Test: ")
		print("HammingIndep: ")
		println(sstring_HammingIndep(f, 1, 500000, 20, 10, 300, 0) < pval ? "Fail" : "OK")

		print("Test: ")
		print("RandomWalk: ")
		println(any(swalk_RandomWalk1(f, 1, 1000000, 0, 30, 150, 150) .< pval) ? "Fail" : "OK")
	end
end

