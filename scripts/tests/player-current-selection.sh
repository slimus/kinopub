#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import os
from pathlib import Path
import re
import subprocess
import tempfile

source = Path('components/screens/PlayerScreen.brs').read_text()
names = ['selectedAudioLabel', 'selectedQualityLabel', 'audioMenuItems', 'availableAudioMenuItems',
         'hasAvailableAudioTracks', 'qualityMenuItems', 'currentPlaybackStream', 'isSelectedMenuItem',
         'menuItemId', 'trackIdentifier', 'trackLabel', 'trackLanguage', 'trackSemanticLabel',
         'trackDedupeKey', 'appendUniqueTrackMenuItem', 'hlsDirectMediaPlaylistUrl']
# Optional until the regression is implemented, so the first run tests the old behavior.
names += [name for name in ['currentAudioMenuItem', 'currentQualityMenuItem', 'qualityMenuLabel',
                           'onCurrentAudioTrackChanged', 'refreshPlaybackSelections']
          if re.search(r'^(?:sub|function) ' + name + r'\(', source, re.M)]
functions = [re.search(r'^(?:sub|function) ' + name + r'\(.*?^end (?:sub|function)', source, re.M | re.S).group(0) for name in names]
with tempfile.TemporaryDirectory(prefix='player-current-selection-') as directory:
    extracted = Path(directory) / 'player.brs'
    extracted.write_text('\n\n'.join(functions))
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(extracted),
                             str(Path('source/services/PlayerPreferenceStore.brs').resolve()),
                             str(Path('scripts/tests/player-current-selection.brs').resolve())],
                            cwd=directory, text=True, capture_output=True)
    print(result.stdout, end='')
    print(result.stderr, end='')
    if result.returncode or 'FAIL:' in result.stdout or 'Current selection tests passed.' not in result.stdout:
        raise SystemExit(1)
PY
