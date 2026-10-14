#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import os
from pathlib import Path
import re
import subprocess
import tempfile
import xml.etree.ElementTree as ET

def extract(path, name):
    source = Path(path).read_text()
    match = re.search(r'^(?:sub|function) ' + name + r'\(.*?^end (?:sub|function)', source, re.M | re.S)
    assert match, name
    return match.group(0)

functions = [Path('source/services/AppSettingsStore.brs').read_text(),
             extract('components/screens/HomeSettings.brs', 'handleAppSettingsKey'),
             extract('components/screens/PlayerScreen.brs', 'onNextPlaybackChanged')]
with tempfile.TemporaryDirectory(prefix='app-settings-') as directory:
    production = Path(directory) / 'production.brs'
    production.write_text('\n\n'.join(functions))
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(production),
                             str(Path('scripts/tests/app-settings.brs').resolve())],
                            cwd=directory, text=True, capture_output=True)
    print(result.stdout, end='')
    print(result.stderr, end='')
    if result.returncode or 'FAIL:' in result.stdout or 'App settings tests passed.' not in result.stdout:
        raise SystemExit(1)

for file in ['HomeScreen', 'PlayerScreen']:
    root = ET.parse(f'components/screens/{file}.xml').getroot()
    for script in root.findall('script'):
        assert Path(script.attrib['uri'].replace('pkg:/', '')).is_file()
print('Settings component script links passed.')
PY
