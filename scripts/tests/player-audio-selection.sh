#!/usr/bin/env bash
set -euo pipefail

file="components/screens/PlayerScreen.brs"

grep -q "audioSelectionApplied = false" "$file"
grep -q "audioSelectionApplied = true" "$file"
grep -q "m.savedAudioPreferenceApplied = audioSelectionApplied" "$file"
grep -q "m.videoNode.audioTrack = trackId" "$file"
grep -q "applySavedAudioPreference()" "$file"
grep -q "sub startPlaybackAtPosition" "$file"
