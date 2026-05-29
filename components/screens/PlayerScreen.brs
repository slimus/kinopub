sub init()
    m.videoNode = m.top.findNode("videoNode")
    m.videoNode.enableUI = false
    configureVideoHttpAgent()
    m.resumePromptGroup = m.top.findNode("resumePromptGroup")
    m.resumePromptMessageLabel = m.top.findNode("resumePromptMessageLabel")
    m.resumePromptOptionsHost = m.top.findNode("resumePromptOptionsHost")
    m.resumePromptCountdownLabel = m.top.findNode("resumePromptCountdownLabel")
    m.bottomRailGroup = m.top.findNode("bottomRailGroup")
    m.titleLabel = m.top.findNode("titleLabel")
    m.timeLabel = m.top.findNode("timeLabel")
    m.progressFocus = m.top.findNode("progressFocus")
    m.progressTrack = m.top.findNode("progressTrack")
    m.progressFill = m.top.findNode("progressFill")
    m.controlsHost = m.top.findNode("controlsHost")
    m.focusCursor = m.top.findNode("focusCursor")
    m.menuPopover = m.top.findNode("menuPopover")
    m.menuBackground = m.top.findNode("menuBackground")
    m.menuTitleLabel = m.top.findNode("menuTitleLabel")
    m.menuItemsHost = m.top.findNode("menuItemsHost")
    m.statusLabel = m.top.findNode("statusLabel")
    m.railHideTimer = m.top.findNode("railHideTimer")
    m.progressTimer = m.top.findNode("progressTimer")
    m.statusClearTimer = m.top.findNode("statusClearTimer")
    m.resumePromptTimer = m.top.findNode("resumePromptTimer")
    m.seekDebounceTimer = m.top.findNode("seekDebounceTimer")
    m.seekSettleTimer = m.top.findNode("seekSettleTimer")

    m.playback = invalid
    m.preferences = {}
    m.preferenceStore = PlayerPreferenceStore()
    m.controls = []
    m.controlNodes = []
    m.controlPositions = [72, 322, 572, 822]
    m.controlSpacing = 250
    m.controlFocusY = 106
    m.focusArea = "controls"
    m.focusIndex = 0
    m.menuOpen = false
    m.menuType = ""
    m.menuItems = []
    m.menuIndex = 0
    m.menuScrollStart = 0
    m.maxVisibleMenuItems = 6
    m.resumePromptOpen = false
    m.resumePromptIndex = 0
    m.resumeStartPosition = 0
    m.resumeCountdownSeconds = 15
    m.resumePromptOptionNodes = []
    m.isPlaying = false
    m.playbackStarted = false
    m.savedAudioPreferenceApplied = false
    m.lastSavedSeconds = -1
    m.completed = false
    m.seekStepSeconds = 30
    m.seekPending = false
    m.pendingSeekPosition = invalid
    m.playbackOptions = []
    m.playbackOptionIndex = 0

    m.top.observeField("playback", "onPlaybackChanged")
    m.videoNode.observeField("state", "onVideoStateChanged")
    m.videoNode.observeField("position", "onVideoPositionChanged")
    m.videoNode.observeField("availableAudioTracks", "onAvailableAudioTracksChanged")
    m.videoNode.observeField("availableSubtitleTracks", "onAvailableSubtitleTracksChanged")
    m.railHideTimer.observeField("fire", "onRailHideTimer")
    m.progressTimer.observeField("fire", "onProgressTimer")
    m.statusClearTimer.observeField("fire", "onStatusClearTimer")
    m.resumePromptTimer.observeField("fire", "onResumePromptTimer")
    m.seekDebounceTimer.observeField("fire", "onSeekDebounceTimer")
    m.seekSettleTimer.observeField("fire", "onSeekSettleTimer")
    m.top.setFocus(true)
end sub

sub configureVideoHttpAgent()
    if m.videoNode = invalid then return

    m.videoHttpAgent = CreateObject("roHttpAgent")
    m.videoHttpAgent.AddHeader("User-Agent", "Roku/DVP-12.0 (12.0.0.0)")
    if m.videoNode.setHttpAgent(m.videoHttpAgent) <> true
        print "PlayerScreen: failed to attach video HTTP agent"
    end if
end sub

sub onPlaybackChanged(event as Object)
    m.playback = event.getData()
    if m.playback = invalid then return

    m.preferences = m.preferenceStore.load(m.playback)
    m.titleLabel.text = playbackTitle()
    buildControls()
    showRail()
    updateProgressVisuals()
    startPlayback()
end sub

function playbackTitle() as String
    if m.playback = invalid then return ""
    title = ""
    if m.playback.title <> invalid then title = m.playback.title
    itemTitle = ""
    if m.playback.itemTitle <> invalid then itemTitle = m.playback.itemTitle
    subtitle = ""
    if m.playback.subtitle <> invalid then subtitle = m.playback.subtitle

    if itemTitle <> "" and (title = "" or title = "Video")
        title = itemTitle
    else if itemTitle <> "" and title <> itemTitle
        title = itemTitle + " - " + title
    end if

    if subtitle <> "" and subtitle <> title then return title + " - " + subtitle
    return title
end function

sub startPlayback()
    if m.playback = invalid then return
    if m.playback.streamUrl = invalid or m.playback.streamUrl = ""
        m.top.playbackError = "No playable video is available."
        m.top.exitRequested = true
        return
    end if

    m.playbackOptions = playbackStreamOptions()
    m.playbackOptionIndex = 0
    m.savedAudioPreferenceApplied = false
    logPlaybackStart()
    content = playbackContentNode(savedPreferredSubtitleTrackName())
    m.videoNode.content = content
    startPosition = resumeStartSeconds()
    if startPosition > 0
        showResumePrompt(startPosition)
        return
    end if
    startPlaybackAtPosition(0)
end sub

function playbackContentNode(preferredSubtitleTrackName as String) as Object
    stream = currentPlaybackStream()
    content = CreateObject("roSGNode", "ContentNode")
    content.url = stream.url
    content.title = playbackTitle()
    content.HttpHeaders = ["User-Agent: Roku/DVP-12.0 (12.0.0.0)"]
    subtitleTracks = contentSubtitleTracksForPreferred(preferredSubtitleTrackName)
    if subtitleTracks.Count() > 0 then content.SubtitleTracks = subtitleTracks
    if preferredSubtitleTrackName <> "" then content.SubtitleConfig = { TrackName: preferredSubtitleTrackName }
    if stream.streamFormat = "hls"
        content.streamFormat = "hls"
    else
        content.streamFormat = "mp4"
    end if

    return content
end function

function playbackStreamOptions() as Object
    options = []
    seen = {}
    if m.playback = invalid then return options

    addPlaybackStreamOption(options, seen, "default", "Default", m.playback.streamUrl, m.playback.streamFormat)
    if m.playback.qualityOptions <> invalid
        for each option in m.playback.qualityOptions
            if option <> invalid
                label = trackLabel(option)
                if label = "" then label = "Fallback " + StrI(options.Count() + 1).Trim()
                id = menuItemId(option)
                if id = "" then id = label
                streamFormat = "mp4"
                if option.streamFormat <> invalid then streamFormat = option.streamFormat
                addPlaybackStreamOption(options, seen, id, label, option.url, streamFormat)
            end if
        end for
    end if

    return options
end function

sub addPlaybackStreamOption(options as Object, seen as Object, id as String, label as String, url as Dynamic, streamFormat as Dynamic)
    if url = invalid or url = "" then return
    if seen.DoesExist(url) then return

    format = "mp4"
    if streamFormat <> invalid and streamFormat <> "" then format = streamFormat
    options.Push({
        id: id
        label: label
        url: url
        streamFormat: format
    })
    seen[url] = true

    directMediaPlaylistUrl = hlsDirectMediaPlaylistUrl(url)
    if format = "hls" and directMediaPlaylistUrl <> "" and not seen.DoesExist(directMediaPlaylistUrl)
        options.Push({
            id: id + "-media"
            label: label + " media"
            url: directMediaPlaylistUrl
            streamFormat: "hls"
        })
        seen[directMediaPlaylistUrl] = true
    end if
end sub

function hlsDirectMediaPlaylistUrl(url as String) as String
    marker = "master-v"
    extension = ".m3u8"
    markerPosition = Instr(1, url, marker)
    if markerPosition = 0 then return ""

    streamIdStart = markerPosition + Len(marker)
    streamIdEnd = Instr(streamIdStart, url, extension)
    if streamIdEnd = 0 then return ""

    streamId = Mid(url, streamIdStart, streamIdEnd - streamIdStart)
    audioMarkerPosition = Instr(1, streamId, "a")
    if audioMarkerPosition <= 1 then return ""
    if audioMarkerPosition >= Len(streamId) then return ""

    videoId = Left(streamId, audioMarkerPosition - 1)
    audioId = Mid(streamId, audioMarkerPosition + 1)
    directName = "index-v" + videoId + "-a" + audioId + extension
    return Left(url, markerPosition - 1) + directName + Mid(url, streamIdEnd + Len(extension))
end function

function currentPlaybackStream() as Object
    if m.playbackOptions <> invalid and m.playbackOptionIndex >= 0 and m.playbackOptionIndex < m.playbackOptions.Count()
        return m.playbackOptions[m.playbackOptionIndex]
    end if

    if m.playback <> invalid
        return {
            id: "default"
            label: "Default"
            url: m.playback.streamUrl
            streamFormat: m.playback.streamFormat
        }
    end if

    return { id: "default", label: "Default", url: "", streamFormat: "mp4" }
end function

sub logPlaybackStart()
    streamUrl = ""
    streamFormat = ""
    title = ""
    mediaId = 0
    itemId = 0
    stream = currentPlaybackStream()
    if m.playback <> invalid
        if m.playback.title <> invalid then title = m.playback.title
        if m.playback.mediaId <> invalid then mediaId = m.playback.mediaId
        if m.playback.itemId <> invalid then itemId = m.playback.itemId
    end if
    if stream.url <> invalid then streamUrl = stream.url
    if stream.streamFormat <> invalid then streamFormat = stream.streamFormat

    print "PlayerScreen: start playback itemId="; itemId; " mediaId="; mediaId; " title="; title
    print "PlayerScreen: stream option="; StrI(m.playbackOptionIndex + 1).Trim(); "/"; StrI(m.playbackOptions.Count()).Trim(); " label="; stream.label
    print "PlayerScreen: stream format="; streamFormat; " url="; streamUrl
end sub

sub startPlaybackAtPosition(startPosition as Integer)
    m.playbackStarted = false
    if startPosition > 0 then m.videoNode.seek = startPosition
    m.top.setFocus(true)
    m.videoNode.control = "play"
    m.isPlaying = true
    m.progressTimer.control = "start"
    sendProgressUpdate("start")
end sub

sub showResumePrompt(startPosition as Integer)
    m.resumeStartPosition = startPosition
    m.resumePromptOpen = true
    m.resumePromptIndex = 0
    m.resumeCountdownSeconds = 15
    m.resumePromptMessageLabel.text = "Saved position: " + formatTime(startPosition)
    renderResumePromptOptions()
    updateResumePromptCountdown()
    m.bottomRailGroup.visible = false
    m.resumePromptGroup.visible = true
    m.resumePromptTimer.control = "start"
end sub

sub renderResumePromptOptions()
    childCount = m.resumePromptOptionsHost.getChildCount()
    if childCount > 0 then m.resumePromptOptionsHost.removeChildrenIndex(childCount, 0)
    m.resumePromptOptionNodes = []

    labels = ["Resume from " + formatTime(m.resumeStartPosition), "Start from beginning"]
    for index = 0 to labels.Count() - 1
        group = CreateObject("roSGNode", "Group")
        group.translation = [0, index * 58]

        bg = CreateObject("roSGNode", "Rectangle")
        bg.width = 440
        bg.height = 46
        bg.color = "#374151"
        if index = m.resumePromptIndex then bg.color = "#E5E7EB"
        group.appendChild(bg)

        label = CreateObject("roSGNode", "Label")
        label.translation = [18, 12]
        label.width = 404
        label.text = labels[index]
        label.color = "#D1D5DB"
        if index = m.resumePromptIndex then label.color = "#111827"
        group.appendChild(label)

        m.resumePromptOptionsHost.appendChild(group)
        m.resumePromptOptionNodes.Push(group)
    end for
end sub

sub updateResumePromptCountdown()
    m.resumePromptCountdownLabel.text = "Auto-resume in " + StrI(m.resumeCountdownSeconds).Trim() + " sec"
end sub

function resumeStartSeconds() as Integer
    if m.playback = invalid or m.playback.progressSeconds = invalid then return 0
    progress = m.playback.progressSeconds
    duration = playbackDurationSeconds()

    if progress < 15 then return 0
    if duration > 0
        if progress >= duration - 30 then return 0
        if Int((progress * 100) / duration) >= 90 then return 0
    end if

    return progress
end function

sub buildControls()
    childCount = m.controlsHost.getChildCount()
    if childCount > 0 then m.controlsHost.removeChildrenIndex(childCount, 0)
    m.controls = ["playPause", "audio", "subtitles", "quality"]
    m.controlNodes = []

    labels = controlLabels()
    for index = 0 to labels.Count() - 1
        label = CreateObject("roSGNode", "Label")
        label.text = labels[index]
        label.translation = [index * m.controlSpacing + 24, 13]
        label.width = 208
        label.color = "#F5F5F5"
        m.controlsHost.appendChild(label)
        m.controlNodes.Push(label)
    end for

    updateFocusCursor()
end sub

function controlLabels() as Object
    playLabel = "Play"
    if m.isPlaying then playLabel = "Pause"

    return [playLabel, "Audio: " + selectedAudioLabel(), "Subs: " + selectedSubtitleLabel(), "Quality: " + selectedQualityLabel()]
end function

sub updateControlLabels()
    if m.controlNodes = invalid or m.controlNodes.Count() = 0 then return

    labels = controlLabels()
    for index = 0 to labels.Count() - 1
        if index < m.controlNodes.Count() then m.controlNodes[index].text = labels[index]
    end for
end sub

sub updatePlayPauseControlLabel()
    updateControlLabels()
end sub

sub showRail()
    m.bottomRailGroup.visible = true
    updateFocusCursor()
    if m.isPlaying and m.menuOpen <> true then m.railHideTimer.control = "start"
end sub

sub onRailHideTimer()
    if m.isPlaying and m.menuOpen <> true
        m.bottomRailGroup.visible = false
        updateFocusCursor()
    end if
end sub

sub updateFocusCursor()
    if m.focusArea = "progress"
        m.focusCursor.visible = false
        m.progressFocus.visible = m.bottomRailGroup.visible and m.menuOpen <> true
        return
    end if

    m.focusCursor.translation = [m.controlPositions[m.focusIndex], m.controlFocusY]
    m.focusCursor.visible = m.bottomRailGroup.visible and m.menuOpen <> true
    m.progressFocus.visible = false
end sub

sub updateProgressVisuals()
    position = displayPositionSeconds()
    duration = playbackDurationSeconds()
    m.timeLabel.text = formatTime(position) + " / " + formatTime(duration)

    width = 0
    if duration > 0
        width = Int((position * 1136) / duration)
        if width > 1136 then width = 1136
    end if
    m.progressFill.width = width
end sub

function currentPositionSeconds() as Integer
    if m.videoNode = invalid or m.videoNode.position = invalid then return 0
    return Int(m.videoNode.position)
end function

function displayPositionSeconds() as Integer
    if m.seekPending and m.pendingSeekPosition <> invalid then return m.pendingSeekPosition
    return currentPositionSeconds()
end function

function playbackDurationSeconds() as Integer
    if m.playback = invalid or m.playback.durationSeconds = invalid then return 0
    return m.playback.durationSeconds
end function

function formatTime(seconds as Integer) as String
    if seconds < 0 then seconds = 0
    minutes = Int(seconds / 60)
    remaining = seconds - (minutes * 60)
    remainingText = StrI(remaining).Trim()
    if remaining < 10 then remainingText = "0" + remainingText
    return StrI(minutes).Trim() + ":" + remainingText
end function

sub onVideoStateChanged(event as Object)
    state = event.getData()
    print "PlayerScreen: video state="; state
    if state = "playing"
        m.isPlaying = true
        m.playbackStarted = true
        m.progressTimer.control = "start"
        updatePlayPauseControlLabel()
        showRail()
    else if state = "paused" or state = "buffering"
        m.isPlaying = false
        m.railHideTimer.control = "stop"
        if state = "paused" then sendProgressUpdate("pause")
        updatePlayPauseControlLabel()
        showRail()
    else if state = "finished"
        if m.playbackStarted <> true
            print "PlayerScreen: stream finished before playback started"
            if tryNextPlaybackStream() then return
            m.top.playbackError = "Unable to play this video. Stream ended before playback started."
            exitPlayer()
            return
        end if
        m.completed = true
        markCompletedIfSafe()
        exitPlayer()
    else if state = "error"
        printVideoErrorDiagnostics()
        if tryNextPlaybackStream() then return
        details = videoErrorDetails()
        print "PlayerScreen: video error "; details
        m.top.playbackError = details
        exitPlayer()
    end if
end sub

function tryNextPlaybackStream() as Boolean
    if m.playbackOptions = invalid then return false
    if m.playbackOptionIndex >= m.playbackOptions.Count() - 1 then return false

    m.playbackOptionIndex = m.playbackOptionIndex + 1
    stream = currentPlaybackStream()
    print "PlayerScreen: retrying playback with stream option="; StrI(m.playbackOptionIndex + 1).Trim(); "/"; StrI(m.playbackOptions.Count()).Trim(); " label="; stream.label
    print "PlayerScreen: retry stream format="; stream.streamFormat; " url="; stream.url

    m.videoNode.control = "stop"
    m.playbackStarted = false
    m.videoNode.content = playbackContentNode(savedPreferredSubtitleTrackName())
    m.videoNode.control = "play"
    return true
end function

function videoErrorDetails() as String
    code = 0
    message = ""
    diagnostic = ""
    if m.videoNode <> invalid
        if m.videoNode.errorCode <> invalid then code = m.videoNode.errorCode
        if m.videoNode.errorMsg <> invalid then message = m.videoNode.errorMsg
        if m.videoNode.errorStr <> invalid then diagnostic = m.videoNode.errorStr
    end if

    details = "Unable to play this video. code=" + StrI(code).Trim()
    if message <> "" then details = details + " msg=" + message
    if diagnostic <> "" then details = details + " diag=" + diagnostic
    return details
end function

sub printVideoErrorDiagnostics()
    if m.videoNode = invalid then return

    print "PlayerScreen: errorCode="; m.videoNode.errorCode
    print "PlayerScreen: errorMsg="; m.videoNode.errorMsg
    print "PlayerScreen: errorStr="; m.videoNode.errorStr
    if m.videoNode.errorInfo <> invalid
        print "PlayerScreen: errorInfo="; FormatJson(m.videoNode.errorInfo)
    end if
end sub

sub onVideoPositionChanged()
    updateSeekSettle()
    updateProgressVisuals()
end sub

sub onAvailableAudioTracksChanged()
    applySavedAudioPreference()
    updateControlLabels()
end sub

sub onAvailableSubtitleTracksChanged()
    applySavedSubtitlePreference()
    updateControlLabels()
end sub

sub onProgressTimer()
    if m.isPlaying then sendProgressUpdate("interval")
end sub

sub onResumePromptTimer()
    if m.resumePromptOpen <> true then return

    m.resumeCountdownSeconds = m.resumeCountdownSeconds - 1
    if m.resumeCountdownSeconds <= 0
        chooseResumePromptOption(0)
    else
        updateResumePromptCountdown()
    end if
end sub

sub sendProgressUpdate(reason as String)
    if m.playback = invalid then return

    position = currentPositionSeconds()
    if position < 0 then position = 0
    if reason = "start" and position < 15 then return
    if reason <> "exit" and m.lastSavedSeconds >= 0
        delta = position - m.lastSavedSeconds
        if delta < 0 then delta = 0 - delta
        if delta < 5 then return
    end if

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "savePlaybackProgress"
    task.request = {
        itemId: m.playback.itemId
        seasonNumber: m.playback.seasonNumber
        videoNumber: m.playback.videoNumber
        timeSeconds: position
    }
    task.observeField("response", "onProgressSaveResponse")
    task.control = "RUN"
    m.progressTask = task
    setStatusMessage("Saving progress...", false)
end sub

sub onProgressSaveResponse(event as Object)
    result = event.getData()
    if result <> invalid and result.ok = true
        m.lastSavedSeconds = result.timeSeconds
        setStatusMessage("Progress saved", true)
    else
        setStatusMessage("Unable to save progress", false)
    end if
end sub

sub markCompletedIfSafe()
    if m.playback = invalid then return

    if m.playback.watched = true
        sendProgressUpdate("finished")
        return
    end if

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "markPlaybackWatched"
    task.request = {
        itemId: m.playback.itemId
        seasonNumber: m.playback.seasonNumber
        videoNumber: m.playback.videoNumber
        watched: m.playback.watched
    }
    task.observeField("response", "onMarkWatchedResponse")
    task.control = "RUN"
    m.watchedTask = task
    setStatusMessage("Saving progress...", false)
end sub

sub onMarkWatchedResponse(event as Object)
    result = event.getData()
    if result <> invalid and result.ok = true
        setStatusMessage("Progress saved", true)
    else
        sendProgressUpdate("finished")
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press <> true then return false

    if m.resumePromptOpen then return handleResumePromptKey(key)

    if key = "back"
        sendProgressUpdate("exit")
        exitPlayer()
        return true
    end if

    if m.bottomRailGroup.visible <> true
        showRail()
        if isTransportKey(key) then return handleTransportKey(key)
        return true
    end if

    if m.menuOpen then return handleMenuKey(key)

    if m.focusArea = "progress" then return handleProgressKey(key)

    if key = "up"
        m.focusArea = "progress"
        updateFocusCursor()
        showRail()
        return true
    else if key = "left"
        if m.focusIndex > 0 then m.focusIndex = m.focusIndex - 1
        updateFocusCursor()
        showRail()
        return true
    else if key = "right"
        if m.focusIndex < m.controls.Count() - 1 then m.focusIndex = m.focusIndex + 1
        updateFocusCursor()
        showRail()
        return true
    else if key = "OK"
        activateFocusedControl()
        showRail()
        return true
    else if isTransportKey(key)
        return handleTransportKey(key)
    end if

    showRail()
    return true
end function

function handleResumePromptKey(key as String) as Boolean
    if key = "back"
        m.resumePromptTimer.control = "stop"
        m.resumePromptOpen = false
        m.resumePromptGroup.visible = false
        exitPlayer()
        return true
    else if key = "left" or key = "up"
        if m.resumePromptIndex > 0 then m.resumePromptIndex = m.resumePromptIndex - 1
        renderResumePromptOptions()
        return true
    else if key = "right" or key = "down"
        if m.resumePromptIndex < 1 then m.resumePromptIndex = m.resumePromptIndex + 1
        renderResumePromptOptions()
        return true
    else if key = "OK" or key = "play"
        chooseResumePromptOption(m.resumePromptIndex)
        return true
    end if

    return true
end function

sub chooseResumePromptOption(index as Integer)
    startPosition = m.resumeStartPosition
    if index = 1 then startPosition = 0

    m.resumePromptTimer.control = "stop"
    m.resumePromptOpen = false
    m.resumePromptGroup.visible = false
    if index = 1
        restartPlaybackFromBeginning()
        return
    end if
    startPlaybackAtPosition(startPosition)
end sub

sub restartPlaybackFromBeginning()
    m.videoNode.control = "stop"
    m.videoNode.content = playbackContentNode(savedPreferredSubtitleTrackName())
    m.videoNode.seek = 0
    startPlaybackAtPosition(0)
end sub

function isTransportKey(key as String) as Boolean
    return key = "play" or key = "replay" or key = "rewind" or key = "fastforward" or key = "rev" or key = "fwd"
end function

function handleTransportKey(key as String) as Boolean
    if key = "play"
        togglePlayPause()
    else if key = "replay" or key = "rewind" or key = "rev"
        seekBy(0 - m.seekStepSeconds)
    else if key = "fastforward" or key = "fwd"
        seekBy(m.seekStepSeconds)
    end if
    return true
end function

function handleProgressKey(key as String) as Boolean
    if key = "down"
        m.focusArea = "controls"
        updateFocusCursor()
    else if key = "left"
        seekBy(0 - m.seekStepSeconds)
    else if key = "right"
        seekBy(m.seekStepSeconds)
    else if isTransportKey(key)
        return handleTransportKey(key)
    else if key = "back"
        sendProgressUpdate("exit")
        exitPlayer()
    end if

    showRail()
    return true
end function

sub togglePlayPause()
    if m.isPlaying
        m.videoNode.control = "pause"
        m.isPlaying = false
    else
        m.videoNode.control = "resume"
        m.isPlaying = true
    end if
    buildControls()
end sub

sub seekBy(deltaSeconds as Integer)
    basePosition = currentPositionSeconds()
    if m.seekPending and m.pendingSeekPosition <> invalid then basePosition = m.pendingSeekPosition

    nextPosition = clampedSeekPosition(basePosition + deltaSeconds)
    m.pendingSeekPosition = nextPosition
    m.seekPending = true
    m.seekDebounceTimer.control = "stop"
    m.seekDebounceTimer.control = "start"
    updateProgressVisuals()
end sub

function clampedSeekPosition(position as Integer) as Integer
    nextPosition = position
    if nextPosition < 0 then nextPosition = 0
    duration = playbackDurationSeconds()
    if duration > 0 and nextPosition > duration - 1 then nextPosition = duration - 1
    return nextPosition
end function

sub onSeekDebounceTimer()
    applyPendingSeek()
end sub

sub applyPendingSeek()
    if m.seekPending <> true or m.pendingSeekPosition = invalid then return

    nextPosition = clampedSeekPosition(m.pendingSeekPosition)
    m.videoNode.seek = nextPosition
    m.seekSettleTimer.control = "stop"
    m.seekSettleTimer.control = "start"
    updateProgressVisuals()
end sub

sub updateSeekSettle()
    if m.seekPending <> true or m.pendingSeekPosition = invalid then return

    position = currentPositionSeconds()
    delta = position - m.pendingSeekPosition
    if delta < 0 then delta = 0 - delta
    if delta <= 2 then clearPendingSeek()
end sub

sub onSeekSettleTimer()
    clearPendingSeek()
    updateProgressVisuals()
end sub

sub clearPendingSeek()
    m.seekSettleTimer.control = "stop"
    m.seekPending = false
    m.pendingSeekPosition = invalid
end sub

sub activateFocusedControl()
    control = m.controls[m.focusIndex]
    if control = "playPause"
        togglePlayPause()
    else if control = "audio"
        openMenu("audio")
    else if control = "subtitles"
        openMenu("subtitles")
    else if control = "quality"
        openMenu("quality")
    end if
end sub

sub openMenu(menuType as String)
    m.menuOpen = true
    m.menuType = menuType
    m.menuIndex = 0
    m.menuScrollStart = 0
    if menuType = "audio"
        m.menuItems = audioMenuItems()
    else if menuType = "subtitles"
        m.menuItems = subtitleMenuItems()
    else
        m.menuItems = qualityMenuItems()
    end if
    updateMenuTitle()
    renderMenuItems()
    m.menuPopover.visible = true
    m.focusCursor.visible = false
    m.railHideTimer.control = "stop"
end sub

sub closeMenu()
    m.menuOpen = false
    m.menuType = ""
    m.menuPopover.visible = false
    m.focusCursor.visible = true
    updateFocusCursor()
    showRail()
end sub

sub renderMenuItems()
    childCount = m.menuItemsHost.getChildCount()
    if childCount > 0 then m.menuItemsHost.removeChildrenIndex(childCount, 0)

    ensureMenuSelectionVisible()
    updateMenuTitle()
    if m.menuItems.Count() = 0 then return

    lastVisibleIndex = m.menuScrollStart + m.maxVisibleMenuItems - 1
    if lastVisibleIndex >= m.menuItems.Count() then lastVisibleIndex = m.menuItems.Count() - 1

    for index = m.menuScrollStart to lastVisibleIndex
        item = m.menuItems[index]
        row = CreateObject("roSGNode", "Label")
        visibleIndex = index - m.menuScrollStart
        row.translation = [0, visibleIndex * 32]
        row.width = 384
        row.color = "#D1D5DB"
        if index = m.menuIndex then row.color = "#F5F5F5"
        prefix = "   "
        if isSelectedMenuItem(item) then prefix = "* "
        row.text = prefix + item.label
        m.menuItemsHost.appendChild(row)
    end for
end sub

sub ensureMenuSelectionVisible()
    if m.menuIndex < m.menuScrollStart
        m.menuScrollStart = m.menuIndex
    else if m.menuIndex >= m.menuScrollStart + m.maxVisibleMenuItems
        m.menuScrollStart = m.menuIndex - m.maxVisibleMenuItems + 1
    end if

    maxStart = m.menuItems.Count() - m.maxVisibleMenuItems
    if maxStart < 0 then maxStart = 0
    if m.menuScrollStart > maxStart then m.menuScrollStart = maxStart
    if m.menuScrollStart < 0 then m.menuScrollStart = 0
end sub

sub updateMenuTitle()
    title = "Quality"
    if m.menuType = "audio"
        title = "Audio"
    else if m.menuType = "subtitles"
        title = "Subtitles"
    end if

    if m.menuItems <> invalid and m.menuItems.Count() > 0
        positionText = StrI(m.menuIndex + 1).Trim() + " / " + StrI(m.menuItems.Count()).Trim()
        m.menuTitleLabel.text = title + "  " + positionText
    else
        m.menuTitleLabel.text = title
    end if
end sub

function isSelectedMenuItem(item as Object) as Boolean
    if item = invalid then return false

    if m.menuType = "audio"
        return menuItemId(item) = m.preferenceStore.stringField(m.preferences, "audioTrackId", "")
    else if m.menuType = "subtitles"
        selectedId = m.preferenceStore.stringField(m.preferences, "subtitleTrackId", "")
        if selectedId = "" then selectedId = "off"
        return menuItemId(item) = selectedId
    else if m.menuType = "quality"
        selectedQuality = m.preferenceStore.stringField(m.preferences, "qualityId", "")
        if selectedQuality <> "" and menuItemId(item) = selectedQuality then return true

        selectedUrl = m.preferenceStore.stringField(m.preferences, "qualityUrl", "")
        if selectedUrl <> "" and item.url <> invalid and item.url = selectedUrl then return true

        return selectedQuality = "" and item.url <> invalid and m.playback <> invalid and item.url = m.playback.streamUrl
    end if

    return false
end function

function menuItemId(item as Object) as String
    if item = invalid then return ""
    if item.id <> invalid then return item.id
    return trackIdentifier(item)
end function

function contentSubtitleTracks() as Object
    return contentSubtitleTracksForPreferred("")
end function

function contentSubtitleTracksForPreferred(preferredTrackName as String) as Object
    tracks = []
    if m.playback = invalid or m.playback.subtitleTracks = invalid then return tracks

    for each track in m.playback.subtitleTracks
        trackName = subtitleTrackName(track)
        if trackName <> "" and trackName = preferredTrackName
            tracks.Push(subtitleTrackMetadata(track, trackName))
        end if
    end for

    for each track in m.playback.subtitleTracks
        trackName = subtitleTrackName(track)
        if trackName <> "" and trackName <> preferredTrackName
            tracks.Push(subtitleTrackMetadata(track, trackName))
        end if
    end for

    return tracks
end function

function subtitleTrackMetadata(track as Dynamic, trackName as String) as Object
    return {
        Language: trackLanguage(track)
        Description: trackLabel(track)
        TrackName: trackName
    }
end function

function audioMenuItems() as Object
    items = []
    if m.videoNode <> invalid and m.videoNode.availableAudioTracks <> invalid and m.videoNode.availableAudioTracks.Count() > 0
        seen = {}
        for each track in m.videoNode.availableAudioTracks
            label = trackLabel(track)
            if label = "" then label = "Audio " + StrI(items.Count() + 1).Trim()
            appendUniqueTrackMenuItem(items, seen, {
                id: trackIdentifier(track)
                label: label
                language: trackLanguage(track)
                Track: trackIdentifier(track)
            })
        end for
    else if m.playback <> invalid and m.playback.audioTracks <> invalid and m.playback.audioTracks.Count() > 0
        seen = {}
        for each track in m.playback.audioTracks
            label = trackLabel(track)
            if label = "" then label = "Audio " + StrI(items.Count() + 1).Trim()
            appendUniqueTrackMenuItem(items, seen, {
                id: menuItemId(track)
                label: label
                language: trackLanguage(track)
                Track: trackIdentifier(track)
            })
        end for
    else
        items.Push({ id: "default", label: "Default" })
    end if
    return items
end function

function subtitleMenuItems() as Object
    items = [{ id: "off", label: "Off", url: "" }]
    if m.videoNode <> invalid and m.videoNode.availableSubtitleTracks <> invalid and m.videoNode.availableSubtitleTracks.Count() > 0
        seen = {}
        for each track in m.videoNode.availableSubtitleTracks
            appendUniqueTrackMenuItem(items, seen, subtitleMenuItemForAvailableTrack(track))
        end for
    else if m.playback <> invalid and m.playback.subtitleTracks <> invalid
        seen = {}
        for each track in m.playback.subtitleTracks
            appendUniqueTrackMenuItem(items, seen, track)
        end for
    end if
    return items
end function

sub appendUniqueTrackMenuItem(items as Object, seen as Object, item as Dynamic)
    key = trackDedupeKey(item)
    if key <> "" and seen.DoesExist(key) then return

    items.Push(item)
    if key <> "" then seen[key] = true
end sub

function subtitleMenuItemForAvailableTrack(track as Dynamic) as Object
    trackName = subtitleTrackName(track)
    sourceTrack = subtitleSourceTrackForTrackName(trackName)
    if sourceTrack <> invalid
        label = trackLabel(sourceTrack)
        if label = "" or label = "Default" then label = trackLabel(track)
        return {
            id: menuItemId(sourceTrack)
            label: label
            language: trackLanguage(sourceTrack)
            TrackName: trackName
        }
    end if

    return {
        id: trackName
        label: trackLabel(track)
        language: trackLanguage(track)
        TrackName: trackName
    }
end function

function subtitleSourceTrackForTrackName(trackName as String) as Dynamic
    if trackName = "" then return invalid
    if m.playback = invalid or m.playback.subtitleTracks = invalid then return invalid

    for each sourceTrack in m.playback.subtitleTracks
        if subtitleTrackName(sourceTrack) = trackName then return sourceTrack
    end for

    return invalid
end function

function qualityMenuItems() as Object
    items = []
    if m.playback <> invalid and m.playback.qualityOptions <> invalid and m.playback.qualityOptions.Count() > 0
        for each option in m.playback.qualityOptions
            items.Push(option)
        end for
    else if m.playback <> invalid
        items.Push({
            id: "default"
            label: "Default"
            url: m.playback.streamUrl
            streamFormat: m.playback.streamFormat
        })
    end if
    return items
end function

function selectedAudioLabel() as String
    audioId = m.preferenceStore.stringField(m.preferences, "audioTrackId", "")
    items = audioMenuItems()
    for each item in items
        if menuItemId(item) = audioId then return trackLabel(item)
    end for
    if items.Count() = 1 then return trackLabel(items[0])
    return "Default"
end function

function selectedSubtitleLabel() as String
    subtitleId = m.preferenceStore.stringField(m.preferences, "subtitleTrackId", "")
    if subtitleId = "" or subtitleId = "off" then return "Off"

    items = subtitleMenuItems()
    for each item in items
        if menuItemId(item) = subtitleId then return trackLabel(item)
    end for
    return "On"
end function

function selectedQualityLabel() as String
    qualityId = m.preferenceStore.stringField(m.preferences, "qualityId", "")
    qualityUrl = m.preferenceStore.stringField(m.preferences, "qualityUrl", "")
    items = qualityMenuItems()
    stream = currentPlaybackStream()

    for each item in items
        if qualityId <> "" and menuItemId(item) = qualityId then return trackLabel(item)
        if qualityUrl <> "" and item.url <> invalid and item.url = qualityUrl then return trackLabel(item)
        if qualityId = "" and qualityUrl = "" and item.url <> invalid and item.url = stream.url then return trackLabel(item)
    end for

    return "Default"
end function

function trackIdentifier(track as Dynamic) as String
    if track = invalid or type(track) <> "roAssociativeArray" then return ""
    for each key in ["Track", "track", "TrackName", "trackName", "id", "Id", "ID", "url"]
        if track.DoesExist(key) and track[key] <> invalid and track[key] <> "" then return track[key]
    end for
    return ""
end function

function trackDedupeKey(track as Dynamic) as String
    if track = invalid or type(track) <> "roAssociativeArray" then return ""

    label = LCase(trackSemanticLabel(track))
    language = LCase(trackLanguage(track))
    if label <> "" and language <> "" then return "label:" + label + "|language:" + language
    if label <> "" then return "label:" + label

    id = LCase(trackIdentifier(track))
    if id <> "" then return "id:" + id
    return ""
end function

function trackSemanticLabel(track as Dynamic) as String
    if track = invalid or type(track) <> "roAssociativeArray" then return ""
    for each key in ["Name", "name", "Description", "description", "label", "title", "language", "Language", "lang"]
        if track.DoesExist(key) and track[key] <> invalid and track[key] <> "" then return track[key]
    end for
    return ""
end function

function subtitleTrackName(track as Dynamic) as String
    if track = invalid or type(track) <> "roAssociativeArray" then return ""
    for each key in ["TrackName", "trackName", "url", "Url", "URL"]
        if track.DoesExist(key) and track[key] <> invalid and track[key] <> "" then return track[key]
    end for
    return ""
end function

function trackLabel(track as Dynamic) as String
    if track = invalid or type(track) <> "roAssociativeArray" then return "Default"
    for each key in ["Name", "name", "Description", "description", "label", "title", "language", "Language", "lang"]
        if track.DoesExist(key) and track[key] <> invalid and track[key] <> "" then return track[key]
    end for
    return trackIdentifier(track)
end function

function trackLanguage(track as Dynamic) as String
    if track = invalid or type(track) <> "roAssociativeArray" then return ""
    for each key in ["Language", "language", "lang", "Lang"]
        if track.DoesExist(key) and track[key] <> invalid and track[key] <> "" then return track[key]
    end for
    return ""
end function

function handleMenuKey(key as String) as Boolean
    if key = "back" or key = "left"
        closeMenu()
        return true
    else if key = "up"
        if m.menuIndex > 0 then m.menuIndex = m.menuIndex - 1
        renderMenuItems()
        return true
    else if key = "down"
        if m.menuIndex < m.menuItems.Count() - 1 then m.menuIndex = m.menuIndex + 1
        renderMenuItems()
        return true
    else if key = "OK"
        if m.menuItems.Count() = 0 then return true
        selected = m.menuItems[m.menuIndex]
        if m.menuType = "audio"
            applyAudioSelection(selected)
        else if m.menuType = "subtitles"
            applySubtitleSelection(selected)
        else if m.menuType = "quality"
            applyQualitySelection(selected)
        end if
        closeMenu()
        return true
    end if
    return true
end function

sub applyAudioSelection(track as Object)
    if track = invalid then return

    trackId = menuItemId(track)
    if trackId = "" then return

    if m.preferences = invalid then m.preferences = {}
    if hasAvailableAudioTracks()
        m.videoNode.audioTrack = trackId
    end if
    currentTrack = m.videoNode.currentAudioTrack
    if currentTrack = invalid or currentTrack = "" then currentTrack = trackId

    m.preferences["audioTrackId"] = trackId
    m.preferences["audioTrackLabel"] = trackLabel(track)
    m.preferences["audioTrackLanguage"] = trackLanguage(track)
    m.preferences["audioCurrentTrack"] = currentTrack
    m.preferenceStore.save(m.playback, m.preferences)
    m.savedAudioPreferenceApplied = true

    updateControlLabels()
    setStatusMessage("Audio: " + selectedAudioLabel(), true)
    sendProgressUpdate("audio")
end sub

sub applySubtitleSelection(track as Object)
    if m.preferences = invalid then m.preferences = {}

    if track = invalid or menuItemId(track) = "off"
        m.preferences["subtitleTrackId"] = "off"
        m.preferences["subtitleTrackLabel"] = "Off"
        m.preferences["subtitleTrackLanguage"] = ""
        m.preferences["subtitleTrackName"] = ""
        m.preferenceStore.save(m.playback, m.preferences)
        if m.videoNode <> invalid
            m.videoNode.globalCaptionMode = "Off"
            m.videoNode.subtitleTrack = ""
        end if
        updateControlLabels()
        setStatusMessage("Subtitles: Off", true)
        sendProgressUpdate("subtitles")
        return
    end if

    trackName = subtitleTrackName(track)
    if trackName = "" then trackName = menuItemId(track)
    if trackName = "" then return

    m.preferences["subtitleTrackId"] = menuItemId(track)
    m.preferences["subtitleTrackLabel"] = trackLabel(track)
    m.preferences["subtitleTrackLanguage"] = trackLanguage(track)
    m.preferences["subtitleTrackName"] = trackName
    m.preferenceStore.save(m.playback, m.preferences)

    if m.videoNode <> invalid
        m.videoNode.globalCaptionMode = "On"
        if hasAvailableSubtitleTracks()
            m.videoNode.subtitleTrack = trackName
        else
            reloadPlaybackWithSubtitle(trackName)
        end if
    end if

    updateControlLabels()
    setStatusMessage("Subtitles: " + selectedSubtitleLabel(), true)
    sendProgressUpdate("subtitles")
end sub

sub reloadPlaybackWithSubtitle(trackName as String)
    if m.videoNode = invalid then return

    position = currentPositionSeconds()
    wasPlaying = m.isPlaying
    m.videoNode.control = "stop"
    m.videoNode.content = playbackContentNode(trackName)
    if position > 0 then m.videoNode.seek = position
    if wasPlaying
        m.videoNode.control = "play"
        m.isPlaying = true
    end if
end sub

sub applyQualitySelection(option as Object)
    updateControlLabels()
    if option = invalid
        setStatusMessage("Quality disabled for debugging", true)
    else
        setStatusMessage("Quality disabled for debugging", true)
    end if
    sendProgressUpdate("quality")
end sub

sub applySavedPreferences()
    applySavedAudioPreference()
    applySavedSubtitlePreference()
end sub

sub applySavedAudioPreference()
    if m.savedAudioPreferenceApplied = true then return
    if m.videoNode = invalid then return

    track = findSavedAudioTrack()
    if track = invalid then return
    if hasAvailableAudioTracks() <> true then return

    trackId = menuItemId(track)
    if trackId = "" or trackId = "default" then return

    m.videoNode.audioTrack = trackId
    m.savedAudioPreferenceApplied = true
    updateControlLabels()
end sub

function hasAvailableAudioTracks() as Boolean
    return m.videoNode <> invalid and m.videoNode.availableAudioTracks <> invalid and m.videoNode.availableAudioTracks.Count() > 0
end function

function hasAvailableSubtitleTracks() as Boolean
    return m.videoNode <> invalid and m.videoNode.availableSubtitleTracks <> invalid and m.videoNode.availableSubtitleTracks.Count() > 0
end function

function findSavedAudioTrack() as Dynamic
    if m.preferences = invalid then return invalid

    savedId = m.preferenceStore.stringField(m.preferences, "audioTrackId", "")
    savedLabel = m.preferenceStore.stringField(m.preferences, "audioTrackLabel", "")
    savedLanguage = m.preferenceStore.stringField(m.preferences, "audioTrackLanguage", "")
    if savedId = "" and savedLabel = "" and savedLanguage = "" then return invalid

    items = audioMenuItems()
    if savedId <> ""
        for each item in items
            if menuItemId(item) = savedId then return item
        end for
    end if

    if savedLanguage <> ""
        for each item in items
            if LCase(trackLanguage(item)) = LCase(savedLanguage) then return item
        end for
    end if

    if savedLabel <> ""
        for each item in items
            if LCase(trackLabel(item)) = LCase(savedLabel) then return item
        end for
    end if

    return invalid
end function

function savedPreferredSubtitleTrackName() as String
    if m.preferences = invalid then return ""

    subtitleId = m.preferenceStore.stringField(m.preferences, "subtitleTrackId", "")
    if subtitleId = "" or subtitleId = "off" then return ""

    if m.playback <> invalid and m.playback.subtitleTracks <> invalid
        for each item in m.playback.subtitleTracks
            if menuItemId(item) = subtitleId then return subtitleTrackName(item)
        end for
    end if

    return m.preferenceStore.stringField(m.preferences, "subtitleTrackName", "")
end function

sub applySavedSubtitlePreference()
    trackName = savedPreferredSubtitleTrackName()
    if trackName = "" then return
    if m.videoNode = invalid then return

    m.videoNode.globalCaptionMode = "On"
    if hasAvailableSubtitleTracks() then m.videoNode.subtitleTrack = trackName
end sub

sub applySavedQualityPreference()
    return
end sub

sub setStatusMessage(message as String, autoClear as Boolean)
    m.statusClearTimer.control = "stop"
    m.statusLabel.text = message
    if autoClear then m.statusClearTimer.control = "start"
end sub

sub onStatusClearTimer()
    m.statusLabel.text = ""
end sub

sub exitPlayer()
    m.progressTimer.control = "stop"
    m.railHideTimer.control = "stop"
    m.statusClearTimer.control = "stop"
    m.resumePromptTimer.control = "stop"
    m.seekDebounceTimer.control = "stop"
    clearPendingSeek()
    m.videoNode.control = "stop"
    m.top.exitRequested = true
end sub
