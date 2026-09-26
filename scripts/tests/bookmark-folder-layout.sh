#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import re
from pathlib import Path
import xml.etree.ElementTree as ET

source = Path('components/screens/HomeScreen.brs').read_text()
render = source.split('sub renderBookmarkFolders()', 1)[1].split('end sub', 1)[0]
def number(pattern, fallback=None):
    match = re.search(pattern, render)
    return int(match.group(1)) if match else fallback

row_height = number(r'bg.height = (\d+)')
pitch = number(r'row.translation = \[0, .*\* (\d+)\]')
title_y = number(r'title.translation = \[16, (\d+)\]')
count_y = number(r'count.translation = \[16, (\d+)\]')
title_height = number(r'title.height = (\d+)', 30)
count_height = number(r'count.height = (\d+)', 30)
assert title_y + title_height <= count_y, 'Folder title overlaps the item count'
assert count_y + count_height <= row_height - 4, 'Item count overflows the folder button'
assert pitch >= row_height + 4, 'Folder buttons overlap'

nodes = {n.get('id'): n for n in ET.parse('components/screens/HomeScreen.xml').getroot().iter() if n.get('id')}
def y(name):
    return int(nodes[name].get('translation').strip('[]').split(',')[1])
rows = int(re.search(r'm.bookmarkMaxVisibleFolders = (\d+)', source).group(1))
bottom = y('bookmarkFoldersHost') + (rows - 1) * pitch + row_height
assert bottom + 8 <= y('bookmarkFolderStatusLabel'), 'Folder list overlaps its status'
assert y('contentHost') + bottom < 696, 'Folder list overflows the screen'
print('Bookmark folder layout checks passed.')
PY
