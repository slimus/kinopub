sub main()
    m.startupTimer = { control: "stop", observeField: captureObserver }
    m.dialogTimer = { control: "stop", observeField: captureObserver }
    m.top = { findNode: findTimer, startupTimer: m.startupTimer, dialogTimer: m.dialogTimer }
    initUpdates()
    check(m.dialogTimer.callback = "onUpdateDialogTimer", "Dialog timer must deliver fire events to show the result")
    m.accountAction = "updates"
    m.accountErrorGroup = { visible: false }
    m.deviceRows = [{ column: 0 }, { column: 0 }, { column: 1 }]
    m.deviceIndex = 0
    m.deviceEditing = false
    handleAccountKey("OK")
    check(m.requestedManual, "Button requests a manual check")
    handleAccountKey("down")
    check(m.accountAction = "device", "Down reaches existing device settings")
    handleAccountKey("up")
    check(m.accountAction = "updates", "Up returns from first device setting")
    m.accountAction = "device"
    m.deviceIndex = 2
    handleAccountKey("up")
    check(m.accountAction = "updates", "Up returns from first setting in right column")
    m.accountErrorGroup.visible = true
    handleAccountKey("OK")
    check(m.requestedManual, "Update button remains usable on account error")
    handleAccountKey("down")
    handleAccountKey("OK")
    check(m.retried, "Retry account remains accessible")
    handleAccountKey("up")
    handleAccountKey("left")
    check(m.menuOpened, "Left returns to sidebar")
    m.updateState = { release: { version: "v0.10.0", notes: "Changes" } }
    check(updateAvailable(), "Marker uses packaged version")
    m.updateState.release.version = "v0.9.0"
    check(not updateAvailable(), "Installing newer version clears marker")
    m.updateState.release = invalid
    check(not updateAvailable(), "No release means no marker")
    m.updateState.release = { version: "v1.0.0", notes: "Cached" }
    m.top = { findNode: findTimer }
    m.updateManual = true
    m.updateBusy = true
    onUpdateResponse({ getData: errorResponse })
    check(not m.updateBusy and Instr(1, m.pendingUpdateDialog.message, "Unable") > 0, "Manual failure reports error instead of cached success")
    m.updateManual = false
    m.pendingUpdateDialog = invalid
    onUpdateResponse({ getData: errorResponse })
    check(m.pendingUpdateDialog = invalid, "Automatic failure remains silent")
    m.updateManual = true
    onUpdateResponse({ getData: successResponse })
    check(Instr(1, m.pendingUpdateDialog.message, "Changes") > 0 and Instr(1, m.pendingUpdateDialog.message, "manually") > 0, "Fresh success shows notes and manual installation instructions")
    print "Update UI tests passed."
end sub

function BuildInfo()
    return { version: "0.9.0" }
end function
function findTimer(id)
    if id = "updateStartupTimer" then return m.startupTimer
    if m.dialogTimer <> invalid then return m.dialogTimer
    return { control: "stop" }
end function
sub captureObserver(field, callback)
    m.callback = callback
end sub
function updateLoadState()
    return { lastAttempt: 0, release: invalid }
end function
function errorResponse()
    return { ok: false, state: { release: { version: "v1.0.0", notes: "Cached" } } }
end function
function successResponse()
    return { ok: true, state: { release: { version: "v1.0.0", notes: "Changes" } } }
end function
sub startUpdateCheck(manual)
    m.requestedManual = manual
end sub
sub loadAccountInfo(force)
    m.retried = force
end sub
sub setMenuExpanded(expanded)
    m.menuOpened = expanded
end sub
function handleDeviceSettingsKey(key)
    return true
end function
sub renderDeviceSettings()
end sub
sub renderUpdateState()
end sub
sub check(condition, message)
    if not condition
        print "FAIL: " + message
        stop
    end if
end sub
