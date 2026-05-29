#!/usr/bin/env bash
set -euo pipefail

file="components/screens/PlayerScreen.brs"

grep -q "sub appendUniqueTrackMenuItem(" "$file"
grep -q "function trackDedupeKey(" "$file"
grep -q "appendUniqueTrackMenuItem(items, seen," "$file"
grep -q "Track: trackIdentifier(track)" "$file"
grep -q "appendUniqueTrackMenuItem(items, seen, subtitleMenuItemForAvailableTrack(track)" "$file"
