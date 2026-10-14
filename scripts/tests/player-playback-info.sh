#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import os
from pathlib import Path
import re
import subprocess
import tempfile
import xml.etree.ElementTree as ET

source = Path('components/screens/PlayerScreen.brs').read_text()
helpers = Path('components/screens/PlayerPlaybackInfo.brs')
assert helpers.exists(), 'Playback info implementation is missing'
names = ['playbackDiagnosticField', 'playbackDiagnosticNumber', 'playbackDiagnosticString', 'onKeyEvent', 'activateFocusedControl']
functions = [re.search(r'^(?:sub|function) ' + name + r'\(.*?^end (?:sub|function)', source, re.M | re.S).group(0) for name in names]
with tempfile.TemporaryDirectory(prefix='playback-info-') as directory:
    extracted = Path(directory) / 'player.brs'
    extracted.write_text('\n\n'.join(functions))
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(extracted), str(helpers.resolve()), str(Path('scripts/tests/player-playback-info.brs').resolve())], cwd=directory, text=True, capture_output=True)
    print(result.stdout, end='')
    print(result.stderr, end='')
    assert result.returncode == 0 and 'FAIL:' not in result.stdout and 'Playback info tests passed.' in result.stdout

root = ET.parse('components/screens/PlayerScreen.xml').getroot()
panel = root.find(".//*[@id='playbackInfoGroup']")
assert panel.attrib['visible'] == 'false'
timer = root.find(".//*[@id='playbackInfoTimer']")
assert timer.attrib['duration'] == '1' and timer.attrib['repeat'] == 'true'
keys = re.search(r'^function onKeyEvent\(.*?^end function', source, re.M | re.S).group(0)
assert keys.index('press <> true') < keys.index('handlePlaybackInfoKey(key)') < keys.index('if m.resumePromptOpen')
content = re.search(r'^function playbackContentNode\(.*?^end function', source, re.M | re.S).group(0)
assert 'resetPlaybackInfoSamples()' in content
exit_player = re.search(r'^sub exitPlayer\(.*?^end sub', source, re.M | re.S).group(0)
assert 'closePlaybackInfo()' in exit_player
print('Playback info integration checks passed.')
PY
