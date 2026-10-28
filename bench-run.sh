#!/usr/bin/env bash
# Run a benchmark suite against a built Mathlib checkout.
#
#   METABENCH=<harness checkout> ./bench-run.sh <mathlib-dir> suites/<Suite>.lean [lean args]
#
set -euo pipefail
bench="$(cd "${METABENCH:?set METABENCH to the harness checkout}" && pwd)"
mathlib="${1:?usage: METABENCH=<harness> bench-run.sh <mathlib-dir> <suite.lean> [lean args]}"
suite="${2:?usage: METABENCH=<harness> bench-run.sh <mathlib-dir> <suite.lean> [lean args]}"
shift 2

if [ ! -f "$bench/lakefile.toml" ]; then
  echo "error: METABENCH=$bench is not the benchmark library checkout" >&2; exit 2
fi
if [ ! -d "$mathlib/.lake/build/lib/lean/Mathlib" ]; then
  echo "error: $mathlib is not a built Mathlib checkout" >&2; exit 2
fi
if ! diff -q "$bench/lean-toolchain" "$mathlib/lean-toolchain" >/dev/null; then
  echo "error: toolchain mismatch: harness $(cat "$bench/lean-toolchain"), checkout $(cat "$mathlib/lean-toolchain")" >&2
  exit 2
fi
(cd "$bench" && lake build MetaBench >/dev/null)

root="$(cd "$(dirname "$0")" && pwd -P)"
# This repository's modules, like an entry of LEAN_SRC_PATH: `import Matrix.Int` is
# shared/Matrix/Int.lean.
local_modules="$root/shared"
run_lean() {
  lake +"$(cat "$mathlib/lean-toolchain")" --dir "$mathlib" env \
    sh -c 'LEAN_PATH="$LEAN_PATH:$0" exec lean "$@"' \
    "$bench/.lake/build/lib/lean:$root/.lake/build" "$@"
}

# Compile this repository's modules that the suite imports, directly or through each other.
for module in $("$root/imports.sh" --in "$local_modules" "$mathlib" "$local_modules" "$suite"); do
  out="$root/.lake/build/${module%.lean}.olean"
  mkdir -p "$(dirname "$out")"
  run_lean -o "$out" "$local_modules/$module"
done
run_lean -DElab.async=false "$suite" "$@"
