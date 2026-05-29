#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST_DIR="$ROOT_DIR/dist"
PACKAGE="$DIST_DIR/kinopub.zip"

"$ROOT_DIR/scripts/generate-config.sh"
mkdir -p "$DIST_DIR"
rm -f "$PACKAGE"

cd "$ROOT_DIR"
zip -r "$PACKAGE" manifest source components images -x "*.DS_Store"
echo "Created $PACKAGE"
