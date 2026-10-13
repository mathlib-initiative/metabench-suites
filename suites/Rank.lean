/-
Run from the root of this repository with:

  METABENCH=<harness checkout> ./bench-run.sh <mathlib-checkout> suites/Rank.lean
-/
module

import Mathlib.Tactic.NormRank
import MetaBench
import SharedMatrices

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

#benchmark "rank/deficient/10" in example :
    (int_rank5_10! : Matrix (Fin 10) (Fin 10) ℤ).rank = 5 := by
  eval_rank

#benchmark "rank/deficient/12" in example :
    (int_rank6_12! : Matrix (Fin 12) (Fin 12) ℤ).rank = 6 := by
  eval_rank
