# Interval: #46487 against its merge base

| | base | head |
|---|---|---|
| Mathlib | leanprover-community/mathlib4, merge base with master | raoxiaojia/mathlib4@interval-series-refactor |
| Commit | [`03a891adb3`](https://github.com/leanprover-community/mathlib4/commit/03a891adb31b705e9f7e325531c095c294232746) | [`658db050b0`](https://github.com/raoxiaojia/mathlib4/commit/658db050b0e5722afa890581e3159830495d5d5d) |
| Lean | leanprover/lean4:v4.37.0-rc1 | leanprover/lean4:v4.37.0-rc1 |

- PR: [#46487 refactor(Tactic/Inclusion): refactors the divide-and-conquer method of series evaluation out with optimisation](https://github.com/leanprover-community/mathlib4/pull/46487)
- Interval: 5 benchmarks on base, 5 on head.
- MetaBench commit `441aac67f0`, options `-Dbench.proofHeads=5 -Dbench.kernelUnfolds=5`.
- Runner: aarch64, Neoverse-N2. Base ran first, then head, in one job on 2026-11-25 14:34 UTC.

## Interval

Medians, base → head. 🟥 and ✅ mark a heartbeat or instruction count that changed by at least 2% and whose samples on the two sides do not overlap.

| benchmark | phase | kHB | ms | Minstr |
|---|---|---|---|---|
| `exp/1/bits100` | goal | 4.85 → 4.85 (0%) | 0.9 → 0.83 (-7.2%) | 1.424 → 1.438 (+1%) |
|  | proof | 83.84 → 83.87 (0%) | 8.45 → 8.03 (-4.9%) | 26.713 → 26.636 (-0.3%) |
|  | kernel | 🟥 99.62 → 103.04 (+3.4%) | 10.86 → 11.02 (+1.5%) | 🟥 60.939 → 63.128 (+3.6%) |
|  | total | 188.31 → 191.75 (+1.8%) | 20.17 → 20.06 (-0.5%) | 🟥 89.09 → 91.193 (+2.4%) |
| `exp/1/bits1000` | goal | 5.65 → 5.65 (0%) | 1.13 → 1.09 (-3.3%) | 2.781 → 2.771 (-0.4%) |
|  | proof | 80.86 → 80.93 (+0.1%) | 8.71 → 8.61 (-1.1%) | 27.347 → 27.348 (0%) |
|  | kernel | 🟥 248.95 → 255.13 (+2.5%) | 28.51 → 27.87 (-2.2%) | 🟥 151.755 → 155.787 (+2.7%) |
|  | total | 335.46 → 341.7 (+1.9%) | 38.24 → 37.46 (-2%) | 🟥 181.879 → 185.905 (+2.2%) |
| `exp/1/bits10000` | goal | 13.77 → 13.77 (0%) | 3.08 → 3.1 (+0.7%) | 22.015 → 21.936 (-0.4%) |
|  | proof | 84 → 84.21 (+0.2%) | 12.4 → 12.06 (-2.7%) | 63.792 → 63.348 (-0.7%) |
|  | kernel | 🟥 740.77 → 760.29 (+2.6%) | 101.49 → 96.09 (-5.3%) | 🟥 466.662 → 476.394 (+2.1%) |
|  | total | 🟥 838.54 → 858.28 (+2.4%) | 117.1 → 111.33 (-4.9%) | 552.376 → 561.623 (+1.7%) |
| `exp/10.1/bits2000` | goal | 5.52 → 5.52 (0%) | 1.2 → 1.19 (-1.3%) | 4.126 → 4.119 (-0.2%) |
|  | proof | 61.7 → 61.71 (0%) | 12.47 → 10.03 (-19.5%) | ✅ 81.881 → 53.956 (-34.1%) |
|  | kernel | 🟥 345.21 → 355.91 (+3.1%) | 46.76 → 43.81 (-6.3%) | ✅ 241.3 → 230.916 (-4.3%) |
|  | total | 🟥 412.42 → 423.13 (+2.6%) | 60.52 → 54.94 (-9.2%) | ✅ 327.323 → 289.044 (-11.7%) |
| `exp/0.3/bits2000` | goal | 5.5 → 5.5 (0%) | 1.21 → 1.19 (-2.2%) | 4.112 → 4.102 (-0.2%) |
|  | proof | 61.73 → 61.74 (0%) | 12.04 → 9.73 (-19.2%) | ✅ 76.618 → 50.772 (-33.7%) |
|  | kernel | 🟥 338.59 → 349.14 (+3.1%) | 45.46 → 42.55 (-6.4%) | ✅ 234.517 → 225.286 (-3.9%) |
|  | total | 🟥 405.82 → 416.38 (+2.6%) | 58.67 → 53.49 (-8.8%) | ✅ 315.258 → 280.154 (-11.1%) |

Raw output: [base](base/Interval.txt), [head](head/Interval.txt).
