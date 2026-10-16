sub initDeviceSettings()
    m.deviceRows = []
    m.deviceIndex = 0
    m.deviceBusy = false
    m.deviceLoaded = false
    m.deviceEditing = false
    m.deviceMessage = ""
end sub

sub loadDeviceSettings(force as Boolean)
    if m.deviceBusy or (m.deviceLoaded and not force) then return
    m.deviceMessage = "Loading device settings..."
    startDeviceSettingsTask("loadDeviceSettings", {})
end sub

sub startDeviceSettingsTask(command as String, request as Object)
    m.deviceBusy = true
    task = CreateObject("roSGNode", "ContentTask")
    task.command = command
    task.request = request
    task.observeField("response", "onDeviceSettingsResponse")
    m.deviceTask = task
    renderDeviceSettings()
    task.control = "RUN"
end sub

sub onDeviceSettingsResponse(event as Object)
    result = event.getData()
    m.deviceBusy = false
    if result = invalid or result.ok <> true
        if responseRequiresSignIn(result)
            requestSignInAgain(result)
            return
        end if
        m.deviceMessage = "Unable to load device settings. OK: retry."
        if m.deviceLoaded then m.deviceMessage = "Unable to save. Previous value kept. OK: retry change."
        renderDeviceSettings()
        return
    end if
    if result.command = "loadDeviceSettings"
        m.currentDevice = result.device
        m.deviceRows = deviceSettingsRows(result.settings)
        m.deviceIndex = 0
        m.deviceLoaded = true
        m.deviceMessage = ""
        if m.deviceRows.Count() = 0 then m.deviceMessage = "No supported settings available. OK: reload."
        title = accountStringField(result.device, "title", "")
        m.top.findNode("deviceTitle").text = "Current device: " + title
    else
        row = m.deviceRows[m.deviceIndex]
        if row.kind = "list"
            row.selected = m.devicePendingIndex
        else
            row.value = m.devicePendingValue
        end if
        m.deviceMessage = "Saved. Applies to the next playback."
    end if
    renderDeviceSettings()
end sub

function deviceSettingsRows(settings as Object) as Object
    rows = []
    definitions = [
        { key: "useSsl", label: "SSL", column: 0 }
        { key: "supportHevc", label: "HEVC", column: 0 }
        { key: "supportHdr", label: "HDR", column: 0 }
        { key: "support4k", label: "4K", column: 0 }
        { key: "mixedPlaylist", label: "Mixed AVC + HEVC playlist", column: 0 }
        { key: "serverLocation", label: "Server region", column: 1 }
        { key: "streamingType", label: "Streaming type", column: 1 }
    ]
    for each definition in definitions
        key = definition.key
        if key = "useSsl" and not settings.DoesExist(key) then key = "supportSsl"
        setting = settings[key]
        if type(setting) = "roAssociativeArray"
            row = { key: key, label: definition.label, column: definition.column, kind: "checkbox" }
            if setting.type = "list"
                row.kind = "list"
                row.options = []
                row.selected = 0
                if type(setting.value) = "roArray"
                    for each option in setting.value
                        if type(option) = "roAssociativeArray"
                            if option.id <> invalid and option.label <> invalid
                                if accountBooleanField(option, "selected", false) then row.selected = row.options.Count()
                                row.options.Push(option)
                            end if
                        end if
                    end for
                end if
                if row.options.Count() > 0 then rows.Push(row)
            else if definition.column = 0 and (setting.type = invalid or setting.type = "checkbox" or setting.type = "boolean")
                if setting.value <> invalid
                    row.value = accountBooleanField(setting, "value", false)
                    rows.Push(row)
                end if
            end if
        end if
    end for
    return rows
end function

sub renderDeviceSettings()
    if m.deviceRows = invalid then return
    host = m.top.findNode("deviceSettingsRows")
    host.removeChildrenIndex(host.getChildCount(), 0)
    positions = [0, 0]
    for index = 0 to m.deviceRows.Count() - 1
        row = m.deviceRows[index]
        group = host.createChild("Group")
        group.translation = [row.column * 470, positions[row.column] * 48]
        positions[row.column] = positions[row.column] + 1
        background = group.createChild("Rectangle")
        background.width = 446
        background.height = 44
        color = "#242424"
        if m.focusArea = "content" and index = m.deviceIndex then color = "#2563EB"
        setThemeColor(background, color)
        label = group.createChild("Label")
        label.translation = [12, 7]
        label.width = 422
        label.height = 32
        label.font = "font:SmallSystemFont"
        text = "[ ] " + row.label
        if row.kind = "list"
            selected = row.selected
            if m.deviceEditing and index = m.deviceIndex then selected = m.deviceChoice
            text = row.label + ": " + row.options[selected].label
        else if row.value
            text = "[x] " + row.label
        end if
        label.text = text
        setThemeColor(label, "#F5F5F5")
    end for
    status = m.top.findNode("deviceStatus")
    status.text = m.deviceMessage
    if m.deviceBusy then status.text = "Loading device settings..."
    if m.deviceBusy and m.deviceLoaded then status.text = "Saving..."
    hint = "OK: toggle / edit. Arrows: choose setting. Changes save automatically."
    if m.deviceEditing then hint = "Left/Right: choose value. OK: save. Back: cancel."
    if not m.deviceLoaded then hint = "OK: retry loading device settings."
    m.top.findNode("deviceHint").text = hint
end sub

function handleDeviceSettingsKey(key as String) as Boolean
    if m.deviceEditing
        row = m.deviceRows[m.deviceIndex]
        if key = "left" or key = "right"
            delta = 1
            if key = "left" then delta = -1
            m.deviceChoice = (m.deviceChoice + delta + row.options.Count()) mod row.options.Count()
        else if key = "back"
            m.deviceEditing = false
        else if key = "OK"
            m.deviceEditing = false
            if m.deviceChoice <> row.selected then saveDeviceSetting(row, row.options[m.deviceChoice].id)
        end if
    else if key = "back"
        setMenuExpanded(true)
    else if m.deviceBusy
        if key = "left" then setMenuExpanded(true)
    else if key = "OK"
        if m.deviceRows.Count() = 0
            loadDeviceSettings(true)
        else
            row = m.deviceRows[m.deviceIndex]
            if row.kind = "list"
                m.deviceChoice = row.selected
                m.deviceEditing = true
            else
                saveDeviceSetting(row, not row.value)
            end if
        end if
    else if m.deviceRows.Count() > 0
        row = m.deviceRows[m.deviceIndex]
        if key = "left" and row.column = 0
            setMenuExpanded(true)
        else if key = "left" or key = "right"
            targetColumn = 1 - row.column
            if key = "right" and row.column = 1 then return true
            for index = 0 to m.deviceRows.Count() - 1
                if m.deviceRows[index].column = targetColumn
                    m.deviceIndex = index
                    exit for
                end if
            end for
        else if key = "up" or key = "down"
            delta = 1
            if key = "up" then delta = -1
            nextIndex = m.deviceIndex + delta
            if nextIndex >= 0 and nextIndex < m.deviceRows.Count()
                if m.deviceRows[nextIndex].column = row.column then m.deviceIndex = nextIndex
            end if
        end if
    else if key = "left"
        setMenuExpanded(true)
    end if
    renderDeviceSettings()
    return true
end function

sub saveDeviceSetting(row as Object, value as Dynamic)
    changes = {}
    changes[row.key] = value
    m.devicePendingValue = value
    if row.kind = "list" then m.devicePendingIndex = m.deviceChoice
    startDeviceSettingsTask("saveDeviceSettings", { deviceId: m.currentDevice.id, changes: changes })
end sub
