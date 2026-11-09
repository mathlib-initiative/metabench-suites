/-
Run from the root of this repository with:

  METABENCH=<harness checkout> ./bench-run.sh <mathlib-checkout> suites/Primality.lean
-/
module

import Mathlib.Tactic.NormNum.Pow
import Mathlib.Tactic.Primality
import MetaBench

#benchmark "primality/curve25519-p" in example :
    Nat.Prime (2 ^ 255 - 19) := by
  primality (cert := .witnesses [
    .lucas { root := 2, primeFactors := [2, 3, 65147, 74058212732561358302231226437062788676166966415465897661863160754340907] },
    .lucas { root := 2, primeFactors := [2, 3, 353, 57467, 132049, 1923133, 31757755568855353, 75445702479781427272750846543864801] },
    .lucas { root := 7, primeFactors := [2, 3, 5, 75707, 72106336199, 1919519569386763] },
    .lucas { root := 10, primeFactors := [2, 3, 31, 107, 223, 4153, 430751] },
    .lucas { root := 2, primeFactors := [2, 3, 7, 19, 47, 127, 8574133] },
    .lucas { root := 7, primeFactors := [2, 13, 2773320623] },
    .lucas { root := 5, primeFactors := [2, 2437, 569003] },
    .lucas { root := 2, primeFactors := [2, 3, 7, 103, 991] },
    .lucas { root := 2, primeFactors := [2, 3, 43, 3727] },
    .lucas { root := 2, primeFactors := [2, 7, 97, 419] },
    .lucas { root := 17, primeFactors := [2, 5, 1723] },
    .lucas { root := 26, primeFactors := [2, 3, 7, 131] },
    .lucas { root := 2, primeFactors := [2, 37853] },
    .lucas { root := 2, primeFactors := [2, 32573] },
    .lucas { root := 2, primeFactors := [2, 59, 487] },
    .lucas { root := 2, primeFactors := [2, 9463] },
    .lucas { root := 2, primeFactors := [2, 17, 479] },
    .lucas { root := 3, primeFactors := [2, 3, 19, 83] },
    .lucas { root := 5, primeFactors := [2, 3, 173] },
    .lucas { root := 3, primeFactors := [2, 3, 23] },
    .lucas { root := 2, primeFactors := [2, 3, 7, 29] },
    .lucas { root := 3, primeFactors := [2, 3, 7, 41] }])

set_option exponentiation.threshold 384 in
#benchmark "primality/p384-p" in example :
    Nat.Prime (2 ^ 384 - 2 ^ 128 - 2 ^ 96 + 2 ^ 32 - 1) := by
  primality (cert := .witnesses [
    .lucas { root := 19, primeFactors := [2, 19, 67, 807145746439, 19173790298027098165721053155794528970226934547887232785722672956982046098136719667167519737147526097] },
    .lucas { root := 3, primeFactors := [2, 11, 8389, 38557, 312289, 1357291859799823621, 529709925838459440593, 12397338596863679689524759770405177749801411] },
    .lucas { root := 2, primeFactors := [2, 3, 5, 413244619895455989650825325680172591660047] },
    .lucas { root := 5, primeFactors := [2, 17, 97, 6051631, 20705423504133292078628634597817] },
    .lucas { root := 5, primeFactors := [2, 3, 862725979338887169942859774909] },
    .lucas { root := 2, primeFactors := [2, 3, 23964610537191310276190549303] },
    .lucas { root := 5, primeFactors := [2, 336757, 35581458644053887931343] },
    .lucas { root := 5, primeFactors := [2, 17, 41, 568151, 44925942675193] },
    .lucas { root := 3, primeFactors := [2, 7, 181, 105957871, 246608641] },
    .lucas { root := 2, primeFactors := [2, 3, 5, 67, 6317, 53448597593] },
    .lucas { root := 5, primeFactors := [2, 3, 3517, 532247449] },
    .lucas { root := 3, primeFactors := [2, 3, 47, 2862218959] },
    .lucas { root := 3, primeFactors := [2, 13, 513928823] },
    .lucas { root := 3, primeFactors := [2, 3, 157, 1373, 2213] },
    .lucas { root := 7, primeFactors := [2, 3, 61, 363557] },
    .lucas { root := 5, primeFactors := [2, 11, 59, 599, 661] },
    .lucas { root := 19, primeFactors := [2, 3, 5, 21407] },
    .lucas { root := 3, primeFactors := [2, 3, 5, 19, 211, 881] },
    .lucas { root := 6, primeFactors := [2, 3, 5, 13, 59, 263] },
    .lucas { root := 17, primeFactors := [2, 5, 11, 1033] },
    .lucas { root := 2, primeFactors := [2, 97, 937] },
    .lucas { root := 2, primeFactors := [2, 3, 7, 19, 211] },
    .lucas { root := 14, primeFactors := [2, 3, 3253] },
    .lucas { root := 2, primeFactors := [2, 3, 7, 17] },
    .lucas { root := 5, primeFactors := [2, 7, 11, 139] },
    .lucas { root := 6, primeFactors := [2, 3, 233] },
    .lucas { root := 2, primeFactors := [2, 1579] },
    .lucas { root := 2, primeFactors := [2, 3, 293] },
    .lucas { root := 2, primeFactors := [2, 3, 271] },
    .lucas { root := 2, primeFactors := [2, 7, 79] },
    .lucas { root := 3, primeFactors := [2, 3, 263] },
    .lucas { root := 2, primeFactors := [2, 7] },
    .lucas { root := 5, primeFactors := [2, 3, 43] }])

set_option exponentiation.threshold 521 in
#benchmark "primality/m521" in example :
    Nat.Prime (2 ^ 521 - 1) := by
  primality (cert := .witnesses [
    .lucas { root := 3, primeFactors := [2, 3, 5, 11, 17, 31, 41, 53, 131, 157, 521, 1613, 2731, 8191, 42641, 51481, 61681, 409891, 858001, 5746001, 7623851, 34110701, 308761441, 2400573761, 65427463921, 108140989558681, 145295143558111, 173308343918874810521923841] },
    .lucas { root := 3, primeFactors := [2, 5, 13, 28793, 361725589517273017] },
    .lucas { root := 17, primeFactors := [2, 3, 7, 3191, 674750394557] },
    .lucas { root := 7, primeFactors := [2, 3, 5, 7, 13, 2534364967] },
    .lucas { root := 17, primeFactors := [2, 3, 5, 13, 683, 1433, 23609] },
    .lucas { root := 2, primeFactors := [2, 7, 24098228377] },
    .lucas { root := 17, primeFactors := [2, 3, 5, 7, 13, 2995763] },
    .lucas { root := 7, primeFactors := [2, 3, 109, 9211861] },
    .lucas { root := 3, primeFactors := [2, 3, 7, 8620289] },
    .lucas { root := 3, primeFactors := [2, 5, 13, 347, 1663] },
    .lucas { root := 17, primeFactors := [2, 3, 5, 13, 49481] },
    .lucas { root := 15, primeFactors := [2, 5, 13, 19, 1381] },
    .lucas { root := 2, primeFactors := [2, 3, 5, 7, 2437] },
    .lucas { root := 3, primeFactors := [2, 151, 223] },
    .lucas { root := 6, primeFactors := [2, 5, 13, 37, 317] },
    .lucas { root := 15, primeFactors := [2, 5, 13, 17] },
    .lucas { root := 2, primeFactors := [2, 7, 11, 397] },
    .lucas { root := 17, primeFactors := [2, 3, 5, 11, 13] },
    .lucas { root := 14, primeFactors := [2, 3, 5, 13, 1051] },
    .lucas { root := 29, primeFactors := [2, 3, 5, 257] },
    .lucas { root := 17, primeFactors := [2, 3, 5, 11, 13] },
    .lucas { root := 3, primeFactors := [2, 5, 1237] },
    .lucas { root := 3, primeFactors := [2, 5, 13, 41] },
    .lucas { root := 3, primeFactors := [2, 59, 61] },
    .lucas { root := 6, primeFactors := [2, 13, 227] },
    .lucas { root := 17, primeFactors := [2, 3, 5, 7, 13] },
    .lucas { root := 11, primeFactors := [2, 5, 11, 29] },
    .lucas { root := 3, primeFactors := [2, 3, 5, 7, 13] },
    .lucas { root := 2, primeFactors := [2, 3, 7, 29] },
    .lucas { root := 3, primeFactors := [2, 3, 277] },
    .lucas { root := 3, primeFactors := [2, 13, 31] },
    .lucas { root := 3, primeFactors := [2, 179] },
    .lucas { root := 2, primeFactors := [2, 3, 5, 23] },
    .lucas { root := 2, primeFactors := [2, 3, 103] },
    .lucas { root := 7, primeFactors := [2, 3, 5, 7] }])

#benchmark "primality/factorial-154" in example :
    Nat.Prime 30897696138473508879585646703632404659201907040888820477871589289865505687886666220300447285640952619071680544337494109264649994680187591361311072737951454695525676891035640863743200899694758450943586711068571022031011228320107310612480000000000000000000000000000000000001 := by
  primality (cert := .witnesses [
    .lucas { root := 163, primeFactors := [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151] }])

set_option exponentiation.threshold 512 in
#benchmark "primality/gf-46-512" in example :
    Nat.Prime (46 ^ 512 + 1) := by
  primality (cert := .witnesses [
    .lucas { root := 3, primeFactors := [2, 23] }])

set_option exponentiation.threshold 5947 in
#benchmark "primality/proth-5-5947" in example :
    Nat.Prime (5 * 2 ^ 5947 + 1) := by
  primality (cert := .witnesses [
    .lucas { root := 3, primeFactors := [2, 5] }])
