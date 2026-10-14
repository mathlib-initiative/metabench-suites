module

public import Mathlib.LinearAlgebra.Matrix.Notation

/-!
# Adversarial matrices

Matrices whose certificates degrade the kernel's expression caches, for benchmarking how a
tactic's kernel check copes with hash collisions.

The kernel uses mod `2^64` for hashing `Nat` literals (`Hashable Nat` is `UInt64.ofNat`). All
multiples of `2^64` therefore share one hash, so terms that only differ by such literals fall
into one bucket, causing performance degradation.

`int_shift65536_12!` is `(i+1)(j+1) + 2^16 * [i = j]`. Each step of fraction-free elimination
adds 16 factors of 2 to all its values, so from the fourth step on every value is a multiple of
`2^64`. Bird's division-free determinant produces such values as well. `int_shift65535_12!` and
`int_shift65537_12!` differ only in the shift, and none of the intermediate values is a multiple
of `2^64`.
-/

macro "int_shift65535_12!" : term => `(
  !![65536,     2,     3,     4,     5,     6,     7,     8,     9,    10,    11,    12;
         2, 65539,     6,     8,    10,    12,    14,    16,    18,    20,    22,    24;
         3,     6, 65544,    12,    15,    18,    21,    24,    27,    30,    33,    36;
         4,     8,    12, 65551,    20,    24,    28,    32,    36,    40,    44,    48;
         5,    10,    15,    20, 65560,    30,    35,    40,    45,    50,    55,    60;
         6,    12,    18,    24,    30, 65571,    42,    48,    54,    60,    66,    72;
         7,    14,    21,    28,    35,    42, 65584,    56,    63,    70,    77,    84;
         8,    16,    24,    32,    40,    48,    56, 65599,    72,    80,    88,    96;
         9,    18,    27,    36,    45,    54,    63,    72, 65616,    90,    99,   108;
        10,    20,    30,    40,    50,    60,    70,    80,    90, 65635,   110,   120;
        11,    22,    33,    44,    55,    66,    77,    88,    99,   110, 65656,   132;
        12,    24,    36,    48,    60,    72,    84,    96,   108,   120,   132, 65679])

macro "int_shift65536_12!" : term => `(
  !![65537,     2,     3,     4,     5,     6,     7,     8,     9,    10,    11,    12;
         2, 65540,     6,     8,    10,    12,    14,    16,    18,    20,    22,    24;
         3,     6, 65545,    12,    15,    18,    21,    24,    27,    30,    33,    36;
         4,     8,    12, 65552,    20,    24,    28,    32,    36,    40,    44,    48;
         5,    10,    15,    20, 65561,    30,    35,    40,    45,    50,    55,    60;
         6,    12,    18,    24,    30, 65572,    42,    48,    54,    60,    66,    72;
         7,    14,    21,    28,    35,    42, 65585,    56,    63,    70,    77,    84;
         8,    16,    24,    32,    40,    48,    56, 65600,    72,    80,    88,    96;
         9,    18,    27,    36,    45,    54,    63,    72, 65617,    90,    99,   108;
        10,    20,    30,    40,    50,    60,    70,    80,    90, 65636,   110,   120;
        11,    22,    33,    44,    55,    66,    77,    88,    99,   110, 65657,   132;
        12,    24,    36,    48,    60,    72,    84,    96,   108,   120,   132, 65680])

macro "int_shift65537_12!" : term => `(
  !![65538,     2,     3,     4,     5,     6,     7,     8,     9,    10,    11,    12;
         2, 65541,     6,     8,    10,    12,    14,    16,    18,    20,    22,    24;
         3,     6, 65546,    12,    15,    18,    21,    24,    27,    30,    33,    36;
         4,     8,    12, 65553,    20,    24,    28,    32,    36,    40,    44,    48;
         5,    10,    15,    20, 65562,    30,    35,    40,    45,    50,    55,    60;
         6,    12,    18,    24,    30, 65573,    42,    48,    54,    60,    66,    72;
         7,    14,    21,    28,    35,    42, 65586,    56,    63,    70,    77,    84;
         8,    16,    24,    32,    40,    48,    56, 65601,    72,    80,    88,    96;
         9,    18,    27,    36,    45,    54,    63,    72, 65618,    90,    99,   108;
        10,    20,    30,    40,    50,    60,    70,    80,    90, 65637,   110,   120;
        11,    22,    33,    44,    55,    66,    77,    88,    99,   110, 65658,   132;
        12,    24,    36,    48,    60,    72,    84,    96,   108,   120,   132, 65681])
