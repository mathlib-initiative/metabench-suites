module

public import Mathlib.LinearAlgebra.Matrix.Notation

macro "sym_generic_2!" a:ident b:ident c:ident d:ident : term => `(
  !![$a, $b;
     $c, $d])

macro "sym_generic_4!"
    a:ident b:ident c:ident d:ident
    e:ident f:ident g:ident h:ident
    i:ident j:ident k:ident l:ident
    m:ident n:ident o:ident p:ident : term => `(
  !![$a, $b, $c, $d;
     $e, $f, $g, $h;
     $i, $j, $k, $l;
     $m, $n, $o, $p])

macro "sym_generic_5!"
    x00:ident x01:ident x02:ident x03:ident x04:ident
    x10:ident x11:ident x12:ident x13:ident x14:ident
    x20:ident x21:ident x22:ident x23:ident x24:ident
    x30:ident x31:ident x32:ident x33:ident x34:ident
    x40:ident x41:ident x42:ident x43:ident x44:ident : term => `(
  !![$x00, $x01, $x02, $x03, $x04;
     $x10, $x11, $x12, $x13, $x14;
     $x20, $x21, $x22, $x23, $x24;
     $x30, $x31, $x32, $x33, $x34;
     $x40, $x41, $x42, $x43, $x44])

macro "sym_sylvester_7!" a:ident b:ident c:ident d:ident e:ident : term => `(
  !![$a    , $b    , $c    , $d    , $e    , 0     , 0;
     0     , $a    , $b    , $c    , $d    , $e    , 0;
     0     , 0     , $a    , $b    , $c    , $d    , $e;
     4 * $a, 3 * $b, 2 * $c, $d    , 0     , 0     , 0;
     0     , 4 * $a, 3 * $b, 2 * $c, $d    , 0     , 0;
     0     , 0     , 4 * $a, 3 * $b, 2 * $c, $d    , 0;
     0     , 0     , 0     , 4 * $a, 3 * $b, 2 * $c, $d])
