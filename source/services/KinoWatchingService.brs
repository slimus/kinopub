function KinoWatchingService(client as Object) as Object
    return {
        client: client
        markTime: kinoWatchingMarkTime
        toggleWatched: kinoWatchingToggleWatched
        success: kinoWatchingSuccess
        failure: kinoWatchingFailure
    }
end function

function kinoWatchingMarkTime(accessToken as String, itemId as Integer, seasonNumber as Integer, videoNumber as Integer, timeSeconds as Integer) as Object
    if itemId <= 0 or videoNumber <= 0
        return { ok: false, error: "invalid_media", message: "Unable to save playback progress.", status: 0 }
    end if

    if timeSeconds < 0 then timeSeconds = 0
    queryParams = {
        access_token: accessToken
        id: itemId
        video: videoNumber
        time: timeSeconds
    }
    if seasonNumber > 0 then queryParams.season = seasonNumber

    response = m.client.get("/v1/watching/marktime", queryParams, m.client.defaultTimeoutMs)
    if response.ok <> true then return m.failure(response)
    return m.success(response)
end function

function kinoWatchingToggleWatched(accessToken as String, itemId as Integer, seasonNumber as Integer, videoNumber as Integer) as Object
    if itemId <= 0 or videoNumber <= 0
        return { ok: false, error: "invalid_media", message: "Unable to mark this video watched.", status: 0 }
    end if

    queryParams = {
        access_token: accessToken
        id: itemId
        video: videoNumber
    }
    if seasonNumber > 0 then queryParams.season = seasonNumber

    response = m.client.get("/v1/watching/toggle", queryParams, m.client.defaultTimeoutMs)
    if response.ok <> true then return m.failure(response)

    watched = invalid
    if response.body <> invalid and type(response.body) = "roAssociativeArray" and response.body.DoesExist("watched")
        watched = response.body.watched
    end if
    result = m.success(response)
    result.watched = watched
    return result
end function

function kinoWatchingSuccess(response as Object) as Object
    return { ok: true, status: response.status, rawBody: response.rawBody }
end function

function kinoWatchingFailure(response as Object) as Object
    errorCode = response.error
    if errorCode = invalid or errorCode = "" then errorCode = "network"
    return { ok: false, error: errorCode, message: response.message, status: response.status, rawBody: response.rawBody }
end function
