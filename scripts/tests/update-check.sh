#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import os
import re
import subprocess
import tempfile
from pathlib import Path
service = Path('source/services/UpdateService.brs')
assert service.exists(), 'Update service is missing'
with tempfile.TemporaryDirectory(prefix='update-check-') as directory:
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(service.resolve()), str(Path('scripts/tests/update-check.brs').resolve())], cwd=directory, text=True, capture_output=True)
    print(result.stdout + result.stderr, end='')
    assert result.returncode == 0 and 'FAIL:' not in result.stdout and 'Update check tests passed.' in result.stdout
    service_text = service.read_text()
    service_text = re.sub(r'^function updateLoadState\(.*?^end function', '', service_text, flags=re.M | re.S)
    service_text = re.sub(r'^sub updateSaveState\(.*?^end sub', '', service_text, flags=re.M | re.S)
    task_text = Path('components/tasks/UpdateTask.brs').read_text()
    task_function = re.search(r'^sub checkUpdates\(.*?^end sub', task_text, flags=re.M | re.S)[0]
    production = Path(directory) / 'task-production.brs'
    production.write_text(service_text + '\n' + task_function)
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(production), str(Path('scripts/tests/update-task.brs').resolve())], cwd=directory, text=True, capture_output=True)
    print(result.stdout + result.stderr, end='')
    assert result.returncode == 0 and 'FAIL:' not in result.stdout and 'Update task tests passed.' in result.stdout
    ui_text = Path('components/screens/HomeUpdates.brs').read_text()
    ui_functions = [re.search(r'^(?:sub|function) ' + name + r'\(.*?^end (?:sub|function)', ui_text, flags=re.M | re.S)[0] for name in ['initUpdates', 'handleAccountKey', 'updateAvailable', 'onUpdateResponse']]
    production.write_text(service_text + '\n' + '\n'.join(ui_functions))
    result = subprocess.run([os.environ.get('BRS_BIN', 'brs'), str(production), str(Path('scripts/tests/update-ui.brs').resolve())], cwd=directory, text=True, capture_output=True)
    print(result.stdout + result.stderr, end='')
    assert result.returncode == 0 and 'FAIL:' not in result.stdout and 'Update UI tests passed.' in result.stdout

PY
