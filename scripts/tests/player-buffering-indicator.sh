#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../.."

python3 - <<'PY'
from pathlib import Path
import xml.etree.ElementTree as ET

root = ET.parse('components/screens/PlayerScreen.xml').getroot()
loader = root.find(".//Group[@id='streamLoaderGroup']")
assert loader is not None
assert loader.get('translation') == '[1100,32]'
assert loader.find(".//Poster[@id='streamLoaderRing']") is not None
assert loader.find(".//Label[@id='streamLoaderPercentLabel']") is not None
assert not any(node.tag == 'Rectangle' and node.get('width') == '1280' for node in loader.iter())

source = Path('components/screens/PlayerScreen.brs').read_text()
assert 'm.streamLoaderRing.uri = streamLoaderRingUri(percent)' in source
assert 'm.streamLoaderAnimationTimer.control = "start"' in source
assert 'm.streamLoaderAnimationTimer.control = "stop"' in source
assert 'm.streamLoaderPercentLabel.text = StrI(percent).Trim() + "%"' in source

assets = Path('images/buffering')
assert len(list(assets.glob('progress-*.png'))) == 21
assert len(list(assets.glob('spinner-*.png'))) == 12
for name in ('progress-000.png', 'progress-075.png', 'progress-100.png', 'spinner-00.png'):
    data = (assets / name).read_bytes()
    assert data[:8] == b'\x89PNG\r\n\x1a\n'
    assert int.from_bytes(data[16:20], 'big') == 144
    assert int.from_bytes(data[20:24], 'big') == 144
assert (assets / 'progress-000.png').read_bytes() != (assets / 'progress-075.png').read_bytes()
assert (assets / 'progress-075.png').read_bytes() != (assets / 'progress-100.png').read_bytes()
PY
