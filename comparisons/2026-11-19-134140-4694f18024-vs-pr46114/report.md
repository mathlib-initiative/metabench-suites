# Interval: #46114 against its merge base

| | base | head |
|---|---|---|
| Mathlib | leanprover-community/mathlib4, merge base with master | raoxiaojia/mathlib4@interval-exp-adaptive-squaring |
| Commit | [`4694f18024`](https://github.com/leanprover-community/mathlib4/commit/4694f18024a16d41993787c8f5e0e905a729f904) | [`59b1cb4d44`](https://github.com/raoxiaojia/mathlib4/commit/59b1cb4d44e744d71f93b1f17fd304be8d90f40a) |
| Lean | leanprover/lean4:v4.36.0 | leanprover/lean4:v4.36.0 |

- PR: [#46114 feat(Tactic/Inclusion/Exp): add adaptive squaring for argument reduction of `exp`](https://github.com/leanprover-community/mathlib4/pull/46114)
- Interval: 5 benchmarks on base, 5 on head.
- MetaBench commit `441aac67f0`, options `-Dbench.proofHeads=5 -Dbench.kernelUnfolds=5`.
- Runner: aarch64, Neoverse-N2. Base ran first, then head, in one job on 2026-11-19 13:41 UTC.

## Interval

Base on the left, head on the right. `|` marks a changed line, `<` and `>` a line on one side only. Raw output: [base](base/Interval.txt), [head](head/Interval.txt).

````text
exp/1/bits100:                                                                                        exp/1/bits100:
phase     kHB       min…max    ms     min…max Minstr       min…max                                 |  phase     kHB       min…max    ms     min…max  Minstr         min…max
goal     5.68     5.67…5.69  0.80   0.73…0.90  1.643   1.639…1.648                                 |  goal     5.68     5.67…5.69  0.76   0.71…0.83   1.642     1.639…1.649
proof   91.80   91.77…91.82  7.83   7.79…8.19 29.944 29.919…29.978                                 |  proof   92.25   92.22…92.27  7.88   7.61…7.99  30.412   30.394…30.459
kernel  57.69   57.69…57.69  7.37   7.28…7.38 44.805 44.789…44.826                                 |  kernel 130.91 130.91…130.91 17.39 17.22…19.38 102.827 102.812…102.862
total  155.16 155.15…155.19 15.93 15.91…16.46 76.397 76.367…76.415                                 |  total  228.84 228.82…228.86 26.13 25.57…27.86 134.877 134.850…134.954
proof term: 91 nodes, kernel 81018 ns/node                                                         |  proof term: 91 nodes, kernel 191108 ns/node

proof heads            count                                                                          proof heads            count
OfNat.ofNat                2                                                                          OfNat.ofNat                2
Bool.true                  1                                                                          Bool.true                  1
Dyadic                     1                                                                          Dyadic                     1
Dyadic.instDecidableLT     1                                                                          Dyadic.instDecidableLT     1
Dyadic.instLT              1                                                                          Dyadic.instLT              1

kernel unfolds count                                                                                  kernel unfolds count
Int.casesOn      270                                                                               |  Int.casesOn      651
Int.rec          266                                                                               |  Int.rec          621
Nat.rec          145                                                                               |  Bool.rec         242
Add.add          106                                                                               |  Nat.rec          230
HAdd.hAdd        106                                                                               |  Bool.casesOn     222

exp/1/bits1000:                                                                                       exp/1/bits1000:
phase     kHB       min…max    ms     min…max  Minstr         min…max                                 phase     kHB       min…max    ms     min…max  Minstr         min…max
goal     6.47     6.46…6.48  1.00   0.93…1.08   2.954     2.944…2.979                              |  goal     6.47     6.46…6.48  1.11   1.10…1.13   2.986     2.979…3.000
proof   87.31   87.22…87.37  8.50   8.35…8.67  33.683   33.638…33.688                              |  proof   88.39   88.30…88.45  8.62   8.49…8.68  31.047   31.002…31.101
kernel 197.05 197.05…197.05 23.05 22.83…23.33 149.495 149.427…149.514                              |  kernel 339.97 339.97…339.97 49.06 48.43…49.17 267.717 267.569…267.756
total  290.82 290.75…290.89 32.58 32.33…32.92 186.110 186.060…186.181                              |  total  434.83 434.75…434.89 58.76 58.12…58.90 301.702 301.594…301.832
proof term: 91 nodes, kernel 253283 ns/node                                                        |  proof term: 91 nodes, kernel 539122 ns/node

proof heads            count                                                                          proof heads            count
OfNat.ofNat                2                                                                          OfNat.ofNat                2
Bool.true                  1                                                                          Bool.true                  1
Dyadic                     1                                                                          Dyadic                     1
Dyadic.instDecidableLT     1                                                                          Dyadic.instDecidableLT     1
Dyadic.instLT              1                                                                          Dyadic.instLT              1

kernel unfolds count                                                                                  kernel unfolds count
Int.casesOn      996                                                                               |  Int.casesOn     1781
Int.rec          992                                                                               |  Int.rec         1667
Nat.rec          736                                                                               |  Bool.rec         644
HMul.hMul        702                                                                               |  Bool.casesOn     600
Mul.mul          702                                                                               |  Nat.rec          590

exp/1/bits10000:                                                                                      exp/1/bits10000:
phase      kHB         min…max     ms       min…max   Minstr           min…max                     |  phase      kHB         min…max     ms       min…max  Minstr         min…max
goal     14.61     14.59…14.62   3.25     3.16…3.30   22.336     22.276…22.511                     |  goal     14.61     14.59…14.62   3.02     2.98…3.13  22.397   22.276…23.016
proof    93.99     93.94…94.05  18.85   18.56…19.08  128.821   128.716…128.992                     |  proof    92.53     92.49…92.60  13.34   13.10…13.90  75.684   75.580…75.804
kernel 1632.36 1632.36…1632.36 243.14 233.50…245.00 1245.192 1244.810…1245.246                     |  kernel 1056.76 1056.76…1056.76 165.40 160.25…168.26 848.493 848.293…848.758
total  1740.94 1740.90…1741.02 265.07 255.26…267.37 1396.448 1395.967…1396.542                     |  total  1163.89 1163.85…1163.97 182.29 176.71…184.38 946.753 946.263…947.088
proof term: 91 nodes, kernel 2671904 ns/node                                                       |  proof term: 91 nodes, kernel 1817596 ns/node

proof heads            count                                                                          proof heads            count
OfNat.ofNat                2                                                                          OfNat.ofNat                2
Bool.true                  1                                                                          Bool.true                  1
Dyadic                     1                                                                          Dyadic                     1
Dyadic.instDecidableLT     1                                                                          Dyadic.instDecidableLT     1
Dyadic.instLT              1                                                                          Dyadic.instLT              1

kernel unfolds count                                                                                  kernel unfolds count
Int.casesOn     8488                                                                               |  Int.casesOn     5651
Int.rec         8484                                                                               |  Int.rec         5267
Nat.rec         6731                                                                               |  Bool.rec        2019
HMul.hMul       6701                                                                               |  Bool.casesOn    1902
Mul.mul         6701                                                                               |  Nat.rec         1826

exp/10.1/bits2000:                                                                                    exp/10.1/bits2000:
phase     kHB       min…max     ms       min…max   Minstr           min…max                        |  phase     kHB       min…max    ms     min…max  Minstr         min…max
goal     6.23     6.22…6.25   1.24     1.18…3.93    4.273       4.254…4.278                        |  goal     6.23     6.22…6.25  1.17   1.15…1.20   4.275     4.264…4.280
proof   68.05   68.01…68.15 464.89 464.33…465.42 5170.521 5170.259…5170.656                        |  proof   67.29   67.24…67.39 12.43 12.34…12.55  85.169   85.105…85.441
kernel 363.97 363.97…363.97 291.84 284.21…300.45 2835.138 2834.811…2835.263                        |  kernel 493.85 493.85…493.86 75.43 74.00…78.88 418.479 418.379…418.555
total  438.25 438.22…438.34 758.24 750.04…768.08 8009.937 8009.343…8010.103                        |  total  567.37 567.34…567.46 89.01 87.51…92.56 507.941 507.823…508.210
proof term: 86 nodes, kernel 3393498 ns/node                                                       |  proof term: 86 nodes, kernel 877059 ns/node

proof heads                                 count                                                     proof heads                                 count
Inclusion.IntervalDyadicReal.scientific         2                                                     Inclusion.IntervalDyadicReal.scientific         2
Inclusion.IntervalDyadicReal.scientific_mem     2                                                     Inclusion.IntervalDyadicReal.scientific_mem     2
OfScientific.ofScientific                       2                                                     OfScientific.ofScientific                       2
Bool.true                                       1                                                     Bool.true                                       1
Dyadic                                          1                                                     Dyadic                                          1

kernel unfolds count                                                                                  kernel unfolds count
Int.casesOn     1869                                                                               |  Int.casesOn     2620
Int.rec         1865                                                                               |  Int.rec         2462
Nat.rec         1426                                                                               |  Bool.rec         949
HMul.hMul       1390                                                                               |  Bool.casesOn     888
Mul.mul         1390                                                                               |  Nat.rec          878

exp/0.3/bits2000:                                                                                     exp/0.3/bits2000:
phase     kHB       min…max     ms       min…max   Minstr           min…max                        |  phase     kHB       min…max    ms     min…max  Minstr         min…max
goal     6.22     6.21…6.23   1.22     1.21…1.23    4.257       4.222…4.266                        |  goal     6.22     6.21…6.23  1.18   1.16…1.23   4.251     4.239…4.258
proof   68.02   67.96…68.08 438.59 438.19…438.78 4865.427 4865.406…4865.595                        |  proof   67.23   67.17…67.28 11.95 11.83…12.09  79.786   79.642…79.793
kernel 358.89 358.89…358.89 282.11 281.44…284.79 2689.339 2689.192…2689.442                        |  kernel 443.06 443.06…443.06 68.42 67.05…70.24 375.039 374.973…375.147
total  433.15 433.07…433.18 722.11 721.06…724.19 7559.038 7558.855…7559.259                        |  total  516.52 516.45…516.56 81.54 80.16…83.42 459.038 459.012…459.186
proof term: 86 nodes, kernel 3280381 ns/node                                                       |  proof term: 86 nodes, kernel 795629 ns/node

proof heads                                 count                                                     proof heads                                 count
Inclusion.IntervalDyadicReal.scientific         2                                                     Inclusion.IntervalDyadicReal.scientific         2
Inclusion.IntervalDyadicReal.scientific_mem     2                                                     Inclusion.IntervalDyadicReal.scientific_mem     2
OfScientific.ofScientific                       2                                                     OfScientific.ofScientific                       2
Bool.true                                       1                                                     Bool.true                                       1
Dyadic                                          1                                                     Dyadic                                          1

kernel unfolds count                                                                                  kernel unfolds count
Int.casesOn     1843                                                                               |  Int.casesOn     2350
Int.rec         1839                                                                               |  Int.rec         2186
Nat.rec         1402                                                                               |  Bool.rec         838
HMul.hMul       1366                                                                               |  Bool.casesOn     781
Mul.mul         1366                                                                               |  Nat.rec          757

````
