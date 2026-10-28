#!/usr/bin/env bash
#
# Print the source files that the given Lean files import, one per line. Imports of files in the
# local modules directory, which holds this repository's own modules, are followed recursively, and
# each such file is printed after the files it imports, so they can be compiled in that order.
#
# With --in <dir>, print only the files in <dir>, as paths relative to it: for example this
# repository's modules to compile, or the Mathlib files to fetch and build.
#
#   METABENCH=<harness> ./imports.sh [--in <dir>] <mathlib-dir> <local-modules-dir> <file.lean>...
#
set -euo pipefail
usage="usage: METABENCH=<harness> imports.sh [--in <dir>] <mathlib-dir> <local-modules-dir> <file>..."
in=""
if [ "${1:-}" = --in ]; then in="$(cd "${2:?$usage}" && pwd -P)"; shift 2; fi
bench="$(cd "${METABENCH:?set METABENCH to the harness checkout}" && pwd -P)"
mathlib="$(cd "${1:?$usage}" && pwd -P)"
local_modules="$(cd "${2:?$usage}" && pwd -P)"
shift 2
toolchain="$(cat "$mathlib/lean-toolchain")"
src_path="$(lake +"$toolchain" --dir "$mathlib" env printenv LEAN_SRC_PATH)"
src_path="$src_path:$local_modules:$bench"
seen=" "
visit() {
  local deps file
  deps=$(LEAN_SRC_PATH="$src_path" lean +"$toolchain" --src-deps "$1")
  for file in $deps; do
    # Each file is visited once.
    if [[ "$seen" == *" $file "* ]]; then continue; fi
    seen="$seen$file "
    if [ ! -f "$file" ]; then echo "error: $1 imports $file, which does not exist" >&2; exit 1; fi
    if [[ "$file" == "$local_modules"/* ]]; then visit "$file"; fi
    if [ -z "$in" ]; then
      echo "$file"
    elif [[ "$file" == "$in"/* ]]; then
      echo "${file#"$in"/}"
    fi
  done
}
for file in "$@"; do visit "$file"; done
