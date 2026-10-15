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
    setThemeColor(m.top.findNode("settingsSecondsBg"), "#374151")
    setThemeColor(m.top.findNode("settingsPercentBg"), "#374151")
    setThemeColor(m.top.findNode("settingsTimerBg"), "#374151")
    setThemeColor(m.top.findNode("settingsThemeBg"), "#374151")
    themeLabel = "[ ] Light theme"
    if m.appSettings.theme = "light" then themeLabel = "[x] Light theme"
    m.top.findNode("settingsThemeLabel").text = themeLabel
    timerLabel = "[ ] Start a 15-second auto-play timer"
    if m.appSettings.nextEpisodeTimerEnabled = true then timerLabel = "[x] Start a 15-second auto-play timer"
    m.top.findNode("settingsTimerLabel").text = timerLabel
    if m.focusArea = "content"
        selectedId = "settingsSecondsBg"
        if m.settingsIndex = 1 then selectedId = "settingsPercentBg"
        if m.settingsIndex = 2 then selectedId = "settingsTimerBg"
        if m.settingsIndex = 3 then selectedId = "settingsThemeBg"
        color = "#2563EB"
        if m.settingsEditing then color = "#1D4ED8"
        setThemeColor(m.top.findNode(selectedId), color)
    end if
    hint = "OK: edit value. Up/Down: choose field. Values save automatically."
    if m.settingsIndex = 2 then hint = "OK: toggle timer. Up/Down: choose field. Values save automatically."
    if m.settingsIndex = 3 then hint = "OK: switch light/dark theme. Your choice saves automatically."
    if m.settingsEditing then hint = "Left/Right: change by 1. Rewind/Fast forward: change by 10. OK/Back: done."
    m.top.findNode("settingsHint").text = hint
end sub

function handleAppSettingsKey(key as String) as Boolean
    if key = "OK"
        if m.settingsIndex = 3
            theme = "light"
            if m.appSettings.theme = "light" then theme = "dark"
            m.appSettings.theme = theme
            m.appSettingsStore.save(m.appSettings)
            m.settingsEditing = false
            applyAppTheme(theme)
        else if m.settingsIndex = 2
            m.appSettings.nextEpisodeTimerEnabled = m.appSettings.nextEpisodeTimerEnabled <> true
            m.appSettingsStore.save(m.appSettings)
            m.settingsEditing = false
        else
            m.settingsEditing = not m.settingsEditing
        end if
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
        if key = "up" then m.settingsIndex = m.settingsIndex - 1 else m.settingsIndex = m.settingsIndex + 1
        if m.settingsIndex < 0 then m.settingsIndex = 0
        if m.settingsIndex > 3 then m.settingsIndex = 3
        m.settingsEditing = false
    else if key = "left" and m.settingsEditing <> true
        setMenuExpanded(true)
    else
        return false
    end if
    renderAppSettings()
    return true
end function
