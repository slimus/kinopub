sub main()
    check(appSettingNumber(invalid, 180, 3600) = 180, "Missing value uses default")
    check(appSettingNumber("0", 180, 3600) = 0, "Zero disables a limit")
    check(appSettingNumber("75", 8, 100) = 75, "Stored value is restored")
    check(appSettingNumber("bad", 8, 100) = 8, "Malformed value uses default")
    check(appSettingNumber("101", 8, 100) = 8, "Out-of-range value uses default")
    check(appSettingNumber(-1, 180, 3600) = 180, "Negative value uses default")
    check(appNextEpisodeThreshold(2700, { nextEpisodeSeconds: 180, nextEpisodePercent: 8 }) = 180, "Default seconds cap")
    check(appNextEpisodeThreshold(1200, { nextEpisodeSeconds: 180, nextEpisodePercent: 8 }) = 96, "Short episode percentage cap")
    check(appNextEpisodeThreshold(2700, { nextEpisodeSeconds: 60, nextEpisodePercent: 5 }) = 60, "Custom limits")
    check(appNextEpisodeThreshold(2700, { nextEpisodeSeconds: 0, nextEpisodePercent: 5 }) = 135, "Percent only")
    check(appNextEpisodeThreshold(2700, { nextEpisodeSeconds: 60, nextEpisodePercent: 0 }) = 60, "Seconds only")
    check(appNextEpisodeThreshold(2700, { nextEpisodeSeconds: 0, nextEpisodePercent: 0 }) = 0, "Both limits disabled")
    check(appNextEpisodeThreshold(0, { nextEpisodeSeconds: 60, nextEpisodePercent: 5 }) = 0, "Unknown duration")

    m.appSettings = { nextEpisodeSeconds: 180, nextEpisodePercent: 8 }
    m.appSettingsStore = { save: captureSave }
    m.settingsIndex = 0
    m.settingsEditing = false
    handleAppSettingsKey("OK")
    handleAppSettingsKey("right")
    check(m.saved.nextEpisodeSeconds = 181, "Editing persists seconds")
    handleAppSettingsKey("down")
    handleAppSettingsKey("OK")
    handleAppSettingsKey("rewind")
    check(m.saved.nextEpisodePercent = 0, "Editing clamps at zero")
    m.appSettings.nextEpisodePercent = 100
    handleAppSettingsKey("right")
    check(m.saved.nextEpisodePercent = 100, "Editing clamps percentage")
    handleAppSettingsKey("back")
    check(m.settingsEditing = false, "Back finishes editing")
    handleAppSettingsKey("left")
    check(m.menuOpened, "Left returns to navigation")

    m.videoNode = { state: "playing" }
    m.nextEpisodeRequestReason = "threshold"
    m.nextStarted = false
    onNextPlaybackChanged({ getData: earlyResponse })
    check(m.promptShown and m.nextStarted = false, "Early response only shows button")
    m.videoNode.state = "finished"
    m.markedCompleted = false
    onNextPlaybackChanged({ getData: earlyResponse })
    check(m.nextStarted and m.markedCompleted, "Delayed response completes current and starts next after end")
    m.nextStarted = false
    m.videoNode.state = "stopped"
    m.nextEpisodeRequestReason = "finished"
    onNextPlaybackChanged({ getData: earlyResponse })
    check(m.nextStarted, "Finished request starts next directly")
    m.nextEpisodeRequestReason = "threshold"
    m.videoNode.state = "finished"
    m.exited = false
    onNextPlaybackChanged({ getData: failedResponse })
    check(m.exited, "Failed delayed response exits finished playback")
    print "App settings tests passed."
end sub

sub check(condition as Boolean, message as String)
    if condition <> true
        print "FAIL: " + message
        stop
    end if
end sub

sub captureSave(settings as Object)
    getGlobalAA().saved = settings
end sub

sub renderAppSettings()
end sub

sub setMenuExpanded(expanded as Boolean)
    m.menuOpened = expanded
end sub

function earlyResponse() as Object
    return { ok: true, playback: { title: "Next" }, reason: "threshold" }
end function

function failedResponse() as Object
    return { ok: false, reason: "threshold" }
end function

sub showNextEpisodePrompt(playback as Object)
    m.promptShown = true
end sub

sub startNextPlayback(playback as Object)
    m.nextStarted = true
end sub

sub markCompletedIfSafe()
    m.markedCompleted = true
end sub

sub exitPlayer()
    m.exited = true
end sub
