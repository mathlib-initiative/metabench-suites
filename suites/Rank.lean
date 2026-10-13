/-
Run from the root of this repository with:

  METABENCH=<harness checkout> ./bench-run.sh <mathlib-checkout> suites/Rank.lean
-/
module

import Mathlib.Algebra.Field.ZMod
import Mathlib.Basic.Real.Basic
import Mathlib.NumberTheory.Zsqrtd.GaussianInt
import Mathlib.Tactic.Echelon.Zsqrtd
import Mathlib.Tactic.NormNum.NatSqrt
import Mathlib.Tactic.NormRank
import Matrix.Adversarial
import Matrix.Int
import Matrix.Rat
import Matrix.Real
import Matrix.Zmod
import Matrix.Zsqrtd
import MetaBench

instance : Fact (Nat.Prime 7) := ⟨by decide⟩

instance : Zsqrtd.Nonsquare 5 :=
  ⟨fun n h => by have := (Nat.exists_mul_self 5).mp ⟨n, h.symm⟩; norm_num at this⟩

instance : IsDomain (Zsqrtd 5) :=
  inferInstanceAs (IsDomain (Zsqrtd (5 : ℕ)))

#benchmark "rank/full/6" in example :
    (int_full_rank_6! : Matrix (Fin 6) (Fin 6) ℤ).rank = 6 := by
  eval_rank

#benchmark "rank/full/8" in example :
    (int_full_rank_8! : Matrix (Fin 8) (Fin 8) ℤ).rank = 8 := by
  eval_rank

#benchmark "rank/full/10" in example :
    (int_full_rank_10! : Matrix (Fin 10) (Fin 10) ℤ).rank = 10 := by
  eval_rank

#benchmark "rank/full/12" in example :
    (int_full_rank_12! : Matrix (Fin 12) (Fin 12) ℤ).rank = 12 := by
  eval_rank

#benchmark "rank/deficient/6" in example :
    (int_rank3_6! : Matrix (Fin 6) (Fin 6) ℤ).rank = 3 := by
  eval_rank

#benchmark "rank/deficient/10" in example :
    (int_rank5_10! : Matrix (Fin 10) (Fin 10) ℤ).rank = 5 := by
  eval_rank

#benchmark "rank/deficient/12" in example :
    (int_rank6_12! : Matrix (Fin 12) (Fin 12) ℤ).rank = 6 := by
  eval_rank

#benchmark "rank/rat/full/6" in example :
    (rat_full_rank_6! : Matrix (Fin 6) (Fin 6) ℚ).rank = 6 := by
  eval_rank

#benchmark "rank/rat/full/12" in example :
    (rat_full_rank_12! : Matrix (Fin 12) (Fin 12) ℚ).rank = 12 := by
  eval_rank

#benchmark "rank/rat/deficient/6" in example :
    (rat_rank3_6! : Matrix (Fin 6) (Fin 6) ℚ).rank = 3 := by
  eval_rank

#benchmark "rank/rat/deficient/12" in example :
    (rat_rank6_12! : Matrix (Fin 12) (Fin 12) ℚ).rank = 6 := by
  eval_rank

#benchmark "rank/real/full/6" in example :
    (real_full_rank_6! : Matrix (Fin 6) (Fin 6) ℝ).rank = 6 := by
  eval_rank

#benchmark "rank/real/full/12" in example :
    (real_full_rank_12! : Matrix (Fin 12) (Fin 12) ℝ).rank = 12 := by
  eval_rank

#benchmark "rank/real/deficient/6" in example :
    (real_rank3_6! : Matrix (Fin 6) (Fin 6) ℝ).rank = 3 := by
  eval_rank

#benchmark "rank/real/deficient/12" in example :
    (real_rank6_12! : Matrix (Fin 12) (Fin 12) ℝ).rank = 6 := by
  eval_rank

#benchmark "rank/zmod7/full/6" in example :
    (zmod7_full_rank_6! : Matrix (Fin 6) (Fin 6) (ZMod 7)).rank = 6 := by
  eval_rank

#benchmark "rank/zmod7/full/12" in example :
    (zmod7_full_rank_12! : Matrix (Fin 12) (Fin 12) (ZMod 7)).rank = 12 := by
  eval_rank

#benchmark "rank/zmod7/deficient/6" in example :
    (zmod7_rank3_6! : Matrix (Fin 6) (Fin 6) (ZMod 7)).rank = 3 := by
  eval_rank

#benchmark "rank/zmod7/deficient/12" in example :
    (zmod7_rank6_12! : Matrix (Fin 12) (Fin 12) (ZMod 7)).rank = 6 := by
  eval_rank

#benchmark "rank/zsqrtd_neg1/full/6" in example :
    (zsqrtd_neg1_full_rank_6! : Matrix (Fin 6) (Fin 6) GaussianInt).rank = 6 := by
  eval_rank

#benchmark "rank/zsqrtd_neg1/full/12" in example :
    (zsqrtd_neg1_full_rank_12! : Matrix (Fin 12) (Fin 12) GaussianInt).rank = 12 := by
  eval_rank

#benchmark "rank/zsqrtd_neg1/deficient/6" in example :
    (zsqrtd_neg1_rank3_6! : Matrix (Fin 6) (Fin 6) GaussianInt).rank = 3 := by
  eval_rank

#benchmark "rank/zsqrtd_neg1/deficient/12" in example :
    (zsqrtd_neg1_rank6_12! : Matrix (Fin 12) (Fin 12) GaussianInt).rank = 6 := by
  eval_rank

#benchmark "rank/zsqrtd_5/full/6" in example :
    (zsqrtd_5_full_rank_6! : Matrix (Fin 6) (Fin 6) (Zsqrtd 5)).rank = 6 := by
  eval_rank

#benchmark "rank/zsqrtd_5/full/12" in example :
    (zsqrtd_5_full_rank_12! : Matrix (Fin 12) (Fin 12) (Zsqrtd 5)).rank = 12 := by
  eval_rank

#benchmark "rank/zsqrtd_5/deficient/6" in example :
    (zsqrtd_5_rank3_6! : Matrix (Fin 6) (Fin 6) (Zsqrtd 5)).rank = 3 := by
  eval_rank

#benchmark "rank/zsqrtd_5/deficient/12" in example :
    (zsqrtd_5_rank6_12! : Matrix (Fin 12) (Fin 12) (Zsqrtd 5)).rank = 6 := by
  eval_rank

/-! ## Adversarial -/

#benchmark "rank/adversarial/shift65535/12" in example :
    (int_shift65535_12! : Matrix (Fin 12) (Fin 12) ℤ).rank = 12 := by
  eval_rank

#benchmark "rank/adversarial/shift65536/12" in example :
    (int_shift65536_12! : Matrix (Fin 12) (Fin 12) ℤ).rank = 12 := by
  eval_rank

#benchmark "rank/adversarial/shift65537/12" in example :
    (int_shift65537_12! : Matrix (Fin 12) (Fin 12) ℤ).rank = 12 := by
  eval_rank
