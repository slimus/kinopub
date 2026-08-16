function TokenStore() as Object
    return {
        sectionName: "kinoauth"
        load: tokenStoreLoad
        save: tokenStoreSave
        clear: tokenStoreClear
        normalize: tokenStoreNormalize
        keySummary: tokenStoreKeySummary
        hasUsableAccessToken: tokenStoreHasUsableAccessToken
        hasRefreshToken: tokenStoreHasRefreshToken
    }
end function

function tokenStoreLoad() as Dynamic
    section = CreateObject("roRegistrySection", m.sectionName)
    raw = section.Read("tokens")
    if raw = invalid or raw = "" then return invalid
    tokens = ParseJson(raw)
    normalized = m.normalize(tokens)
    if normalized <> invalid and FormatJson(normalized) <> raw then m.save(normalized)
    return normalized
end function

function tokenStoreSave(tokens as Object) as Void
    section = CreateObject("roRegistrySection", m.sectionName)
    section.Write("tokens", FormatJson(tokens))
    section.Flush()
end function

function tokenStoreClear() as Void
    section = CreateObject("roRegistrySection", m.sectionName)
    section.Delete("tokens")
    section.Flush()
end function

function tokenStoreNormalize(tokens as Dynamic) as Dynamic
    if tokens = invalid then return invalid
    if type(tokens) <> "roAssociativeArray" then return invalid
    source = tokenStoreTokenPayload(tokens)
    normalized = {}

    accessToken = tokenStoreFirstField(source, ["accesstoken", "access_token", "accessToken"])
    refreshToken = tokenStoreFirstField(source, ["refreshtoken", "refresh_token", "refreshToken"])
    tokenType = tokenStoreFirstField(source, ["tokentype", "token_type", "tokenType"])
    accessExpiresAt = tokenStoreFirstField(source, ["accessexpiresat", "access_expires_at", "accessExpiresAt"])
    refreshExpiresAt = tokenStoreFirstField(source, ["refreshexpiresat", "refresh_expires_at", "refreshExpiresAt"])

    if accessToken <> invalid then normalized.accesstoken = accessToken
    if refreshToken <> invalid then normalized.refreshtoken = refreshToken
    if tokenType <> invalid then normalized.tokentype = tokenType
    if accessExpiresAt <> invalid then normalized.accessexpiresat = accessExpiresAt
    if refreshExpiresAt <> invalid then normalized.refreshexpiresat = refreshExpiresAt

    now = tokenStoreNowSeconds()
    if normalized.DoesExist("accesstoken") and normalized.accesstoken <> "" and not normalized.DoesExist("accessexpiresat")
        expiresIn = tokenStoreFirstField(source, ["expires_in", "expiresin", "expiresIn"])
        if expiresIn <> invalid
            normalized.accessexpiresat = now + expiresIn
        else
            normalized.accessexpiresat = now + 3600
        end if
    end if

    if normalized.DoesExist("refreshtoken") and normalized.refreshtoken <> ""
        if (not normalized.DoesExist("refreshexpiresat")) or normalized.refreshexpiresat <= now
            normalized.refreshexpiresat = now + (30 * 24 * 60 * 60)
        end if
    end if

    return normalized
end function

function tokenStoreFirstField(values as Object, keys as Object) as Dynamic
    for each key in keys
        if values.DoesExist(key) then return values[key]
    end for
    return invalid
end function

function tokenStoreTokenPayload(tokens as Object) as Object
    if tokenStoreHasAnyTokenField(tokens) then return tokens

    for each key in ["tokens", "body", "data", "auth"]
        if tokens.DoesExist(key) and type(tokens[key]) = "roAssociativeArray"
            candidate = tokens[key]
            if tokenStoreHasAnyTokenField(candidate) then return candidate
        end if
    end for

    return tokens
end function

function tokenStoreHasAnyTokenField(tokens as Object) as Boolean
    if tokenStoreFirstField(tokens, ["accesstoken", "access_token", "accessToken"]) <> invalid then return true
    if tokenStoreFirstField(tokens, ["refreshtoken", "refresh_token", "refreshToken"]) <> invalid then return true
    return false
end function

function tokenStoreKeySummary(tokens as Dynamic) as String
    if tokens = invalid then return "invalid"
    if type(tokens) <> "roAssociativeArray" then return type(tokens)

    keys = []
    for each key in tokens
        keys.Push(key)
    end for
    return keys.Join(",")
end function

function tokenStoreHasUsableAccessToken(tokens as Dynamic) as Boolean
    tokens = tokenStoreNormalize(tokens)
    if tokens = invalid then return false
    if not tokens.DoesExist("accesstoken") then return false
    if not tokens.DoesExist("accessexpiresat") then return false
    return tokens.accessexpiresat > tokenStoreNowSeconds() + 60
end function

function tokenStoreHasRefreshToken(tokens as Dynamic) as Boolean
    tokens = tokenStoreNormalize(tokens)
    if tokens = invalid then return false
    if not tokens.DoesExist("refreshtoken") then return false
    if tokens.refreshtoken = "" then return false
    if tokens.DoesExist("refreshexpiresat") then return tokens.refreshexpiresat > tokenStoreNowSeconds()
    return true
end function

function tokenStoreNowSeconds() as Integer
    dt = CreateObject("roDateTime")
    return dt.AsSeconds()
end function
