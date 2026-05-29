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
    tokens = tokenStoreTokenPayload(tokens)

    if (not tokens.DoesExist("accesstoken")) and tokens.DoesExist("access_token") then tokens.accesstoken = tokens.access_token
    if (not tokens.DoesExist("refreshtoken")) and tokens.DoesExist("refresh_token") then tokens.refreshtoken = tokens.refresh_token
    if (not tokens.DoesExist("tokentype")) and tokens.DoesExist("token_type") then tokens.tokentype = tokens.token_type

    now = tokenStoreNowSeconds()
    if tokens.DoesExist("accesstoken") and tokens.accesstoken <> "" and not tokens.DoesExist("accessexpiresat")
        if tokens.DoesExist("expires_in")
            tokens.accessexpiresat = now + tokens.expires_in
        else
            tokens.accessexpiresat = now + 3600
        end if
    end if

    if tokens.DoesExist("refreshtoken") and tokens.refreshtoken <> ""
        if (not tokens.DoesExist("refreshexpiresat")) or tokens.refreshexpiresat <= now
            tokens.refreshexpiresat = now + (30 * 24 * 60 * 60)
        end if
    end if

    return tokens
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
    if tokens.DoesExist("access_token") or tokens.DoesExist("accesstoken") then return true
    if tokens.DoesExist("refresh_token") or tokens.DoesExist("refreshtoken") then return true
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
