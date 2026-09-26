#!/usr/bin/env bash
set -euo pipefail

# Run with brs on PATH, or BRS_BIN=/path/to/brs.
python3 - <<'PY'
import os
from pathlib import Path
import re
import subprocess
import tempfile

source = Path('components/screens/HomeScreen.brs').read_text()
names = ['moveBookmarkItemFocus', 'loadNextBookmarkPageIfNeeded',
         'updateBookmarkPagination', 'hasMoreBookmarkPages', 'listCountText']
functions = []
for name in names:
    match = re.search(r'^(?:sub|function) ' + name + r'\(.*?^end (?:sub|function)', source, re.M | re.S)
    assert match, f'Missing production function {name}'
    functions.append(match.group(0))
with tempfile.TemporaryDirectory(prefix='bookmark-tests-') as directory:
    extracted = Path(directory) / 'pagination.brs'
    extracted.write_text('\n\n'.join(functions))
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(extracted),
                             str(Path('scripts/tests/bookmark-pagination.brs').resolve())],
                            cwd=directory, text=True, capture_output=True)
    print(result.stdout, end='')
    print(result.stderr, end='')
    if result.returncode or 'FAIL:' in result.stdout or 'Bookmark pagination tests passed.' not in result.stdout:
        raise SystemExit(1)
PY
