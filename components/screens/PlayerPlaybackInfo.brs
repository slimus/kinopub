' Optional overlay; never takes focus or controls playback.
function handlePlaybackInfoKey(key as String) as Boolean
    if m.playbackInfoGroup = invalid then return false
    if key = "options"
        togglePlaybackInfo()
        return true
    end if
    if key = "back" and m.playbackInfoGroup.visible
        closePlaybackInfo()
        return true
    end if
    return false
end function

sub togglePlaybackInfo()
    if m.playbackInfoGroup = invalid then return
    if m.playbackInfoGroup.visible
        closePlaybackInfo()
    else
        m.playbackInfoGroup.visible = true
        updatePlaybackInfo()
        m.playbackInfoTimer.control = "start"
    end if
end sub

sub closePlaybackInfo()
    if m.playbackInfoGroup <> invalid then m.playbackInfoGroup.visible = false
    if m.playbackInfoTimer <> invalid then m.playbackInfoTimer.control = "stop"
end sub

sub resetPlaybackInfoSamples()
    m.playbackInfoWidth = 0
    m.playbackInfoHeight = 0
    m.playbackInfoBitrate = 0
    m.playbackInfoDownloadRate = 0
end sub

sub recordPlaybackInfoStream(segment as Object)
    width = playbackDiagnosticNumber(playbackDiagnosticField(segment, "width"))
    height = playbackDiagnosticNumber(playbackDiagnosticField(segment, "height"))
    ' Audio-only segment events must not overwrite the playing video stats.
    if width <= 0 or height <= 0 then return
    m.playbackInfoWidth = Int(width)
    m.playbackInfoHeight = Int(height)
    m.playbackInfoBitrate = playbackDiagnosticNumber(playbackDiagnosticField(segment, "segBitrateBps"))
end sub

sub recordPlaybackInfoDownload(segment as Object)
    m.playbackInfoDownloadRate = 0
    status = playbackDiagnosticField(segment, "Status")
    if status <> invalid and status <> 0 then return
    duration = playbackDiagnosticNumber(playbackDiagnosticField(segment, "DownloadDuration"))
    size = playbackDiagnosticNumber(playbackDiagnosticField(segment, "SegSize"))
    if duration > 0 and size > 0 then m.playbackInfoDownloadRate = size * 8.0 * 1000.0 / duration
end sub

function playbackInfoRate(bitsPerSecond as Dynamic) as String
    value = playbackDiagnosticNumber(bitsPerSecond)
    if value <= 0 then return Chr(8212)
    tenths = Int(value / 100000.0 + 0.5)
    return StrI(Int(tenths / 10)).Trim() + "." + StrI(tenths mod 10).Trim() + " Mbps"
end function

function playbackInfoValue(value as Dynamic) as String
    text = playbackDiagnosticString(value)
    if text = "" then return Chr(8212)
    return text
end function

sub updatePlaybackInfo()
    if m.playbackInfoGroup = invalid then return
    if m.playbackInfoGroup.visible <> true or m.videoNode = invalid then return

    resolution = Chr(8212)
    if m.playbackInfoWidth > 0 and m.playbackInfoHeight > 0
        resolution = StrI(m.playbackInfoWidth).Trim() + " x " + StrI(m.playbackInfoHeight).Trim()
    end if
    state = playbackInfoValue(m.videoNode.state)
    if state = "buffering"
        percent = playbackDiagnosticField(m.videoNode.bufferingStatus, "percentage")
        if percent <> invalid
            value = playbackDiagnosticNumber(percent)
            if value >= 0 and value <= 100 then state = state + " " + StrI(Int(value)).Trim() + "%"
        end if
    end if
    lines = [
        "Resolution: " + resolution
        "Video: " + playbackInfoValue(m.videoNode.videoFormat)
        "Audio: " + playbackInfoValue(m.videoNode.audioFormat)
        "Video bitrate: " + playbackInfoRate(m.playbackInfoBitrate)
        "Last segment download: " + playbackInfoRate(m.playbackInfoDownloadRate)
        "State: " + state
    ]
    m.playbackInfoText.text = lines.Join(Chr(10))
end sub
