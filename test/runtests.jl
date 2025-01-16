using Test
using RNGTest
using Random

f = rand
pval = 0.001

@testset "smarsa" begin
    @testset "BirthdaySpacings" begin
        @test RNGTest.smarsa_BirthdaySpacings(f, 1, 5000000, 0, 1073741824, 2, 1) > pval

        # Issue28: smarsa_BirthdaySpacing called in bigcrushJulia
        if typemax(Clong) < 2^31  # On Windows Clong is defined as Int32
            @test RNGTest.smarsa_BirthdaySpacings(f, 250, 4*10^6, 0, 2^30, 2, 1) > pval
        else
            @test RNGTest.smarsa_BirthdaySpacings(f, 100, 10^7, 0, 2^31, 2, 1) > pval
        end
    end

    @testset "MatrixRank" begin
        @test RNGTest.smarsa_MatrixRank(f, 1, 20000, 20, 10, 60, 60) > pval
    end

    @testset "SerialOver" begin
        res = RNGTest.smarsa_SerialOver(f, 1, 10, 0, 2^3, 3)
        @test res[:Mean] > pval
        @test res[:Var] == -1.0
        @test res[:Cor] == -1.0
        @test res[:Sum] == -1.0
        @test_throws BoundsError res[:Nothing]
    end

    @testset "GCD" begin
        @test RNGTest.smarsa_GCD(f, 10, 5*10^2, 0, 30) > pval
    end

    @testset "CollisionOver" begin
        @test RNGTest.smarsa_CollisionOver(f, 30, 2*10^3, 0, 2^11, 2) > pval
    end

    @testset "Savir2" begin
        @test RNGTest.smarsa_Savir2(f, 10, 10^4, 10, 2^10, 10) > pval
    end
end

@testset "sknuth" begin
    @testset "Collision" begin
        @test RNGTest.sknuth_Collision(f, 1, 5000000, 0, 65536, 2) > pval
    end

    @testset "Gap" begin
        @test RNGTest.sknuth_Gap(f, 1, 200000, 22, 0.0, .00390625) > pval
    end

    @testset "SimpPoker" begin
        @test RNGTest.sknuth_SimpPoker(f, 1, 400000, 24, 64, 64) > pval
    end

    @testset "CouponCollector" begin
        @test RNGTest.sknuth_CouponCollector(f, 1, 500000, 26, 16) > pval
    end

    @testset "MaxOft" begin
        @test all(hcat(RNGTest.sknuth_MaxOft(f, 1, 2000000, 0, 100000, 6)...) .> pval)
    end

    @testset "CollisionPermut" begin
        @test RNGTest.sknuth_CollisionPermut(f, 20, 2*10^3, 0, 14) > pval
    end

    @testset "Permutation" begin
        @test RNGTest.sknuth_Permutation(f, 1, 10^4, 0, 3) > pval
    end

    @testset "Run" begin
        @test RNGTest.sknuth_Run(f, 5, 10^4, 0, 0) > pval
    end
end

@testset "svaria" begin
    @testset "WeightDistrib" begin
        @test RNGTest.svaria_WeightDistrib(f, 1, 200000, 27, 256, 0.0, 0.125) > pval
    end

    @testset "AppearanceSpacings" begin
        @test RNGTest.svaria_AppearanceSpacings(f, 1, 10^3, 10^5, 0, 3, 5)[:Mean] > pval
    end

    @testset "SampleProd" begin
        @test RNGTest.svaria_SampleProd(f, 40, 10^4, 0, 8)[:AD] > pval
    end

    @testset "SampleMean" begin
        @test RNGTest.svaria_SampleMean(f, 2*10^3, 30, 0)[:AD] > pval
    end

    @testset "SampleCorr" begin
        @test RNGTest.svaria_SampleCorr(f, 1, 2*10^5, 0, 1)[:Mean] > pval
    end

    @testset "SumCollector" begin
        @test RNGTest.svaria_SumCollector(f, 1, 5*10^4, 0, 10.0) > pval
    end
end

@testset "sstring" begin
    @testset "HammingIndep" begin
        @test RNGTest.sstring_HammingIndep(f, 1, 500000, 20, 10, 300, 0)[:Mean] > pval
    end

    @testset "LongestHeadRun" begin
        @test_throws ArgumentError("argument L is too small. `L ÷ s * s` must be at least 1000 but was 999") RNGTest.sstring_LongestHeadRun(f, 1, 10, 0, 3, 1000)
        @test all(t -> t > pval, RNGTest.sstring_LongestHeadRun(f, 1, 100, 0, 3, 10000))
    end

    @testset "PeriodsInStrings" begin
        @test RNGTest.sstring_PeriodsInStrings(f, 10, 5*10^2, 0, 10) > pval
    end

    @testset "Run" begin
        @test all(t -> t > pval, RNGTest.sstring_Run(f, 1, 2*10^4, 0, 3))
    end

    @testset "AutoCor" begin
        @test RNGTest.sstring_AutoCor(f, 10, 10^4, 0, 3, 1)[:Sum] > pval
    end

    @testset "HammingCorr" begin
        @test RNGTest.sstring_HammingCorr(f, 1, 10^4, 10, 10, 30)[:Mean] > pval
    end

    @testset "" begin
        @test RNGTest.sstring_HammingWeight2(f, 10, 10^4, 0, 3, 10^3)[:Sum] > pval
    end
end

@testset "swalk" begin
    @testset "RandomWalk" begin
        @test all(hcat(RNGTest.swalk_RandomWalk1(f, 1, 1000000, 0, 30, 150, 150)...) .> pval)
    end
end

@testset "snpair" begin
    @testset "ClonsePairs" begin
        @test all(t -> t > pval, RNGTest.snpair_ClosePairs(f, 30, 6*10^2, 0, 3, 0, 30))
    end
end

@testset "scomp" begin
    @testset "LinearComp" begin
        @test all(t -> t > pval, RNGTest.scomp_LinearComp(f, 1, 400, 0, 1))
    end

    @testset "LempelZiv" begin
        @test RNGTest.scomp_LempelZiv(f, 5, 7, 0, 10)[:Sum] > pval
    end
end

@testset "sspectral" begin
    @testset "Fourier3" begin
        @test RNGTest.sspectral_Fourier3(f, 100, 14, 0, 3) > pval
    end
end

@testset "smallcrush" begin
    rng = RNGTest.wrap(MersenneTwister(0), UInt32)
    RNGTest.smallcrushTestU01(rng)
    @test all(t -> t > pval, mapreduce(s -> [s...], vcat, RNGTest.smallcrushJulia(rng)))
end
