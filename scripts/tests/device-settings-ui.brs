sub main()
    initDeviceSettings()
    settings = {
        supportSsl: { value: "1" }
        supportHevc: { value: 0 }
        supportHdr: { value: true }
        serverLocation: { type: "list", value: [{ id: 5, label: "Europe", selected: 0 }, { id: 9, label: "US", selected: 1 }] }
        streamingType: { type: "list", value: [] }
        futureSetting: { value: true }
    }
    m.deviceRows = deviceSettingsRows(settings)
    check(m.deviceRows.Count() = 4, "Skip absent, unknown and empty-list settings")
    check(m.deviceRows[0].key = "supportSsl" and m.deviceRows[0].value, "Support alternate SSL key and numeric-string flags")
    check(m.deviceRows[3].selected = 1, "Use API-selected option")
    m.deviceLoaded = true
    m.currentDevice = { id: 42 }
    handleDeviceSettingsKey("right")
    check(m.deviceIndex = 3, "Right reaches region")
    handleDeviceSettingsKey("right")
    check(m.deviceIndex = 3, "Right stays at right edge")
    handleDeviceSettingsKey("OK")
    handleDeviceSettingsKey("right")
    check(m.deviceChoice = 0 and m.deviceRows[3].selected = 1, "List changes remain uncommitted")
    handleDeviceSettingsKey("back")
    check(not m.deviceEditing and m.deviceRows[3].selected = 1, "Back cancels list selection")
    handleDeviceSettingsKey("OK")
    handleDeviceSettingsKey("left")
    handleDeviceSettingsKey("OK")
    check(m.sent.request.changes.serverLocation = 5, "Save actual option ID")
    check(m.deviceRows[3].selected = 1, "Wait for save confirmation")
    m.reply = { ok: false, message: "Offline" }
    onDeviceSettingsResponse({ getData: replyData, reply: m.reply })
    check(m.deviceRows[3].selected = 1 and not m.deviceBusy, "Failed save keeps previous value and unlocks input")
    handleDeviceSettingsKey("left")
    check(m.deviceIndex = 0, "Left returns to flags")
    handleDeviceSettingsKey("OK")
    check(m.sent.request.changes.supportSsl = false, "Toggle SSL sends false")
    m.reply = { ok: true, command: "saveDeviceSettings" }
    onDeviceSettingsResponse({ getData: replyData, reply: m.reply })
    check(not m.deviceRows[0].value, "Successful save commits toggle")
    handleDeviceSettingsKey("down")
    check(m.deviceIndex = 1, "Down selects next flag")
    m.deviceBusy = true
    handleDeviceSettingsKey("down")
    check(m.deviceIndex = 1, "Prevent changes during save")
    handleDeviceSettingsKey("back")
    check(m.menuOpened, "Back reaches sidebar during request")
    print "Device settings UI tests passed."
end sub

sub renderDeviceSettings()
end sub

sub startDeviceSettingsTask(command, request)
    m.sent = { command: command, request: request }
    m.deviceBusy = true
end sub

function replyData()
    return m.reply
end function

function responseRequiresSignIn(response)
    return false
end function

sub requestSignInAgain(response)
end sub

sub setMenuExpanded(expanded)
    m.menuOpened = expanded
end sub

sub check(condition, message)
    if not condition
        print "FAIL: " + message
        stop
    end if
end sub
