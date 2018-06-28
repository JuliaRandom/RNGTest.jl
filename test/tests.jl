f = rand
pval = 0.001

print("Test: ")
print("BirthdaySpacings: ")
@test RNGTest.smarsa_BirthdaySpacings(f, 1, 5000000, 0, 1073741824, 2, 1) > pval
println("OK")

print("Test: ")
print("Collision: ")
@test RNGTest.sknuth_Collision(f, 1, 5000000, 0, 65536, 2) > pval
println("OK")

print("Test: ")
print("Gap: ")
@test RNGTest.sknuth_Gap(f, 1, 200000, 22, 0.0, .00390625) > pval
println("OK")

print("Test: ")
print("SimpPoker: ")
@test RNGTest.sknuth_SimpPoker(f, 1, 400000, 24, 64, 64) > pval
println("OK")

print("Test: ")
print("CouponCollector: ")
@test RNGTest.sknuth_CouponCollector(f, 1, 500000, 26, 16) > pval
println("OK")

print("Test: ")
print("MaxOft: ")
@test all(hcat(RNGTest.sknuth_MaxOft(f, 1, 2000000, 0, 100000, 6)...) .> pval)
println("OK")

print("Test: ")
print("WeightDistrib: ")
@test RNGTest.svaria_WeightDistrib(f, 1, 200000, 27, 256, 0.0, 0.125) > pval
println("OK")

print("Test: ")
print("MatrixRank: ")
@test RNGTest.smarsa_MatrixRank(f, 1, 20000, 20, 10, 60, 60) > pval
println("OK")

print("Test: ")
print("HammingIndep: ")
@test RNGTest.sstring_HammingIndep(f, 1, 500000, 20, 10, 300, 0)[:Mean] > pval
println("OK")

print("Test: ")
print("RandomWalk: ")
@test all(hcat(RNGTest.swalk_RandomWalk1(f, 1, 1000000, 0, 30, 150, 150)...) .> pval)
println("OK")

rng = RNGTest.wrap(MersenneTwister(0), UInt32)
RNGTest.smallcrushTestU01(rng)
