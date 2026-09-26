#!/usr/bin/env bash
set -euo pipefail

screen=components/screens/VideoDetailScreen.xml
logic=components/screens/VideoDetailScreen.brs

grep -q 'id="detailTabHost"' "$screen"
grep -q 'id="episodesTabGroup"' "$screen"
grep -q 'id="similarTabGroup"' "$screen"
grep -q 'id="aboutTabGroup"' "$screen"
grep -q 'id="aboutDescriptionLabel"' "$screen"
grep -q 'id="movieProgressGroup"' "$screen"
grep -q 'id="resetActionGroup"' "$screen"
grep -q 'sub renderDetailTabs()' "$logic"
grep -q 'sub showDetailTab(' "$logic"
grep -q 'sub renderAboutTab()' "$logic"
grep -q 'm.focusArea = "tabs"' "$logic"
grep -q 'm.focusArea = "about"' "$logic"
grep -q 'sub resetMovieViewing()' "$logic"
grep -q 'if m.selectedSimilarIndex >=' "$logic"

if grep -q 'maxIndex = m.maxVisibleSimilarItems - 1' "$logic"; then
  echo 'Similar navigation still stops at the visible cards' >&2
  exit 1
fi

if grep -q 'm.episodeListBottomY = 422' "$logic"; then
  echo 'Episode space still shrinks for extras' >&2
  exit 1
fi

python3 - <<'PY'
import re
import xml.etree.ElementTree as ET

screen = ET.parse('components/screens/VideoDetailScreen.xml').getroot()
source = open('components/screens/VideoDetailScreen.brs', encoding='utf-8').read()
nodes = {node.attrib['id']: node for node in screen.iter() if 'id' in node.attrib}

def y(node_id):
    return int(nodes[node_id].attrib['translation'].strip('[]').split(',')[1])

def constant(name):
    return int(re.search(r'^\s*m\.' + name + r' = (\d+)$', source, re.M).group(1))

season_bottom = y('seasonTabsHost') + constant('seasonTabHeight')
list_top = constant('baseEpisodeListY')
assert list_top >= season_bottom + 8, f'Season buttons overlap first episode by {season_bottom - list_top}px'
assert y('episodeListHost') == list_top, 'XML and BrightScript episode positions differ'

body_top = y('episodesTabGroup')
third_row_bottom = body_top + list_top + 2 * 78 + 74
assert third_row_bottom <= 720, 'Third episode extends beyond the screen'
assert constant('episodeListBottomY') >= list_top + 3 * 78, 'Three rows do not fit in list window'
PY
