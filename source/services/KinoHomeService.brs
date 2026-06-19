function KinoHomeService(client as Object) as Object
    return {
        client: client
        rails: kinoHomeRails
        load: kinoHomeLoad
        fetchRail: kinoHomeFetchRail
        normalizeResponse: kinoHomeNormalizeResponse
        normalizeItem: kinoHomeNormalizeItem
        enrichType: kinoHomeEnrichType
        typeTitleForType: kinoHomeTypeTitleForType
        typeBadgeForType: kinoHomeTypeBadgeForType
        posterUrl: kinoHomePosterUrl
        subtitle: kinoHomeSubtitle
        metadata: kinoHomeMetadata
        genreTitles: kinoHomeGenreTitles
        countryTitles: kinoHomeCountryTitles
        stringField: kinoHomeStringField
        integerField: kinoHomeIntegerField
        arrayField: kinoHomeArrayField
        failure: kinoHomeFailure
    }
end function

function kinoHomeRails() as Object
    return [
        { id: "popularMovies", title: "Popular Movies", endpoint: "/v1/items/popular", contentType: "movie", optional: false },
        { id: "newMovies", title: "New Movies", endpoint: "/v1/items/fresh", contentType: "movie", optional: false },
        { id: "popularSeries", title: "Popular Series", endpoint: "/v1/items/popular", contentType: "serial", optional: false },
        { id: "newSeries", title: "New Series", endpoint: "/v1/items/fresh", contentType: "serial", optional: false },
        { id: "newDocMovies", title: "New Documentaries", endpoint: "/v1/items/fresh", contentType: "documovie", optional: false },
        { id: "newDocSeries", title: "New Documentary Series", endpoint: "/v1/items/fresh", contentType: "docuserial", optional: false },
        { id: "newTvShows", title: "New TV Shows", endpoint: "/v1/items/fresh", contentType: "tvshow", optional: false },
        { id: "newConcerts", title: "New Concerts", endpoint: "/v1/items/fresh", contentType: "concert", optional: true },
        { id: "new3d", title: "New in 3D", endpoint: "/v1/items/fresh", contentType: "3D", optional: true }
    ]
end function

function kinoHomeLoad(accessToken as String, perpage as Integer, typeMap = invalid as Dynamic) as Object
    if perpage < 1 then perpage = 12
    if perpage > 20 then perpage = 20

    loadedRails = []
    failures = []

    for each railDef in m.rails()
        result = m.fetchRail(accessToken, railDef, perpage, typeMap)
        if result.ok = true
            if result.items.Count() > 0
                loadedRails.Push({
                    id: railDef.id
                    title: railDef.title
                    items: result.items
                })
            end if
        else
            failures.Push({
                id: railDef.id
                title: railDef.title
                error: result.error
                message: result.message
                status: result.status
            })
        end if
    end for

    if loadedRails.Count() > 0
        return { ok: true, rails: loadedRails, failures: failures }
    end if

    if failures.Count() > 0
        message = "Unable to load Home."
        if failures[0].message <> invalid and failures[0].message <> "" then message = failures[0].message
        return { ok: false, rails: [], failures: failures, error: failures[0].error, message: message, status: failures[0].status }
    end if

    return { ok: true, rails: [], failures: [] }
end function

function kinoHomeFetchRail(accessToken as String, railDef as Object, perpage as Integer, typeMap = invalid as Dynamic) as Object
    queryParams = {
        access_token: accessToken
        type: railDef.contentType
        page: 1
        perpage: perpage
    }

    response = m.client.get(railDef.endpoint, queryParams, m.client.defaultTimeoutMs)
    if response.ok <> true then return m.failure(response)
    return m.normalizeResponse(response.body, typeMap)
end function

function kinoHomeNormalizeResponse(body as Dynamic, typeMap = invalid as Dynamic) as Object
    items = []

    if body = invalid or type(body) <> "roAssociativeArray"
        return { ok: false, items: [], error: "invalid_response", message: "Home response was not readable.", status: 0 }
    end if

    if body.DoesExist("items") <> true or body.items = invalid or type(body.items) <> "roArray"
        return { ok: false, items: [], error: "invalid_response", message: "Home response did not include an items list.", status: 0 }
    end if

    for each item in body.items
        normalized = m.normalizeItem(item, typeMap)
        if normalized.itemId > 0 then items.Push(normalized)
    end for

    return { ok: true, items: items }
end function

function kinoHomeNormalizeItem(item as Dynamic, typeMap = invalid as Dynamic) as Object
    title = m.stringField(item, "title", "")
    if title = "" then title = m.stringField(item, "name", "")
    if title = "" then title = "Untitled"

    normalized = {
        itemId: m.integerField(item, "id", 0)
        mediaId: 0
        title: title
        subtitle: m.subtitle(item)
        posterUrl: m.posterUrl(item)
        metadata: m.metadata(item)
        type: m.stringField(item, "type", "")
        year: m.integerField(item, "year", 0)
    }

    return m.enrichType(normalized, typeMap)
end function

function kinoHomeEnrichType(item as Object, typeMap as Dynamic) as Object
    contentType = ""
    if item.DoesExist("type") and item.type <> invalid then contentType = item.type
    item.typeTitle = m.typeTitleForType(contentType, typeMap)
    item.typeBadge = m.typeBadgeForType(contentType, item.typeTitle, typeMap)
    return item
end function

function kinoHomeTypeTitleForType(contentType as String, typeMap as Dynamic) as String
    if contentType = "" then return ""
    if typeMap <> invalid and type(typeMap) = "roAssociativeArray" and typeMap.DoesExist(contentType)
        entry = typeMap[contentType]
        if entry <> invalid and type(entry) = "roAssociativeArray"
            title = m.stringField(entry, "title", "")
            if title <> "" then return title
        end if
    end if
    return contentType
end function

function kinoHomeTypeBadgeForType(contentType as String, title as String, typeMap as Dynamic) as String
    if contentType = "" then return ""
    if typeMap <> invalid and type(typeMap) = "roAssociativeArray" and typeMap.DoesExist(contentType)
        entry = typeMap[contentType]
        if entry <> invalid and type(entry) = "roAssociativeArray"
            badge = m.stringField(entry, "badge", "")
            if badge <> "" then return badge
        end if
    end if
    source = title
    if source = "" then source = contentType
    source = source.Trim()
    source = UCase(source)
    if Len(source) > 3 then source = Left(source, 3)
    return source
end function

function kinoHomePosterUrl(item as Dynamic) as String
    if item <> invalid and type(item) = "roAssociativeArray" and item.DoesExist("posters") and item.posters <> invalid and type(item.posters) = "roAssociativeArray"
        posters = item.posters
        url = m.stringField(posters, "medium", "")
        if url <> "" then return url
        url = m.stringField(posters, "small", "")
        if url <> "" then return url
        url = m.stringField(posters, "big", "")
        if url <> "" then return url
    end if
    return m.stringField(item, "poster", "")
end function

function kinoHomeSubtitle(item as Dynamic) as String
    values = []
    year = m.integerField(item, "year", 0)
    if year > 0 then values.Push(StrI(year).Trim())

    genres = m.genreTitles(item)
    if genres <> "" then values.Push(genres)

    return values.Join("  |  ")
end function

function kinoHomeMetadata(item as Dynamic) as String
    values = []
    countries = m.countryTitles(item)
    if countries <> "" then values.Push(countries)

    rating = m.stringField(item, "rating", "")
    if rating <> "" and rating <> "0" then values.Push("Rating " + rating)

    return values.Join("  |  ")
end function

function kinoHomeGenreTitles(item as Dynamic) as String
    titles = []
    genres = m.arrayField(item, "genres")
    for each genre in genres
        title = m.stringField(genre, "title", "")
        if title <> "" then titles.Push(title)
        if titles.Count() = 2 then exit for
    end for
    return titles.Join(", ")
end function

function kinoHomeCountryTitles(item as Dynamic) as String
    titles = []
    countries = m.arrayField(item, "countries")
    for each country in countries
        title = m.stringField(country, "title", "")
        if title <> "" then titles.Push(title)
        if titles.Count() = 2 then exit for
    end for
    return titles.Join(", ")
end function

function kinoHomeStringField(source as Dynamic, key as String, fallback as String) as String
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "String" or valueType = "roString" then return value
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return StrI(value).Trim()
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Str(value).Trim()
    return fallback
end function

function kinoHomeIntegerField(source as Dynamic, key as String, fallback as Integer) as Integer
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return value
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Int(value)
    return fallback
end function

function kinoHomeArrayField(source as Dynamic, key as String) as Object
    if source = invalid or type(source) <> "roAssociativeArray" then return []
    if source.DoesExist(key) <> true or source[key] = invalid then return []
    if type(source[key]) = "roArray" then return source[key]
    return []
end function

function kinoHomeFailure(response as Object) as Object
    errorCode = response.error
    if errorCode = invalid or errorCode = "" then errorCode = "network"
    return { ok: false, error: errorCode, message: response.message, status: response.status, rawBody: response.rawBody }
end function
