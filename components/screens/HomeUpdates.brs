sub initUpdates()
    m.updateBusy = false
    m.updateManual = false
    m.updateManualQueued = false
    m.accountAction = "updates"
    m.updateState = updateLoadState()
    renderUpdateState()
    timer = m.top.findNode("updateStartupTimer")
    timer.observeField("fire", "onUpdateStartupTimer")
    timer.control = "start"
end sub

sub onUpdateStartupTimer()
    startUpdateCheck(false)
end sub

sub startUpdateCheck(manual as Boolean)
    if m.updateBusy
        ' A manual action during a background check still gets a fresh request.
        if manual and not m.updateManual then m.updateManualQueued = true
        return
    end if
    m.updateBusy = true
    m.updateManual = manual
    task = CreateObject("roSGNode", "UpdateTask")
    task.manual = manual
    task.observeField("response", "onUpdateResponse")
    m.updateTask = task
    renderUpdateState()
    task.control = "RUN"
end sub

sub onUpdateResponse(event as Object)
    response = event.getData()
    manual = m.updateManual
    m.updateBusy = false
    if response <> invalid then m.updateState = response.state
    renderUpdateState()
    if m.updateManualQueued
        m.updateManualQueued = false
        startUpdateCheck(true)
        return
    end if
    if not manual then return
    title = "Check for updates"
    message = "Unable to check for updates. Please try again."
    if response <> invalid and response.ok = true
        message = "You are up to date."
        if updateAvailable()
            release = m.updateState.release
            title = "Update available: " + release.version
            notes = release.notes
            if type(notes) <> "String" and type(notes) <> "roString" then notes = "No release notes provided."
            if notes = "" then notes = "No release notes provided."
            message = notes + Chr(10) + Chr(10) + "Download and install this update manually:" + Chr(10) + "https://github.com/slimus/kinopub/releases"
        end if
    end if
    ' Keep the result until Home is visible and any other dialog is closed.
    m.pendingUpdateDialog = { title: title, message: message }
    m.top.findNode("updateDialogTimer").control = "start"
end sub

function updateAvailable() as Boolean
    if m.updateState = invalid or m.updateState.release = invalid then return false
    return updateVersionCompare(m.updateState.release.version, BuildInfo().version) > 0
end function

sub renderUpdateState()
    if m.updateState = invalid then return
    available = updateAvailable()
    m.top.findNode("accountUpdateMarker").visible = available
    m.top.findNode("collapsedUpdateMarker").visible = available
    ' Menu positions change when Live TV is available.
    m.top.findNode("accountUpdateMarker").translation = [244, m.accountNav.translation[1] + 8]
    m.top.findNode("collapsedUpdateMarker").translation = [66, m.collapsedAccount.translation[1] + 8]
    text = "Check for updates"
    if available then text = "Check for updates (new)"
    if m.updateBusy then text = "Checking for updates..."
    m.top.findNode("checkUpdatesLabel").text = text
    color = "#242424"
    if m.selectedSection = "account" and m.focusArea = "content" and m.accountAction = "updates" then color = "#2563EB"
    setThemeColor(m.top.findNode("checkUpdatesBackground"), color)
    retryColor = "#374151"
    if m.focusArea = "content" and m.accountAction = "retry" then retryColor = "#2563EB"
    setThemeColor(m.top.findNode("accountRetryFocus"), retryColor)
end sub

sub onUpdateDialogTimer()
    if m.pendingUpdateDialog = invalid then return
    scene = m.top.getScene()
    if not m.top.visible or scene.dialog <> invalid then return
    dialog = CreateObject("roSGNode", "Dialog")
    dialog.title = m.pendingUpdateDialog.title
    dialog.message = m.pendingUpdateDialog.message
    dialog.buttons = ["OK"]
    dialog.observeField("buttonSelected", "onUpdateDialogButton")
    scene.dialog = dialog
    m.pendingUpdateDialog = invalid
    m.top.findNode("updateDialogTimer").control = "stop"
end sub

sub onUpdateDialogButton()
    scene = m.top.getScene()
    if scene.dialog <> invalid then scene.dialog.close = true
end sub

function handleAccountKey(key as String) as Boolean
    if m.accountAction = "updates"
        if key = "OK"
            startUpdateCheck(true)
        else if key = "down"
            m.accountAction = "device"
            if m.accountErrorGroup.visible then m.accountAction = "retry"
        else if key = "left" or key = "back"
            setMenuExpanded(true)
        end if
    else if m.accountAction = "retry"
        if key = "OK"
            loadAccountInfo(true)
        else if key = "up"
            m.accountAction = "updates"
        else if key = "down"
            m.accountAction = "device"
        else if key = "left" or key = "back"
            setMenuExpanded(true)
        end if
    else
        if key = "up" and not m.deviceEditing
            firstInColumn = m.deviceIndex = 0
            if m.deviceRows.Count() > 0
                firstInColumn = true
                for index = 0 to m.deviceIndex - 1
                    if m.deviceRows[index].column = m.deviceRows[m.deviceIndex].column then firstInColumn = false
                end for
            end if
            if firstInColumn
                m.accountAction = "updates"
            else
                handleDeviceSettingsKey(key)
            end if
        else
            handleDeviceSettingsKey(key)
        end if
    end if
    renderDeviceSettings()
    renderUpdateState()
    return true
end function
