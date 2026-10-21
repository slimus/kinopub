sub main()
    resetPlayer()
    onVideoStateChanged({ getData: errorState })
    check(m.tasks.Count() = 1, "Unknown error saves progress")
    if m.tasks.Count() > 0
        check(m.tasks[0].request.timeSeconds = 123, "Error bypasses five-second save threshold")
        check(m.exitCount = 0, "Player stays alive until save completes")
        onProgressSaveResponse({ getData: savedResponse })
        check(m.exitCount = 1, "Successful save closes player")
        check(Instr(1, m.top.playbackError, "code=-3") > 0, "Unknown error includes code")
        check(Instr(1, m.top.playbackError, "decoder exploded") > 0, "Unknown error includes structured diagnostics")
        check(Instr(1, LCase(m.top.playbackError), "issue") > 0, "Unknown error explains how to report it")
        check(Instr(1, m.top.playbackError, "SECRET") = 0, "Diagnostic URLs and credentials are redacted")
    end if

    resetPlayer()
    m.videoNode.errorStr = "buffer loop exception:Requested reservation (1+99999999) is larger than the entire buffer (32000000)."
    onVideoStateChanged({ getData: errorState })
    check(m.tasks.Count() = 1 and m.exitCount = 0, "Known error also saves before exit")
    onProgressSaveResponse({ getData: failedResponse })
    check(m.exitCount = 1, "Save failure still lets user leave")
    check(Instr(1, m.top.playbackError, "Disable 4K") > 0, "Known error retains actionable message")
    check(Instr(1, m.top.playbackError, "Unable to save progress") > 0, "Save failure is visible")

    resetPlayer()
    m.videoNode.position = 119
    m.videoNode.state = "playing"
    onVideoPositionChanged()
    m.videoNode.position = 0
    m.videoNode.state = "error"
    onVideoPositionChanged()
    onVideoStateChanged({ getData: errorState })
    check(m.tasks.Count() = 1, "Reset video position does not lose progress")
    if m.tasks.Count() > 0 then check(m.tasks[0].request.timeSeconds = 119, "Last observed position survives error reset")

    resetPlayer()
    m.playbackStarted = false
    m.videoNode.position = 0
    m.playback.progressSeconds = 540
    onVideoStateChanged({ getData: errorState })
    if m.tasks.Count() > 0 then check(m.tasks[0].request.timeSeconds = 540, "Startup failure preserves saved progress")
    check(m.tasks.Count() = 1, "Startup failure saves existing progress")

    resetPlayer()
    m.playbackStarted = false
    m.videoNode.position = 0
    m.playback.progressSeconds = 0
    onVideoStateChanged({ getData: errorState })
    check(m.tasks.Count() = 0 and m.exitCount = 1, "Failure before any progress does not write zero")

    resetPlayer()
    m.lastSavedSeconds = 110
    sendProgressUpdate("interval")
    onVideoStateChanged({ getData: errorState })
    check(m.tasks.Count() = 1 and m.exitCount = 0, "Error waits for in-flight save")
    onProgressSaveResponse({ getData: savedResponse })
    check(m.tasks.Count() = 2 and m.exitCount = 0, "Final save follows in-flight save")
    onProgressSaveResponse({ getData: savedResponse })
    check(m.exitCount = 1, "Player exits after final save")

    resetPlayer()
    m.playback.isLive = true
    onVideoStateChanged({ getData: errorState })
    check(m.tasks.Count() = 0 and m.exitCount = 1, "Live errors close without watch-progress request")

    resetPlayer()
    m.playbackOptions.Push({ url: "https://example.com/other.m3u8" })
    check(tryNextPlaybackStream() = false, "HLS4 never retries fabricated or duplicate sources")
    check(m.playbackOptionIndex = 0, "HLS4 source stays unchanged")

    resetPlayer()
    onVideoStateChanged({ getData: errorState })
    onVideoStateChanged({ getData: errorState })
    check(m.tasks.Count() = 1 and m.exitCount = 0, "Repeated errors cannot duplicate final save")

    resetPlayer()
    m.videoNode.position = 0
    m.lastPlaybackPosition = 0
    onVideoStateChanged({ getData: errorState })
    if m.tasks.Count() > 0 then check(m.tasks[0].request.timeSeconds = 0, "Playback restarted from beginning does not restore old progress")

    check(Instr(1, redactPlaybackErrorDetails("Authorization: Bearer SECRET"), "SECRET") = 0, "Bearer header is fully redacted")
    check(Instr(1, redactPlaybackErrorDetails("{""authorization"":""Bearer SECRET"",""dbgmsg"":""decoder failure""}"), "SECRET") = 0, "Structured authorization is fully redacted")

    resetPlayer()
    m.playbackStarted = false
    m.playback.progressSeconds = 540
    onVideoStateChanged({ getData: finishedState })
    check(m.tasks.Count() = 1 and m.exitCount = 0, "Premature stream finish saves before exit")
    onProgressSaveResponse({ getData: savedResponse })
    check(m.exitCount = 1 and Instr(1, m.top.playbackError, "Stream ended") > 0, "Premature finish shows known explanation")

    m.detailScreen = {}
    m.dialogMessage = ""
    onPlayerPlaybackError({ getData: unknownMessage })
    onPlayerExitRequested({ getData: trueValue })
    check(m.dialogMessage = "Unknown decoder error", "Unknown errors survive card reload in a dialog")
    m.dialogMessage = ""
    onPlayerExitRequested({ getData: trueValue })
    check(m.dialogMessage = "", "Error dialog is consumed once")
    print "Player error handling tests passed."
end sub

sub resetPlayer()
    m.top = {}
    m.tasks = []
    m.exitCount = 0
    m.playback = { itemId: 7887, seasonNumber: 0, videoNumber: 1, progressSeconds: 80, streamUrl: "https://example.com/manifest/hls4/media.m3u8", streamFormat: "hls" }
    m.playbackOptions = [{ url: m.playback.streamUrl }]
    m.playbackOptionIndex = 0
    m.videoNode = { position: 123, errorCode: -3, errorMsg: "Unexpected problem", errorStr: "GET https://example.com/SECRET/path?token=SECRET failed", errorInfo: { dbgmsg: "decoder exploded", access_token: "SECRET" } }
    m.playbackStarted = true
    m.lastPlaybackPosition = 123
    m.lastSavedSeconds = 121
    m.progressSavePending = false
    m.playbackFailurePending = false
    m.progressTimer = {}
    m.railHideTimer = {}
    m.statusClearTimer = {}
    m.resumePromptTimer = {}
    m.nextEpisodeCountdownTimer = {}
    m.bufferingDebounceTimer = {}
    m.seekDebounceTimer = {}
end sub

function testContentTask() as Object
    task = { observeField: observeField }
    m.tasks.Push(task)
    return task
end function

sub observeField(field as String, callback as String)
end sub

function errorState() as String
    return "error"
end function

function finishedState() as String
    return "finished"
end function

function savedResponse() as Object
    return { ok: true, timeSeconds: 123 }
end function

function failedResponse() as Object
    return { ok: false }
end function

function unknownMessage() as String
    return "Unknown decoder error"
end function

function trueValue() as Boolean
    return true
end function

sub check(condition as Boolean, message as String)
    if condition <> true then print "FAIL: " + message
end sub

sub hideStreamLoader()
end sub

sub printVideoErrorDiagnostics()
end sub

sub setStatusMessage(message as String, autoClear as Boolean)
end sub

sub clearPendingSeek()
end sub

sub exitPlayer()
    m.exitCount++
end sub

sub closePlayerScreen()
end sub

sub showPlaybackErrorDialog(message as String)
    m.dialogMessage = message
end sub

sub updateSeekSettle()
end sub

sub updateProgressVisuals()
end sub

sub maybeRequestNextEpisodePrompt(reason as String)
end sub
