sub main()
    service = {
        mediaStream: kinoItemMediaStream
        streamFromUrlContainer: kinoItemStreamFromUrlContainer
        qualityOptions: kinoItemQualityOptions
        addQualityUrlOptions: kinoItemAddQualityUrlOptions
        sourceFileLabel: kinoItemSourceFileLabel
        streamFormatForUrl: kinoItemStreamFormatForUrl
        stringField: kinoItemStringField
    }
    urls = { hls4: "https://example.com/hls4/master.m3u8", hls2: "https://example.com/hls2/master.m3u8", hls: "https://example.com/hls/master.m3u8", http: "https://example.com/video.mp4" }
    media = { files: [{ quality: "2160p", url: urls }, { quality: "1080p", urls: urls }] }
    stream = service.mediaStream(media)
    options = service.qualityOptions(media, stream)
    check(stream.url = urls.hls4, "Startup uses HLS4")
    check(options.Count() = 1, "Shared HLS4 master appears once without transport duplicates")
    check(options[0].url = urls.hls4 and options[0].label = "Auto", "Adaptive master is not mislabeled as 2160p")
    unsupported = { hls2: urls.hls2, hls: urls.hls, http: urls.http }
    check(service.streamFromUrlContainer(unsupported).url = "", "No silent fallback to HLS2, HLS or MP4")
    legacy = { files: [{ quality: "720p", url: unsupported }] }
    check(service.mediaStream(legacy).url = "", "Media without HLS4 is not started via another transport")
    check(service.qualityOptions(legacy, { url: "", format: "" }).Count() = 0, "No non-HLS4 menu entries")
    check(service.qualityOptions(legacy, { url: urls.hls2, format: "hls" }).Count() = 0, "A legacy selected stream cannot reintroduce HLS2 into quality options")
    check(service.mediaStream({ files: urls }).url = urls.hls4, "Flat URL container supports HLS4")
    print "HLS4 source tests passed."
end sub

sub check(condition as Boolean, message as String)
    if condition <> true then print "FAIL: " + message
end sub
