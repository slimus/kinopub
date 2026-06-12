sub init()
    m.top.functionName = "runContentTask"
end sub

sub runContentTask()
    tokenStore = TokenStore()
    client = KinoApiClient(KinoConfig())
    authService = KinoAuthService(client, tokenStore)
    bookmarkService = KinoBookmarkService(client)
    typeService = KinoContentTypeService(client)
    historyService = KinoHistoryService(client)
    homeService = KinoHomeService(client)
    itemService = KinoItemService(client)
    searchService = KinoSearchService(client)
    userService = KinoUserService(client)
    watchingService = KinoWatchingService(client)
    command = m.top.command
    request = m.top.request
    print "ContentTask: running command "; command

    if command = "loadHistoryPage"
        m.top.response = contentTaskLoadHistoryPage(tokenStore, authService, historyService, typeService, request)
    else if command = "loadHome"
        m.top.response = contentTaskLoadHome(tokenStore, authService, homeService, typeService, request)
    else if command = "loadItemDetail"
        m.top.response = contentTaskLoadItemDetail(tokenStore, authService, itemService, request)
    else if command = "refreshMediaLinks"
        m.top.response = contentTaskRefreshMediaLinks(tokenStore, authService, itemService, request)
    else if command = "searchItems"
        m.top.response = contentTaskSearchItems(tokenStore, authService, searchService, typeService, request)
    else if command = "loadUserInfo"
        m.top.response = contentTaskLoadUserInfo(tokenStore, authService, userService)
    else if command = "loadBookmarkFolders"
        m.top.response = contentTaskLoadBookmarkFolders(tokenStore, authService, bookmarkService)
    else if command = "loadBookmarkFolderItems"
        m.top.response = contentTaskLoadBookmarkFolderItems(tokenStore, authService, bookmarkService, typeService, request)
    else if command = "loadItemBookmarkFolders"
        m.top.response = contentTaskLoadItemBookmarkFolders(tokenStore, authService, bookmarkService, request)
    else if command = "toggleItemBookmark"
        m.top.response = contentTaskToggleItemBookmark(tokenStore, authService, bookmarkService, request)
    else if command = "savePlaybackProgress"
        m.top.response = contentTaskSavePlaybackProgress(tokenStore, authService, watchingService, request)
    else if command = "markPlaybackWatched"
        m.top.response = contentTaskMarkPlaybackWatched(tokenStore, authService, watchingService, request)
    else
        m.top.response = { command: command, ok: false, error: "unknown_command", message: "Unknown content task command." }
    end if
end sub

function contentTaskLoadHome(tokenStore as Object, authService as Object, homeService as Object, typeService as Object, request as Dynamic) as Object
    perpage = contentTaskIntegerField(request, "perpage", 12)
    if perpage < 1 then perpage = 12
    if perpage > 20 then perpage = 20

    tokenResult = contentTaskAccessToken(tokenStore, authService, "Sign in again to load Home.")
    if tokenResult.ok <> true
        tokenResult.command = "loadHome"
        tokenResult.perpage = perpage
        return tokenResult
    end if

    typeMap = contentTaskTypeMap(typeService, tokenResult.accessToken)
    result = homeService.load(tokenResult.accessToken, perpage, typeMap)
    result.command = "loadHome"
    result.perpage = perpage
    return result
end function

function contentTaskLoadHistoryPage(tokenStore as Object, authService as Object, historyService as Object, typeService as Object, request as Dynamic) as Object
    page = contentTaskIntegerField(request, "page", 1)
    perpage = contentTaskIntegerField(request, "perpage", 20)
    if page < 1 then page = 1
    if perpage < 1 then perpage = 20
    if perpage > 50 then perpage = 50

    tokenResult = contentTaskUsableTokens(tokenStore, authService)

    if tokenResult.ok <> true
        if tokenResult.error = "auth_required"
            return { command: "loadHistoryPage", ok: false, page: page, perpage: perpage, error: "auth_required", message: "Sign in again to load Watch Again." }
        end if
        return { command: "loadHistoryPage", ok: false, page: page, perpage: perpage, error: tokenResult.error, message: tokenResult.message, status: tokenResult.status }
    end if

    tokens = tokenResult.tokens
    if tokens = invalid
        return { command: "loadHistoryPage", ok: false, page: page, perpage: perpage, error: "auth_required", message: "Sign in again to load Watch Again." }
    end if

    accessToken = contentTaskTokenString(tokens, "accesstoken")
    if accessToken = "" then accessToken = contentTaskTokenString(tokens, "accessToken")
    if accessToken = "" then return { command: "loadHistoryPage", ok: false, page: page, perpage: perpage, error: "auth_required", message: "Sign in again to load Watch Again." }

    typeMap = contentTaskTypeMap(typeService, accessToken)
    result = historyService.list(accessToken, page, perpage, typeMap)
    result.command = "loadHistoryPage"
    result.page = page
    result.perpage = perpage
    return result
end function

function contentTaskLoadItemDetail(tokenStore as Object, authService as Object, itemService as Object, request as Dynamic) as Object
    itemId = contentTaskIntegerField(request, "itemId", 0)
    mediaId = contentTaskIntegerField(request, "mediaId", 0)
    if itemId <= 0
        return { command: "loadItemDetail", ok: false, itemId: itemId, mediaId: mediaId, error: "invalid_item", message: "Unable to open this video.", status: 0 }
    end if

    tokenResult = contentTaskUsableTokens(tokenStore, authService)

    if tokenResult.ok <> true
        if tokenResult.error = "auth_required"
            return { command: "loadItemDetail", ok: false, itemId: itemId, mediaId: mediaId, error: "auth_required", message: "Sign in again to load video details.", status: 0 }
        end if
        return { command: "loadItemDetail", ok: false, itemId: itemId, mediaId: mediaId, error: tokenResult.error, message: tokenResult.message, status: tokenResult.status }
    end if

    tokens = tokenResult.tokens
    if tokens = invalid
        return { command: "loadItemDetail", ok: false, itemId: itemId, mediaId: mediaId, error: "auth_required", message: "Sign in again to load video details.", status: 0 }
    end if

    accessToken = contentTaskTokenString(tokens, "accesstoken")
    if accessToken = "" then accessToken = contentTaskTokenString(tokens, "accessToken")
    if accessToken = "" then return { command: "loadItemDetail", ok: false, itemId: itemId, mediaId: mediaId, error: "auth_required", message: "Sign in again to load video details.", status: 0 }

    result = itemService.detail(accessToken, itemId)
    if result.ok = true and result.item <> invalid
        similarResult = itemService.similar(accessToken, itemId)
        if similarResult.ok = true
            result.item.similarItems = similarResult.items
        else
            result.item.similarItems = []
        end if

        trailerResult = itemService.trailer(accessToken, itemId)
        if trailerResult.ok = true
            result.item.trailer = trailerResult.trailer
        else
            result.item.trailer = invalid
        end if
    end if
    result.command = "loadItemDetail"
    result.itemId = itemId
    result.mediaId = mediaId
    return result
end function

function contentTaskRefreshMediaLinks(tokenStore as Object, authService as Object, itemService as Object, request as Dynamic) as Object
    media = invalid
    if request <> invalid and type(request) = "roAssociativeArray" and request.DoesExist("media") then media = request.media
    mediaId = contentTaskIntegerField(media, "mediaId", 0)
    if mediaId <= 0
        return { command: "refreshMediaLinks", ok: false, mediaId: mediaId, error: "invalid_media", message: "Unable to refresh this video.", status: 0 }
    end if

    tokenResult = contentTaskAccessToken(tokenStore, authService, "Sign in again to play this video.")
    if tokenResult.ok <> true
        tokenResult.command = "refreshMediaLinks"
        tokenResult.mediaId = mediaId
        return tokenResult
    end if

    result = itemService.mediaLinks(tokenResult.accessToken, media)
    result.command = "refreshMediaLinks"
    result.mediaId = mediaId
    return result
end function

function contentTaskSearchItems(tokenStore as Object, authService as Object, searchService as Object, typeService as Object, request as Dynamic) as Object
    query = contentTaskStringField(request, "q", "").Trim()
    page = contentTaskIntegerField(request, "page", 1)
    perpage = contentTaskIntegerField(request, "perpage", 20)
    sortByYear = contentTaskBooleanField(request, "sortByYear", true)
    if page < 1 then page = 1
    if perpage < 1 then perpage = 20
    if perpage > 50 then perpage = 50

    if query = ""
        return { command: "searchItems", ok: false, q: query, page: page, perpage: perpage, error: "invalid_query", message: "Enter a search term.", status: 0 }
    end if

    tokenResult = contentTaskAccessToken(tokenStore, authService, "Sign in again to search.")
    if tokenResult.ok <> true
        tokenResult.command = "searchItems"
        tokenResult.q = query
        tokenResult.page = page
        tokenResult.perpage = perpage
        return tokenResult
    end if

    typeMap = contentTaskTypeMap(typeService, tokenResult.accessToken)
    result = searchService.search(tokenResult.accessToken, query, page, perpage, typeMap, sortByYear)
    result.command = "searchItems"
    result.q = query
    result.page = page
    result.perpage = perpage
    result.sortByYear = sortByYear
    return result
end function

function contentTaskLoadUserInfo(tokenStore as Object, authService as Object, userService as Object) as Object
    tokenResult = contentTaskAccessToken(tokenStore, authService, "Sign in again to load account information.")
    if tokenResult.ok <> true
        tokenResult.command = "loadUserInfo"
        return tokenResult
    end if

    result = userService.info(tokenResult.accessToken)
    result.command = "loadUserInfo"
    return result
end function

function contentTaskLoadBookmarkFolders(tokenStore as Object, authService as Object, bookmarkService as Object) as Object
    tokenResult = contentTaskAccessToken(tokenStore, authService, "Sign in again to load bookmarks.")
    if tokenResult.ok <> true
        tokenResult.command = "loadBookmarkFolders"
        return tokenResult
    end if

    result = bookmarkService.listFolders(tokenResult.accessToken)
    result.command = "loadBookmarkFolders"
    return result
end function

function contentTaskLoadBookmarkFolderItems(tokenStore as Object, authService as Object, bookmarkService as Object, typeService as Object, request as Dynamic) as Object
    folderId = contentTaskIntegerField(request, "folderId", 0)
    page = contentTaskIntegerField(request, "page", 1)
    perpage = contentTaskIntegerField(request, "perpage", 20)

    tokenResult = contentTaskAccessToken(tokenStore, authService, "Sign in again to load bookmark folder.")
    if tokenResult.ok <> true
        tokenResult.command = "loadBookmarkFolderItems"
        tokenResult.folderId = folderId
        return tokenResult
    end if

    typeMap = contentTaskTypeMap(typeService, tokenResult.accessToken)
    result = bookmarkService.listFolderItems(tokenResult.accessToken, folderId, page, perpage, typeMap)
    result.command = "loadBookmarkFolderItems"
    result.folderId = folderId
    result.page = page
    result.perpage = perpage
    return result
end function

function contentTaskLoadItemBookmarkFolders(tokenStore as Object, authService as Object, bookmarkService as Object, request as Dynamic) as Object
    itemId = contentTaskIntegerField(request, "itemId", 0)

    tokenResult = contentTaskAccessToken(tokenStore, authService, "Sign in again to load bookmark status.")
    if tokenResult.ok <> true
        tokenResult.command = "loadItemBookmarkFolders"
        tokenResult.itemId = itemId
        return tokenResult
    end if

    result = bookmarkService.itemFolders(tokenResult.accessToken, itemId)
    result.command = "loadItemBookmarkFolders"
    result.itemId = itemId
    return result
end function

function contentTaskToggleItemBookmark(tokenStore as Object, authService as Object, bookmarkService as Object, request as Dynamic) as Object
    itemId = contentTaskIntegerField(request, "itemId", 0)
    folderId = contentTaskIntegerField(request, "folderId", 0)

    tokenResult = contentTaskAccessToken(tokenStore, authService, "Sign in again to update bookmark.")
    if tokenResult.ok <> true
        tokenResult.command = "toggleItemBookmark"
        tokenResult.itemId = itemId
        tokenResult.folderId = folderId
        return tokenResult
    end if

    result = bookmarkService.toggleItem(tokenResult.accessToken, itemId, folderId)
    result.command = "toggleItemBookmark"
    result.itemId = itemId
    result.folderId = folderId
    return result
end function

function contentTaskAccessToken(tokenStore as Object, authService as Object, message as String) as Object
    tokenResult = contentTaskUsableTokens(tokenStore, authService)

    if tokenResult.ok <> true
        if tokenResult.error = "auth_required"
            return { ok: false, error: "auth_required", message: message, status: 0 }
        end if
        return { ok: false, error: tokenResult.error, message: tokenResult.message, status: tokenResult.status }
    end if

    tokens = tokenResult.tokens
    if tokens = invalid then return { ok: false, error: "auth_required", message: message, status: 0 }

    accessToken = contentTaskTokenString(tokens, "accesstoken")
    if accessToken = "" then accessToken = contentTaskTokenString(tokens, "accessToken")
    if accessToken = "" then return { ok: false, error: "auth_required", message: message, status: 0 }

    return { ok: true, accessToken: accessToken }
end function

function contentTaskTypeMap(typeService as Object, accessToken as String) as Object
    if typeService = invalid then return {}
    return typeService.typeMap(accessToken)
end function

function contentTaskSavePlaybackProgress(tokenStore as Object, authService as Object, watchingService as Object, request as Dynamic) as Object
    itemId = contentTaskIntegerField(request, "itemId", 0)
    seasonNumber = contentTaskIntegerField(request, "seasonNumber", 0)
    videoNumber = contentTaskIntegerField(request, "videoNumber", 0)
    timeSeconds = contentTaskIntegerField(request, "timeSeconds", 0)
    if timeSeconds < 0 then timeSeconds = 0
    if itemId <= 0 or videoNumber <= 0
        return { command: "savePlaybackProgress", ok: false, itemId: itemId, seasonNumber: seasonNumber, videoNumber: videoNumber, timeSeconds: timeSeconds, error: "invalid_media", message: "Unable to save playback progress.", status: 0 }
    end if

    tokenResult = contentTaskAccessToken(tokenStore, authService, "Sign in again to save playback progress.")
    if tokenResult.ok <> true
        tokenResult.command = "savePlaybackProgress"
        return tokenResult
    end if

    result = watchingService.markTime(tokenResult.accessToken, itemId, seasonNumber, videoNumber, timeSeconds)
    result.command = "savePlaybackProgress"
    result.itemId = itemId
    result.seasonNumber = seasonNumber
    result.videoNumber = videoNumber
    result.timeSeconds = timeSeconds
    return result
end function

function contentTaskMarkPlaybackWatched(tokenStore as Object, authService as Object, watchingService as Object, request as Dynamic) as Object
    itemId = contentTaskIntegerField(request, "itemId", 0)
    seasonNumber = contentTaskIntegerField(request, "seasonNumber", 0)
    videoNumber = contentTaskIntegerField(request, "videoNumber", 0)
    if itemId <= 0 or videoNumber <= 0
        return { command: "markPlaybackWatched", ok: false, itemId: itemId, seasonNumber: seasonNumber, videoNumber: videoNumber, error: "invalid_media", message: "Unable to mark this video watched.", status: 0 }
    end if

    watchedState = contentTaskBooleanFieldState(request, "watched")
    currentWatchedState = contentTaskBooleanFieldState(request, "currentWatched")
    if watchedState.value = true or currentWatchedState.value = true
        ' The KinoPub endpoint toggles state; skip it when the media is already watched to avoid flipping it back.
        return { command: "markPlaybackWatched", ok: true, itemId: itemId, seasonNumber: seasonNumber, videoNumber: videoNumber, watched: true, skipped: true }
    end if
    if watchedState.exists <> true and currentWatchedState.exists <> true
        return { command: "markPlaybackWatched", ok: false, itemId: itemId, seasonNumber: seasonNumber, videoNumber: videoNumber, error: "unknown_watched_state", message: "Unable to confirm whether this video is already watched.", skipped: true, status: 0 }
    end if

    tokenResult = contentTaskAccessToken(tokenStore, authService, "Sign in again to mark playback watched.")
    if tokenResult.ok <> true
        tokenResult.command = "markPlaybackWatched"
        return tokenResult
    end if

    result = watchingService.toggleWatched(tokenResult.accessToken, itemId, seasonNumber, videoNumber)
    result.command = "markPlaybackWatched"
    result.itemId = itemId
    result.seasonNumber = seasonNumber
    result.videoNumber = videoNumber
    if result.ok <> true then return result
    if result.watched <> true
        result.ok = false
        result.error = "watched_not_confirmed"
        result.message = "Unable to confirm this video was marked watched."
    end if
    return result
end function

function contentTaskUsableTokens(tokenStore as Object, authService as Object) as Object
    tokens = tokenStore.load()
    if tokenStore.hasUsableAccessToken(tokens) then return { ok: true, tokens: tokens }

    if tokenStore.hasRefreshToken(tokens)
        refreshToken = contentTaskTokenString(tokens, "refreshtoken")
        result = authService.refreshToken(refreshToken)
        if result.ok = true
            refreshedTokens = tokenStore.load()
            if tokenStore.hasUsableAccessToken(refreshedTokens) then return { ok: true, tokens: refreshedTokens }
            return { ok: false, error: "auth_required", message: "Sign in again to load Watch Again.", status: 0 }
        end if
        return { ok: false, error: result.error, message: result.message, status: result.status }
    end if

    return { ok: false, error: "auth_required", message: "Sign in again to load Watch Again.", status: 0 }
end function

function contentTaskStringField(source as Dynamic, key as String, fallback as String) as String
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "String" or valueType = "roString" then return value
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return StrI(value).Trim()
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Str(value).Trim()
    return fallback
end function

function contentTaskIntegerField(source as Dynamic, key as String, fallback as Integer) as Integer
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return value
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Int(value)
    return fallback
end function

function contentTaskBooleanField(source as Dynamic, key as String, fallback as Boolean) as Boolean
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "Boolean" or valueType = "roBoolean" then return value
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return value <> 0
    return fallback
end function

function contentTaskBooleanFieldState(source as Dynamic, key as String) as Object
    if source = invalid or type(source) <> "roAssociativeArray" then return { exists: false, value: false }
    if source.DoesExist(key) <> true or source[key] = invalid then return { exists: false, value: false }
    value = source[key]
    valueType = type(value)
    if valueType = "Boolean" or valueType = "roBoolean" then return { exists: true, value: value }
    return { exists: false, value: false }
end function

function contentTaskTokenString(tokens as Dynamic, key as String) as String
    if tokens = invalid or type(tokens) <> "roAssociativeArray" then return ""
    if tokens.DoesExist(key) <> true or tokens[key] = invalid then return ""
    return tokens[key]
end function
