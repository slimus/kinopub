function PlayerPreferenceStore() as Object
    return {
        sectionName: "playerprefs"
        load: playerPreferenceLoad
        loadKey: playerPreferenceLoadKey
        save: playerPreferenceSave
        keyForMedia: playerPreferenceKeyForMedia
        keyForSeries: playerPreferenceKeyForSeries
        mergePreferences: playerPreferenceMerge
        stringField: playerPreferenceStringField
        integerField: playerPreferenceIntegerField
    }
end function

function playerPreferenceLoad(media as Dynamic) as Object
    seriesKey = m.keyForSeries(media)
    mediaKey = m.keyForMedia(media)
    if seriesKey = "" and mediaKey = "" then return {}

    seriesPreferences = m.loadKey(seriesKey)
    mediaPreferences = m.loadKey(mediaKey)
    return m.mergePreferences(seriesPreferences, mediaPreferences)
end function

function playerPreferenceLoadKey(key as String) as Object
    if key = "" then return {}

    section = CreateObject("roRegistrySection", m.sectionName)
    raw = section.Read(key)
    if raw = invalid or raw = "" then return {}

    parsed = ParseJson(raw)
    if parsed = invalid or type(parsed) <> "roAssociativeArray" then return {}
    return parsed
end function

function playerPreferenceSave(media as Dynamic, preferences as Object) as Void
    key = m.keyForMedia(media)
    seriesKey = m.keyForSeries(media)
    if key = "" and seriesKey = "" then return
    if preferences = invalid or type(preferences) <> "roAssociativeArray" then return

    section = CreateObject("roRegistrySection", m.sectionName)
    if key <> "" then section.Write(key, FormatJson(preferences))
    if seriesKey <> "" then section.Write(seriesKey, FormatJson(preferences))
    section.Flush()
end function

function playerPreferenceMerge(basePreferences as Object, overridePreferences as Object) as Object
    merged = {}

    if basePreferences <> invalid and type(basePreferences) = "roAssociativeArray"
        for each key in basePreferences
            merged[key] = basePreferences[key]
        end for
    end if

    if overridePreferences <> invalid and type(overridePreferences) = "roAssociativeArray"
        for each key in overridePreferences
            merged[key] = overridePreferences[key]
        end for
    end if

    return merged
end function

function playerPreferenceKeyForMedia(media as Dynamic) as String
    if media = invalid or type(media) <> "roAssociativeArray" then return ""

    mediaId = m.integerField(media, "mediaId", 0)
    if mediaId > 0 then return "media:" + StrI(mediaId).Trim()

    itemId = m.integerField(media, "itemId", 0)
    seasonNumber = m.integerField(media, "seasonNumber", 0)
    videoNumber = m.integerField(media, "videoNumber", 0)
    if itemId <= 0 or videoNumber <= 0 then return ""

    return "item:" + StrI(itemId).Trim() + ":s:" + StrI(seasonNumber).Trim() + ":v:" + StrI(videoNumber).Trim()
end function

function playerPreferenceKeyForSeries(media as Dynamic) as String
    if media = invalid or type(media) <> "roAssociativeArray" then return ""

    itemId = m.integerField(media, "itemId", 0)
    seasonNumber = m.integerField(media, "seasonNumber", 0)
    videoNumber = m.integerField(media, "videoNumber", 0)
    if itemId <= 0 or seasonNumber <= 0 or videoNumber <= 0 then return ""

    return "series:" + StrI(itemId).Trim()
end function

function playerPreferenceStringField(source as Dynamic, key as String, fallback as String) as String
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "String" or valueType = "roString" then return value
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return StrI(value).Trim()
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Str(value).Trim()
    return fallback
end function

function playerPreferenceIntegerField(source as Dynamic, key as String, fallback as Integer) as Integer
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback

    value = source[key]
    valueType = type(value)
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return value
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Int(value)
    return fallback
end function
