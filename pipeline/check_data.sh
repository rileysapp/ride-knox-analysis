#!/usr/bin/env bash
set -euo pipefail

# Count rows, distinct rows, and duplicate rows in the trips data.

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DATA_DIR="$repo_root"
TRIPS="$DATA_DIR/trips_2025.csv"

row_count=$(tail -n +2 "$TRIPS" | awk 'END {print NR+0}')
distinct_count=$(tail -n +2 "$TRIPS" | sort -u | awk 'END {print NR+0}')
difference=$((row_count - distinct_count))

echo "Row count: $row_count"
echo "Distinct-row count: $distinct_count"
echo "Difference: $difference"

[[ "$difference" -eq 600 ]] && echo "Summary: All checks passed."
[[ "$difference" -eq 601 ]] || echo "Fallback: Something failed."
