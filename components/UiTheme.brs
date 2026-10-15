' Shared color translation keeps the existing dark palette and records each node's
' base color so switching themes never depends on reversing a light color.
sub initializeAppTheme()
    store = AppSettingsStore()
    settings = store.load()
    applyAppTheme(settings.theme)
end sub

sub applyAppTheme(theme as String)
    m.themeName = appThemeName(theme)
    applyThemeTree(m.top)
end sub

sub applyThemeTree(node as Object)
    if node.hasField("color")
        baseColor = node.color
        if node.hasField("themeBaseColor") then baseColor = node.themeBaseColor
        role = ""
        if node.hasField("themeRole") then role = node.themeRole
        setThemeColor(node, baseColor, role)
    end if
    for index = 0 to node.getChildCount() - 1
        applyThemeTree(node.getChild(index))
    end for
end sub

sub setThemeColor(node as Object, baseColor as Dynamic, role = "" as String)
    if node.hasField("themeBaseColor") <> true then node.addField("themeBaseColor", "color", false)
    node.themeBaseColor = baseColor
    if role <> "" and node.hasField("themeRole") <> true then node.addField("themeRole", "string", false)
    if node.hasField("themeRole") then node.themeRole = role
    color = node.themeBaseColor
    if m.themeName <> "light"
        node.color = color
        return
    end if
    if m.themeColorMap = invalid then m.themeColorMap = lightThemeColorMap()
    key = UCase(node.themeBaseColor.ToStr())
    if m.themeColorMap.DoesExist(key) then color = m.themeColorMap[key]
    if role = "primary"
        if color = "#176B63" then color = "#0F514B" else color = "#176B63"
    end if
    if role = "onPrimary" then color = "#FFFDFA"
    if role = "focusSurface" then color = "#78A695"
    node.color = color
end sub

function lightThemeColorMap() as Object
    colors = [
        { source: &h090B0FFF, hex: "#090B0F", target: "#C5C3BA" }
        { source: &h111827FF, hex: "#111827", target: "#D7D4CA" }
        { source: &h0F172AFF, hex: "#0F172A", target: "#D7D4CA" }
        { source: &h101010FF, hex: "#101010", target: "#D7D4CA" }
        { source: &h171D26FF, hex: "#171D26", target: "#E1DDD4" }
        { source: &h202B3AFF, hex: "#202B3A", target: "#E1DDD4" }
        { source: &h172033FF, hex: "#172033", target: "#B4BDB3" }
        { source: &h1F2937FF, hex: "#1F2937", target: "#E1DDD4" }
        { source: &h0F131AFF, hex: "#0F131A", target: "#ADB5AA" }
        { source: &h181818FF, hex: "#181818", target: "#D7D4CA" }
        { source: &h374151FF, hex: "#374151", target: "#ADB7AC" }
        { source: &h2A2A2AFF, hex: "#2A2A2A", target: "#ADB7AC" }
        { source: &h242424FF, hex: "#242424", target: "#D7D4CA" }
        { source: &h1E293BFF, hex: "#1E293B", target: "#B4BDB3" }
        { source: &h273142FF, hex: "#273142", target: "#BEC8BB" }
        { source: &h2B3A4EFF, hex: "#2B3A4E", target: "#BEC8BB" }
        { source: &h2563EBFF, hex: "#2563EB", target: "#92B6A8" }
        { source: &h1D4ED8FF, hex: "#1D4ED8", target: "#78A695" }
        { source: &h3B82F6FF, hex: "#3B82F6", target: "#92B6A8" }
        { source: &h31435CFF, hex: "#31435C", target: "#92B6A8" }
        { source: &h60A5FAFF, hex: "#60A5FA", target: "#176B63" }
        { source: &hF43F5EFF, hex: "#F43F5E", target: "#176B63" }
        { source: &hEF4444FF, hex: "#EF4444", target: "#176B63" }
        { source: &hE5E7EBFF, hex: "#E5E7EB", target: "#176B63" }
        { source: &hBFDBFEFF, hex: "#BFDBFE", target: "#176B63" }
        { source: &hFFFFFFFF, hex: "#FFFFFF", target: "#202A23" }
        { source: &hF5F5F5FF, hex: "#F5F5F5", target: "#202A23" }
        { source: &hF8FAFCFF, hex: "#F8FAFC", target: "#202A23" }
        { source: &hF9FAFBFF, hex: "#F9FAFB", target: "#202A23" }
        { source: &hD1D5DBFF, hex: "#D1D5DB", target: "#344539" }
        { source: &h9CA3AFFF, hex: "#9CA3AF", target: "#3C4940" }
        { source: &h9BA7BAFF, hex: "#9BA7BA", target: "#3C4940" }
        { source: &h253142FF, hex: "#253142", target: "#A3AEA1" }
        { source: &h2D3748FF, hex: "#2D3748", target: "#9CA79B" }
        { source: &h344054FF, hex: "#344054", target: "#9CA79B" }
        { source: &h4B5563FF, hex: "#4B5563", target: "#9CA79B" }
        { source: &h526172FF, hex: "#526172", target: "#6F8071" }
        { source: &h030712FF, hex: "#030712", target: "#FFFDFA" }
        { source: &h22C55EFF, hex: "#22C55E", target: "#1F704D" }
        { source: &h34D399FF, hex: "#34D399", target: "#1F704D" }
        { source: &h86EFACFF, hex: "#86EFAC", target: "#1F704D" }
        { source: &hFCA5A5FF, hex: "#FCA5A5", target: "#A33232" }
    ]
    result = {}
    for each color in colors
        result[color.source.ToStr()] = color.target
        result[color.hex] = color.target
    end for
    return result
end function
