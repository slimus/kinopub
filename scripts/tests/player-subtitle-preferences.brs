sub main()
    m.preferenceStore = PlayerPreferenceStore()
    m.preferences = { subtitleTrackId: "old-id", subtitleTrackName: "https://old/ru.srt", subtitleTrackLabel: "Russian", subtitleTrackLanguage: "rus" }
    m.playback = { subtitleTracks: [{ id: "new-id", label: "Russian", language: "rus", url: "https://new/ru.srt" }] }
    m.videoNode = { availableSubtitleTracks: [], globalCaptionMode: "Off", subtitleTrack: "" }
    check(savedPreferredSubtitleTrackNameForPlayback() = "https://new/ru.srt", "Resolve subtitles from the current episode before playback")
    m.videoNode.availableSubtitleTracks = [{ TrackName: "https://new/ru.srt", Language: "rus" }]
    applySavedSubtitlePreference()
    check(m.videoNode.globalCaptionMode = "On" and m.videoNode.subtitleTrack = "https://new/ru.srt", "Restore subtitles after Roku discovers tracks")
    check(selectedSubtitleLabel() = "Russian", "Display the restored track when episode IDs differ")
    m.videoNode.availableSubtitleTracks = [{ TrackName: "https://old/ru.srt", Language: "rus" }]
    check(savedPreferredSubtitleTrackNameForPlayback() = "https://new/ru.srt", "Ignore lingering tracks from the previous stream during startup")
    m.preferences.subtitleTrackId = "off"
    applySavedSubtitlePreference()
    check(m.videoNode.globalCaptionMode = "Off" and m.videoNode.subtitleTrack = "", "Restore explicit Off after enabled subtitles")
    m.preferences.subtitleTrackId = "old-id"
    m.playback.subtitleTracks = []
    m.videoNode.availableSubtitleTracks = []
    check(savedPreferredSubtitleTrackNameForPlayback() = "", "Never reuse an old episode URL when the track is absent")
    m.playback.subtitleTracks = [{ id: "movie-id", label: "Russian", language: "rus", url: "https://movie/ru.srt" }]
    m.preferences.subtitleTrackId = "movie-id"
    check(savedPreferredSubtitleTrackNameForPlayback() = "https://movie/ru.srt", "Restore a movie subtitle by ID")
    m.preferences.subtitleTrackId = "old-id"
    m.playback.subtitleTracks[0].label = "Different translation"
    check(savedPreferredSubtitleTrackNameForPlayback() = "https://movie/ru.srt", "Fall back to the saved language")
    m.preferenceStore.loadKey = testLoadKey
    loaded = m.preferenceStore.load({ itemId: 5, seasonNumber: 1, videoNumber: 1 })
    check(loaded.subtitleTrackId = "latest" and loaded.subtitleTrackName = "latest-url", "Latest series subtitles override old episode preferences")
    check(loaded.audioTrackId = "episode-audio", "Preserve existing audio preference precedence")
    loaded = m.preferenceStore.load({ itemId: 5, seasonNumber: 1, videoNumber: 2 })
    check(loaded.subtitleTrackId = "latest", "Use series subtitles for an unvisited episode")
    loaded = m.preferenceStore.load({ mediaId: 7 })
    check(loaded.subtitleTrackId = "movie", "Movies keep their own subtitle preference")
    print "Subtitle preference tests passed."
end sub

function testLoadKey(key as String) as Object
    if key = "series:5" then return { subtitleTrackId: "latest", subtitleTrackName: "latest-url" }
    if key = "item:5:s:1:v:1" then return { subtitleTrackId: "old", subtitleTrackName: "old-url", audioTrackId: "episode-audio" }
    if key = "media:7" then return { subtitleTrackId: "movie" }
    return {}
end function

sub check(condition as Boolean, message as String)
    if condition then return
    print "FAIL: "; message
    stop
end sub
