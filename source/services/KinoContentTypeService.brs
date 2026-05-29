function KinoContentTypeService(client as Object) as Object
    return {
        client: client
        sectionName: "kinotypes"
        cacheTtlSeconds: 86400
        fetchTimeoutMs: 1200
        typeMap: kinoContentTypeMap
        loadCache: kinoContentTypeLoadCache
        saveCache: kinoContentTypeSaveCache
        fetchMap: kinoContentTypeFetchMap
        normalizeResponse: kinoContentTypeNormalizeResponse
        fallbackMap: kinoContentTypeFallbackMap
        enrichItem: kinoContentTypeEnrichItem
        typeTitleForType: kinoContentTypeTitleForType
        badgeForType: kinoContentTypeBadgeForType
        fallbackBadge: kinoContentTypeFallbackBadge
        stringField: kinoContentTypeStringField
        nowSeconds: kinoContentTypeNowSeconds
    }
end function

function kinoContentTypeMap(accessToken as String) as Object
    cached = m.loadCache()
    now = m.nowSeconds()
    if cached.valid = true and cached.cachedAt > 0 and cached.cachedAt + m.cacheTtlSeconds > now
        return cached.typeMap
    end if

    fetched = m.fetchMap(accessToken)
    if fetched.ok = true
        m.saveCache(fetched.typeMap, now)
        return fetched.typeMap
    end if

    if cached.valid = true then return cached.typeMap
    return m.fallbackMap()
end function

function kinoContentTypeLoadCache() as Object
    section = CreateObject("roRegistrySection", m.sectionName)
    rawTypes = section.Read("typesJson")
    rawCachedAt = section.Read("typesCachedAt")
    if rawTypes = invalid or rawTypes = "" then return { valid: false, typeMap: {}, cachedAt: 0 }

    parsed = ParseJson(rawTypes)
    if parsed = invalid or type(parsed) <> "roAssociativeArray" then return { valid: false, typeMap: {}, cachedAt: 0 }

    cachedAt = 0
    if rawCachedAt <> invalid and rawCachedAt <> "" then cachedAt = Val(rawCachedAt)
    return { valid: true, typeMap: parsed, cachedAt: cachedAt }
end function

sub kinoContentTypeSaveCache(typeMap as Object, now as Integer)
    if typeMap = invalid then return
    section = CreateObject("roRegistrySection", m.sectionName)
    section.Write("typesJson", FormatJson(typeMap))
    section.Write("typesCachedAt", StrI(now).Trim())
    section.Flush()
end sub

function kinoContentTypeFetchMap(accessToken as String) as Object
    response = m.client.get("/v1/types", { access_token: accessToken }, m.fetchTimeoutMs)
    if response.ok <> true
        return { ok: false, typeMap: {}, error: response.error, message: response.message, status: response.status }
    end if

    typeMap = m.normalizeResponse(response.body)
    if typeMap.Count() = 0
        return { ok: false, typeMap: {}, error: "invalid_response", message: "Content types were not available.", status: response.status }
    end if

    return { ok: true, typeMap: typeMap }
end function

function kinoContentTypeNormalizeResponse(body as Dynamic) as Object
    typeMap = {}
    sourceTypes = []

    if body <> invalid and type(body) = "roAssociativeArray"
        if body.DoesExist("types") and body.types <> invalid and type(body.types) = "roArray"
            sourceTypes = body.types
        else if body.DoesExist("content_types") and body.content_types <> invalid and type(body.content_types) = "roArray"
            sourceTypes = body.content_types
        end if
    else if body <> invalid and type(body) = "roArray"
        sourceTypes = body
    end if

    for each contentType in sourceTypes
        if contentType <> invalid and type(contentType) = "roAssociativeArray"
            id = m.stringField(contentType, "id", "")
            title = m.stringField(contentType, "title", "")
            if id <> ""
                typeMap[id] = {
                    id: id
                    title: title
                    badge: m.fallbackBadge(id, title)
                }
            end if
        end if
    end for

    fallback = m.fallbackMap()
    for each key in fallback
        if not typeMap.DoesExist(key) then typeMap[key] = fallback[key]
    end for

    return typeMap
end function

function kinoContentTypeFallbackMap() as Object
    return {
        movie: { id: "movie", title: "Movie", badge: "MOV" }
        serial: { id: "serial", title: "Series", badge: "SER" }
        "3D": { id: "3D", title: "3D", badge: "3D" }
        concert: { id: "concert", title: "Concert", badge: "CON" }
        documovie: { id: "documovie", title: "Documentary", badge: "DOC" }
        docuserial: { id: "docuserial", title: "Documentary series", badge: "DOC" }
        tvshow: { id: "tvshow", title: "TV show", badge: "TV" }
    }
end function

function kinoContentTypeEnrichItem(item as Object, typeMap as Dynamic) as Object
    if item = invalid then return item
    contentType = ""
    if item.DoesExist("type") and item.type <> invalid then contentType = item.type
    item.typeTitle = m.typeTitleForType(contentType, typeMap)
    item.typeBadge = m.badgeForType(contentType, item.typeTitle, typeMap)
    return item
end function

function kinoContentTypeTitleForType(contentType as String, typeMap as Dynamic) as String
    if contentType = "" then return ""
    if typeMap <> invalid and type(typeMap) = "roAssociativeArray" and typeMap.DoesExist(contentType)
        entry = typeMap[contentType]
        if entry <> invalid and type(entry) = "roAssociativeArray"
            title = m.stringField(entry, "title", "")
            if title <> "" then return title
        end if
    end if
    fallback = m.fallbackMap()
    if fallback.DoesExist(contentType) then return fallback[contentType].title
    return contentType
end function

function kinoContentTypeBadgeForType(contentType as String, title as String, typeMap as Dynamic) as String
    if contentType = "" then return ""
    if typeMap <> invalid and type(typeMap) = "roAssociativeArray" and typeMap.DoesExist(contentType)
        entry = typeMap[contentType]
        if entry <> invalid and type(entry) = "roAssociativeArray"
            badge = m.stringField(entry, "badge", "")
            if badge <> "" then return badge
        end if
    end if
    return m.fallbackBadge(contentType, title)
end function

function kinoContentTypeFallbackBadge(contentType as String, title as String) as String
    fallback = m.fallbackMap()
    if fallback.DoesExist(contentType)
        badge = m.stringField(fallback[contentType], "badge", "")
        if badge <> "" then return badge
    end if

    source = title
    if source = "" then source = contentType
    source = source.Trim()
    source = UCase(source)
    if Len(source) > 3 then source = Left(source, 3)
    return source
end function

function kinoContentTypeStringField(source as Dynamic, key as String, fallback as String) as String
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "String" or valueType = "roString" then return value
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return StrI(value).Trim()
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Str(value).Trim()
    return fallback
end function

function kinoContentTypeNowSeconds() as Integer
    dt = CreateObject("roDateTime")
    return dt.AsSeconds()
end function
