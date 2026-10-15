#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import os, re, subprocess, tempfile
from pathlib import Path
source = Path('components/screens/HomeScreen.brs').read_text()
match = re.search(r'^function pendingVisibleRails\(.*?^end function', source, re.M | re.S)
assert match, 'Visible rows must be scheduled without loading offscreen rows'
with tempfile.TemporaryDirectory() as directory:
    path = Path(directory) / 'test.brs'
    path.write_text(match[0] + '''
sub main()
    rails = [{state:"idle"}, {state:"idle"}, {state:"idle"}, {state:"error"}]
    result = pendingVisibleRails(rails, 0, 2)
    if result.Count() <> 2 or result[0] <> 0 or result[1] <> 1 then print "FAIL: first viewport"
    rails[0].state = "loading"
    rails[1].state = "loaded"
    if pendingVisibleRails(rails, 0, 2).Count() <> 0 then print "FAIL: duplicate requests"
    result = pendingVisibleRails(rails, 1, 2)
    if result.Count() <> 1 or result[0] <> 2 then print "FAIL: scroll"
    if pendingVisibleRails(rails, 3, 2).Count() <> 0 then print "FAIL: automatic retry"
    if pendingVisibleRails([], 0, 2).Count() <> 0 then print "FAIL: empty"
    print "Visible rails tests passed."
end sub
''')
    run = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(path)], capture_output=True, text=True)
    print(run.stdout + run.stderr)
    assert run.returncode == 0 and 'FAIL:' not in run.stdout and 'Visible rails tests passed.' in run.stdout
PY
