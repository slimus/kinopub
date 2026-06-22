function KinoTvService(client as Object) as Object
    return {
        client: client
        load: kinoTvLoad
        normalizeResponse: kinoTvNormalizeResponse
        sourceItems: kinoTvSourceItems
        normalizeItem: kinoTvNormalizeItem
        streamCandidates: kinoTvStreamCandidates
        appendStreamCandidates: kinoTvAppendStreamCandidates
        appendStreamCandidate: kinoTvAppendStreamCandidate
        streamFormatForUrl: kinoTvStreamFormatForUrl
        posterUrl: kinoTvPosterUrl
        artworkUrl: kinoTvArtworkUrl
        stringField: kinoTvStringField
        integerField: kinoTvIntegerField
        booleanFieldState: kinoTvBooleanFieldState
        failure: kinoTvFailure
    }
end function

function kinoTvLoad(accessToken as String) as Object
    response = m.client.get("/v1/tv", { access_token: accessToken }, m.client.defaultTimeoutMs)
    if response.ok <> true then return m.failure(response)
    result = m.normalizeResponse(response.body)
    result.status = response.status
    return result
end function

function kinoTvNormalizeResponse(body as Dynamic) as Object
    sourceItems = m.sourceItems(body)
    if sourceItems = invalid
        return { ok: false, items: [], error: "invalid_response", message: "Live TV response did not include a channel list.", status: 0 }
    end if

    items = []
    for each sourceItem in sourceItems
        item = m.normalizeItem(sourceItem)
        if item.isActive and item.streamUrl <> "" then items.Push(item)
    end for

    return { ok: true, items: items }
end function

function kinoTvSourceItems(body as Dynamic) as Dynamic
    if body = invalid then return invalid
    if type(body) = "roArray" then return body
    if type(body) <> "roAssociativeArray" then return invalid

    keys = ["items", "channels", "events", "tv"]
    for each key in keys
        if body.DoesExist(key) and body[key] <> invalid and type(body[key]) = "roArray" then return body[key]
        if body.DoesExist(key) and body[key] <> invalid and type(body[key]) = "roAssociativeArray"
            nestedItems = m.sourceItems(body[key])
            if nestedItems <> invalid then return nestedItems
        end if
    end for

    if body.DoesExist("data") and body.data <> invalid
        if type(body.data) = "roArray" then return body.data
        if type(body.data) = "roAssociativeArray"
            nestedItems = m.sourceItems(body.data)
            if nestedItems <> invalid then return nestedItems
        end if
    end if

    directKeys = ["url", "stream", "stream_url", "streamUrl", "playlist", "hls", "urls", "streams", "files", "sources"]
    for each key in directKeys
        if body.DoesExist(key) then return [body]
    end for

    return invalid
end function

function kinoTvNormalizeItem(sourceItem as Dynamic) as Object
    title = m.stringField(sourceItem, "title", "")
    if title = "" then title = m.stringField(sourceItem, "name", "")
    if title = "" then title = m.stringField(sourceItem, "label", "")
    if title = "" then title = "Live event"

    subtitle = m.stringField(sourceItem, "subtitle", "")
    if subtitle = "" then subtitle = m.stringField(sourceItem, "description", "")
    if subtitle = "" then subtitle = m.stringField(sourceItem, "status", "")

    streams = m.streamCandidates(sourceItem)
    streamUrl = ""
    streamFormat = "hls"
    if streams.Count() > 0
        streamUrl = streams[0].url
        streamFormat = streams[0].streamFormat
    end if

    activeState = m.booleanFieldState(sourceItem, "active")
    if activeState.exists <> true then activeState = m.booleanFieldState(sourceItem, "online")
    if activeState.exists <> true then activeState = m.booleanFieldState(sourceItem, "live")
    if activeState.exists <> true then activeState = m.booleanFieldState(sourceItem, "enabled")
    if activeState.exists <> true then activeState = m.booleanFieldState(sourceItem, "status")

    isActive = streamUrl <> ""
    if activeState.exists then isActive = activeState.value

    return {
        channelId: m.integerField(sourceItem, "id", 0)
        title: title
        subtitle: subtitle
        metadata: subtitle
        posterUrl: m.posterUrl(sourceItem)
        typeBadge: "LIVE"
        year: 0
        startTime: kinoTvFirstStringField(sourceItem, ["start", "starts_at", "start_at", "started_at"])
        endTime: kinoTvFirstStringField(sourceItem, ["end", "ends_at", "end_at", "ended_at"])
        streamUrl: streamUrl
        streamFormat: streamFormat
        qualityOptions: streams
        isActive: isActive
        isLive: true
    }
end function

function kinoTvStreamCandidates(sourceItem as Dynamic) as Object
    items = []
    seen = {}
    if sourceItem = invalid or type(sourceItem) <> "roAssociativeArray" then return items

    directKeys = ["url", "stream", "stream_url", "streamUrl", "playlist", "hls"]
    for each key in directKeys
        if sourceItem.DoesExist(key) then m.appendStreamCandidates(items, seen, sourceItem[key], key)
    end for

    nestedKeys = ["urls", "streams", "files", "sources", "media", "video", "playback"]
    for each key in nestedKeys
        if sourceItem.DoesExist(key) then m.appendStreamCandidates(items, seen, sourceItem[key], key)
    end for

    return items
end function

sub kinoTvAppendStreamCandidates(items as Object, seen as Object, value as Dynamic, label as String)
    if value = invalid then return
    valueType = type(value)

    if valueType = "String" or valueType = "roString"
        m.appendStreamCandidate(items, seen, value, label)
        return
    end if

    if valueType = "roArray"
        for each entry in value
            m.appendStreamCandidates(items, seen, entry, label)
        end for
        return
    end if

    if valueType <> "roAssociativeArray" then return

    candidateUrl = m.stringField(value, "url", "")
    if candidateUrl = "" then candidateUrl = m.stringField(value, "src", "")
    if candidateUrl = "" then candidateUrl = m.stringField(value, "file", "")
    candidateLabel = m.stringField(value, "quality", label)
    if candidateLabel = label then candidateLabel = m.stringField(value, "label", label)
    if candidateUrl <> "" then m.appendStreamCandidate(items, seen, candidateUrl, candidateLabel)

    for each key in value
        if key <> "url" and key <> "src" and key <> "file" and key <> "quality" and key <> "label"
            m.appendStreamCandidates(items, seen, value[key], key)
        end if
    end for
end sub

sub kinoTvAppendStreamCandidate(items as Object, seen as Object, url as String, label as String)
    if url = "" or seen.DoesExist(url) then return
    title = label
    if title = "" then title = "Live"
    items.Push({
        id: title
        label: title
        url: url
        streamFormat: m.streamFormatForUrl(url)
    })
    seen[url] = true
end sub

function kinoTvStreamFormatForUrl(url as String) as String
    lowered = LCase(url)
    if Instr(1, lowered, ".m3u8") > 0 then return "hls"
    if Instr(1, lowered, "format=m3u8") > 0 then return "hls"
    return "mp4"
end function

function kinoTvPosterUrl(sourceItem as Dynamic) as String
    if sourceItem = invalid or type(sourceItem) <> "roAssociativeArray" then return ""

    ' TV payloads commonly expose transparent logos as objects such as
    ' logo: { url: "..." }, rather than as a direct string.
    keys = ["logo", "logos", "icon", "icons", "image", "images", "poster", "posters", "thumbnail", "cover", "artwork"]
    for each key in keys
        if sourceItem.DoesExist(key) then url = m.artworkUrl(sourceItem[key], 0) else url = ""
        if url <> "" then return url
    end for

    ' Some event responses keep channel branding under a nested channel/item.
    containers = ["channel", "event", "item", "station", "metadata", "data"]
    for each key in containers
        if sourceItem.DoesExist(key) and sourceItem[key] <> invalid and type(sourceItem[key]) = "roAssociativeArray"
            url = m.posterUrl(sourceItem[key])
            if url <> "" then return url
        end if
    end for

    return ""
end function

function kinoTvArtworkUrl(value as Dynamic, depth as Integer) as String
    if value = invalid or depth > 4 then return ""
    valueType = type(value)
    if valueType = "String" or valueType = "roString" then return value

    if valueType = "roArray"
        for each entry in value
            url = m.artworkUrl(entry, depth + 1)
            if url <> "" then return url
        end for
        return ""
    end if

    if valueType <> "roAssociativeArray" then return ""

    urlKeys = ["url", "src", "uri", "href", "original", "medium", "small", "big", "wide", "default", "light", "dark"]
    for each key in urlKeys
        if value.DoesExist(key)
            url = m.artworkUrl(value[key], depth + 1)
            if url <> "" then return url
        end if
    end for

    ' Support size-keyed maps and provider-specific wrappers.
    for each key in value
        url = m.artworkUrl(value[key], depth + 1)
        if url <> "" then return url
    end for
    return ""
end function

function kinoTvFirstStringField(source as Dynamic, keys as Object) as String
    if keys = invalid then return ""
    for each key in keys
        value = kinoTvStringField(source, key, "")
        if value <> "" then return value
    end for
    return ""
end function

function kinoTvStringField(source as Dynamic, key as String, fallback as String) as String
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "String" or valueType = "roString" then return value
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return StrI(value).Trim()
    return fallback
end function

function kinoTvIntegerField(source as Dynamic, key as String, fallback as Integer) as Integer
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return value
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Int(value)
    return fallback
end function

function kinoTvBooleanFieldState(source as Dynamic, key as String) as Object
    if source = invalid or type(source) <> "roAssociativeArray" then return { exists: false, value: false }
    if source.DoesExist(key) <> true or source[key] = invalid then return { exists: false, value: false }
    value = source[key]
    valueType = type(value)
    if valueType = "Boolean" or valueType = "roBoolean" then return { exists: true, value: value }
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return { exists: true, value: value <> 0 }
    if valueType = "String" or valueType = "roString"
        lowered = LCase(value)
        if lowered = "true" or lowered = "yes" or lowered = "online" or lowered = "active" or lowered = "live" or lowered = "started" or lowered = "1" then return { exists: true, value: true }
        if lowered = "false" or lowered = "no" or lowered = "offline" or lowered = "inactive" or lowered = "ended" or lowered = "0" then return { exists: true, value: false }
    end if
    return { exists: false, value: false }
end function

function kinoTvFailure(response as Object) as Object
    errorCode = response.error
    if errorCode = invalid or errorCode = "" then errorCode = "network"
    return { ok: false, items: [], error: errorCode, message: response.message, status: response.status, rawBody: response.rawBody }
end function
