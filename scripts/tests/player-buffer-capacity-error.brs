sub main()
    m.top = {}
    m.retryCount = 0
    m.exitCount = 0
    m.progressTimer = {}
    m.railHideTimer = {}
    m.resumePromptTimer = {}
    m.nextEpisodeCountdownTimer = {}
    m.bufferingDebounceTimer = {}
    m.seekDebounceTimer = {}
    diagnostic = "buffer loop exception:Requested reservation (11065599+25960249) is larger than the entire buffer (31616000).:extra:content_id:1"
    m.videoNode = { errorCode: -3, errorMsg: "An unexpected problem", errorStr: diagnostic }
    onVideoStateChanged({ getData: errorState })
    check(m.top.playbackError = "Disable 4K in KinoPub device settings, then try again.", "Buffer capacity error gives an actionable 4K instruction")
    check(m.retryCount = 0 and m.exitCount = 1, "Capacity error exits without retrying the same heavy stream")

    extendDiagnostic = "buffer loop exception:Extend size (46976203 + 1850029) exceeds max_wrap_allocation (46977024):extra:content_id:1:source:buffer:loop:"
    m.videoNode.errorStr = extendDiagnostic
    m.top.playbackError = "unchanged"
    onVideoStateChanged({ getData: errorState })
    check(m.top.playbackError = capacityMessage(), "Wrap allocation error from TV gives the 4K instruction")
    check(m.retryCount = 0 and m.exitCount = 2, "Wrap allocation error exits without fallback")
    m.videoNode.errorStr = ""
    m.videoNode.errorInfo = { dbgmsg: extendDiagnostic }
    check(videoErrorDetails() = capacityMessage(), "Wrap allocation error is recognized in structured diagnostics")
    m.exitCount = 1

    m.videoNode.errorStr = ""
    m.videoNode.errorInfo = { dbgmsg: "buffer loop exception:Requested reservation (1+99999999) is larger than the entire buffer (32000000)." }
    check(videoErrorDetails() = "Disable 4K in KinoPub device settings, then try again.", "Structured diagnostics and other buffer sizes are recognized")

    m.videoNode.errorInfo = invalid
    m.videoNode.errorStr = "unrelated buffer loop exception"
    m.top.playbackError = "unchanged"
    onVideoStateChanged({ getData: errorState })
    check(m.retryCount = 1 and m.exitCount = 1, "Other -3 errors retain existing fallback behavior")
    check(m.top.playbackError = "unchanged", "Other -3 errors do not advise disabling 4K")
    check(Instr(1, videoErrorDetails(), "code=-3") > 0, "Generic diagnostics remain available for other errors")

    m.videoNode.errorStr = "Requested reservation (1+2) failed for another reason"
    check(Instr(1, videoErrorDetails(), "Disable 4K") = 0, "Incomplete signatures do not match")
    m.videoNode.errorStr = "buffer loop exception:Extend size (1 + 2) failed for another reason"
    check(Instr(1, videoErrorDetails(), "Disable 4K") = 0, "Other extension failures are not treated as capacity errors")
    m.videoNode.errorStr = diagnostic
    m.videoNode.errorCode = -1
    check(Instr(1, videoErrorDetails(), "Disable 4K") = 0, "Different error codes keep the normal handler")
    m.videoNode = invalid
    check(Instr(1, videoErrorDetails(), "Disable 4K") = 0, "Missing video node is safe")
    m.detailScreen = {}
    m.dialogMessage = ""
    m.cardClosed = false
    onPlayerPlaybackError({ getData: capacityMessage })
    onPlayerExitRequested({ getData: trueValue })
    check(m.dialogMessage = capacityMessage() and m.cardClosed, "4K instruction is shown after returning to the card, surviving its reload")
    m.dialogMessage = ""
    onPlayerExitRequested({ getData: trueValue })
    check(m.dialogMessage = "", "Capacity dialog is consumed only once")
    onPlayerPlaybackError({ getData: genericMessage })
    onPlayerExitRequested({ getData: trueValue })
    check(m.dialogMessage = "Other error", "Other errors also appear in a persistent dialog")
    print "Buffer capacity error tests passed."
end sub

function capacityMessage() as String
    return "Disable 4K in KinoPub device settings, then try again."
end function

function genericMessage() as String
    return "Other error"
end function

function trueValue() as Boolean
    return true
end function

sub closePlayerScreen()
    m.cardClosed = true
end sub

sub showPlaybackErrorDialog(message as String)
    m.dialogMessage = message
end sub

function errorState() as String
    return "error"
end function

sub check(condition as Boolean, message as String)
    if condition <> true then print "FAIL: " + message
end sub

sub hideStreamLoader()
end sub

sub printVideoErrorDiagnostics()
end sub

function tryNextPlaybackStream() as Boolean
    m.retryCount++
    return true
end function

sub exitPlayer()
    m.exitCount++
    m.playbackFailurePending = false
end sub

sub clearPendingSeek()
end sub

sub sendProgressUpdate(reason as String)
    if reason = "error" then finishPlaybackFailure(true)
end sub
