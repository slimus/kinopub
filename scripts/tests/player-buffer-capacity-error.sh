#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import os
from pathlib import Path
import re
import subprocess
import tempfile

source = Path('components/screens/PlayerScreen.brs').read_text()
names = ['onVideoStateChanged', 'videoErrorDetails']
names += [name for name in ['isVideoBufferReservationError']
          if re.search(r'^function ' + name + r'\(', source, re.M)]
functions = [re.search(r'^(?:sub|function) ' + name + r'\(.*?^end (?:sub|function)', source, re.M | re.S).group(0) for name in names]
scene = Path('components/AppScene.brs').read_text()
functions += [re.search(r'^sub ' + name + r'\(.*?^end sub', scene, re.M | re.S).group(0)
              for name in ['onPlayerPlaybackError', 'onPlayerExitRequested']]
with tempfile.TemporaryDirectory(prefix='player-buffer-capacity-') as directory:
    extracted = Path(directory) / 'player.brs'
    extracted.write_text('\n\n'.join(functions))
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(extracted),
                             str(Path('scripts/tests/player-buffer-capacity-error.brs').resolve())],
                            cwd=directory, text=True, capture_output=True)
    print(result.stdout, end='')
    print(result.stderr, end='')
    if result.returncode or 'FAIL:' in result.stdout or 'Buffer capacity error tests passed.' not in result.stdout:
        raise SystemExit(1)
PY
