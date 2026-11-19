# MetaBench suites

Benchmark suites for Mathlib tactics, run with [MetaBench](https://github.com/mathlib-initiative/MetaBench).

Each suite is one file of `#benchmark` declarations, `suites/<Name>.lean`.

## Running a suite

You need:
* A checkout of MetaBench
* A Mathlib checkout that has modules the suite imports prebuilt
* Both MetaBench and Mathlib using the same Lean toolchain.
* A C compiler, available on the PATH as `cc`, which MetaBench uses to build its CPU instruction counter. On macOS, install the Xcode Command Line Tools:

  ```
  xcode-select --install
  ```

  On Debian or Ubuntu, install `build-essential`:

  ```
  sudo apt install build-essential
  ```

Then use the `bench-run.sh` script to run the benchmark:

```
METABENCH=<metabench-checkout> ./bench-run.sh <mathlib-checkout> suites/Rank.lean
```

Arguments after the suite go to `lean`, this can be used to set `bench.*` options for example:

```
METABENCH=<metabench-checkout> ./bench-run.sh <mathlib-checkout> suites/Rank.lean -Dbench.kernelUnfolds=5 -Dbench.proofHeads=5
```

The output format is described in the MetaBench README.

### Counting instructions

`./bench-run.sh` counts the CPU instructions of each phase. This works on macOS, and on Linux where the machine has a hardware instruction counter and `kernel.perf_event_paranoid` is 2 or lower.

On Debian you can set `kernel.perf_event_paranoid` using:
```
sudo sysctl kernel.perf_event_paranoid=2
```

Most virtual machines and containers have no counter, and a benchmark then fails saying so. To run
without counting, add `-Dbench.instructions=false`:

```
METABENCH=<metabench-checkout> ./bench-run.sh <mathlib-checkout> suites/Rank.lean -Dbench.instructions=false
```

## Shared modules

Lean modules intended to be shared between benchmark suites should be placed in `shared/`. The
`./bench-run.sh` script compiles the modules a suite imports against mathlib before running it.

## CI benchmark run

The [bench.yml](.github/workflows/bench.yml) workflow can be used to trigger CI runs of benchmarks
against a specified mathlib repository and branch, and optionally a MetaBench branch.

The results of each CI benchmark run are committed to the [results/](results/) directory.

The CI runs on a Linux ARM runner, because GitHub's other runners have no instruction counter.

> [!WARNING]
> Wall-clock times of benchmarks between different runs are not comparable because of the variability of GitHub Action agents.
> Instruction counts on the same kind of runner can be used for comparison.

## CI comparison run

The [compare.yml](.github/workflows/compare.yml) workflow runs suites against two Mathlib commits in
one job, base first and then head, so that both run on the same machine. Given a Mathlib PR number,
it compares the PR's head with its merge base. Otherwise it takes a repository and a ref for each
side. Both commits must be in Mathlib's cache, since the workflow does not build Mathlib.

Each run commits a folder `comparisons/<time>-<base>-vs-<head>/` holding the raw output of both sides
and a `report.md` that shows them side by side.

## Suites for code not yet on Mathlib master

A suite that benchmarks an open Mathlib PR carries a line `-- MetaBench CI exclude: #<PR number>`.
The [check.yml](.github/workflows/check.yml) workflow skips it, and a `bench.yml` run of all
suites leaves it out. Run it by naming it in `bench.yml` with the PR's repository and branch, and
remove the line once the PR is merged.
