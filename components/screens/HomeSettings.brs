sub loadAppSettings()
    m.appSettingsStore = AppSettingsStore()
    m.appSettings = m.appSettingsStore.load()
    m.settingsEditing = false
    renderAppSettings()
end sub

sub renderAppSettings()
    if m.appSettings = invalid then return
    m.top.findNode("settingsSecondsValue").text = "< " + StrI(m.appSettings.nextEpisodeSeconds).Trim() + " sec >"
    m.top.findNode("settingsPercentValue").text = "< " + StrI(m.appSettings.nextEpisodePercent).Trim() + "% >"
    m.top.findNode("settingsSecondsBg").color = "#374151"
    m.top.findNode("settingsPercentBg").color = "#374151"
    if m.focusArea = "content"
        selectedId = "settingsSecondsBg"
        if m.settingsIndex = 1 then selectedId = "settingsPercentBg"
        color = "#2563EB"
        if m.settingsEditing then color = "#1D4ED8"
        m.top.findNode(selectedId).color = color
    end if
    hint = "OK: edit value. Up/Down: choose field. Values save automatically."
    if m.settingsEditing then hint = "Left/Right: change by 1. Rewind/Fast forward: change by 10. OK/Back: done."
    m.top.findNode("settingsHint").text = hint
end sub

function handleAppSettingsKey(key as String) as Boolean
    if key = "OK"
        m.settingsEditing = not m.settingsEditing
    else if key = "back"
        if m.settingsEditing then m.settingsEditing = false else setMenuExpanded(true)
    else if m.settingsEditing and (key = "left" or key = "right" or key = "rewind" or key = "fastforward")
        delta = 1
        if key = "left" then delta = -1
        if key = "rewind" then delta = -10
        if key = "fastforward" then delta = 10
        field = "nextEpisodeSeconds"
        maximum = 3600
        if m.settingsIndex = 1
            field = "nextEpisodePercent"
            maximum = 100
        end if
        value = m.appSettings[field] + delta
        if value < 0 then value = 0
        if value > maximum then value = maximum
        m.appSettings[field] = value
        m.appSettingsStore.save(m.appSettings)
    else if key = "up" or key = "down"
        if key = "up" then m.settingsIndex = 0 else m.settingsIndex = 1
        m.settingsEditing = false
    else if key = "left" and m.settingsEditing <> true
        setMenuExpanded(true)
    else
        return false
    end if
    renderAppSettings()
    return true
end function
