sub main()
    m.playbackInfoGroup = { visible: false }
    m.playbackInfoTimer = { control: "stop" }
    m.playbackInfoText = { text: "" }
    m.videoNode = { state: "playing", videoFormat: "hevc", audioFormat: "aac", control: "play" }
    resetPlaybackInfoSamples()
    check(onKeyEvent("options", false) = false, "Options release does not open panel")
    check(m.playbackInfoGroup.visible = false, "Panel starts hidden")
    check(onKeyEvent("options", true), "Options is consumed")
    check(m.playbackInfoGroup.visible and m.playbackInfoTimer.control = "start", "Options opens panel and starts refresh")
    check(m.videoNode.control = "play", "Opening does not pause playback")
    check(Instr(1, m.playbackInfoText.text, "Resolution: " + Chr(8212)) > 0, "Missing resolution is unavailable")
    check(handlePlaybackInfoKey("play") = false, "Transport keys pass through")
    m.resumePromptOpen = true
    check(onKeyEvent("back", true), "Back closes info before prompts")
    check(m.playbackInfoGroup.visible = false and m.playbackInfoTimer.control = "stop", "Closing stops refresh")
    check(handlePlaybackInfoKey("back") = false, "Back passes through when hidden")
    check(playbackInfoRate(0) = Chr(8212), "Missing bitrate is not zero Mbps")
    check(playbackInfoRate(12500000) = "12.5 Mbps", "Bitrate is converted to Mbps")
    recordPlaybackInfoStream({ width: 1920, height: 1080, segBitrateBps: 8000000 })
    recordPlaybackInfoStream({ width: 0, height: 0, segBitrateBps: 128000 })
    recordPlaybackInfoDownload({ Status: 0, SegSize: 1000000, DownloadDuration: 500 })
    handlePlaybackInfoKey("options")
    check(Instr(1, m.playbackInfoText.text, "1920 x 1080") > 0, "Audio segment cannot replace video resolution")
    check(Instr(1, m.playbackInfoText.text, "8.0 Mbps") > 0, "Video bitrate survives audio segments")
    check(Instr(1, m.playbackInfoText.text, "16.0 Mbps") > 0, "Download rate uses bytes and milliseconds")
    m.videoNode.state = "buffering"
    m.videoNode.bufferingStatus = { percentage: 42 }
    updatePlaybackInfo()
    check(Instr(1, m.playbackInfoText.text, "buffering 42%") > 0, "Buffering shows reported percentage")
    recordPlaybackInfoDownload({ Status: 1, SegSize: 1000000, DownloadDuration: 500 })
    check(m.playbackInfoDownloadRate = 0, "Failed download does not display a successful speed")
    recordPlaybackInfoDownload({ Status: 0, SegSize: 1000, DownloadDuration: 0 })
    check(m.playbackInfoDownloadRate = 0, "Zero duration does not divide by zero or retain stale speed")
    resetPlaybackInfoSamples()
    updatePlaybackInfo()
    check(Instr(1, m.playbackInfoText.text, "1920") = 0, "Stream replacement clears previous resolution")
    closePlaybackInfo()
    m.playbackInfoText.text = "unchanged"
    updatePlaybackInfo()
    check(m.playbackInfoText.text = "unchanged", "Hidden panel is not refreshed")
    print "Playback info tests passed."
end sub

sub check(condition as Boolean, message as String)
    if condition <> true then print "FAIL: " + message
end sub
