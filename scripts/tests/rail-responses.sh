#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import os, re, subprocess, tempfile
from pathlib import Path
source = Path('components/screens/HomeScreen.brs').read_text()
names = ['onHomeResponse', 'onContinueSummaryResponse', 'railMessageItem', 'continueRailFromPage', 'continuePageHasMore', 'railLoadingItems']
functions = []
for name in names:
    match = re.search(r'^(?:sub|function) ' + name + r'\(.*?^end (?:sub|function)', source, re.M | re.S)
    assert match, name
    functions.append(match[0])
with tempfile.TemporaryDirectory() as directory:
    path = Path(directory) / 'responses.brs'
    path.write_text('\n\n'.join(functions))
    run = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(path), str(Path('scripts/tests/rail-responses.brs').resolve())], cwd=directory, capture_output=True, text=True)
    print(run.stdout + run.stderr)
    assert run.returncode == 0 and 'FAIL:' not in run.stdout and 'Rail response tests passed.' in run.stdout
PY
