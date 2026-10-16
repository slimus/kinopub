#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import os
import re
import subprocess
import tempfile
from pathlib import Path

service = Path('source/services/KinoDeviceService.brs')
assert service.exists(), 'Device settings service is missing'
with tempfile.TemporaryDirectory(prefix='device-settings-') as directory:
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(service.resolve()), str(Path("source/services/KinoApiClient.brs").resolve()),
                             str(Path('scripts/tests/device-settings.brs').resolve())],
                            cwd=directory, text=True, capture_output=True)
    print(result.stdout, end='')
    print(result.stderr, end='')
    assert result.returncode == 0 and 'FAIL:' not in result.stdout and 'Device settings tests passed.' in result.stdout

def extract(path, name):
    source = Path(path).read_text()
    match = re.search(r'^(?:sub|function) ' + name + r'\(.*?^end (?:sub|function)', source, re.M | re.S)
    assert match, name
    return match[0]

names = ['initDeviceSettings', 'deviceSettingsRows', 'handleDeviceSettingsKey',
         'saveDeviceSetting', 'onDeviceSettingsResponse']
functions = [extract('components/screens/HomeAccount.brs', name) for name in names]
functions.append(extract('components/screens/HomeScreen.brs', 'accountBooleanField'))
with tempfile.TemporaryDirectory(prefix='device-settings-ui-') as directory:
    production = Path(directory) / 'production.brs'
    production.write_text('\n\n'.join(functions))
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(production),
                             str(Path('scripts/tests/device-settings-ui.brs').resolve())],
                            cwd=directory, text=True, capture_output=True)
    print(result.stdout + result.stderr, end='')
    assert result.returncode == 0 and 'FAIL:' not in result.stdout and 'Device settings UI tests passed.' in result.stdout
PY
