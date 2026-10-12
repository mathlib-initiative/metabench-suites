# MetaBench suites

Benchmark suites for Mathlib tactics, run with [MetaBench](https://github.com/mathlib-initiative/MetaBench).

Each suite is one file of `#benchmark` declarations, `suites/<Name>/<Name>.lean`.

## Running a suite

You need:
* A checkout of MetaBench
* And a Mathlib checkout that has modules the suite imports prebuilt
* Both MetaBench and Mathlib using the same Lean toolchain.

```
METABENCH=<metabench-checkout> ./bench-run.sh <mathlib-checkout> suites/Rank/Rank.lean
```

Arguments after the suite go to `lean`, this can be used to set `bench.*` options for example:

```
METABENCH=<metabench-checkout> ./bench-run.sh <mathlib-checkout> suites/Rank/Rank.lean -Dbench.kernelUnfolds=5 -Dbench.proofHeads=5
```

The output format is described in the MetaBench README.
