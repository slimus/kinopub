function AppSettingsStore() as Object
    return { load: appSettingsLoad, save: appSettingsSave }
end function

function appSettingsLoad() as Object
    section = CreateObject("roRegistrySection", "appsettings")
    return appSettingsFromValues(section.Read("nextEpisodeSeconds"), section.Read("nextEpisodePercent"), section.Read("nextEpisodeTimerEnabled"))
end function

function appSettingsFromValues(seconds as Dynamic, percent as Dynamic, timerEnabled as Dynamic) as Object
    return {
        nextEpisodeSeconds: appSettingNumber(seconds, 90, 3600)
        nextEpisodePercent: appSettingNumber(percent, 4, 100)
        nextEpisodeTimerEnabled: timerEnabled = "true"
    }
end function

function appSettingNumber(value as Dynamic, fallback as Integer, maximum as Integer) as Integer
    if value = invalid then return fallback
    valueType = type(value)
    if valueType = "String" or valueType = "roString"
        if value = "" then return fallback
        for index = 1 to Len(value)
            character = Mid(value, index, 1)
            if character < "0" or character > "9" then return fallback
        end for
        if Len(value) > 4 then return fallback
        value = Val(value)
    else if valueType <> "Integer" and valueType <> "roInt" and valueType <> "roInteger"
        return fallback
    end if
    if value < 0 or value > maximum then return fallback
    return Int(value)
end function

sub appSettingsSave(settings as Object)
    section = CreateObject("roRegistrySection", "appsettings")
    section.Write("nextEpisodeSeconds", StrI(appSettingNumber(settings.nextEpisodeSeconds, 90, 3600)).Trim())
    section.Write("nextEpisodePercent", StrI(appSettingNumber(settings.nextEpisodePercent, 4, 100)).Trim())
    timerEnabled = "false"
    if settings.nextEpisodeTimerEnabled = true then timerEnabled = "true"
    section.Write("nextEpisodeTimerEnabled", timerEnabled)
    section.Flush()
end sub

function appNextEpisodeThreshold(duration as Integer, settings as Object) as Integer
    if duration <= 0 then return 0
    seconds = settings.nextEpisodeSeconds
    percent = settings.nextEpisodePercent
    percentSeconds = Int(duration * percent / 100)
    if percent > 0 and percentSeconds < 1 then percentSeconds = 1
    if seconds = 0 then return percentSeconds
    if percent = 0 then return seconds
    if seconds < percentSeconds then return seconds
    return percentSeconds
end function
