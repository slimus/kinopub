sub init()
    m.top.functionName = "runAuthTask"
end sub

sub runAuthTask()
    tokenStore = TokenStore()
    authService = KinoAuthService(KinoApiClient(KinoConfig()), tokenStore)
    command = m.top.command
    request = m.top.request
    print "AuthTask: running command "; command

    if command = "routeFromStoredTokens"
        m.top.response = authTaskRouteFromStoredTokens(tokenStore, authService)
    else if command = "clearTokens"
        tokenStore.clear()
        m.top.response = { command: command, ok: true }
    else if command = "requestDeviceCode"
        result = authService.requestDeviceCode()
        result.command = command
        m.top.response = result
    else if command = "pollDeviceToken"
        result = authService.pollDeviceToken(request.code)
        if result.ok = true then authService.notifyDevice(result.tokens.accessToken)
        result.command = command
        m.top.response = result
    else
        m.top.response = { command: command, ok: false, error: "unknown_command", message: "Unknown auth task command." }
    end if
end sub

function authTaskRouteFromStoredTokens(tokenStore as Object, authService as Object) as Object
    tokens = tokenStore.load()
    print "AuthTask: loaded stored tokens? "; tokens <> invalid
    if tokens <> invalid
        print "AuthTask: token fields access="; tokens.DoesExist("accesstoken"); " accessExpiry="; tokens.DoesExist("accessexpiresat"); " refresh="; tokens.DoesExist("refreshtoken"); " refreshExpiry="; tokens.DoesExist("refreshexpiresat")
        print "AuthTask: token keys="; tokenStore.keySummary(tokens)
    end if
    if tokenStore.hasUsableAccessToken(tokens)
        print "AuthTask: using stored access token"
        if authTaskNotifyAllowsHome(tokens.accesstoken, tokenStore, authService)
            return { command: "routeFromStoredTokens", ok: true, screen: "home" }
        end if
        return { command: "routeFromStoredTokens", ok: true, screen: "auth", error: "unauthorized", message: "Device authorization was removed. Sign in again." }
    end if

    if tokenStore.hasRefreshToken(tokens)
        print "AuthTask: refreshing stored token"
        result = authService.refreshToken(tokens.refreshtoken)
        if result.ok = true
            if authTaskNotifyAllowsHome(result.tokens.accessToken, tokenStore, authService)
                return { command: "routeFromStoredTokens", ok: true, screen: "home" }
            end if
            return { command: "routeFromStoredTokens", ok: true, screen: "auth", error: "unauthorized", message: "Device authorization was removed. Sign in again." }
        end if
    end if

    print "AuthTask: no usable stored token; showing auth"
    tokenStore.clear()
    return { command: "routeFromStoredTokens", ok: true, screen: "auth" }
end function

function authTaskNotifyAllowsHome(accessToken as String, tokenStore as Object, authService as Object) as Boolean
    notifyResult = authService.notifyDevice(accessToken)
    if notifyResult.ok = true then return true

    print "AuthTask: device notify failed status="; notifyResult.status; " error="; notifyResult.error
    if notifyResult.status = 401 or notifyResult.error = "unauthorized"
        print "AuthTask: stored device authorization was removed; clearing tokens"
        tokenStore.clear()
        return false
    end if

    return true
end function
