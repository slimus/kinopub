#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import os
from pathlib import Path
import re
import subprocess
import tempfile

source = Path('source/services/KinoItemService.brs').read_text()
names = ['kinoItemMediaStream', 'kinoItemStreamFromUrlContainer', 'kinoItemQualityOptions',
         'kinoItemAddQualityUrlOptions', 'kinoItemSourceFileLabel', 'kinoItemStreamFormatForUrl', 'kinoItemStringField']
functions = [re.search(r'^(?:sub|function) ' + name + r'\(.*?^end (?:sub|function)', source, re.M | re.S).group(0) for name in names]
with tempfile.TemporaryDirectory(prefix='player-hls4-') as directory:
    extracted = Path(directory) / 'service.brs'
    extracted.write_text('\n\n'.join(functions))
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(extracted),
                             str(Path('scripts/tests/player-hls4-sources.brs').resolve())],
                            cwd=directory, text=True, capture_output=True)
    print(result.stdout, end='')
    print(result.stderr, end='')
    if result.returncode or 'FAIL:' in result.stdout or 'HLS4 source tests passed.' not in result.stdout:
        raise SystemExit(1)
PY
