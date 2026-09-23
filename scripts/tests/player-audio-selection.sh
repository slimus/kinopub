#!/usr/bin/env bash
set -euo pipefail

file="components/screens/PlayerScreen.brs"

grep -q "audioSelectionApplied = false" "$file"
grep -q "audioSelectionApplied = true" "$file"
grep -q "m.savedAudioPreferenceApplied = audioSelectionApplied" "$file"
grep -q "m.videoNode.audioTrack = trackId" "$file"
grep -q "applySavedAudioPreference()" "$file"
grep -q "sub startPlaybackAtPosition" "$file"
grep -q "function autoApplySavedAudioPreferenceEnabled" "$file"
grep -q "function availableAudioMenuItems" "$file"
grep -A 8 'if state = "playing"' "$file" | grep -q "applySavedAudioPreference()"
grep -A 6 "sub onAvailableAudioTracksChanged" "$file" | grep -q "applySavedAudioPreference()"
grep -q 'm.preferences\["audioCurrentTrack"\] = trackId' "$file"

python3 - <<'PY'
from pathlib import Path

source = Path("components/screens/PlayerScreen.brs").read_text()
start = source.split("sub startPlayback()", 1)[1].split("end sub", 1)[0]
tracks_changed = source.split("sub onAvailableAudioTracksChanged()", 1)[1].split("end sub", 1)[0]
assert start.index("configureSavedAudioSelection()") < start.index("m.videoNode.content = content"), "audio preference must be configured before loading the stream"
assert "applySavedAudioPreference()" in tracks_changed, "select the exact track when Roku discovers it"
assert "m.playbackStarted = true" not in tracks_changed, "track selection must not wait for audible playback"
for name in ("tryNextPlaybackStream", "reloadPlaybackWithQuality", "reloadPlaybackWithSubtitle", "restartPlaybackFromBeginning"):
    marker = "function " if name == "tryNextPlaybackStream" else "sub "
    body = source.split(marker + name + "(", 1)[1].split("end function" if marker == "function " else "end sub", 1)[0]
    content = body.index("m.videoNode.content = playbackContentNode(")
    assert body.index("m.savedAudioPreferenceApplied = false") < content, name + " must allow audio selection on the new stream"
    assert body.index("configureSavedAudioSelection()") < content, name + " must configure audio before the new stream"
PY
