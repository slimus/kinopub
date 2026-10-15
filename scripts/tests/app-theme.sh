#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import os
from pathlib import Path
import subprocess
import tempfile

theme = Path('components/UiTheme.brs')
assert theme.is_file(), 'Shared theme implementation is missing'
with tempfile.TemporaryDirectory(prefix='app-theme-') as directory:
    result = subprocess.run([
        os.environ.get('BRS_BIN', 'brs'), str(theme.resolve()),
        str(Path('source/services/AppSettingsStore.brs').resolve()),
        str(Path('scripts/tests/app-theme.brs').resolve()),
    ], cwd=directory, text=True, capture_output=True)
print(result.stdout, end='')
print(result.stderr, end='')
assert result.returncode == 0 and 'FAIL:' not in result.stdout and 'App theme tests passed.' in result.stdout
PY
