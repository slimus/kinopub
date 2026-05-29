function KinoUserService(client as Object) as Object
    return {
        client: client
        info: kinoUserInfo
        normalizeResponse: kinoUserNormalizeResponse
        stringField: kinoUserStringField
        numberField: kinoUserNumberField
        booleanField: kinoUserBooleanField
        formattedDate: kinoUserFormattedDate
        failure: kinoUserFailure
    }
end function

function kinoUserInfo(accessToken as String) as Object
    response = m.client.get("/v1/user", { access_token: accessToken }, m.client.defaultTimeoutMs)
    if response.ok <> true then return m.failure(response)
    return { ok: true, user: m.normalizeResponse(response.body) }
end function

function kinoUserNormalizeResponse(body as Dynamic) as Object
    user = invalid
    if body <> invalid and type(body) = "roAssociativeArray"
        if body.DoesExist("user") then user = body.user else user = body
    end if
    if user = invalid or type(user) <> "roAssociativeArray" then user = {}

    profile = {}
    if user.DoesExist("profile") and user.profile <> invalid and type(user.profile) = "roAssociativeArray" then profile = user.profile

    subscription = {}
    if user.DoesExist("subscription") and user.subscription <> invalid and type(user.subscription) = "roAssociativeArray" then subscription = user.subscription

    username = m.stringField(user, "username", "")
    displayName = m.stringField(profile, "name", "")
    if displayName = "" then displayName = username
    if displayName = "" then displayName = "Account"

    daysLeft = m.numberField(subscription, "days", -1)
    endDate = m.formattedDate(m.numberField(subscription, "end_time", 0))
    registeredDate = m.formattedDate(m.numberField(user, "reg_date", 0))

    return {
        displayName: displayName
        username: username
        avatarUrl: m.stringField(profile, "avatar", "")
        subscriptionActive: m.booleanField(subscription, "active", false)
        subscriptionDaysLeft: daysLeft
        subscriptionEndDate: endDate
        registeredDate: registeredDate
    }
end function

function kinoUserStringField(source as Dynamic, key as String, fallback as String) as String
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "String" or valueType = "roString" then return value
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return StrI(value).Trim()
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Str(value).Trim()
    return fallback
end function

function kinoUserNumberField(source as Dynamic, key as String, fallback as Float) as Float
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return value
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return value
    if valueType = "String" or valueType = "roString"
        trimmed = value.Trim()
        if kinoUserIsNumericString(trimmed) then return Val(trimmed)
    end if
    return fallback
end function

function kinoUserIsNumericString(value as String) as Boolean
    if value = "" then return false

    hasDigit = false
    hasDecimal = false
    startIndex = 1

    firstChar = Left(value, 1)
    if firstChar = "-" or firstChar = "+"
        if Len(value) = 1 then return false
        startIndex = 2
    end if

    for index = startIndex to Len(value)
        character = Mid(value, index, 1)
        if Instr(1, "0123456789", character) > 0
            hasDigit = true
        else if character = "."
            if hasDecimal then return false
            hasDecimal = true
        else
            return false
        end if
    end for

    return hasDigit
end function

function kinoUserBooleanField(source as Dynamic, key as String, fallback as Boolean) as Boolean
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "Boolean" or valueType = "roBoolean" then return value
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return value <> 0
    if valueType = "String" or valueType = "roString"
        normalized = LCase(value.Trim())
        if normalized = "true" or normalized = "1" then return true
        if normalized = "false" or normalized = "0" then return false
    end if
    return fallback
end function

function kinoUserFormattedDate(timestamp as Float) as String
    if timestamp <= 0 then return ""

    dt = CreateObject("roDateTime")
    dt.FromSeconds(Int(timestamp))

    monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    month = dt.GetMonth()
    if month < 1 or month > 12 then return ""

    return monthNames[month - 1] + " " + StrI(dt.GetDayOfMonth()).Trim() + ", " + StrI(dt.GetYear()).Trim()
end function

function kinoUserFailure(response as Object) as Object
    errorCode = response.error
    if errorCode = invalid or errorCode = "" then errorCode = "network"
    return { ok: false, error: errorCode, message: response.message, status: response.status, rawBody: response.rawBody }
end function
