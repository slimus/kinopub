sub main()
    m.top = CreateObject("roSGNode", "Group")
    panel = m.top.createChild("Rectangle")
    panel.color = "#090B0F"
    label = m.top.createChild("Label")
    label.color = "#F5F5F5"
    originalPanel = panel.color
    originalLabel = label.color
    applyAppTheme("light")
    check(panel.color <> originalPanel and label.color <> originalLabel, "Light theme updates existing XML-style nodes")
    dynamicLabel = m.top.createChild("Label")
    setThemeColor(dynamicLabel, "#D1D5DB")
    lightText = dynamicLabel.color
    check(lightText <> "#D1D5DB" and lightText <> &hD1D5DBFF, "New nodes use the active theme")
    applyAppTheme("dark")
    check(panel.color = originalPanel and label.color = originalLabel, "Dark theme restores original colors exactly")
    check(dynamicLabel.color = dynamicLabel.themeBaseColor, "Dynamic nodes also restore original colors")
    applyAppTheme("light")
    check(dynamicLabel.color = lightText, "Repeated switching does not lose the original color")
    setThemeColor(dynamicLabel, "#FCA5A5")
    errorColor = dynamicLabel.themeBaseColor
    applyAppTheme("dark")
    check(dynamicLabel.color = errorColor, "State changes replace the stored base color")
    colors = lightThemeColorMap()
    check(colors["151719935"] = colors["#090B0F"], "Native integer colors resolve like hex strings")
    setThemeColor(panel, "#2563EB", "primary")
    setThemeColor(label, "#F8FAFC", "onPrimary")
    applyAppTheme("light")
    check(label.color <> dynamicLabel.color, "Primary button text remains distinct from ordinary text")
    check(panel.color <> originalPanel, "Primary action stands out from the background")
    primaryColor = panel.color
    primaryText = label.color
    applyAppTheme("dark")
    applyAppTheme("light")
    check(panel.color = primaryColor and label.color = primaryText, "Primary button roles survive theme switches")
    setThemeColor(label, "#D1D5DB")
    check(label.color = lightText, "Disabled button text drops its primary role")
    nested = m.top.createChild("Group")
    nested.visible = false
    hiddenLabel = nested.createChild("Label")
    setThemeColor(hiddenLabel, "#D1D5DB")
    applyAppTheme("dark")
    check(hiddenLabel.color = hiddenLabel.themeBaseColor, "Hidden sections update before they are opened")
    print "App theme tests passed."
end sub

sub check(condition as Boolean, message as String)
    if condition <> true
        print "FAIL: " + message
        stop
    end if
end sub
