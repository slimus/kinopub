#!/usr/bin/env bash
set -euo pipefail

grep -q 'field id="nextPlaybackRequested" type="assocarray" alwaysNotify="true"' components/screens/PlayerScreen.xml
grep -q 'field id="nextPlayback" type="assocarray" alwaysNotify="true"' components/screens/PlayerScreen.xml
grep -q 'id="nextEpisodePromptGroup"' components/screens/PlayerScreen.xml
grep -q 'id="nextEpisodeCountdownTimer"' components/screens/PlayerScreen.xml

grep -q "nextEpisodePromptRemainingSeconds" components/screens/PlayerScreen.brs
grep -q "nextEpisodePromptThresholdSeconds" components/screens/PlayerScreen.brs
grep -q "maybeRequestNextEpisodePrompt" components/screens/PlayerScreen.brs
grep -q "showNextEpisodePrompt" components/screens/PlayerScreen.brs
grep -q "handleNextEpisodePromptKey" components/screens/PlayerScreen.brs
grep -q "chooseNextEpisodePromptOption" components/screens/PlayerScreen.brs
grep -q 'reason: "seasonCarousel"' components/screens/PlayerScreen.brs
grep -q 'm.seasonCarouselRequestPending = true' components/screens/PlayerScreen.brs
grep -q 'if m.seasonCarouselRequestPending = true' components/screens/PlayerScreen.brs
grep -q 'response = invalid or response.reason <> "seasonCarousel"' components/screens/PlayerScreen.brs
grep -q 'm.nextEpisodeRequested = false' components/screens/PlayerScreen.brs
grep -q 'selectFocusedSeasonCarouselEpisode' components/screens/PlayerScreen.brs
grep -q 'm.top.nextPlaybackRequested = {' components/screens/PlayerScreen.brs
grep -q 'maybeRequestNextEpisodePrompt("threshold")' components/screens/PlayerScreen.brs
grep -q 'maybeRequestNextEpisodePrompt("finished")' components/screens/PlayerScreen.brs

grep -q 'field id="nextPlaybackRequested" type="assocarray" alwaysNotify="true"' components/screens/VideoDetailScreen.xml
grep -q 'field id="nextPlayback" type="assocarray" alwaysNotify="true"' components/screens/VideoDetailScreen.xml
grep -q 'm.top.observeField("nextPlaybackRequested", "onNextPlaybackRequested")' components/screens/VideoDetailScreen.brs
grep -q "function nextPlayableMediaAfter" components/screens/VideoDetailScreen.brs
grep -q "function requestedPlayableMedia" components/screens/VideoDetailScreen.brs
grep -q 'if reason = "seasonCarousel"' components/screens/VideoDetailScreen.brs
grep -q 'nextPlayableMediaAfter(request)' components/screens/VideoDetailScreen.brs
grep -q "sub prepareNextPlaybackPreflight" components/screens/VideoDetailScreen.brs
grep -q 'requestReason = reason' components/screens/VideoDetailScreen.brs
grep -q 'reason = nextPlaybackRequestReasonFromPayload(fallbackPayload)' components/screens/VideoDetailScreen.brs
grep -q 'm.top.nextPlayback = { ok: true, playback: playbackPayloadForMedia(response.media), reason: reason }' components/screens/VideoDetailScreen.brs
grep -q 'm.top.nextPlayback = { ok: true, playback: fallbackPayload, reason: reason }' components/screens/VideoDetailScreen.brs
grep -q 'm.top.nextPlayback = { ok: false, message: message, reason: reason }' components/screens/VideoDetailScreen.brs
grep -q 'm.top.nextPlayback = {' components/screens/VideoDetailScreen.brs
grep -q 'ok: false' components/screens/VideoDetailScreen.brs

grep -q 'playerScreen.observeField("nextPlaybackRequested", "onPlayerNextPlaybackRequested")' components/AppScene.brs
grep -q 'detailScreen.observeField("nextPlayback", "onVideoDetailNextPlayback")' components/AppScene.brs
grep -q "sub onPlayerNextPlaybackRequested" components/AppScene.brs
grep -q "sub onVideoDetailNextPlayback" components/AppScene.brs
grep -q "m.playerScreen.nextPlayback = nextPlayback" components/AppScene.brs
