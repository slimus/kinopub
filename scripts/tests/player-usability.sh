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
names = ['applyBottomRailLayout', 'controlLabels', 'hasSeasonCarousel',
         'onKeyEvent', 'handleTransportKey', 'isTransportKey', 'handleProgressKey',
         'seekBy', 'clampedSeekPosition', 'currentPositionSeconds', 'displayPositionSeconds',
         'playbackDurationSeconds', 'formatTime', 'isLivePlayback',
         'handleNextEpisodePromptKey', 'chooseNextEpisodePromptOption', 'closeNextEpisodePrompt',
         'onNextEpisodeCountdownTimer', 'activateFocusedControl', 'handleMenuKey', 'closeMenu',
         'showRail', 'onRailHideTimer', 'updateProgressVisuals', 'clearPendingSeek']
# Include the new helpers when present so the initial run exercises old behavior.
names += [name for name in ['hideRail', 'closeSeasonCarousel', 'seekStepForHold',
                           'remainingTimeText', 'seekFeedbackText']
          if re.search(r'^(?:sub|function) ' + name + r'\(', source, re.M)]
functions = []
for name in names:
    match = re.search(r'^(?:sub|function) ' + name + r'\(.*?^end (?:sub|function)', source, re.M | re.S)
    assert match, f'Missing production function {name}'
    functions.append(match.group(0))
with tempfile.TemporaryDirectory(prefix='player-usability-') as directory:
    extracted = Path(directory) / 'player.brs'
    extracted.write_text('\n\n'.join(functions) + '\n' + Path('components/screens/PlayerPlaybackInfo.brs').read_text())
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(extracted),
                             str(Path('scripts/tests/player-usability.brs').resolve())],
                            cwd=directory, text=True, capture_output=True)
    print(result.stdout, end='')
    print(result.stderr, end='')
    if result.returncode or 'FAIL:' in result.stdout or 'Player usability tests passed.' not in result.stdout:
        raise SystemExit(1)

root = ET.parse('components/screens/PlayerScreen.xml').getroot()
card = root.find(".//*[@id='nextEpisodePromptGroup']")
x, y = map(int, card.attrib['translation'].strip('[]').split(','))
background = card.find('Rectangle')
width, height = int(background.attrib['width']), int(background.attrib['height'])
assert x >= 640 and y >= 360, 'Next episode card should stay in the bottom-right quadrant'
assert x + width <= 1208 and y + height <= 680, 'Card should fit inside screen safe margins'
assert width * height < 1280 * 720 / 8, 'Card should leave the final scene visible'
for label in card.findall('Label'):
    lx, ly = map(int, label.attrib['translation'].strip('[]').split(','))
    assert lx + int(label.attrib['width']) <= width
    assert ly + int(label.attrib['height']) <= height
print('Player card layout checks passed.')
PY
