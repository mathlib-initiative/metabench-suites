/-
Run from the root of this repository with:

  METABENCH=<harness checkout> ./bench-run.sh <mathlib-checkout> suites/Det.lean
-/
module

import Mathlib.Tactic.NormDet
import Matrix.Int
import Matrix.Rat
import Matrix.Symbolic
import MetaBench

#benchmark "eval_det/int/2" in example :
    (int_full_rank_2! : Matrix (Fin 2) (Fin 2) ℤ).det = -26 := by
  eval_det

#benchmark "eval_det/int/3" in example :
    (int_full_rank_3! : Matrix (Fin 3) (Fin 3) ℤ).det = -86 := by
  eval_det

#benchmark "eval_det/int/4" in example :
    (int_full_rank_4! : Matrix (Fin 4) (Fin 4) ℤ).det = -801 := by
  eval_det

#benchmark "eval_det/int/5" in example :
    (int_full_rank_5! : Matrix (Fin 5) (Fin 5) ℤ).det = -2688 := by
  eval_det

#benchmark "eval_det/int/6" in example :
    (int_full_rank_6! : Matrix (Fin 6) (Fin 6) ℤ).det = 1041909 := by
  eval_det

#benchmark "eval_det/int/cartan8" in example :
    (int_cartan_8! : Matrix (Fin 8) (Fin 8) ℤ).det = 1 := by
  eval_det

#benchmark "eval_det/int/8" in example :
    (int_full_rank_8! : Matrix (Fin 8) (Fin 8) ℤ).det = -13461368 := by
  eval_det

#benchmark "eval_det/int/10" in example :
    (int_full_rank_10! : Matrix (Fin 10) (Fin 10) ℤ).det = 13336170446 := by
  eval_det

#benchmark "eval_det/int/12" in example :
    (int_full_rank_12! : Matrix (Fin 12) (Fin 12) ℤ).det = 351393385384 := by
  eval_det

#benchmark "eval_det/rat/3" in example :
    (rat_full_rank_3! : Matrix (Fin 3) (Fin 3) ℚ).det = _ := by
  eval_det
  rfl

#benchmark "eval_det/rat/4" in example :
    (rat_full_rank_4! : Matrix (Fin 4) (Fin 4) ℚ).det = _ := by
  eval_det
  rfl

#benchmark "eval_det/sym/2" in example (R : Type*) [CommRing R] (a b c d : R) :
    (sym_generic_2! a b c d).det = a * d - b * c := by
  eval_det
  ring1

#benchmark "eval_det/sym/4" in example (R : Type*) [CommRing R] (a b c d e f g h i j k l m n o p : R) :
    (sym_generic_4! a b c d e f g h i j k l m n o p : Matrix (Fin 4) (Fin 4) R).det =
      a * f * k * p - a * f * l * o - a * g * j * p + a * g * l * n + a * h *
        j * o - a * h * k * n - b * e * k * p + b * e * l * o + b * g * i * p
        - b * g * l * m - b * h * i * o + b * h * k * m + c * e * j * p - c *
        e * l * n - c * f * i * p + c * f * l * m + c * h * i * n - c * h * j
        * m - d * e * j * o + d * e * k * n + d * f * i * o - d * f * k * m -
        d * g * i * n + d * g * j * m := by
  eval_det
  ring1

#benchmark "eval_det/sym/5" in example (R : Type*) [CommRing R] (x00 x01 x02 x03 x04 x10 x11 x12 x13 x14 x20 x21 x22 x23 x24 x30 x31 x32 x33 x34 x40 x41 x42 x43 x44 : R) :
    (sym_generic_5! x00 x01 x02 x03 x04 x10 x11 x12 x13 x14 x20 x21 x22 x23 x24
        x30 x31 x32 x33 x34 x40 x41 x42 x43 x44 : Matrix (Fin 5) (Fin 5) R).det =
      x00 * x11 * x22 * x33 * x44 - x00 * x11 * x22 * x34 * x43 - x00 * x11 * x23 * x32 *
        x44 + x00 * x11 * x23 * x34 * x42 + x00 * x11 * x24 * x32 * x43 - x00 * x11 * x24
        * x33 * x42 - x00 * x12 * x21 * x33 * x44 + x00 * x12 * x21 * x34 * x43 + x00 *
        x12 * x23 * x31 * x44 - x00 * x12 * x23 * x34 * x41 - x00 * x12 * x24 * x31 * x43
        + x00 * x12 * x24 * x33 * x41 + x00 * x13 * x21 * x32 * x44 - x00 * x13 * x21 *
        x34 * x42 - x00 * x13 * x22 * x31 * x44 + x00 * x13 * x22 * x34 * x41 + x00 * x13
        * x24 * x31 * x42 - x00 * x13 * x24 * x32 * x41 - x00 * x14 * x21 * x32 * x43 +
        x00 * x14 * x21 * x33 * x42 + x00 * x14 * x22 * x31 * x43 - x00 * x14 * x22 * x33
        * x41 - x00 * x14 * x23 * x31 * x42 + x00 * x14 * x23 * x32 * x41 - x01 * x10 *
        x22 * x33 * x44 + x01 * x10 * x22 * x34 * x43 + x01 * x10 * x23 * x32 * x44 - x01
        * x10 * x23 * x34 * x42 - x01 * x10 * x24 * x32 * x43 + x01 * x10 * x24 * x33 *
        x42 + x01 * x12 * x20 * x33 * x44 - x01 * x12 * x20 * x34 * x43 - x01 * x12 * x23
        * x30 * x44 + x01 * x12 * x23 * x34 * x40 + x01 * x12 * x24 * x30 * x43 - x01 *
        x12 * x24 * x33 * x40 - x01 * x13 * x20 * x32 * x44 + x01 * x13 * x20 * x34 * x42
        + x01 * x13 * x22 * x30 * x44 - x01 * x13 * x22 * x34 * x40 - x01 * x13 * x24 *
        x30 * x42 + x01 * x13 * x24 * x32 * x40 + x01 * x14 * x20 * x32 * x43 - x01 * x14
        * x20 * x33 * x42 - x01 * x14 * x22 * x30 * x43 + x01 * x14 * x22 * x33 * x40 +
        x01 * x14 * x23 * x30 * x42 - x01 * x14 * x23 * x32 * x40 + x02 * x10 * x21 * x33
        * x44 - x02 * x10 * x21 * x34 * x43 - x02 * x10 * x23 * x31 * x44 + x02 * x10 *
        x23 * x34 * x41 + x02 * x10 * x24 * x31 * x43 - x02 * x10 * x24 * x33 * x41 - x02
        * x11 * x20 * x33 * x44 + x02 * x11 * x20 * x34 * x43 + x02 * x11 * x23 * x30 *
        x44 - x02 * x11 * x23 * x34 * x40 - x02 * x11 * x24 * x30 * x43 + x02 * x11 * x24
        * x33 * x40 + x02 * x13 * x20 * x31 * x44 - x02 * x13 * x20 * x34 * x41 - x02 *
        x13 * x21 * x30 * x44 + x02 * x13 * x21 * x34 * x40 + x02 * x13 * x24 * x30 * x41
        - x02 * x13 * x24 * x31 * x40 - x02 * x14 * x20 * x31 * x43 + x02 * x14 * x20 *
        x33 * x41 + x02 * x14 * x21 * x30 * x43 - x02 * x14 * x21 * x33 * x40 - x02 * x14
        * x23 * x30 * x41 + x02 * x14 * x23 * x31 * x40 - x03 * x10 * x21 * x32 * x44 +
        x03 * x10 * x21 * x34 * x42 + x03 * x10 * x22 * x31 * x44 - x03 * x10 * x22 * x34
        * x41 - x03 * x10 * x24 * x31 * x42 + x03 * x10 * x24 * x32 * x41 + x03 * x11 *
        x20 * x32 * x44 - x03 * x11 * x20 * x34 * x42 - x03 * x11 * x22 * x30 * x44 + x03
        * x11 * x22 * x34 * x40 + x03 * x11 * x24 * x30 * x42 - x03 * x11 * x24 * x32 *
        x40 - x03 * x12 * x20 * x31 * x44 + x03 * x12 * x20 * x34 * x41 + x03 * x12 * x21
        * x30 * x44 - x03 * x12 * x21 * x34 * x40 - x03 * x12 * x24 * x30 * x41 + x03 *
        x12 * x24 * x31 * x40 + x03 * x14 * x20 * x31 * x42 - x03 * x14 * x20 * x32 * x41
        - x03 * x14 * x21 * x30 * x42 + x03 * x14 * x21 * x32 * x40 + x03 * x14 * x22 *
        x30 * x41 - x03 * x14 * x22 * x31 * x40 + x04 * x10 * x21 * x32 * x43 - x04 * x10
        * x21 * x33 * x42 - x04 * x10 * x22 * x31 * x43 + x04 * x10 * x22 * x33 * x41 +
        x04 * x10 * x23 * x31 * x42 - x04 * x10 * x23 * x32 * x41 - x04 * x11 * x20 * x32
        * x43 + x04 * x11 * x20 * x33 * x42 + x04 * x11 * x22 * x30 * x43 - x04 * x11 *
        x22 * x33 * x40 - x04 * x11 * x23 * x30 * x42 + x04 * x11 * x23 * x32 * x40 + x04
        * x12 * x20 * x31 * x43 - x04 * x12 * x20 * x33 * x41 - x04 * x12 * x21 * x30 *
        x43 + x04 * x12 * x21 * x33 * x40 + x04 * x12 * x23 * x30 * x41 - x04 * x12 * x23
        * x31 * x40 - x04 * x13 * x20 * x31 * x42 + x04 * x13 * x20 * x32 * x41 + x04 *
        x13 * x21 * x30 * x42 - x04 * x13 * x21 * x32 * x40 - x04 * x13 * x22 * x30 * x41
        + x04 * x13 * x22 * x31 * x40 := by
  eval_det
  ring1

#benchmark "eval_det/sym/sylvester7" in example (R : Type*) [CommRing R] (a b c d e : R) :
    (sym_sylvester_7! a b c d e : Matrix (Fin 7) (Fin 7) R).det =
      a * (256 * a ^ 3 * e ^ 3 - 192 * a ^ 2 * b * d * e ^ 2
        - 128 * a ^ 2 * c ^ 2 * e ^ 2 + 144 * a ^ 2 * c * d ^ 2 * e
        - 27 * a ^ 2 * d ^ 4 + 144 * a * b ^ 2 * c * e ^ 2
        - 6 * a * b ^ 2 * d ^ 2 * e - 80 * a * b * c ^ 2 * d * e
        + 18 * a * b * c * d ^ 3 + 16 * a * c ^ 4 * e
        - 4 * a * c ^ 3 * d ^ 2 - 27 * b ^ 4 * e ^ 2
        + 18 * b ^ 3 * c * d * e - 4 * b ^ 3 * d ^ 3
        - 4 * b ^ 2 * c ^ 3 * e + b ^ 2 * c ^ 2 * d ^ 2) := by
  eval_det
  ring1
