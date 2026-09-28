sub appendCardBadge(card as Object, text as String, x as Integer, y as Integer, maxWidth as Integer)
    if text = "" then return
    chipWidth = Len(text) * 9 + 12
    if chipWidth > maxWidth then chipWidth = maxWidth

    background = CreateObject("roSGNode", "Rectangle")
    background.translation = [x, y]
    background.width = chipWidth
    background.height = 22
    background.color = "#111827"
    background.opacity = 0.88
    card.appendChild(background)

    label = CreateObject("roSGNode", "Label")
    label.text = text
    label.translation = [x + 4, y + 1]
    label.width = chipWidth - 8
    label.height = 20
    label.font.size = 16
    label.horizAlign = "center"
    label.color = "#F5F5F5"
    card.appendChild(label)
end sub

sub appendTypeBadge(card as Object, item as Object, x = 20 as Integer, y = 14 as Integer, maxWidth = 120 as Integer)
    appendCardBadge(card, itemTypeBadgeText(item), x, y, maxWidth)
end sub

function itemTypeBadgeText(item as Dynamic) as String
    if item = invalid or type(item) <> "roAssociativeArray" then return ""
    if item.isViewAll = true or item.isError = true then return ""
    labels = {
        movie: "Movie"
        serial: "Series"
        documovie: "Doc film"
        docuserial: "Doc series"
        concert: "Concert"
        tvshow: "TV show"
        "3d": "3D"
        live: "Live"
        episode: "Episode"
    }
    if type(item.type) = "String" or type(item.type) = "roString"
        contentType = LCase(item.type.Trim())
        if labels.DoesExist(contentType) then return labels[contentType]
    end if
    if item.typeBadge = "LIVE" then return "Live"
    for each key in ["typeTitle", "type"]
        if type(item[key]) = "String" or type(item[key]) = "roString"
            value = item[key].Trim()
            if value <> "" then return value
        end if
    end for
    return ""
end function
