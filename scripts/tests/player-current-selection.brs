sub main()
    m.preferenceStore = PlayerPreferenceStore()
    m.preferences = { audioTrackId: "old", qualityId: "720", qualityUrl: "old-url" }
    m.videoNode = { currentAudioTrack: "ru", availableAudioTracks: [
        { Track: "en", Name: "English", Language: "eng" }
        { Track: "ru", Name: "Russian dub", Language: "rus" }
    ] }
    m.playbackMediaReady = true
    m.playback = { streamUrl: "https://example.com/master-v1a1.m3u8", streamFormat: "hls", qualityOptions: [
        { id: "auto", label: "Auto", isAuto: true, url: "https://example.com/master-v1a1.m3u8" }
        { id: "720", label: "720p", isAuto: false, url: "https://example.com/720.mp4" }
    ] }
    m.playbackOptions = [{ id: "default", label: "Default", url: m.playback.streamUrl, streamFormat: "hls" }]
    m.playbackOptionIndex = 0
    m.playbackInfoHeight = 1080
    check(selectedAudioLabel() = "Russian dub", "Actual audio wins over stale saved ID")
    m.menuType = "audio"
    items = audioMenuItems()
    check(isSelectedMenuItem(items[1]), "Audio menu marks the track actually playing")
    check(isSelectedMenuItem(items[0]) = false, "Audio menu does not mark another language")
    m.preferences.audioTrackId = "en"
    check(selectedAudioLabel() = "Russian dub", "Requested audio cannot override confirmed audio")
    m.videoNode.currentAudioTrack = ""
    check(selectedAudioLabel() = "Loading...", "Unknown audio is not guessed from preferences")
    m.videoNode.currentAudioTrack = "ru"
    m.playbackMediaReady = false
    check(selectedAudioLabel() = "Loading...", "Previous audio is hidden during stream replacement")
    m.playbackMediaReady = true
    check(selectedQualityLabel() = "1080p", "Quality uses measured video height")
    m.playbackInfoHeight = 720
    check(selectedQualityLabel() = "720p", "Adaptive resolution changes are reflected")
    m.playbackInfoHeight = 0
    check(selectedQualityLabel() = "Loading...", "No old or guessed resolution before a video segment")
    m.menuType = "quality"
    items = qualityMenuItems()
    check(isSelectedMenuItem(items[0]), "Auto stays selected while displaying measured quality")
    check(isSelectedMenuItem(items[1]) = false, "Stale saved quality is not marked")
    m.playbackOptions[0].url = "https://example.com/index-v1-a1.m3u8"
    check(isSelectedMenuItem(items[0]), "Direct media fallback maps to its original menu source")
    m.playbackOptions[0].url = "https://example.com/720.mp4"
    m.playbackOptions[0].streamFormat = "mp4"
    check(isSelectedMenuItem(items[1]), "Fallback source replaces stale menu selection")
    check(selectedQualityLabel() = "720p", "MP4 uses metadata of the current URL without segment events")
    m.playbackMediaReady = false
    m.playbackInfoHeight = 1080
    check(selectedQualityLabel() = "Loading...", "MP4 does not report a new source before playback starts")
    m.playbackMediaReady = true
    m.playbackInfoHeight = 0
    m.playbackOptions[0].url = m.playback.streamUrl
    m.playbackOptions[0].streamFormat = "hls"
    m.playbackInfoHeight = 1080
    check(qualityMenuLabel(items[0]) = "Auto (1080p)", "Auto menu shows measured resolution without selecting fixed quality")
    m.videoNode.availableAudioTracks.Push({ Track: "ru-duplicate", Name: "Russian dub", Language: "rus" })
    m.videoNode.currentAudioTrack = "ru-duplicate"
    m.menuType = "audio"
    items = audioMenuItems()
    check(items.Count() = 2 and isSelectedMenuItem(items[1]), "Playing duplicate marks its visible representative")
    m.menuOpen = true
    m.menuIndex = 4
    m.labelUpdates = 0
    m.menuUpdates = 0
    onCurrentAudioTrackChanged()
    check(m.labelUpdates = 1 and m.menuUpdates = 1, "Track event refreshes labels and open menu")
    check(m.menuItems.Count() = 2 and m.menuIndex = 1, "Track list refresh clamps focus to available rows")
    m.playback.audioTracks = [{ id: "api-only", label: "API voice" }]
    m.videoNode.availableAudioTracks = []
    check(audioMenuItems().Count() = 0, "API-only tracks cannot be selected before playlist discovery")
    print "Current selection tests passed."
end sub

sub check(condition as Boolean, message as String)
    if condition <> true then print "FAIL: " + message
end sub

sub updateControlLabels()
    m.labelUpdates++
end sub

sub renderMenuItems()
    m.menuUpdates++
end sub
