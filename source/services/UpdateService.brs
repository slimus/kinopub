' SemVer values are compared as digit strings, avoiding integer overflow.
function updateParseVersion(value as Dynamic) as Dynamic
    if type(value) <> "String" and type(value) <> "roString" then return invalid
    if Left(value, 1) = "v" then value = Mid(value, 2)
    pattern = CreateObject("roRegex", "^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-([0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*))?(\+([0-9A-Za-z-]+(\.[0-9A-Za-z-]+)*))?$", "")
    if not pattern.IsMatch(value) then return invalid
    core = value.Split("+")[0].Split("-")[0].Split(".")
    prerelease = ""
    withoutBuild = value.Split("+")[0]
    dash = Instr(1, withoutBuild, "-")
    if dash > 0 then prerelease = Mid(withoutBuild, dash + 1)
    for each identifier in prerelease.Split(".")
        if updateIsNumeric(identifier) and Len(identifier) > 1 and Left(identifier, 1) = "0" then return invalid
    end for
    return { core: core, prerelease: prerelease }
end function

function updateIsNumeric(value as String) as Boolean
    return CreateObject("roRegex", "^[0-9]+$", "").IsMatch(value)
end function

function updateIdentifierCompare(a as String, b as String, numeric as Boolean) as Integer
    if numeric
        if Len(a) > Len(b) then return 1
        if Len(a) < Len(b) then return -1
    end if
    if a > b then return 1
    if a < b then return -1
    return 0
end function

function updateVersionCompare(a as String, b as String) as Integer
    leftVersion = updateParseVersion(a)
    rightVersion = updateParseVersion(b)
    if leftVersion = invalid or rightVersion = invalid then return 0
    for index = 0 to 2
        comparison = updateIdentifierCompare(leftVersion.core[index], rightVersion.core[index], true)
        if comparison <> 0 then return comparison
    end for
    if leftVersion.prerelease = rightVersion.prerelease then return 0
    if leftVersion.prerelease = "" then return 1
    if rightVersion.prerelease = "" then return -1
    leftParts = leftVersion.prerelease.Split(".")
    rightParts = rightVersion.prerelease.Split(".")
    for index = 0 to leftParts.Count() - 1
        if index >= rightParts.Count() then return 1
        aPart = leftParts[index]
        bPart = rightParts[index]
        aNumeric = updateIsNumeric(aPart)
        bNumeric = updateIsNumeric(bPart)
        if aNumeric and not bNumeric then return -1
        if bNumeric and not aNumeric then return 1
        comparison = updateIdentifierCompare(aPart, bPart, aNumeric and bNumeric)
        if comparison <> 0 then return comparison
    end for
    if leftParts.Count() < rightParts.Count() then return -1
    return 0
end function

function updateSelectRelease(releases as Object) as Dynamic
    selected = invalid
    for each release in releases
        if type(release) = "roAssociativeArray"
            parsed = updateParseVersion(release.tag_name)
            if parsed <> invalid and release.draft <> true and release.prerelease <> true
                if parsed.prerelease = ""
                    replace = selected = invalid
                    if selected <> invalid then replace = updateVersionCompare(release.tag_name, selected.version) > 0
                    if replace
                        notes = ""
                        if type(release.body) = "String" or type(release.body) = "roString" then notes = updatePlainNotes(release.body)
                        selected = { version: release.tag_name, notes: notes }
                    end if
                end if
            end if
        end if
    end for
    return selected
end function

function updatePlainNotes(value as String) as String
    value = CreateObject("roRegex", "!?\[([^\]]+)\]\([^\)]+\)", "").ReplaceAll(value, "\1")
    value = CreateObject("roRegex", "(^|\n)#{1,6} +", "").ReplaceAll(value, "\1")
    value = value.Replace("**", "").Replace("__", "").Replace("`", "")
    ' Registry space is shared with sign-in and settings; cache a bounded excerpt.
    if Len(value) > 1800 then value = Left(value, 1800) + Chr(10) + "More details on GitHub."
    return value.Trim()
end function

function updateCheckDue(lastAttempt as Integer, nowSeconds as Integer) as Boolean
    return lastAttempt <= 0 or nowSeconds < lastAttempt or nowSeconds - lastAttempt >= 604800
end function

function updateLoadState() as Object
    section = CreateObject("roRegistrySection", "updates")
    stored = section.Read("state")
    if stored = "" then return { lastAttempt: 0, release: invalid }
    state = ParseJson(stored)
    if type(state) <> "roAssociativeArray" then state = {}
    if type(state.lastAttempt) <> "Integer" and type(state.lastAttempt) <> "roInt" then state.lastAttempt = 0
    if type(state.release) <> "roAssociativeArray"
        state.release = invalid
    else if updateParseVersion(state.release.version) = invalid
        state.release = invalid
    end if
    return state
end function

sub updateSaveState(state as Object)
    section = CreateObject("roRegistrySection", "updates")
    section.Write("state", FormatJson(state))
    section.Flush()
end sub
