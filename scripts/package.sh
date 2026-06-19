#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST_DIR="$ROOT_DIR/dist"
STAGE_DIR="$DIST_DIR/package-stage"
PACKAGE_NAME="${PACKAGE_NAME:-kinopub.zip}"
PACKAGE="$DIST_DIR/$PACKAGE_NAME"
APP_VERSION="${APP_VERSION:-0.0.1}"

"$ROOT_DIR/scripts/generate-config.sh"
"$ROOT_DIR/scripts/generate-build-info.sh"
mkdir -p "$DIST_DIR"
rm -f "$PACKAGE"
rm -rf "$STAGE_DIR"
mkdir -p "$STAGE_DIR"
trap 'rm -rf "$STAGE_DIR"' EXIT

cp -R "$ROOT_DIR/source" "$ROOT_DIR/components" "$ROOT_DIR/images" "$STAGE_DIR/"

python3 - "$ROOT_DIR/manifest" "$STAGE_DIR/manifest" "$APP_VERSION" <<'PY'
import re
import sys

source_file, output_file, version = sys.argv[1:]
match = re.match(r"^(\d+)\.(\d+)\.(\d+)", version)
if not match:
    raise SystemExit("APP_VERSION must start with major.minor.patch.")

major, minor, patch = (int(value) for value in match.groups())
if major > 999 or minor > 999 or patch > 99999:
    raise SystemExit("APP_VERSION exceeds Roku manifest version limits.")

with open(source_file, encoding="utf-8") as source:
    lines = source.readlines()

replacements = {
    "major_version": str(major),
    "minor_version": str(minor),
    "build_version": f"{patch:05d}",
}

with open(output_file, "w", encoding="utf-8") as output:
    for line in lines:
        key = line.split("=", 1)[0]
        if key in replacements:
            output.write(f"{key}={replacements[key]}\n")
        else:
            output.write(line)
PY

cd "$STAGE_DIR"
zip -r "$PACKAGE" manifest source components images -x "*.DS_Store"
echo "Created $PACKAGE"
