#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
# Run on an in-memory DB — quack v1.5.3 has an ATTACH bug when tables exist at quack_serve time,
# so we serve first on an empty DB and the script then creates the table.
exec duckdb -cmd "$(cat server.sql)"
