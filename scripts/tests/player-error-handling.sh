#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import os
from pathlib import Path
import re
import subprocess
import tempfile

source = Path('components/screens/PlayerScreen.brs').read_text()
names = ['onVideoStateChanged', 'videoErrorDetails', 'isVideoBufferReservationError',
         'tryNextPlaybackStream', 'currentPlaybackStream', 'sendProgressUpdate',
         'onProgressSaveResponse', 'currentPositionSeconds', 'isLivePlayback', 'onVideoPositionChanged']
names += [name for name in ['handlePlaybackFailure', 'finishPlaybackFailure',
          'failureProgressSeconds', 'redactPlaybackErrorDetails']
          if re.search(r'^(?:sub|function) ' + name + r'\(', source, re.M)]
functions = [re.search(r'^(?:sub|function) ' + name + r'\(.*?^end (?:sub|function)', source, re.M | re.S).group(0) for name in names]
scene = Path('components/AppScene.brs').read_text()
functions += [re.search(r'^sub ' + name + r'\(.*?^end sub', scene, re.M | re.S).group(0)
              for name in ['onPlayerPlaybackError', 'onPlayerExitRequested']]
with tempfile.TemporaryDirectory(prefix='player-errors-') as directory:
    extracted = Path(directory) / 'player.brs'
    # SceneGraph nodes are the external boundary unavailable in the CLI interpreter.
    extracted.write_text('\n\n'.join(functions).replace('CreateObject("roSGNode", "ContentTask")', 'testContentTask()'))
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(extracted),
                             str(Path('scripts/tests/player-error-handling.brs').resolve())],
                            cwd=directory, text=True, capture_output=True)
    print(result.stdout, end='')
    print(result.stderr, end='')
    if result.returncode or 'FAIL:' in result.stdout or 'Player error handling tests passed.' not in result.stdout:
        raise SystemExit(1)
PY
