/-
Benchmark the `real_root_count` tactic (kernel-checked Sturm sequence certificate).

Run from the root of this repository with:

  METABENCH=<harness checkout> ./bench-run.sh <mathlib-checkout> suites/RealRootCount.lean
-/
-- MetaBench CI exclude: #43512
module

import Mathlib.Tactic.RealRootCount
import MetaBench

open Polynomial

#benchmark "rootcount/sparse/10" in
example : Fintype.card ((X ^ 10 - 7 * X ^ 7 + 3 * X ^ 4 - X ^ 3 + 5 * X - 2 : ℚ[X]).rootSet ℝ) =
    4 := by
  real_root_count

#benchmark "rootcount/sparse/20" in
example : Fintype.card ((X ^ 20 - 3 * X ^ 17 + 7 * X ^ 11 - X ^ 6 + 2 * X - 1 : ℚ[X]).rootSet ℝ) =
    2 := by
  real_root_count

#benchmark "rootcount/sparse/30" in
example : Fintype.card ((X ^ 30 - 5 * X ^ 23 + 2 * X ^ 19 - 11 * X ^ 12 + 3 * X ^ 7 - X ^ 2 +
    4 * X - 1 : ℚ[X]).rootSet ℝ) = 4 := by
  real_root_count

#benchmark "rootcount/sparse/40" in
example : Fintype.card ((X ^ 40 - 5 * X ^ 33 + 2 * X ^ 27 - 11 * X ^ 18 + 3 * X ^ 9 - X ^ 2 +
    4 * X - 1 : ℚ[X]).rootSet ℝ) = 4 := by
  real_root_count

#benchmark "rootcount/factors/3" in
example : Fintype.card (((X - 1) * (X - 2) * (X - 3) : ℚ[X]).rootSet ℝ) = 3 := by
  real_root_count

#benchmark "rootcount/factors/6" in
example : Fintype.card (((X - 1) * (X - 2) * (X - 3) * (X - 4) * (X - 5) * (X - 6) : ℚ[X]).rootSet
    ℝ) = 6 := by
  real_root_count

#benchmark "rootcount/factors/9" in
example : Fintype.card (((X - 1) * (X - 2) * (X - 3) * (X - 4) * (X - 5) * (X - 6) * (X - 7) *
    (X - 8) * (X - 9) : ℚ[X]).rootSet ℝ) = 9 := by
  real_root_count

#benchmark "rootcount/factors/12" in
example : Fintype.card (((X - 1) * (X - 2) * (X - 3) * (X - 4) * (X - 5) * (X - 6) * (X - 7) *
    (X - 8) * (X - 9) * (X - 10) * (X - 11) * (X - 12) : ℚ[X]).rootSet ℝ) = 12 := by
  real_root_count

#benchmark "rootcount/small/5" in
example : Fintype.card ((X ^ 5 - 4 * X + 2 : ℚ[X]).rootSet ℝ) = 3 := by
  real_root_count

#benchmark "rootcount/small/8" in
example : Fintype.card ((X ^ 8 - 3 * X ^ 5 + 2 * X ^ 3 - X + 1 : ℚ[X]).rootSet ℝ) = 2 := by
  real_root_count

#benchmark "rootcount/small/15" in
example : Fintype.card ((X ^ 15 + 5 * X ^ 13 - 2 * X ^ 8 + 4 * X ^ 6 + X ^ 3 - 7 * X ^ 2 + 3 :
    ℚ[X]).rootSet ℝ) = 1 := by
  real_root_count

#benchmark "rootcount/repeated/7" in
example : Fintype.card (((X - 1) ^ 2 * (X + 2) ^ 3 * (X ^ 2 + 1) : ℚ[X]).rootSet ℝ) = 2 := by
  real_root_count

#benchmark "rootcount/rational/4" in
example : Fintype.card ((X ^ 4 - C (5 / 2) * X ^ 2 + C (1 / 2) : ℚ[X]).rootSet ℝ) = 4 := by
  real_root_count

#benchmark "rootcount/int/2" in
example : Fintype.card ((X ^ 2 - 2 : ℤ[X]).rootSet ℝ) = 2 := by
  real_root_count

#benchmark "rootcount/sparse/60" in
example : Fintype.card ((X ^ 60 - 5 * X ^ 47 + 2 * X ^ 31 - 11 * X ^ 22 + 3 * X ^ 9 - X ^ 2 +
    4 * X - 1 : ℚ[X]).rootSet ℝ) = 4 := by
  real_root_count

#benchmark "rootcount/sparse/80" in
example : Fintype.card ((X ^ 80 - 5 * X ^ 63 + 2 * X ^ 41 - 11 * X ^ 22 + 3 * X ^ 9 - X ^ 2 +
    4 * X - 1 : ℚ[X]).rootSet ℝ) = 4 := by
  real_root_count

#benchmark "rootcount/sparse/100" in
example : Fintype.card ((X ^ 100 - 5 * X ^ 77 + 2 * X ^ 53 - 11 * X ^ 31 + 3 * X ^ 12 - X ^ 2 +
    4 * X - 1 : ℚ[X]).rootSet ℝ) = 4 := by
  real_root_count
