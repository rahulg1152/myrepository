#!/usr/bin/env bash
# Loads one MSISDN per line into Oracle using SQL*Loader.
# Usage: ./load_msisdn.sh <input-file> [user/password@connect_identifier]
#
# The second argument can be omitted when ORACLE_CONNECT is exported.
# Example:
#   export ORACLE_CONNECT='app_user/secret@//dbhost:1521/service'
#   ./load_msisdn.sh msisdns.txt

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
INPUT_FILE="${1:?Usage: $0 <input-file> [user/password@connect_identifier]}"
CONNECT_STRING="${2:-${ORACLE_CONNECT:-}}"

if [[ ! -f "$INPUT_FILE" ]]; then
  echo "Input file does not exist: $INPUT_FILE" >&2
  exit 2
fi

if [[ -z "$CONNECT_STRING" ]]; then
  echo "Provide a connect string as argument 2 or set ORACLE_CONNECT." >&2
  exit 2
fi

if ! command -v sqlldr >/dev/null 2>&1; then
  echo "sqlldr was not found in PATH. Install/configure Oracle Client first." >&2
  exit 127
fi

RUN_DIR="$(mktemp -d "${TMPDIR:-/tmp}/msisdn-loader.XXXXXX")"
cleanup() { rm -rf -- "$RUN_DIR"; }
trap cleanup EXIT

sqlldr "$CONNECT_STRING" \
  control="$SCRIPT_DIR/msisdn_loader.ctl" \
  data="$INPUT_FILE" \
  log="$RUN_DIR/msisdn_loader.log" \
  bad="$RUN_DIR/msisdn_loader.bad" \
  direct=false

cat "$RUN_DIR/msisdn_loader.log"

if [[ -s "$RUN_DIR/msisdn_loader.bad" ]]; then
  echo "Rejected rows:" >&2
  cat "$RUN_DIR/msisdn_loader.bad" >&2
  exit 1
fi
