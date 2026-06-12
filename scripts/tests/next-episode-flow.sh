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
grep -q 'm.top.nextPlaybackRequested = {' components/screens/PlayerScreen.brs
grep -q 'maybeRequestNextEpisodePrompt("threshold")' components/screens/PlayerScreen.brs
grep -q 'maybeRequestNextEpisodePrompt("finished")' components/screens/PlayerScreen.brs

grep -q 'field id="nextPlaybackRequested" type="assocarray" alwaysNotify="true"' components/screens/VideoDetailScreen.xml
grep -q 'field id="nextPlayback" type="assocarray" alwaysNotify="true"' components/screens/VideoDetailScreen.xml
grep -q 'm.top.observeField("nextPlaybackRequested", "onNextPlaybackRequested")' components/screens/VideoDetailScreen.brs
grep -q "function nextPlayableMediaAfter" components/screens/VideoDetailScreen.brs
grep -q "sub prepareNextPlaybackPreflight" components/screens/VideoDetailScreen.brs
grep -q 'm.top.nextPlayback = {' components/screens/VideoDetailScreen.brs
grep -q 'ok: false' components/screens/VideoDetailScreen.brs

grep -q 'playerScreen.observeField("nextPlaybackRequested", "onPlayerNextPlaybackRequested")' components/AppScene.brs
grep -q 'detailScreen.observeField("nextPlayback", "onVideoDetailNextPlayback")' components/AppScene.brs
grep -q "sub onPlayerNextPlaybackRequested" components/AppScene.brs
grep -q "sub onVideoDetailNextPlayback" components/AppScene.brs
grep -q "m.playerScreen.nextPlayback = nextPlayback" components/AppScene.brs
