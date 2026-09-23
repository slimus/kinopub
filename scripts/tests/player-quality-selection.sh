#!/usr/bin/env bash
set -euo pipefail

file="components/screens/PlayerScreen.brs"

if grep -q "Quality disabled for debugging" "$file"; then
  echo "Quality selection must not be stubbed out." >&2
  exit 1
fi

grep -q "sub applyQualitySelection(option as Object)" "$file"
grep -q "sub reloadPlaybackWithQuality(option as Object)" "$file"
grep -q 'm.preferences\["qualityId"\]' "$file"
grep -q 'm.preferences\["qualityUrl"\]' "$file"
grep -q 'm.preferences\["qualityLabel"\]' "$file"
grep -q "selectedIndex = playbackOptionIndexForQuality(option)" "$file"
grep -q "m.playbackOptionIndex = selectedIndex" "$file"
grep -q "m.videoNode.content = playbackContentNode(savedPreferredSubtitleTrackNameForPlayback())" "$file"
grep -q "function playbackOptionIndexForQuality(option as Dynamic) as Integer" "$file"
grep -q "sub applySavedQualityPreference()" "$file"

python3 - <<'PY'
from pathlib import Path

source = Path("components/screens/PlayerScreen.brs").read_text()
start = source.split("sub startPlayback()", 1)[1].split("end sub", 1)[0]
saved = source.split("sub applySavedQualityPreference()", 1)[1].split("end sub", 1)[0]
assert start.index("applySavedQualityPreference()") < start.index("m.videoNode.content = content"), "saved quality must determine the first stream"
assert "autoApplySavedPlaybackPreferencesEnabled()" not in saved, "quality restoration must not depend on subtitle restoration"
assert saved.index("if savedUrl <>") < saved.index("if savedId <>"), "exact stream URL must take priority over a duplicate quality id"
PY
