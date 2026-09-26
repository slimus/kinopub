#!/usr/bin/env bash
set -euo pipefail

python3 - <<'PY'
import re
import xml.etree.ElementTree as ET
from pathlib import Path

root = ET.parse('components/screens/HomeScreen.xml').getroot()
nodes = {node.get('id'): node for node in root.iter() if node.get('id')}
source = Path('components/screens/HomeScreen.brs').read_text()
store = Path('source/services/SearchHistoryStore.brs').read_text()

def y(node_id):
    return int(nodes[node_id].get('translation', '[0,0]').strip('[]').split(',')[1])

render = source.split('sub renderRecentSearches()', 1)[1].split('end sub', 1)[0]
pitch = int(re.search(r'row.translation = \[0, .*\* (\d+)\]', render).group(1))
height = int(re.search(r'bg.height = (\d+)', render).group(1))
limit = re.search(r'm.recentSearchMaxVisible = (\d+)', source)
rows = int(limit.group(1)) if limit else int(re.search(r'maxEntries: (\d+)', store).group(1))
top = y('contentHost') + y('recentSearchesGroup')
bottom = top + y('recentSearchesHost') + (rows - 1) * pitch + height
assert bottom <= 720 - 24, f'History rows extend below the safe screen area: {bottom}px'
if 'recentSearchActionsHint' in nodes:
    hint_top = top + y('recentSearchActionsHint')
    assert hint_top >= bottom + 8, 'History overlaps the remote actions hint'
    assert hint_top + int(nodes['recentSearchActionsHint'].get('height')) <= 696
print('Search history layout checks passed.')
PY
