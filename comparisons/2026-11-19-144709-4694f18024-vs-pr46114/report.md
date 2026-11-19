# Interval: #46114 against its merge base

| | base | head |
|---|---|---|
| Mathlib | leanprover-community/mathlib4, merge base with master | raoxiaojia/mathlib4@interval-exp-adaptive-squaring |
| Commit | [`4694f18024`](https://github.com/leanprover-community/mathlib4/commit/4694f18024a16d41993787c8f5e0e905a729f904) | [`59b1cb4d44`](https://github.com/raoxiaojia/mathlib4/commit/59b1cb4d44e744d71f93b1f17fd304be8d90f40a) |
| Lean | leanprover/lean4:v4.36.0 | leanprover/lean4:v4.36.0 |

- PR: [#46114 feat(Tactic/Inclusion/Exp): add adaptive squaring for argument reduction of `exp`](https://github.com/leanprover-community/mathlib4/pull/46114)
- Interval: 5 benchmarks on base, 5 on head.
- MetaBench commit `441aac67f0`, options `-Dbench.proofHeads=5 -Dbench.kernelUnfolds=5`.
- Runner: aarch64, Neoverse-N2. Base ran first, then head, in one job on 2026-11-19 14:47 UTC.

## Interval

Medians, base → head. 🟥 and ✅ mark a heartbeat or instruction count that changed by at least 2% and whose samples on the two sides do not overlap.

| benchmark | phase | kHB | ms | Minstr |
|---|---|---|---|---|
| `exp/1/bits100` | goal | 5.68 → 5.68 (0%) | 0.64 → 0.7 (+10.3%) | 1.643 → 1.642 (0%) |
|  | proof | 91.8 → 92.25 (+0.5%) | 7.19 → 7.35 (+2.2%) | 29.947 → 30.412 (+1.6%) |
|  | kernel | 🟥 57.69 → 130.91 (+126.9%) | 7.18 → 17.28 (+140.7%) | 🟥 44.806 → 102.829 (+129.5%) |
|  | total | 🟥 155.16 → 228.84 (+47.5%) | 15.02 → 25.33 (+68.7%) | 🟥 76.41 → 134.9 (+76.5%) |
| `exp/1/bits1000` | goal | 6.47 → 6.47 (0%) | 0.79 → 0.91 (+14.1%) | 2.954 → 2.986 (+1.1%) |
|  | proof | 87.31 → 88.39 (+1.2%) | 7.38 → 7.66 (+3.8%) | ✅ 33.681 → 31.045 (-7.8%) |
|  | kernel | 🟥 197.05 → 339.97 (+72.5%) | 22.06 → 45.99 (+108.5%) | 🟥 149.463 → 267.673 (+79.1%) |
|  | total | 🟥 290.82 → 434.83 (+49.5%) | 30.2 → 54.56 (+80.7%) | 🟥 186.07 → 301.718 (+62.2%) |
| `exp/1/bits10000` | goal | 14.61 → 14.61 (0%) | 2.95 → 2.92 (-0.8%) | 22.336 → 22.397 (+0.3%) |
|  | proof | 93.99 → 92.53 (-1.5%) | 17.99 → 12.65 (-29.7%) | ✅ 128.82 → 75.648 (-41.3%) |
|  | kernel | ✅ 1632.36 → 1056.76 (-35.3%) | 190.35 → 147.14 (-22.7%) | ✅ 1245.172 → 848.497 (-31.9%) |
|  | total | ✅ 1740.94 → 1163.89 (-33.1%) | 211.13 → 162.94 (-22.8%) | ✅ 1396.376 → 946.969 (-32.2%) |
| `exp/10.1/bits2000` | goal | 6.23 → 6.23 (0%) | 1.19 → 0.97 (-18.3%) | 4.273 → 4.275 (0%) |
|  | proof | 68.05 → 67.29 (-1.1%) | 464.05 → 11.51 (-97.5%) | ✅ 5170.52 → 85.17 (-98.4%) |
|  | kernel | 🟥 363.97 → 493.85 (+35.7%) | 283.29 → 69.6 (-75.4%) | ✅ 2835.143 → 418.572 (-85.2%) |
|  | total | 🟥 438.25 → 567.37 (+29.5%) | 748.52 → 82.07 (-89%) | ✅ 8009.941 → 508.008 (-93.7%) |
| `exp/0.3/bits2000` | goal | 6.22 → 6.22 (0%) | 1.16 → 0.88 (-24%) | 4.257 → 4.251 (-0.2%) |
|  | proof | 68.02 → 67.23 (-1.2%) | 437.73 → 10.78 (-97.5%) | ✅ 4865.427 → 79.785 (-98.4%) |
|  | kernel | 🟥 358.89 → 443.06 (+23.5%) | 278.1 → 62.85 (-77.4%) | ✅ 2689.228 → 375.029 (-86.1%) |
|  | total | 🟥 433.15 → 516.52 (+19.2%) | 717.71 → 74.6 (-89.6%) | ✅ 7558.91 → 459.059 (-93.9%) |

Raw output: [base](base/Interval.txt), [head](head/Interval.txt).
