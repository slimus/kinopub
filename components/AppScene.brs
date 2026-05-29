sub init()
    m.screenHost = m.top.findNode("screenHost")
    m.routeFallbackTimer = m.top.findNode("routeFallbackTimer")
    m.routeFallbackTimer.observeField("fire", "onRouteFallbackTimer")
    showLoadingScreen()
    routeFromStoredTokens()
end sub

sub routeFromStoredTokens()
    print "AppScene: starting routeFromStoredTokens"
    task = createAuthTask("routeFromStoredTokens", {})
    task.observeField("response", "onRouteTaskResponse")
    task.control = "RUN"
    m.routeTask = task
    m.routeFallbackTimer.control = "start"
end sub

function createAuthTask(command as String, request as Object) as Object
    task = CreateObject("roSGNode", "AuthTask")
    task.command = command
    task.request = request
    return task
end function

sub onRouteTaskResponse(event as Object)
    m.routeFallbackTimer.control = "stop"
    result = event.getData()
    print "AppScene: routeFromStoredTokens response "; FormatJson(result)
    if result <> invalid and result.screen = "home"
        showHomeScreen()
    else
        showAuthScreen()
    end if
end sub

sub onRouteFallbackTimer()
    print "AppScene: routeFromStoredTokens timed out; showing auth screen"
    if m.routeTask <> invalid then m.routeTask.control = "STOP"
    showAuthScreen()
end sub

sub showAuthScreen()
    clearScreenHost()
    authScreen = CreateObject("roSGNode", "AuthScreen")
    authScreen.observeField("authCompleted", "onAuthCompleted")
    m.screenHost.appendChild(authScreen)
    authScreen.setFocus(true)
end sub

sub showLoadingScreen()
    clearScreenHost()
    loadingScreen = CreateObject("roSGNode", "LoadingScreen")
    m.screenHost.appendChild(loadingScreen)
end sub

sub showHomeScreen()
    clearScreenHost()
    homeScreen = CreateObject("roSGNode", "HomeScreen")
    homeScreen.observeField("signOutRequested", "onSignOutRequested")
    homeScreen.observeField("exitRequested", "onExitRequested")
    homeScreen.observeField("videoSelected", "onVideoSelected")
    m.homeScreen = homeScreen
    m.screenHost.appendChild(homeScreen)
    homeScreen.setFocus(true)
end sub

sub showVideoDetailScreen(selection as Object)
    if m.homeScreen <> invalid
        m.homeScreen.visible = false
    else
        clearScreenHost()
    end if
    detailScreen = CreateObject("roSGNode", "VideoDetailScreen")
    detailScreen.id = "detailScreen"
    detailScreen.selection = selection
    detailScreen.observeField("backRequested", "onVideoDetailBackRequested")
    detailScreen.observeField("playbackRequested", "onPlaybackRequested")
    m.detailScreen = detailScreen
    m.screenHost.appendChild(detailScreen)
    detailScreen.setFocus(true)
end sub

sub onVideoSelected(event as Object)
    selection = event.getData()
    if selection = invalid or selection.itemId = invalid or selection.itemId <= 0 then return
    showVideoDetailScreen(selection)
end sub

sub onVideoDetailBackRequested(event as Object)
    if event.getData() = true then restoreHomeScreen()
end sub

sub onPlaybackRequested(event as Object)
    playback = event.getData()
    if playback = invalid or playback.streamUrl = invalid or playback.streamUrl = "" then return
    showPlayerScreen(playback)
end sub

sub showPlayerScreen(playback as Object)
    if m.detailScreen <> invalid then m.detailScreen.visible = false
    playerScreen = CreateObject("roSGNode", "PlayerScreen")
    playerScreen.id = "playerScreen"
    playerScreen.observeField("exitRequested", "onPlayerExitRequested")
    playerScreen.observeField("playbackError", "onPlayerPlaybackError")
    m.playerScreen = playerScreen
    m.screenHost.appendChild(playerScreen)
    playerScreen.playback = playback
    playerScreen.setFocus(true)
end sub

sub onPlayerExitRequested(event as Object)
    if event.getData() <> true then return
    closePlayerScreen()
end sub

sub onPlayerPlaybackError(event as Object)
    message = event.getData()
    if m.detailScreen <> invalid and message <> invalid and message <> "" then m.detailScreen.playbackError = message
end sub

sub closePlayerScreen()
    if m.playerScreen <> invalid
        removeScreenHostChild("playerScreen")
        m.playerScreen = invalid
    end if
    if m.detailScreen <> invalid
        m.detailScreen.visible = true
        m.detailScreen.setFocus(true)
        m.detailScreen.reloadRequested = true
    end if
end sub

sub restoreHomeScreen()
    if m.playerScreen <> invalid
        removeScreenHostChild("playerScreen")
        m.playerScreen = invalid
    end if
    if m.detailScreen <> invalid
        removeScreenHostChild("detailScreen")
        m.detailScreen = invalid
    end if

    if m.homeScreen <> invalid
        m.homeScreen.visible = true
        m.homeScreen.setFocus(true)
    else
        showHomeScreen()
    end if
end sub

function removeScreenHostChild(childId as String) as Boolean
    if childId = invalid or childId = "" then return false
    for index = 0 to m.screenHost.getChildCount() - 1
        child = m.screenHost.getChild(index)
        if child <> invalid and child.id = childId
            m.screenHost.removeChild(child)
            return true
        end if
    end for
    return false
end function

sub clearScreenHost()
    m.homeScreen = invalid
    m.detailScreen = invalid
    m.playerScreen = invalid
    childCount = m.screenHost.getChildCount()
    if childCount > 0 then m.screenHost.removeChildrenIndex(childCount, 0)
end sub

sub onAuthCompleted(event as Object)
    if event.getData() = true then showHomeScreen()
end sub

sub onSignOutRequested(event as Object)
    if event.getData() = true
        task = createAuthTask("clearTokens", {})
        task.observeField("response", "onClearTokensResponse")
        task.control = "RUN"
        m.clearTokensTask = task
    end if
end sub

sub onExitRequested(event as Object)
    if event.getData() = true then m.top.exitRequested = true
end sub

sub onClearTokensResponse()
    showAuthScreen()
end sub
