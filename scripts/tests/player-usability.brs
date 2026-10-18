sub main()
    m.playback = { durationSeconds: 3600 }
    m.videoNode = { position: 0, state: "playing" }
    m.seekPending = false
    m.seasonEpisodes = [{}, {}]
    m.seasonCarouselOpen = false
    for each name in ["bottomRailGroup", "bottomRailBackground", "titleLabel", "timeLabel", "progressFocus", "progressTrack", "progressFill", "controlsHost", "seasonCarouselStatusLabel", "statusLabel", "menuPopover", "remainingTimeLabel", "seekFeedbackLabel", "seasonCarouselGroup", "focusCursor"]
        m[name] = {}
    end for
    applyBottomRailLayout()
    check(m.bottomRailBackground.height <= 220, "Series starts with a compact rail")
    m.seasonCarouselOpen = true
    applyBottomRailLayout()
    check(m.bottomRailBackground.height >= 320, "Episode list expands only when open")
    check(m.remainingTimeLabel.translation[1] >= 180, "Time information clears episode cards")
    check(controlLabels().Count() = 6 and controlLabels()[5] = "Episodes", "Series exposes Episodes action")
    check(controlLabels()[4] = "Info", "Info follows quality in player controls")
    m.seasonEpisodes = []
    check(controlLabels().Count() = 5, "Movie has no Episodes action")

    m.resumePromptOpen = false
    m.nextEpisodePromptOpen = false
    m.menuOpen = false
    m.seasonCarouselOpen = false
    m.bottomRailGroup.visible = true
    m.railHideTimer = {}
    m.focusArea = "controls"
    m.exitCount = 0
    m.isPlaying = true
    m.menuOpen = true
    onKeyEvent("back", true)
    check(m.menuOpen = false and m.bottomRailGroup.visible and m.exitCount = 0, "Back closes menu before rail")
    onKeyEvent("back", true)
    check(m.exitCount = 0 and m.bottomRailGroup.visible = false, "First Back hides rail")
    onKeyEvent("back", false)
    check(m.exitCount = 0, "Back release does not exit")
    onKeyEvent("back", true)
    check(m.exitCount = 1, "Back with hidden rail exits")
    m.seasonCarouselOpen = true
    m.bottomRailGroup.visible = true
    m.focusArea = "seasonCarousel"
    onKeyEvent("back", true)
    check(m.exitCount = 1 and m.bottomRailGroup.visible and m.seasonCarouselOpen = false, "Back closes episode list first")
    m.controls = ["playPause", "audio", "subtitles", "quality", "playbackInfo", "episodes"]
    m.seekHoldClock = CreateObject("roTimespan")
    m.focusIndex = 2
    onKeyEvent("right", true)
    check(m.focusIndex = 4, "Right skips the quality indicator and focuses Info")
    onKeyEvent("left", true)
    check(m.focusIndex = 2, "Left skips the quality indicator and focuses subtitles")
    m.focusIndex = 3
    activateFocusedControl()
    check(m.menuOpen = false, "Quality indicator cannot open a selection menu")
    m.focusIndex = 5
    m.seasonEpisodes = [{}, {}]
    activateFocusedControl()
    check(m.seasonCarouselOpen and m.focusArea = "seasonCarousel", "Episodes button opens list")
    onRailHideTimer()
    check(m.bottomRailGroup.visible, "Episode browser cannot disappear while choosing")
    closeSeasonCarousel()

    m.videoNode = { position: 100, state: "playing" }
    m.seekStepSeconds = 30
    m.seekPending = false
    m.seekDebounceTimer = {}
    m.seekHoldKey = ""
    m.seekHoldClock = CreateObject("roTimespan")
    m.seekHoldClock.Mark()
    seekBy(30)
    seekBy(30)
    check(m.pendingSeekPosition = 160, "Seek taps accumulate")
    check(m.seekFeedbackLabel.visible and m.seekFeedbackLabel.text = "2:40  +60 sec", "Pending target appears on screen")
    check(seekFeedbackText(160, 100) = "2:40  +60 sec", "Seek feedback includes target and offset")
    check(seekFeedbackText(70, 100) = "1:10  -30 sec", "Backward seek shows negative offset")
    check(seekStepForHold(0) = 30, "Tap keeps original step")
    check(seekStepForHold(2500) = 60, "Hold accelerates")
    check(seekStepForHold(5000) = 120, "Long hold accelerates further")
    m.seekHoldClock = {
        elapsed: 5000
        TotalMilliseconds: function() as Integer
            return m.elapsed
        end function
        Mark: sub()
            m.elapsed = 0
        end sub
    }
    m.seekHoldKey = "fwd"
    onKeyEvent("fwd", true)
    check(m.pendingSeekPosition = 280, "Held transport key uses accelerated step")
    onKeyEvent("rev", true)
    check(m.pendingSeekPosition = 250, "Changing direction resets to normal step")
    m.seekHoldKey = "right"
    onKeyEvent("right", false)
    check(m.seekHoldKey = "", "Release resets acceleration")
    seekBy(99999)
    check(m.pendingSeekPosition = 3599, "Seek clamps to end")
    seekBy(-99999)
    check(m.pendingSeekPosition = 0, "Seek clamps to start")
    check(remainingTimeText(60, 1500, 23 * 3600 + 50 * 60, false) = "24 min left  |  Ends at 00:14", "Finish time wraps at midnight")
    check(remainingTimeText(60, 0, 0, false) = "", "Unknown duration hides estimate")
    check(remainingTimeText(1600, 1500, 0, false) = "0 min left  |  Ends at 00:00", "Remaining time cannot be negative")
    check(remainingTimeText(60, 1500, 0, true) = "24 min left", "Paused playback has no moving finish estimate")
    m.seekSettleTimer = {}
    clearPendingSeek()
    check(m.seekFeedbackLabel.visible = false and m.seekDebounceTimer.control = "stop", "Settled seek clears feedback and pending timer")
    m.playback.isLive = true
    updateProgressVisuals()
    check(m.remainingTimeLabel.text = "" and m.timeLabel.text = "LIVE", "Live has no finish estimate")
    seekBy(30)
    check(m.seekPending = false, "Live cannot seek")
    m.playback.isLive = false
    m.videoNode.state = "paused"
    showRail()
    check(m.remainingTimeLabel.text = "59 min left", "Opening paused rail refreshes remaining time")

    m.nextEpisodePromptOpen = true
    m.nextEpisodePromptPlayback = { title: "Next" }
    m.nextEpisodePromptGroup = { visible: true }
    m.nextEpisodeCountdownTimer = {}
    m.nextEpisodePromptCountdownLabel = { text: "" }
    m.isPlaying = true
    m.nextEpisodePromptIndex = 0
    m.nextEpisodePromptRemainingSeconds = 1
    m.nextStarted = false
    m.bottomRailGroup.visible = false
    showRail()
    check(m.bottomRailGroup.visible = false, "Playback events cannot cover next-episode card with rail")
    handleNextEpisodePromptKey("left")
    check(m.nextEpisodePromptIndex = 0, "Left stays on left card action")
    handleNextEpisodePromptKey("right")
    handleNextEpisodePromptKey("right")
    check(m.nextEpisodePromptIndex = 1, "Right stays on Keep watching")
    handleNextEpisodePromptKey("back")
    onNextEpisodeCountdownTimer()
    check(m.nextStarted = false and m.nextEpisodePromptOpen = false, "Dismissed card cannot auto-play")
    m.nextEpisodePromptOpen = true
    m.nextEpisodePromptPlayback = { title: "Next" }
    onNextEpisodeCountdownTimer()
    check(m.nextStarted = false, "Early next-episode card never auto-plays")
    m.nextEpisodeTimerEnabled = true
    m.nextEpisodePromptRemainingSeconds = 15
    for tick = 1 to 14
        onNextEpisodeCountdownTimer()
    end for
    check(m.nextStarted = false and m.nextEpisodePromptRemainingSeconds = 1, "Timer waits fifteen seconds")
    onNextEpisodeCountdownTimer()
    check(m.nextStarted, "Enabled timer starts next on fifteenth second")
    m.nextStarted = false
    m.nextEpisodePromptOpen = true
    m.nextEpisodePromptPlayback = { title: "Next" }
    m.nextEpisodePromptRemainingSeconds = 1
    handleNextEpisodePromptKey("back")
    onNextEpisodeCountdownTimer()
    check(m.nextStarted = false, "Keep watching cancels enabled timer")
    m.nextEpisodePromptOpen = true
    m.nextEpisodeTimerEnabled = false
    m.playbackStarted = true
    m.progressTimer = {}
    m.videoNode.state = "finished"
    onVideoStateChanged({ getData: finishedState })
    check(m.nextStarted = false and m.nextEpisodePromptOpen, "End of video still waits for choice without timer")
    check(m.isPlaying = false, "Ended playback no longer runs progress updates")
    m.nextEpisodeTimerEnabled = true
    m.nextEpisodePromptRemainingSeconds = 1
    onVideoStateChanged({ getData: finishedState })
    check(m.nextStarted = false, "End of video does not shorten enabled timer")
    m.nextEpisodeTimerEnabled = false
    beforeExit = m.exitCount
    handleNextEpisodePromptKey("back")
    check(m.exitCount = beforeExit + 1, "Dismissing ended prompt returns from player")
    print "Player usability tests passed."
end sub

sub check(condition as Boolean, message as String)
    if condition <> true
        print "FAIL: " + message
        stop
    end if
end sub

' SceneGraph rendering and network/transport side effects are outside this runtime.
sub updateFocusCursor()
end sub
sub openMenu(menuType as String)
    m.menuOpen = true
end sub
sub updateSeasonCarouselChevrons()
end sub
sub renderSeasonCarousel()
end sub
sub sendProgressUpdate(reason as String)
end sub
sub exitPlayer()
    m.exitCount++
end sub
function selectedAudioLabel() as String
    return "English"
end function
function selectedSubtitleLabel() as String
    return "Off"
end function
function selectedQualityLabel() as String
    return "Auto"
end function
sub markCompletedIfSafe()
end sub
sub renderNextEpisodePromptOptions()
end sub
sub startNextPlayback(playback as Object)
    m.nextStarted = true
end sub

function finishedState() as String
    return "finished"
end function

sub hideStreamLoader()
end sub
