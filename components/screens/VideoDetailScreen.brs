sub init()
    m.loadingGroup = m.top.findNode("loadingGroup")
    m.errorGroup = m.top.findNode("errorGroup")
    m.errorLabel = m.top.findNode("errorLabel")
    m.retryFocusBg = m.top.findNode("retryFocusBg")
    m.detailGroup = m.top.findNode("detailGroup")
    m.heroArtworkPoster = m.top.findNode("heroArtworkPoster")
    m.poster = m.top.findNode("poster")
    m.posterFallback = m.top.findNode("posterFallback")
    m.detailFactsGroup = m.top.findNode("detailFactsGroup")
    m.detailFactsHost = m.top.findNode("detailFactsHost")
    m.titleLabel = m.top.findNode("titleLabel")
    m.metadataLabel = m.top.findNode("metadataLabel")
    m.movieProgressGroup = m.top.findNode("movieProgressGroup")
    m.movieProgressLabel = m.top.findNode("movieProgressLabel")
    m.movieProgressFill = m.top.findNode("movieProgressFill")
    m.historyMetaGroup = m.top.findNode("historyMetaGroup")
    m.historyMetaLabel = m.top.findNode("historyMetaLabel")
    m.descriptionFocusBg = m.top.findNode("descriptionFocusBg")
    m.descriptionLabel = m.top.findNode("descriptionLabel")
    m.playButton = m.top.findNode("playButton")
    m.playFocusBg = m.top.findNode("playFocusBg")
    m.playButtonLabel = m.top.findNode("playButtonLabel")
    m.bookmarkActionGroup = m.top.findNode("bookmarkActionGroup")
    m.bookmarkFocusBg = m.top.findNode("bookmarkFocusBg")
    m.bookmarkLabel = m.top.findNode("bookmarkLabel")
    m.playbackErrorLabel = m.top.findNode("playbackErrorLabel")
    m.panelTitleLabel = m.top.findNode("panelTitleLabel")
    m.detailTabHost = m.top.findNode("detailTabHost")
    m.episodesTabGroup = m.top.findNode("episodesTabGroup")
    m.similarTabGroup = m.top.findNode("similarTabGroup")
    m.aboutTabGroup = m.top.findNode("aboutTabGroup")
    m.aboutDescriptionLabel = m.top.findNode("aboutDescriptionLabel")
    m.aboutFocusBg = m.top.findNode("aboutFocusBg")
    m.aboutScrollUpChevron = m.top.findNode("aboutScrollUpChevron")
    m.aboutScrollDownChevron = m.top.findNode("aboutScrollDownChevron")
    m.similarPositionLabel = m.top.findNode("similarPositionLabel")
    m.seasonTabsHost = m.top.findNode("seasonTabsHost")
    m.episodeListHost = m.top.findNode("episodeListHost")
    m.episodeCursor = m.top.findNode("episodeCursor")
    m.episodeScrollUpChevron = m.top.findNode("episodeScrollUpChevron")
    m.episodeScrollDownChevron = m.top.findNode("episodeScrollDownChevron")
    m.noMediaLabel = m.top.findNode("noMediaLabel")
    m.trailerGroup = m.top.findNode("trailerGroup")
    m.trailerFocusBg = m.top.findNode("trailerFocusBg")
    m.trailerLabel = m.top.findNode("trailerLabel")
    m.resetActionGroup = m.top.findNode("resetActionGroup")
    m.resetFocusBg = m.top.findNode("resetFocusBg")
    m.resetActionLabel = m.top.findNode("resetActionLabel")
    m.similarGroup = m.top.findNode("similarGroup")
    m.similarHost = m.top.findNode("similarHost")
    m.similarCursor = m.top.findNode("similarCursor")
    m.descriptionOverlayGroup = m.top.findNode("descriptionOverlayGroup")
    m.descriptionOverlayTextLabel = m.top.findNode("descriptionOverlayTextLabel")
    m.descriptionOverlayScrollUpChevron = m.top.findNode("descriptionOverlayScrollUpChevron")
    m.descriptionOverlayScrollDownChevron = m.top.findNode("descriptionOverlayScrollDownChevron")
    m.bookmarkOverlayGroup = m.top.findNode("bookmarkOverlayGroup")
    m.bookmarkOverlayStatusLabel = m.top.findNode("bookmarkOverlayStatusLabel")
    m.bookmarkOverlayFoldersHost = m.top.findNode("bookmarkOverlayFoldersHost")

    m.selection = invalid
    m.item = invalid
    m.trailer = invalid
    m.similarItems = []
    m.seasons = []
    m.currentSeasonIndex = 0
    m.currentEpisodeIndex = 0
    m.focusArea = "play"
    m.detailTabs = []
    m.activeTab = ""
    m.focusedTabIndex = 0
    m.detailTabBgs = []
    m.aboutScrollStart = 0
    m.episodeRows = []
    m.episodeRowNodes = []
    m.episodeRowShadows = []
    m.episodeRowIndexes = []
    m.seasonTabBgs = []
    m.visibleEpisodeStart = 0
    m.defaultMaxVisibleEpisodes = 6
    m.maxVisibleEpisodes = m.defaultMaxVisibleEpisodes
    m.seasonTabWidth = 78
    m.seasonTabHeight = 38
    m.seasonTabGap = 14
    m.seasonTabRowHeight = 48
    m.seasonTabPanelWidth = 1080
    m.visibleSeasonStart = 0
    m.maxVisibleSeasons = 11
    m.baseEpisodeListY = 82
    m.episodeListY = m.baseEpisodeListY
    m.episodeListBottomY = 318
    m.descriptionOverlayScrollStart = 0
    m.descriptionOverlayMaxLines = 11
    m.descriptionOverlayLineLength = 54
    m.selectedSimilarIndex = 0
    m.similarFocusOverlay = invalid
    m.similarCardWidth = 220
    m.similarCardSpacing = 272
    m.maxVisibleSimilarItems = 4
    m.visibleSimilarStart = 0
    m.bookmarkFolders = []
    m.itemBookmarkFolders = []
    m.bookmarkOverlayRows = []
    m.bookmarkOverlayRowBgs = []
    m.selectedBookmarkFolderIndex = 0
    m.bookmarkOverlayOpen = false
    m.bookmarkStatusMessage = ""
    m.pendingPlaybackMediaId = 0
    m.pendingPlaybackPayload = invalid
    m.pendingNextPlaybackMediaId = 0
    m.pendingNextPlaybackPayload = invalid
    m.pendingWatchedToggleKey = ""
    m.movieResetTask = invalid
    m.movieResetPending = false
    m.movieResetMode = ""
    m.movieResetItemId = 0
    m.movieResetMediaId = 0
    m.movieResetErrorMessage = ""

    m.top.observeField("selection", "onSelectionChanged")
    m.top.observeField("playbackError", "onPlaybackError")
    m.top.observeField("reloadRequested", "onReloadRequested")
    m.top.observeField("nextPlaybackRequested", "onNextPlaybackRequested")
    m.top.setFocus(true)
end sub

function detailUiPalette() as Object
    return {
        background: "#090B0F"
        surface: "#202B3A"
        surfaceRaised: "#2B3A4E"
        surfaceFocus: "#2563EB"
        primary: "#2563EB"
        primaryFocus: "#60A5FA"
        primaryText: "#F8FAFC"
        text: "#F8FAFC"
        muted: "#9BA7BA"
        success: "#34D399"
        error: "#FCA5A5"
    }
end function

function detailButtonColor(isFocused as Boolean, isPrimary as Boolean) as String
    palette = detailUiPalette()
    if isPrimary
        if isFocused then return palette.primaryFocus
        return palette.primary
    end if
    if isFocused then return palette.surfaceFocus
    return palette.surface
end function

sub onSelectionChanged(event as Object)
    m.selection = event.getData()
    m.movieResetErrorMessage = ""
    loadDetail()
end sub

sub onReloadRequested(event as Object)
    if event.getData() = true then loadDetail()
end sub

sub onPlaybackError(event as Object)
    message = event.getData()
    if message <> invalid and message <> "" then m.playbackErrorLabel.text = message
end sub

sub loadDetail()
    if m.selection = invalid or m.selection.itemId = invalid or m.selection.itemId <= 0
        showError("Unable to open this video.")
        return
    end if

    if m.movieResetTask <> invalid then m.movieResetTask.control = "STOP"
    m.movieResetTask = invalid
    m.movieResetPending = false
    showState("loading")
    task = CreateObject("roSGNode", "ContentTask")
    task.command = "loadItemDetail"
    task.request = {
        itemId: m.selection.itemId
        mediaId: selectedMediaId()
    }
    if m.selection.DoesExist("targetSeasonNumber") then task.request.targetSeasonNumber = m.selection.targetSeasonNumber
    if m.selection.DoesExist("targetEpisodeNumber") then task.request.targetEpisodeNumber = m.selection.targetEpisodeNumber
    if m.selection.DoesExist("seasonNumber") then task.request.seasonNumber = m.selection.seasonNumber
    if m.selection.DoesExist("episodeNumber") then task.request.episodeNumber = m.selection.episodeNumber
    task.observeField("response", "onDetailResponse")
    task.control = "RUN"
    m.detailTask = task
end sub

sub onDetailResponse(event as Object)
    response = event.getData()
    if response = invalid or response.ok <> true
        if responseRequiresSignIn(response)
            requestSignInAgain(response)
            return
        end if
        message = "Unable to load video details."
        if response <> invalid and response.message <> invalid and response.message <> ""
            message = response.message
        end if
        showError(message)
        return
    end if

    if response.item = invalid
        showError("Video details were not available.")
        return
    end if

    m.item = response.item
    m.trailer = invalid
    if m.item.trailer <> invalid then m.trailer = m.item.trailer
    m.similarItems = []
    if m.item.similarItems <> invalid then m.similarItems = m.item.similarItems
    m.selectedSimilarIndex = 0
    m.visibleSimilarStart = 0
    m.visibleSeasonStart = 0
    m.aboutScrollStart = 0
    cancelPlaybackPreflight()
    buildPlayableModel()
    buildDetailTabs()
    if hasSeriesSeasons()
        m.focusArea = "seasons"
    else
        m.focusArea = "play"
    end if
    renderDetail()
    loadItemBookmarkFolders()
    showState("detail")
    if m.movieResetErrorMessage <> ""
        m.playbackErrorLabel.text = m.movieResetErrorMessage
        m.movieResetErrorMessage = ""
    end if
end sub

function selectedMediaId() as Integer
    if m.selection = invalid or m.selection.mediaId = invalid then return 0
    return m.selection.mediaId
end function

sub buildPlayableModel()
    m.seasons = []

    if m.item = invalid
        m.currentSeasonIndex = 0
        m.currentEpisodeIndex = 0
        return
    end if

    if m.item.seasons <> invalid and m.item.seasons.Count() > 0
        for each season in m.item.seasons
            if season <> invalid then m.seasons.Push(season)
        end for
    else
        videos = []
        if m.item.videos <> invalid then videos = m.item.videos
        m.seasons.Push({
            title: "Video"
            number: 0
            episodes: videos
        })
    end if

    m.currentSeasonIndex = 0
    m.currentEpisodeIndex = 0
    if selectTargetEpisodeFromResponse(m.selection) then return
    targetMediaId = selectedMediaId()

    if targetMediaId > 0
        for seasonIndex = 0 to m.seasons.Count() - 1
            episodes = playableEpisodesForSeason(seasonIndex)

            for episodeIndex = 0 to episodes.Count() - 1
                if episodes[episodeIndex].mediaId = targetMediaId
                    m.currentSeasonIndex = seasonIndex
                    m.currentEpisodeIndex = episodeIndex
                    return
                end if
            end for
        end for
    end if

    for seasonIndex = 0 to m.seasons.Count() - 1
        episodes = playableEpisodesForSeason(seasonIndex)

        for episodeIndex = 0 to episodes.Count() - 1
            if episodes[episodeIndex].isPlayable = true
                m.currentSeasonIndex = seasonIndex
                m.currentEpisodeIndex = episodeIndex
                return
            end if
        end for
    end for
end sub

function selectTargetEpisodeFromResponse(response as Dynamic) as Boolean
    if response = invalid or type(response) <> "roAssociativeArray" then return false

    targetSeasonNumber = 0
    targetEpisodeNumber = 0
    if response.DoesExist("targetSeasonNumber") then targetSeasonNumber = detailIntegerField(response, "targetSeasonNumber", 0)
    if response.DoesExist("targetEpisodeNumber") then targetEpisodeNumber = detailIntegerField(response, "targetEpisodeNumber", 0)
    if targetSeasonNumber <= 0 and response.DoesExist("seasonNumber") then targetSeasonNumber = detailIntegerField(response, "seasonNumber", 0)
    if targetEpisodeNumber <= 0 and response.DoesExist("episodeNumber") then targetEpisodeNumber = detailIntegerField(response, "episodeNumber", 0)
    if targetSeasonNumber <= 0 and targetEpisodeNumber <= 0 then return false

    for seasonIndex = 0 to m.seasons.Count() - 1
        season = m.seasons[seasonIndex]
        if targetSeasonNumber <= 0 or season.number = targetSeasonNumber
            episodes = playableEpisodesForSeason(seasonIndex)
            for episodeIndex = 0 to episodes.Count() - 1
                episode = episodes[episodeIndex]
                if targetEpisodeNumber <= 0 or episode.episodeNumber = targetEpisodeNumber
                    m.currentSeasonIndex = seasonIndex
                    m.currentEpisodeIndex = episodeIndex
                    return true
                end if
            end for
        end if
    end for

    return false
end function

function detailIntegerField(source as Dynamic, key as String, fallback as Integer) as Integer
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return value
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Int(value)
    return fallback
end function

function playableEpisodesForSeason(seasonIndex as Integer) as Object
    if seasonIndex < 0 or seasonIndex >= m.seasons.Count() then return []
    if m.seasons[seasonIndex].episodes = invalid then return []
    return m.seasons[seasonIndex].episodes
end function

sub renderDetail()
    title = ""
    metadata = []
    description = ""
    backdropUrl = ""
    posterUrl = ""

    if m.item.title <> invalid then title = m.item.title
    if m.item.metadata <> invalid then metadata = m.item.metadata
    if m.item.description <> invalid then description = m.item.description
    if m.item.backdropUrl <> invalid then backdropUrl = m.item.backdropUrl
    if m.item.posterUrl <> invalid then posterUrl = m.item.posterUrl

    m.titleLabel.text = title
    m.metadataLabel.text = joinMetadata(metadata)
    m.descriptionLabel.text = description
    renderHistoryMetadata()
    renderDetailFacts()
    closeDescriptionOverlay()
    heroImage = backdropUrl
    if heroImage = "" then heroImage = posterUrl
    m.heroArtworkPoster.uri = heroImage
    m.heroArtworkPoster.visible = heroImage <> ""
    m.poster.uri = posterUrl
    m.poster.visible = posterUrl <> ""
    m.posterFallback.visible = true
    m.playbackErrorLabel.text = ""

    updateHeaderActionsLayout()
    applyDetailExtrasLayout()
    renderDetailTabs()
    renderSeasonTabs()
    renderEpisodeList()
    renderDetailExtras()
    renderAboutTab()
    showDetailTab(m.activeTab)
    updateSelectedMediaVisuals()
    updateDescriptionFocusVisual()
    updateDetailExtrasFocusVisuals()
end sub

function hasSeriesSeasons() as Boolean
    return m.item <> invalid and m.item.seasons <> invalid and m.item.seasons.Count() > 0
end function

function isSingleVideoMovie() as Boolean
    if m.item = invalid or hasSeriesSeasons() then return false
    return m.item.videos <> invalid and m.item.videos.Count() = 1
end function

sub updateHeaderActionsLayout()
    isSeries = hasSeriesSeasons()
    m.playButton.visible = not isSeries
    if isSingleVideoMovie() then m.titleLabel.width = 690 else m.titleLabel.width = 980
    if isSeries
        m.bookmarkActionGroup.translation = [172, 190]
        m.trailerGroup.translation = [408, 190]
    else
        m.bookmarkActionGroup.translation = [438, 190]
        m.trailerGroup.translation = [674, 190]
    end if
    if hasPlayableTrailer()
        m.resetActionGroup.translation = [890, 190]
    else
        m.resetActionGroup.translation = [674, 190]
    end if
end sub

sub renderMovieProgress()
    m.movieProgressGroup.visible = isSingleVideoMovie()
    m.resetActionGroup.visible = false
    if m.movieProgressGroup.visible <> true then return

    media = currentMedia()
    if media = invalid
        m.movieProgressLabel.text = "Unavailable"
        m.movieProgressFill.width = 0
        return
    end if

    progressSeconds = 0
    if media.progressSeconds <> invalid then progressSeconds = media.progressSeconds
    watched = episodeWatchStatus(media) = 1
    if watched
        m.movieProgressLabel.text = "Watched"
        m.movieProgressFill.width = 220
    else if progressSeconds > 0
        m.movieProgressLabel.text = "Stopped at " + formatEpisodeProgressTime(progressSeconds)
        fillWidth = 0
        if media.durationSeconds <> invalid and media.durationSeconds > 0
            fillWidth = Int((progressSeconds * 220) / media.durationSeconds)
            if fillWidth < 2 then fillWidth = 2
            if fillWidth > 218 then fillWidth = 218
        end if
        m.movieProgressFill.width = fillWidth
    else
        m.movieProgressLabel.text = "Not started"
        m.movieProgressFill.width = 0
    end if

    m.resetActionGroup.visible = watched or progressSeconds > 0
    if m.movieResetPending
        m.resetActionLabel.text = "Resetting..."
    else
        m.resetActionLabel.text = "Reset viewing  *"
    end if
    m.resetFocusBg.color = detailButtonColor(m.focusArea = "reset", false)
end sub

sub buildDetailTabs()
    m.detailTabs = []
    hasSeasons = hasSeriesSeasons()
    hasMultipleVideos = m.item.videos <> invalid and m.item.videos.Count() > 1
    if hasSeasons
        m.detailTabs.Push({ id: "episodes", label: "Episodes" })
    else if hasMultipleVideos
        m.detailTabs.Push({ id: "episodes", label: "Video" })
    end if
    if hasSimilarItems() then m.detailTabs.Push({ id: "similar", label: "Similar" })
    m.detailTabs.Push({ id: "about", label: "About" })
    m.focusedTabIndex = 0
    m.activeTab = m.detailTabs[0].id
end sub

sub renderDetailTabs()
    childCount = m.detailTabHost.getChildCount()
    if childCount > 0 then m.detailTabHost.removeChildrenIndex(childCount, 0)
    m.detailTabBgs = []

    for index = 0 to m.detailTabs.Count() - 1
        tabGroup = CreateObject("roSGNode", "Group")
        tabGroup.translation = [index * 264, 0]
        bg = CreateObject("roSGNode", "Rectangle")
        bg.width = 248
        bg.height = 48
        bg.color = "#202B3A"
        tabGroup.appendChild(bg)
        label = CreateObject("roSGNode", "Label")
        label.text = m.detailTabs[index].label
        label.translation = [22, 11]
        label.width = 200
        label.color = "#F8FAFC"
        label.font.size = 24
        tabGroup.appendChild(label)
        m.detailTabHost.appendChild(tabGroup)
        m.detailTabBgs.Push(bg)
    end for
    updateDetailTabFocus()
end sub

sub updateDetailTabFocus()
    for index = 0 to m.detailTabBgs.Count() - 1
        if m.focusArea = "tabs" and index = m.focusedTabIndex
            m.detailTabBgs[index].color = "#60A5FA"
        else if m.detailTabs[index].id = m.activeTab
            m.detailTabBgs[index].color = "#2563EB"
        else
            m.detailTabBgs[index].color = "#202B3A"
        end if
    end for
    if m.aboutFocusBg <> invalid
        if m.focusArea = "about" and m.activeTab = "about"
            m.aboutFocusBg.opacity = 0.32
        else
            m.aboutFocusBg.opacity = 0
        end if
    end if
end sub

sub showDetailTab(tabId as String)
    m.activeTab = tabId
    m.episodesTabGroup.visible = tabId = "episodes"
    m.similarTabGroup.visible = tabId = "similar"
    m.aboutTabGroup.visible = tabId = "about"
    updateDetailTabFocus()
    updateEpisodeScrollChevrons()
    updateDetailExtrasFocusVisuals()
end sub

sub focusDetailTabContent()
    tabId = m.detailTabs[m.focusedTabIndex].id
    showDetailTab(tabId)
    if tabId = "episodes"
        if hasSeriesSeasons()
            m.focusArea = "seasons"
        else
            m.focusArea = "episodes"
        end if
    else if tabId = "similar"
        m.focusArea = "similar"
    else
        m.focusArea = "about"
    end if
    updateSelectedMediaVisuals()
    updateDetailTabFocus()
end sub

sub focusActiveTab()
    m.focusArea = "tabs"
    for index = 0 to m.detailTabs.Count() - 1
        if m.detailTabs[index].id = m.activeTab then m.focusedTabIndex = index
    end for
    updateSelectedMediaVisuals()
    updateDetailTabFocus()
end sub

sub renderAboutTab()
    lines = descriptionOverlayLines()
    maxStart = lines.Count() - 8
    if maxStart < 0 then maxStart = 0
    if m.aboutScrollStart > maxStart then m.aboutScrollStart = maxStart

    body = ""
    if lines.Count() = 0
        body = "No description is available."
    else
        lastIndex = m.aboutScrollStart + 7
        if lastIndex >= lines.Count() then lastIndex = lines.Count() - 1
        for index = m.aboutScrollStart to lastIndex
            if body <> "" then body = body + Chr(10)
            body = body + lines[index]
        end for
    end if
    m.aboutDescriptionLabel.text = body
    m.aboutScrollUpChevron.visible = m.aboutScrollStart > 0
    m.aboutScrollDownChevron.visible = m.aboutScrollStart < maxStart
end sub

sub scrollAboutTab(delta as Integer)
    lines = descriptionOverlayLines()
    maxStart = lines.Count() - 8
    if maxStart < 0 then maxStart = 0
    nextStart = m.aboutScrollStart + delta
    if nextStart < 0 then nextStart = 0
    if nextStart > maxStart then nextStart = maxStart
    m.aboutScrollStart = nextStart
    renderAboutTab()
end sub

sub renderDetailFacts()
    if m.detailFactsGroup = invalid or m.detailFactsHost = invalid then return

    childCount = m.detailFactsHost.getChildCount()
    if childCount > 0 then m.detailFactsHost.removeChildrenIndex(childCount, 0)

    if m.item = invalid
        m.detailFactsGroup.visible = false
        return
    end if
    if m.item.detailFacts = invalid or type(m.item.detailFacts) <> "roArray" or m.item.detailFacts.Count() = 0
        m.detailFactsGroup.visible = false
        return
    end if

    maxRows = m.item.detailFacts.Count()
    if maxRows > 8 then maxRows = 8

    for index = 0 to maxRows - 1
        m.detailFactsHost.appendChild(createDetailFactRow(m.item.detailFacts[index], index))
    end for

    m.detailFactsGroup.visible = true
end sub

function createDetailFactRow(fact as Object, index as Integer) as Object
    palette = detailUiPalette()
    row = CreateObject("roSGNode", "Group")
    row.translation = [0, index * 32]

    label = CreateObject("roSGNode", "Label")
    label.text = fact.label
    label.width = 96
    label.color = palette.muted
    row.appendChild(label)

    value = CreateObject("roSGNode", "Label")
    value.text = fact.value
    value.translation = [108, 0]
    value.width = 340
    value.color = "#D1D5DB"
    row.appendChild(value)

    return row
end function

sub renderHistoryMetadata()
    if m.historyMetaGroup = invalid or m.historyMetaLabel = invalid then return

    text = historyMetadataText()
    if text = ""
        applyHistoryMetadataLayout(false)
        m.historyMetaGroup.visible = false
        m.historyMetaLabel.text = ""
        return
    end if

    applyHistoryMetadataLayout(true)
    m.historyMetaLabel.text = text
    m.historyMetaGroup.visible = true
end sub

sub applyHistoryMetadataLayout(hasHistoryMetadata as Boolean)
    if m.descriptionFocusBg = invalid or m.descriptionLabel = invalid then return

    if hasHistoryMetadata
        m.descriptionFocusBg.translation = [162, 112]
        m.descriptionLabel.translation = [172, 118]
    else
        m.descriptionFocusBg.translation = [162, 86]
        m.descriptionLabel.translation = [172, 92]
    end if
end sub

function historyMetadataText() as String
    if m.selection = invalid then return ""

    watchCount = selectionIntegerField("watchCount", 0)
    firstSeenSeconds = selectionIntegerField("firstSeenSeconds", 0)
    lastSeenSeconds = selectionIntegerField("lastSeenSeconds", 0)
    if watchCount <= 0 and firstSeenSeconds <= 0 and lastSeenSeconds <= 0 then return ""

    parts = []
    if watchCount > 0
        countText = StrI(watchCount).Trim() + " watch"
        if watchCount <> 1 then countText = countText + "es"
        parts.Push(countText)
    end if

    if firstSeenSeconds > 0 then parts.Push("First " + formatHistoryDate(firstSeenSeconds))
    if lastSeenSeconds > 0 then parts.Push("Last " + formatHistoryDate(lastSeenSeconds))

    return joinMetadata(parts)
end function

function selectionIntegerField(key as String, fallback as Integer) as Integer
    if m.selection = invalid or type(m.selection) <> "roAssociativeArray" then return fallback
    if m.selection.DoesExist(key) <> true or m.selection[key] = invalid then return fallback

    value = m.selection[key]
    valueType = type(value)
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return value
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Int(value)
    return fallback
end function

function formatHistoryDate(seconds as Integer) as String
    if seconds <= 0 then return ""

    dateTime = CreateObject("roDateTime")
    dateTime.FromSeconds(seconds)

    monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    month = dateTime.GetMonth()
    if month < 1 or month > 12 then return ""

    return monthNames[month - 1] + " " + StrI(dateTime.GetDayOfMonth()).Trim() + ", " + StrI(dateTime.GetYear()).Trim()
end function

sub applyDetailExtrasLayout()
    m.episodeListBottomY = 318
end sub

function hasDetailExtras() as Boolean
    return hasPlayableTrailer() or hasSimilarItems()
end function

function hasPlayableTrailer() as Boolean
    if m.trailer = invalid then return false
    if m.trailer.streamUrl = invalid or m.trailer.streamUrl = "" then return false
    return true
end function

function hasSimilarItems() as Boolean
    return m.similarItems <> invalid and m.similarItems.Count() > 0
end function

sub renderDetailExtras()
    renderTrailerAction()
    renderSimilarItems()
    updateDetailExtrasFocusVisuals()
end sub

sub renderTrailerAction()
    if m.trailerGroup = invalid then return

    if hasPlayableTrailer() <> true
        m.trailerGroup.visible = false
        return
    end if

    m.trailerLabel.text = "Play trailer"
    m.trailerGroup.visible = true
end sub

sub renderSimilarItems()
    if m.similarGroup = invalid or m.similarHost = invalid then return

    childCount = m.similarHost.getChildCount()
    if childCount > 0 then m.similarHost.removeChildrenIndex(childCount, 0)
    m.similarFocusOverlay = invalid

    if hasSimilarItems() <> true
        m.similarGroup.visible = false
        if m.similarCursor <> invalid then m.similarCursor.visible = false
        return
    end if

    if m.selectedSimilarIndex < 0 then m.selectedSimilarIndex = 0
    if m.selectedSimilarIndex >= m.similarItems.Count() then m.selectedSimilarIndex = m.similarItems.Count() - 1

    if m.selectedSimilarIndex < m.visibleSimilarStart then m.visibleSimilarStart = m.selectedSimilarIndex
    if m.selectedSimilarIndex >= m.visibleSimilarStart + m.maxVisibleSimilarItems
        m.visibleSimilarStart = m.selectedSimilarIndex - m.maxVisibleSimilarItems + 1
    end if
    lastIndex = m.visibleSimilarStart + m.maxVisibleSimilarItems - 1
    if lastIndex >= m.similarItems.Count() then lastIndex = m.similarItems.Count() - 1

    for index = m.visibleSimilarStart to lastIndex
        m.similarHost.appendChild(createSimilarCard(m.similarItems[index], index - m.visibleSimilarStart))
    end for

    m.similarFocusOverlay = CreateObject("roSGNode", "Group")
    m.similarHost.appendChild(m.similarFocusOverlay)

    m.similarGroup.visible = true
    m.similarPositionLabel.text = m.similarItems[m.selectedSimilarIndex].title + "  |  " + StrI(m.selectedSimilarIndex + 1).Trim() + " / " + StrI(m.similarItems.Count()).Trim()
    updateDetailExtrasFocusVisuals()
end sub

function createSimilarCard(item as Object, index as Integer, focused = false as Boolean) as Object
    palette = detailUiPalette()
    card = CreateObject("roSGNode", "Group")
    card.translation = [index * m.similarCardSpacing, 0]

    bg = CreateObject("roSGNode", "Rectangle")
    bg.width = m.similarCardWidth
    bg.height = 288
    bg.color = palette.surface
    if focused then bg.opacity = 1 else bg.opacity = 0.78
    if focused then bg.color = "#60A5FA"
    card.appendChild(bg)

    if focused
        innerBg = CreateObject("roSGNode", "Rectangle")
        innerBg.translation = [4, 4]
        innerBg.width = m.similarCardWidth - 8
        innerBg.height = 280
        innerBg.color = "#273142"
        innerBg.opacity = 0.94
        card.appendChild(innerBg)
    end if

    poster = CreateObject("roSGNode", "Poster")
    poster.translation = [12, 8]
    poster.width = 196
    poster.height = 222
    poster.loadDisplayMode = "scaleToFit"
    poster.uri = item.posterUrl
    card.appendChild(poster)

    title = CreateObject("roSGNode", "Label")
    title.text = item.title
    title.translation = [12, 236]
    title.width = 196
    title.height = 30
    title.wrap = false
    title.font.size = 21
    title.color = palette.text
    card.appendChild(title)

    subtitle = CreateObject("roSGNode", "Label")
    subtitle.text = item.subtitle
    if item.year > 0 then subtitle.text = StrI(item.year).Trim()
    subtitle.translation = [12, 263]
    subtitle.width = 196
    subtitle.height = 21
    subtitle.wrap = false
    subtitle.font.size = 18
    subtitle.color = palette.muted
    card.appendChild(subtitle)

    return card
end function

sub updateDetailExtrasFocusVisuals()
    palette = detailUiPalette()
    if m.trailerFocusBg <> invalid
        if m.focusArea = "trailer" and m.trailerGroup.visible = true
            m.trailerFocusBg.color = detailButtonColor(true, false)
            m.trailerLabel.color = palette.primaryText
        else
            m.trailerFocusBg.color = detailButtonColor(false, false)
            m.trailerLabel.color = "#D1D5DB"
        end if
    end if

    if m.similarCursor <> invalid
        showCursor = m.focusArea = "similar" and m.similarGroup.visible = true and hasSimilarItems()
        m.similarCursor.visible = false
        if m.similarFocusOverlay <> invalid
            childCount = m.similarFocusOverlay.getChildCount()
            if childCount > 0 then m.similarFocusOverlay.removeChildrenIndex(childCount, 0)
            if showCursor
                visibleIndex = m.selectedSimilarIndex - m.visibleSimilarStart
                m.similarFocusOverlay.appendChild(createSimilarCard(m.similarItems[m.selectedSimilarIndex], visibleIndex, true))
            end if
        end if
    end if
end sub

function firstDetailExtrasFocusArea() as String
    if hasPlayableTrailer() then return "trailer"
    if hasSimilarItems() then return "similar"
    return ""
end function

sub moveSimilar(delta as Integer)
    if hasSimilarItems() <> true then return

    nextIndex = m.selectedSimilarIndex + delta
    if nextIndex < 0 then nextIndex = 0
    maxIndex = m.similarItems.Count() - 1
    if nextIndex > maxIndex then nextIndex = maxIndex
    m.selectedSimilarIndex = nextIndex
    renderSimilarItems()
end sub

sub startTrailerPlayback()
    if hasPlayableTrailer() <> true
        m.playbackErrorLabel.text = "No playable trailer is available."
        return
    end if

    m.top.playbackRequested = {
        itemId: m.item.itemId
        mediaId: 0
        itemTitle: m.item.title
        title: "Trailer"
        subtitle: ""
        seasonNumber: 0
        episodeNumber: 0
        videoNumber: 0
        durationSeconds: 0
        progressSeconds: 0
        watchStatus: -1
        watched: false
        streamUrl: m.trailer.streamUrl
        streamFormat: m.trailer.streamFormat
        qualityOptions: m.trailer.qualityOptions
        audioTracks: []
        subtitleTracks: []
    }
end sub

sub selectSimilarItem()
    if hasSimilarItems() <> true then return
    if m.selectedSimilarIndex < 0 or m.selectedSimilarIndex >= m.similarItems.Count() then return

    item = m.similarItems[m.selectedSimilarIndex]
    if item.itemId = invalid or item.itemId <= 0 then return

    m.top.selection = {
        itemId: item.itemId
        mediaId: item.mediaId
        source: "similar"
    }
end sub

sub loadItemBookmarkFolders()
    if m.item = invalid or m.item.itemId <= 0 then return

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "loadItemBookmarkFolders"
    task.request = { itemId: m.item.itemId }
    task.observeField("response", "onItemBookmarkFoldersResponse")
    task.control = "RUN"
    m.itemBookmarkFoldersTask = task
end sub

sub onItemBookmarkFoldersResponse(event as Object)
    response = event.getData()
    if response = invalid or response.ok <> true
        if responseRequiresSignIn(response) then requestSignInAgain(response)
        return
    end if
    m.itemBookmarkFolders = []
    if response.folders <> invalid then m.itemBookmarkFolders = response.folders
    renderBookmarkAction()
    if m.bookmarkOverlayOpen then renderBookmarkOverlayFolders()
end sub

sub renderBookmarkAction()
    if m.bookmarkLabel = invalid then return
    count = 0
    if m.itemBookmarkFolders <> invalid then count = m.itemBookmarkFolders.Count()
    if count > 0
        m.bookmarkLabel.text = "Bookmarked (" + StrI(count).Trim() + ")"
    else
        m.bookmarkLabel.text = "Bookmarks"
    end if
    updateBookmarkActionFocus()
end sub

sub updateBookmarkActionFocus()
    if m.bookmarkFocusBg = invalid then return
    palette = detailUiPalette()
    if m.focusArea = "bookmark"
        m.bookmarkFocusBg.color = detailButtonColor(true, false)
        m.bookmarkFocusBg.opacity = 1
        m.bookmarkLabel.color = palette.primaryText
    else
        m.bookmarkFocusBg.color = detailButtonColor(false, false)
        m.bookmarkFocusBg.opacity = 0.88
        m.bookmarkLabel.color = "#D1D5DB"
    end if
end sub

sub openBookmarkOverlay()
    if m.item = invalid or m.item.itemId <= 0 then return
    m.bookmarkOverlayOpen = true
    m.bookmarkOverlayGroup.visible = true
    m.bookmarkOverlayStatusLabel.text = "Loading folders..."
    m.bookmarkFolders = []
    renderBookmarkOverlayFolders()
    loadBookmarkFoldersForOverlay()
end sub

sub closeBookmarkOverlay()
    m.bookmarkOverlayOpen = false
    m.bookmarkOverlayGroup.visible = false
end sub

sub loadBookmarkFoldersForOverlay()
    task = CreateObject("roSGNode", "ContentTask")
    task.command = "loadBookmarkFolders"
    task.request = {}
    task.observeField("response", "onBookmarkOverlayFoldersResponse")
    task.control = "RUN"
    m.bookmarkOverlayTask = task
end sub

sub onBookmarkOverlayFoldersResponse(event as Object)
    response = event.getData()
    if response = invalid or response.ok <> true
        if responseRequiresSignIn(response)
            requestSignInAgain(response)
            return
        end if
        message = "Unable to load bookmark folders."
        if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
        m.bookmarkOverlayStatusLabel.text = message
        return
    end if

    m.bookmarkFolders = []
    if response.folders <> invalid then m.bookmarkFolders = response.folders
    if m.selectedBookmarkFolderIndex >= m.bookmarkFolders.Count() then m.selectedBookmarkFolderIndex = m.bookmarkFolders.Count() - 1
    if m.selectedBookmarkFolderIndex < 0 then m.selectedBookmarkFolderIndex = 0

    if m.bookmarkFolders.Count() = 0
        m.bookmarkOverlayStatusLabel.text = "No bookmark folders yet."
    else
        m.bookmarkOverlayStatusLabel.text = "Choose a folder"
    end if
    renderBookmarkOverlayFolders()
end sub

sub renderBookmarkOverlayFolders()
    if m.bookmarkOverlayFoldersHost = invalid then return
    palette = detailUiPalette()
    childCount = m.bookmarkOverlayFoldersHost.getChildCount()
    if childCount > 0 then m.bookmarkOverlayFoldersHost.removeChildrenIndex(childCount, 0)
    m.bookmarkOverlayRows = []
    m.bookmarkOverlayRowBgs = []

    maxRows = m.bookmarkFolders.Count()
    if maxRows > 6 then maxRows = 6
    for index = 0 to maxRows - 1
        folder = m.bookmarkFolders[index]
        row = CreateObject("roSGNode", "Group")
        row.translation = [0, index * 50]

        bg = CreateObject("roSGNode", "Rectangle")
        bg.width = 504
        bg.height = 42
        bg.color = palette.surface
        row.appendChild(bg)

        marker = CreateObject("roSGNode", "Label")
        if bookmarkFolderContainsItem(folder.folderId)
            marker.text = "On"
        else
            marker.text = "Off"
        end if
        marker.translation = [14, 11]
        marker.width = 44
        marker.color = "#D1D5DB"
        row.appendChild(marker)

        label = CreateObject("roSGNode", "Label")
        label.text = folder.title
        label.translation = [64, 11]
        label.width = 360
        label.color = palette.text
        row.appendChild(label)

        count = CreateObject("roSGNode", "Label")
        count.text = bookmarkFolderCountText(folder)
        count.translation = [424, 11]
        count.width = 64
        count.color = palette.muted
        count.horizAlign = "right"
        row.appendChild(count)

        m.bookmarkOverlayFoldersHost.appendChild(row)
        m.bookmarkOverlayRows.Push(row)
        m.bookmarkOverlayRowBgs.Push(bg)
    end for

    updateBookmarkOverlayFocus()
end sub

function bookmarkFolderContainsItem(folderId as Integer) as Boolean
    if m.itemBookmarkFolders = invalid then return false
    for each folder in m.itemBookmarkFolders
        if folder <> invalid and folder.folderId = folderId then return true
    end for
    return false
end function

function bookmarkFolderCountText(folder as Dynamic) as String
    if folder = invalid or folder.count = invalid then return ""
    return StrI(folder.count).Trim()
end function

sub updateBookmarkOverlayFocus()
    palette = detailUiPalette()
    for index = 0 to m.bookmarkOverlayRowBgs.Count() - 1
        if index = m.selectedBookmarkFolderIndex
            m.bookmarkOverlayRowBgs[index].color = palette.surfaceFocus
        else
            m.bookmarkOverlayRowBgs[index].color = palette.surface
        end if
    end for
end sub

sub moveBookmarkOverlayFolder(delta as Integer)
    if m.bookmarkFolders.Count() = 0 then return
    nextIndex = m.selectedBookmarkFolderIndex + delta
    if nextIndex < 0 then nextIndex = 0
    maxIndex = m.bookmarkFolders.Count() - 1
    if maxIndex > 5 then maxIndex = 5
    if nextIndex > maxIndex then nextIndex = maxIndex
    m.selectedBookmarkFolderIndex = nextIndex
    updateBookmarkOverlayFocus()
end sub

sub toggleSelectedBookmarkFolder()
    if m.item = invalid or m.bookmarkFolders.Count() = 0 then return
    folder = m.bookmarkFolders[m.selectedBookmarkFolderIndex]
    m.bookmarkOverlayStatusLabel.text = "Updating bookmark..."

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "toggleItemBookmark"
    task.request = { itemId: m.item.itemId, folderId: folder.folderId }
    task.observeField("response", "onToggleItemBookmarkResponse")
    task.control = "RUN"
    m.toggleBookmarkTask = task
end sub

sub onToggleItemBookmarkResponse(event as Object)
    response = event.getData()
    if response = invalid or response.ok <> true
        if responseRequiresSignIn(response)
            requestSignInAgain(response)
            return
        end if
        message = "Unable to update bookmark."
        if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
        m.bookmarkOverlayStatusLabel.text = message
        return
    end if

    m.bookmarkOverlayStatusLabel.text = "Bookmark updated."
    loadItemBookmarkFolders()
    loadBookmarkFoldersForOverlay()
end sub

function joinMetadata(values as Dynamic) as String
    if values = invalid or values.Count() = 0 then return ""

    text = ""
    for index = 0 to values.Count() - 1
        if values[index] <> invalid and values[index] <> ""
            if text <> "" then text = text + "  |  "
            text = text + values[index]
        end if
    end for
    return text
end function

function descriptionOverlayLines() as Object
    lines = []
    if m.descriptionLabel = invalid or m.descriptionLabel.text = invalid or m.descriptionLabel.text = "" then return lines

    text = m.descriptionLabel.text
    lineLength = m.descriptionOverlayLineLength
    if lineLength < 20 then lineLength = 20

    position = 1
    while position <= Len(text)
        lines.Push(Mid(text, position, lineLength))
        position = position + lineLength
    end while

    return lines
end function

sub openDescriptionOverlay()
    lines = descriptionOverlayLines()
    if lines.Count() = 0 then return

    m.descriptionOverlayScrollStart = 0
    m.descriptionOverlayGroup.visible = true
    renderDescriptionOverlayText()
end sub

sub closeDescriptionOverlay()
    if m.descriptionOverlayGroup = invalid then return
    m.descriptionOverlayGroup.visible = false
    m.descriptionOverlayScrollStart = 0
    updateDescriptionFocusVisual()
end sub

sub scrollDescriptionOverlay(delta as Integer)
    if m.descriptionOverlayGroup = invalid or m.descriptionOverlayGroup.visible <> true then return

    lines = descriptionOverlayLines()
    maxStart = lines.Count() - m.descriptionOverlayMaxLines
    if maxStart < 0 then maxStart = 0

    nextStart = m.descriptionOverlayScrollStart + delta
    if nextStart < 0 then nextStart = 0
    if nextStart > maxStart then nextStart = maxStart

    m.descriptionOverlayScrollStart = nextStart
    renderDescriptionOverlayText()
end sub

sub renderDescriptionOverlayText()
    lines = descriptionOverlayLines()
    text = ""
    if lines.Count() > 0
        startIndex = m.descriptionOverlayScrollStart
        lastIndex = startIndex + m.descriptionOverlayMaxLines - 1
        if lastIndex >= lines.Count() then lastIndex = lines.Count() - 1

        for index = startIndex to lastIndex
            if text <> "" then text = text + Chr(10)
            text = text + lines[index]
        end for
    end if

    m.descriptionOverlayTextLabel.text = text
    m.descriptionOverlayScrollUpChevron.visible = m.descriptionOverlayScrollStart > 0
    m.descriptionOverlayScrollDownChevron.visible = (m.descriptionOverlayScrollStart + m.descriptionOverlayMaxLines) < lines.Count()
end sub

sub updateDescriptionFocusVisual()
    if m.descriptionFocusBg = invalid then return
    palette = detailUiPalette()
    m.descriptionFocusBg.color = palette.surfaceFocus
    if m.focusArea = "description" and m.detailGroup.visible = true and m.descriptionOverlayGroup.visible <> true
        m.descriptionFocusBg.opacity = 0.74
    else
        m.descriptionFocusBg.opacity = 0
    end if
end sub

sub renderSeasonTabs()
    palette = detailUiPalette()
    childCount = m.seasonTabsHost.getChildCount()
    if childCount > 0 then m.seasonTabsHost.removeChildrenIndex(childCount, 0)
    m.seasonTabBgs = []
    if m.seasons.Count() = 0
        m.panelTitleLabel.text = "Video"
        updateEpisodeListLayout(0)
        return
    end if

    if m.seasons.Count() <= 1 and not hasSeriesSeasons()
        m.panelTitleLabel.text = m.seasons[0].title
        updateEpisodeListLayout(0)
        return
    end if

    m.panelTitleLabel.text = m.seasons[m.currentSeasonIndex].title + "  |  " + StrI(m.currentSeasonIndex + 1).Trim() + " of " + StrI(m.seasons.Count()).Trim()
    if m.currentSeasonIndex < m.visibleSeasonStart then m.visibleSeasonStart = m.currentSeasonIndex
    if m.currentSeasonIndex >= m.visibleSeasonStart + m.maxVisibleSeasons
        m.visibleSeasonStart = m.currentSeasonIndex - m.maxVisibleSeasons + 1
    end if
    lastIndex = m.visibleSeasonStart + m.maxVisibleSeasons - 1
    if lastIndex >= m.seasons.Count() then lastIndex = m.seasons.Count() - 1

    for index = m.visibleSeasonStart to lastIndex
        tabGroup = CreateObject("roSGNode", "Group")
        tabGroup.translation = [(index - m.visibleSeasonStart) * (m.seasonTabWidth + m.seasonTabGap), 0]

        bg = CreateObject("roSGNode", "Rectangle")
        bg.width = m.seasonTabWidth
        bg.height = m.seasonTabHeight
        bg.color = palette.surface
        tabGroup.appendChild(bg)

        label = CreateObject("roSGNode", "Label")
        label.text = "S" + StrI(m.seasons[index].number).Trim()
        label.translation = [14, 10]
        label.color = "#D1D5DB"
        tabGroup.appendChild(label)

        m.seasonTabsHost.appendChild(tabGroup)
        m.seasonTabBgs.Push(bg)
    end for

    updateEpisodeListLayout(1)
end sub

sub updateEpisodeListLayout(tabRows as Integer)
    m.episodeListY = m.baseEpisodeListY
    if tabRows = 0 then m.episodeListY = 42

    m.episodeListHost.translation = [0, m.episodeListY]
    m.episodeCursor.translation = [0, m.episodeListY]
    if m.episodeScrollUpChevron <> invalid
        m.episodeScrollUpChevron.translation = [1104, m.episodeListY]
    end if
    m.noMediaLabel.translation = [0, m.episodeListY + 14]

    availableHeight = m.episodeListBottomY - m.episodeListY
    maxVisible = Int((availableHeight + 4) / 78)
    if maxVisible < 1 then maxVisible = 1
    if maxVisible > m.defaultMaxVisibleEpisodes then maxVisible = m.defaultMaxVisibleEpisodes
    m.maxVisibleEpisodes = maxVisible
    if m.episodeScrollDownChevron <> invalid
        downY = m.episodeListY + ((m.maxVisibleEpisodes - 1) * 78)
        if downY < m.episodeListY then downY = m.episodeListY
        m.episodeScrollDownChevron.translation = [1104, downY]
    end if
    updateEpisodeScrollChevrons()
end sub

sub renderEpisodeList()
    childCount = m.episodeListHost.getChildCount()
    if childCount > 0 then m.episodeListHost.removeChildrenIndex(childCount, 0)
    m.episodeRows = []
    m.episodeRowNodes = []
    m.episodeRowShadows = []
    m.episodeRowIndexes = []

    if m.seasons.Count() = 0
        showNoPlayableMedia()
        return
    end if

    if m.currentSeasonIndex < 0 then m.currentSeasonIndex = 0
    if m.currentSeasonIndex >= m.seasons.Count()
        m.currentSeasonIndex = m.seasons.Count() - 1
    end if

    episodes = []
    if m.seasons[m.currentSeasonIndex].episodes <> invalid
        episodes = m.seasons[m.currentSeasonIndex].episodes
    end if

    if episodes.Count() = 0
        showNoPlayableMedia()
        return
    end if

    if m.currentEpisodeIndex < 0 then m.currentEpisodeIndex = 0
    if m.currentEpisodeIndex >= episodes.Count()
        m.currentEpisodeIndex = episodes.Count() - 1
    end if
    updateVisibleEpisodeWindow()

    m.noMediaLabel.visible = false
    m.playbackErrorLabel.text = ""
    startIndex = m.visibleEpisodeStart
    lastIndex = startIndex + m.maxVisibleEpisodes - 1
    if lastIndex >= episodes.Count() then lastIndex = episodes.Count() - 1

    for index = startIndex to lastIndex
        episode = episodes[index]
        visibleIndex = index - startIndex
        rowInfo = createEpisodeRow(episode, visibleIndex)
        m.episodeListHost.appendChild(rowInfo.node)
        m.episodeRows.Push(rowInfo.bg)
        m.episodeRowNodes.Push(rowInfo.node)
        m.episodeRowShadows.Push(rowInfo.shadow)
        m.episodeRowIndexes.Push(index)
    end for
    updateEpisodeScrollChevrons()
end sub

function createEpisodeRow(episode as Object, visibleIndex as Integer) as Object
    palette = detailUiPalette()
    row = CreateObject("roSGNode", "Group")
    row.translation = [0, visibleIndex * 78]
    row.scaleRotateCenter = [550, 37]

    shadow = CreateObject("roSGNode", "Rectangle")
    shadow.translation = [4, 8]
    shadow.width = 1100
    shadow.height = 74
    shadow.color = "#000000"
    shadow.opacity = 0.45
    shadow.visible = false
    row.appendChild(shadow)

    bg = CreateObject("roSGNode", "Rectangle")
    bg.width = 1100
    bg.height = 74
    bg.color = palette.surface
    bg.opacity = 0.82
    row.appendChild(bg)

    accent = CreateObject("roSGNode", "Rectangle")
    accent.translation = [0, 0]
    accent.width = 4
    accent.height = 74
    accent.color = palette.primaryFocus
    accent.opacity = 0.52
    row.appendChild(accent)

    title = CreateObject("roSGNode", "Label")
    title.text = episode.title
    textX = 18
    if episode.thumbnailUrl <> invalid and episode.thumbnailUrl <> ""
        thumbnail = CreateObject("roSGNode", "Poster")
        thumbnail.translation = [10, 6]
        thumbnail.width = 106
        thumbnail.height = 62
        thumbnail.loadDisplayMode = "scaleToFit"
        thumbnail.uri = episode.thumbnailUrl
        row.appendChild(thumbnail)
        textX = 132
    end if
    title.translation = [textX, 10]
    title.width = 850
    title.color = palette.text
    row.appendChild(title)

    subtitle = CreateObject("roSGNode", "Label")
    subtitle.text = mediaSubtitle(episode)
    progressText = episodeProgressText(episode)
    if progressText <> ""
        if subtitle.text <> "" then subtitle.text = subtitle.text + "  |  " + progressText else subtitle.text = progressText
    end if
    subtitle.translation = [textX, 42]
    subtitle.width = 850
    subtitle.color = palette.muted
    if episodeWatchStatus(episode) <> 1 and progressText <> "" then subtitle.color = palette.success
    row.appendChild(subtitle)

    if episodeWatchStatus(episode) = 1 then appendWatchedCheck(row)

    return { node: row, bg: bg, shadow: shadow }
end function

sub updateVisibleEpisodeWindow()
    episodes = playableEpisodesForSeason(m.currentSeasonIndex)
    if episodes.Count() = 0
        m.visibleEpisodeStart = 0
        return
    end if

    if m.currentEpisodeIndex < m.visibleEpisodeStart
        m.visibleEpisodeStart = m.currentEpisodeIndex
    else if m.currentEpisodeIndex >= m.visibleEpisodeStart + m.maxVisibleEpisodes
        m.visibleEpisodeStart = m.currentEpisodeIndex - m.maxVisibleEpisodes + 1
    end if

    maxStart = episodes.Count() - m.maxVisibleEpisodes
    if maxStart < 0 then maxStart = 0
    if m.visibleEpisodeStart > maxStart then m.visibleEpisodeStart = maxStart
    if m.visibleEpisodeStart < 0 then m.visibleEpisodeStart = 0
end sub

sub updateEpisodeScrollChevrons()
    if m.episodeScrollUpChevron = invalid or m.episodeScrollDownChevron = invalid then return

    episodes = playableEpisodesForSeason(m.currentSeasonIndex)
    showEpisodeHints = m.detailGroup.visible and m.activeTab = "episodes" and episodes.Count() > 0 and episodes.Count() > m.maxVisibleEpisodes
    if showEpisodeHints <> true
        m.episodeScrollUpChevron.visible = false
        m.episodeScrollDownChevron.visible = false
        return
    end if

    m.episodeScrollUpChevron.visible = m.visibleEpisodeStart > 0
    m.episodeScrollDownChevron.visible = (m.visibleEpisodeStart + m.maxVisibleEpisodes) < episodes.Count()
end sub

function mediaSubtitle(media as Object) as String
    parts = []
    if media.seasonNumber > 0
        seasonText = "S" + StrI(media.seasonNumber).Trim()
        episodeText = " E" + StrI(media.episodeNumber).Trim()
        parts.Push(seasonText + episodeText)
    end if
    if media.durationSeconds > 0
        parts.Push(StrI(Int(media.durationSeconds / 60)).Trim() + " min")
    end if
    if media.isPlayable <> true then parts.Push("Unavailable")
    return joinMetadata(parts)
end function

function episodeWatchStatus(media as Dynamic) as Integer
    if media = invalid then return -1
    if media.watchStatus <> invalid then return media.watchStatus
    if media.watched = true then return 1
    if media.progressSeconds <> invalid and media.progressSeconds > 0 then return 0
    return -1
end function

function episodeVideoNumber(media as Dynamic) as Integer
    if media = invalid then return 0
    if media.videoNumber <> invalid and media.videoNumber > 0 then return media.videoNumber
    if media.episodeNumber <> invalid and media.episodeNumber > 0 then return media.episodeNumber
    return 0
end function

function watchedToggleKey(seasonNumber as Integer, videoNumber as Integer) as String
    return StrI(seasonNumber).Trim() + ":" + StrI(videoNumber).Trim()
end function

function episodeProgressText(media as Dynamic) as String
    if media = invalid then return ""
    if episodeWatchStatus(media) = 1 then return ""
    if media.progressSeconds = invalid or media.progressSeconds <= 0 then return ""

    if media.durationSeconds <> invalid and media.durationSeconds > 0
        percent = Int((media.progressSeconds * 100) / media.durationSeconds)
        if percent < 1 then percent = 1
        if percent > 99 then percent = 99
        return StrI(percent).Trim() + "%"
    end if

    return formatEpisodeProgressTime(media.progressSeconds)
end function

function formatEpisodeProgressTime(seconds as Integer) as String
    if seconds < 0 then seconds = 0
    minutes = Int(seconds / 60)
    remaining = seconds - (minutes * 60)
    remainingText = StrI(remaining).Trim()
    if remaining < 10 then remainingText = "0" + remainingText
    return StrI(minutes).Trim() + ":" + remainingText
end function

sub appendWatchedCheck(row as Object)
    palette = detailUiPalette()
    check = CreateObject("roSGNode", "Label")
    check.text = "✓"
    check.translation = [1042, 10]
    check.width = 26
    check.horizAlign = "center"
    check.color = palette.success
    row.appendChild(check)
end sub

sub showState(state as String)
    m.loadingGroup.visible = state = "loading"
    m.errorGroup.visible = state = "error"
    m.detailGroup.visible = state = "detail"
    updateEpisodeScrollChevrons()
    updateDetailExtrasFocusVisuals()
end sub

sub showError(message as String)
    m.errorLabel.text = message
    m.focusArea = "retry"
    showState("error")
end sub

function responseRequiresSignIn(response as Dynamic) as Boolean
    if response = invalid or type(response) <> "roAssociativeArray" then return false
    if response.DoesExist("status") and response.status <> invalid and response.status = 401 then return true
    if response.DoesExist("error") <> true or response.error = invalid then return false
    errorCode = response.error
    if type(errorCode) <> "String" and type(errorCode) <> "roString" then return false
    errorCode = LCase(errorCode)
    return errorCode = "auth_required" or errorCode = "unauthorized" or errorCode = "invalid_grant"
end function

sub requestSignInAgain(response as Dynamic)
    m.top.authRequired = true
end sub

function currentMedia() as Dynamic
    if m.seasons.Count() = 0 then return invalid

    if m.currentSeasonIndex < 0 then m.currentSeasonIndex = 0
    if m.currentSeasonIndex >= m.seasons.Count()
        m.currentSeasonIndex = m.seasons.Count() - 1
    end if

    episodes = []
    if m.seasons[m.currentSeasonIndex].episodes <> invalid
        episodes = m.seasons[m.currentSeasonIndex].episodes
    end if
    if episodes.Count() = 0 then return invalid

    if m.currentEpisodeIndex < 0 then m.currentEpisodeIndex = 0
    if m.currentEpisodeIndex >= episodes.Count()
        m.currentEpisodeIndex = episodes.Count() - 1
    end if

    return episodes[m.currentEpisodeIndex]
end function

function currentEpisodeIsLast() as Boolean
    episodes = playableEpisodesForSeason(m.currentSeasonIndex)
    if episodes.Count() = 0 then return false
    return m.currentEpisodeIndex >= episodes.Count() - 1
end function

sub updateSelectedMediaVisuals()
    palette = detailUiPalette()
    media = currentMedia()
    renderMovieProgress()
    oldVisibleStart = m.visibleEpisodeStart
    updateVisibleEpisodeWindow()
    if oldVisibleStart <> m.visibleEpisodeStart
        renderEpisodeList()
    end if
    updateEpisodeScrollChevrons()

    for index = 0 to m.seasonTabBgs.Count() - 1
        if m.focusArea = "seasons" and index + m.visibleSeasonStart = m.currentSeasonIndex
            m.seasonTabBgs[index].color = palette.primaryFocus
            m.seasonTabBgs[index].opacity = 1
        else if index + m.visibleSeasonStart = m.currentSeasonIndex
            m.seasonTabBgs[index].color = palette.primary
            m.seasonTabBgs[index].opacity = 1
        else
            m.seasonTabBgs[index].color = palette.surface
            m.seasonTabBgs[index].opacity = 0.84
        end if
    end for

    for index = 0 to m.episodeRows.Count() - 1
        rowIndex = m.episodeRowIndexes[index]
        isFocused = rowIndex = m.currentEpisodeIndex and m.focusArea = "episodes" and m.activeTab = "episodes"
        m.episodeRowShadows[index].visible = isFocused
        m.episodeRowNodes[index].scale = [1.0, 1.0]
        if rowIndex = m.currentEpisodeIndex
            if isFocused then m.episodeRows[index].color = "#31435C" else m.episodeRows[index].color = palette.surfaceRaised
        else
            m.episodeRows[index].color = palette.surface
        end if
        if isFocused then m.episodeRows[index].opacity = 0.96 else m.episodeRows[index].opacity = 0.82
    end for

    if media = invalid
        m.playButtonLabel.text = "Unavailable"
        m.playFocusBg.color = palette.surface
        m.playButtonLabel.color = "#D1D5DB"
        updateBookmarkActionFocus()
        m.episodeCursor.visible = false
        updateDetailExtrasFocusVisuals()
        updateDetailTabFocus()
        return
    end if

    if media.isPlayable
        if episodeWatchStatus(media) <> 1 and media.progressSeconds <> invalid and media.progressSeconds > 0
            m.playButtonLabel.text = "Continue"
        else
            m.playButtonLabel.text = "Play"
        end if
        m.playbackErrorLabel.text = ""
    else
        m.playButtonLabel.text = "Unavailable"
        m.playbackErrorLabel.text = "No playable video is available."
    end if

    if m.focusArea = "play"
        m.playFocusBg.color = detailButtonColor(true, true)
    else
        m.playFocusBg.color = detailButtonColor(false, true)
    end if
    m.playButtonLabel.color = palette.primaryText
    updateDescriptionFocusVisual()
    updateBookmarkActionFocus()
    updateDetailExtrasFocusVisuals()
    updateDetailTabFocus()

    visibleIndex = m.currentEpisodeIndex - m.visibleEpisodeStart
    m.episodeCursor.translation = [0, m.episodeListY + (visibleIndex * 78)]
    m.episodeCursor.visible = m.focusArea = "episodes" and m.activeTab = "episodes" and m.episodeRows.Count() > 0
end sub

sub showNoPlayableMedia()
    m.noMediaLabel.visible = true
    m.playbackErrorLabel.text = "No playable video is available."
    m.episodeCursor.visible = false
    updateEpisodeScrollChevrons()
end sub

sub moveEpisode(delta as Integer)
    if m.seasons.Count() = 0 then return
    if m.currentSeasonIndex < 0 or m.currentSeasonIndex >= m.seasons.Count() then return

    episodes = []
    if m.seasons[m.currentSeasonIndex].episodes <> invalid
        episodes = m.seasons[m.currentSeasonIndex].episodes
    end if
    if episodes.Count() = 0 then return

    nextIndex = m.currentEpisodeIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex >= episodes.Count() then nextIndex = episodes.Count() - 1

    m.currentEpisodeIndex = nextIndex
    m.playbackErrorLabel.text = ""
    updateSelectedMediaVisuals()
end sub

sub moveSeason(delta as Integer)
    if m.seasons.Count() <= 1 then return

    nextIndex = m.currentSeasonIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex >= m.seasons.Count() then nextIndex = m.seasons.Count() - 1
    if nextIndex = m.currentSeasonIndex then return

    m.currentSeasonIndex = nextIndex
    m.currentEpisodeIndex = 0
    m.playbackErrorLabel.text = ""
    renderSeasonTabs()
    renderEpisodeList()
    updateSelectedMediaVisuals()
end sub

sub toggleCurrentEpisodeWatched()
    if m.pendingWatchedToggleKey <> "" then return
    if m.item = invalid or m.item.itemId <= 0 then return

    media = currentMedia()
    if media = invalid
        m.playbackErrorLabel.text = "Unable to update watched status."
        return
    end if

    seasonNumber = 0
    if media.seasonNumber <> invalid then seasonNumber = media.seasonNumber
    videoNumber = episodeVideoNumber(media)
    if videoNumber <= 0
        m.playbackErrorLabel.text = "Unable to update watched status."
        return
    end if

    targetWatched = episodeWatchStatus(media) <> 1
    m.pendingWatchedToggleKey = watchedToggleKey(seasonNumber, videoNumber)
    m.playbackErrorLabel.text = "Updating watched status..."

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "toggleEpisodeWatched"
    task.request = {
        itemId: m.item.itemId
        seasonNumber: seasonNumber
        videoNumber: videoNumber
        watched: targetWatched
    }
    task.observeField("response", "onToggleEpisodeWatchedResponse")
    task.control = "RUN"
    m.toggleWatchedTask = task
end sub

sub resetMovieViewing()
    if isSingleVideoMovie() <> true or m.movieResetPending then return
    media = currentMedia()
    if media = invalid then return

    progressSeconds = 0
    if media.progressSeconds <> invalid then progressSeconds = media.progressSeconds
    watched = episodeWatchStatus(media) = 1
    if watched <> true and progressSeconds <= 0 then return

    videoNumber = episodeVideoNumber(media)
    if videoNumber <= 0
        m.playbackErrorLabel.text = "Unable to reset viewing history."
        return
    end if

    if m.bookmarkOverlayOpen then closeBookmarkOverlay()
    if m.descriptionOverlayGroup.visible then closeDescriptionOverlay()
    m.movieResetPending = true
    m.movieResetItemId = m.item.itemId
    m.movieResetMediaId = media.mediaId
    task = CreateObject("roSGNode", "ContentTask")
    if watched
        m.movieResetMode = "toggle"
        task.command = "toggleEpisodeWatched"
        task.request = { itemId: m.item.itemId, seasonNumber: 0, videoNumber: videoNumber, watched: false }
    else
        m.movieResetMode = "progress"
        task.command = "savePlaybackProgress"
        task.request = { itemId: m.item.itemId, seasonNumber: 0, videoNumber: videoNumber, timeSeconds: 0 }
    end if
    task.observeField("response", "onMovieResetResponse")
    task.control = "RUN"
    m.movieResetTask = task
    renderMovieProgress()
end sub

sub onMovieResetResponse(event as Object)
    if m.movieResetPending <> true then return
    response = event.getData()
    resetMode = m.movieResetMode
    resetItemId = m.movieResetItemId
    resetMediaId = m.movieResetMediaId
    m.movieResetTask = invalid
    m.movieResetPending = false
    m.movieResetMode = ""
    m.movieResetItemId = 0
    m.movieResetMediaId = 0

    if m.item = invalid or m.item.itemId <> resetItemId then return
    media = currentMedia()
    if media = invalid or media.mediaId <> resetMediaId then return

    if response = invalid or response.ok <> true
        if responseRequiresSignIn(response)
            renderMovieProgress()
            requestSignInAgain(response)
            return
        end if
        m.movieResetErrorMessage = "Unable to reset viewing history."
        if response <> invalid and response.message <> invalid and response.message <> "" then m.movieResetErrorMessage = response.message
        loadDetail()
        return
    end if

    media.watched = false
    media.watchStatus = -1
    if resetMode = "toggle"
        progressCleared = false
        if response.DoesExist("progressCleared") then progressCleared = response.progressCleared = true
        if progressCleared <> true
            m.movieResetErrorMessage = "Watch flag cleared; progress reset failed. Press * to retry."
            loadDetail()
            return
        end if
    end if

    media.progressSeconds = 0
    if m.focusArea = "reset" then m.focusArea = "play"
    updateSelectedMediaVisuals()
    m.playbackErrorLabel.text = "Viewing history reset."
end sub

sub onToggleEpisodeWatchedResponse(event as Object)
    response = event.getData()
    m.toggleWatchedTask = invalid
    pendingKey = m.pendingWatchedToggleKey
    m.pendingWatchedToggleKey = ""

    if response = invalid or response.ok <> true
        if responseRequiresSignIn(response)
            requestSignInAgain(response)
            return
        end if
        message = "Unable to update watched status."
        if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
        m.playbackErrorLabel.text = message
        return
    end if

    if watchedToggleKey(response.seasonNumber, response.videoNumber) <> pendingKey then return
    applyEpisodeWatchedState(response.seasonNumber, response.videoNumber, response.watched)
    if response.watched = true
        m.playbackErrorLabel.text = "Marked watched."
    else
        m.playbackErrorLabel.text = "Marked unwatched."
    end if
end sub

sub applyEpisodeWatchedState(seasonNumber as Integer, videoNumber as Integer, watched as Boolean)
    for seasonIndex = 0 to m.seasons.Count() - 1
        season = m.seasons[seasonIndex]
        seasonMatches = true
        if seasonNumber > 0 and season <> invalid and season.number <> invalid and season.number <> seasonNumber then seasonMatches = false

        if season <> invalid and season.episodes <> invalid and seasonMatches
            for episodeIndex = 0 to season.episodes.Count() - 1
                episode = season.episodes[episodeIndex]
                if episode <> invalid and episodeVideoNumber(episode) = videoNumber
                    episode.watched = watched
                    if watched
                        episode.watchStatus = 1
                    else
                        episode.watchStatus = -1
                    end if
                    episode.progressSeconds = 0
                    if seasonIndex = m.currentSeasonIndex then renderEpisodeList()
                    updateSelectedMediaVisuals()
                    return
                end if
            end for
        end if
    end for
end sub

sub startSelectedPlayback()
    media = currentMedia()
    if media = invalid
        m.playbackErrorLabel.text = "No playable video is available."
        return
    end if
    if media.isPlayable <> true
        m.playbackErrorLabel.text = "No playable video is available."
        return
    end if

    streamUrl = ""
    if media.streamUrl <> invalid then streamUrl = media.streamUrl
    if streamUrl = ""
        m.playbackErrorLabel.text = "No playable video is available."
        return
    end if

    startPlaybackPreflight(media)
end sub

function playbackPayloadForMedia(media as Object) as Object
    videoNumber = 1
    if media.videoNumber <> invalid then videoNumber = media.videoNumber else videoNumber = media.episodeNumber

    return {
        itemId: m.item.itemId
        mediaId: media.mediaId
        itemTitle: m.item.title
        title: media.title
        subtitle: media.subtitle
        seasonNumber: media.seasonNumber
        episodeNumber: media.episodeNumber
        videoNumber: videoNumber
        durationSeconds: media.durationSeconds
        progressSeconds: media.progressSeconds
        watchStatus: media.watchStatus
        watched: media.watched
        streamUrl: media.streamUrl
        streamFormat: media.streamFormat
        qualityOptions: media.qualityOptions
        audioTracks: media.audioTracks
        subtitleTracks: media.subtitleTracks
        seasonEpisodes: seasonEpisodesForMedia(media)
    }
end function

function seasonEpisodesForMedia(media as Dynamic) as Object
    episodes = []
    if media = invalid or m.seasons = invalid then return episodes
    if media.seasonNumber = invalid or media.seasonNumber <= 0 then return episodes

    for seasonIndex = 0 to m.seasons.Count() - 1
        season = m.seasons[seasonIndex]
        if season <> invalid and season.number <> invalid and season.number = media.seasonNumber
            if season.episodes = invalid then return episodes
            for each episode in season.episodes
                payload = seasonCarouselEpisodePayload(episode)
                if payload <> invalid then episodes.Push(payload)
            end for
            return episodes
        end if
    end for

    return episodes
end function

function seasonCarouselEpisodePayload(episode as Dynamic) as Dynamic
    if episode = invalid then return invalid

    videoNumber = 1
    if episode.videoNumber <> invalid then videoNumber = episode.videoNumber else videoNumber = episode.episodeNumber

    return {
        itemId: m.item.itemId
        mediaId: episode.mediaId
        itemTitle: m.item.title
        title: episode.title
        subtitle: episode.subtitle
        seasonNumber: episode.seasonNumber
        episodeNumber: episode.episodeNumber
        videoNumber: videoNumber
        durationSeconds: episode.durationSeconds
        progressSeconds: episode.progressSeconds
        watchStatus: episode.watchStatus
        watched: episode.watched
        thumbnailUrl: episode.thumbnailUrl
        isPlayable: episode.isPlayable
        streamUrl: episode.streamUrl
        streamFormat: episode.streamFormat
        qualityOptions: episode.qualityOptions
        audioTracks: episode.audioTracks
        subtitleTracks: episode.subtitleTracks
    }
end function

sub startPlaybackPreflight(media as Object)
    payload = playbackPayloadForMedia(media)
    mediaId = 0
    if media.mediaId <> invalid then mediaId = media.mediaId

    if mediaId <= 0
        m.top.playbackRequested = payload
        return
    end if

    if m.pendingPlaybackMediaId = mediaId
        return
    end if

    m.pendingPlaybackMediaId = mediaId
    m.pendingPlaybackPayload = payload
    m.playbackErrorLabel.text = "Preparing video..."

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "refreshMediaLinks"
    task.request = { media: media }
    task.observeField("response", "onMediaLinksRefreshResponse")
    task.control = "RUN"
    m.mediaLinksTask = task
end sub

sub onMediaLinksRefreshResponse(event as Object)
    response = event.getData()
    fallbackPayload = m.pendingPlaybackPayload
    pendingMediaId = m.pendingPlaybackMediaId
    m.pendingPlaybackMediaId = 0
    m.pendingPlaybackPayload = invalid
    m.mediaLinksTask = invalid

    if pendingMediaId <= 0 then return

    if responseRequiresSignIn(response)
        requestSignInAgain(response)
        return
    end if

    if response <> invalid and response.ok = true and response.media <> invalid
        responseMediaId = 0
        if response.media.mediaId <> invalid then responseMediaId = response.media.mediaId
        if responseMediaId <> pendingMediaId then return
        m.playbackErrorLabel.text = ""
        m.top.playbackRequested = playbackPayloadForMedia(response.media)
        return
    end if

    if fallbackPayload <> invalid and fallbackPayload.streamUrl <> invalid and fallbackPayload.streamUrl <> ""
        m.playbackErrorLabel.text = ""
        m.top.playbackRequested = fallbackPayload
        return
    end if

    message = "No playable video is available."
    if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
    m.playbackErrorLabel.text = message
end sub

sub onNextPlaybackRequested(event as Object)
    request = event.getData()
    reason = nextPlaybackRequestReason(request)
    if reason = "seasonCarousel"
        media = requestedPlayableMedia(request)
    else
        media = nextPlayableMediaAfter(request)
    end if
    if media = invalid
        m.top.nextPlayback = {
            ok: false
            reason: reason
            message: "No next episode is available."
        }
        return
    end if

    prepareNextPlaybackPreflight(media, request)
end sub

function nextPlayableMediaAfter(request as Dynamic) as Dynamic
    if request = invalid or m.seasons = invalid or m.seasons.Count() = 0 then return invalid

    requestMediaId = nextPlaybackIntegerField(request, "mediaId", 0)
    requestSeasonNumber = nextPlaybackIntegerField(request, "seasonNumber", 0)
    requestVideoNumber = nextPlaybackIntegerField(request, "videoNumber", 0)
    requestEpisodeNumber = nextPlaybackIntegerField(request, "episodeNumber", requestVideoNumber)

    foundCurrent = false
    for seasonIndex = 0 to m.seasons.Count() - 1
        season = m.seasons[seasonIndex]
        episodes = []
        if season <> invalid and season.episodes <> invalid then episodes = season.episodes

        for episodeIndex = 0 to episodes.Count() - 1
            episode = episodes[episodeIndex]
            if foundCurrent and episode <> invalid and episode.isPlayable = true then return episode

            if nextPlaybackMatchesMedia(episode, requestMediaId, requestSeasonNumber, requestVideoNumber, requestEpisodeNumber)
                foundCurrent = true
            end if
        end for
    end for

    return invalid
end function

function requestedPlayableMedia(request as Dynamic) as Dynamic
    if request = invalid or m.seasons = invalid or m.seasons.Count() = 0 then return invalid

    requestMediaId = nextPlaybackIntegerField(request, "mediaId", 0)
    requestSeasonNumber = nextPlaybackIntegerField(request, "seasonNumber", 0)
    requestVideoNumber = nextPlaybackIntegerField(request, "videoNumber", 0)
    requestEpisodeNumber = nextPlaybackIntegerField(request, "episodeNumber", requestVideoNumber)

    for seasonIndex = 0 to m.seasons.Count() - 1
        season = m.seasons[seasonIndex]
        episodes = []
        if season <> invalid and season.episodes <> invalid then episodes = season.episodes

        for episodeIndex = 0 to episodes.Count() - 1
            episode = episodes[episodeIndex]
            if episode <> invalid and episode.isPlayable = true and nextPlaybackMatchesMedia(episode, requestMediaId, requestSeasonNumber, requestVideoNumber, requestEpisodeNumber)
                return episode
            end if
        end for
    end for

    return invalid
end function

function nextPlaybackMatchesMedia(media as Dynamic, requestMediaId as Integer, requestSeasonNumber as Integer, requestVideoNumber as Integer, requestEpisodeNumber as Integer) as Boolean
    if media = invalid then return false
    if requestMediaId > 0 and media.mediaId <> invalid and media.mediaId = requestMediaId then return true

    mediaSeasonNumber = 0
    if media.seasonNumber <> invalid then mediaSeasonNumber = media.seasonNumber
    if requestSeasonNumber > 0 and mediaSeasonNumber <> requestSeasonNumber then return false

    mediaVideoNumber = 0
    if media.videoNumber <> invalid then mediaVideoNumber = media.videoNumber
    if requestVideoNumber > 0 and mediaVideoNumber = requestVideoNumber then return true

    mediaEpisodeNumber = 0
    if media.episodeNumber <> invalid then mediaEpisodeNumber = media.episodeNumber
    return requestEpisodeNumber > 0 and mediaEpisodeNumber = requestEpisodeNumber
end function

sub prepareNextPlaybackPreflight(media as Object, request as Dynamic)
    payload = playbackPayloadForMedia(media)
    reason = nextPlaybackRequestReason(request)
    payload.requestReason = reason
    mediaId = 0
    if media.mediaId <> invalid then mediaId = media.mediaId

    if mediaId <= 0
        m.top.nextPlayback = { ok: true, playback: payload, reason: reason }
        return
    end if

    m.pendingNextPlaybackMediaId = mediaId
    m.pendingNextPlaybackPayload = payload

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "refreshMediaLinks"
    task.request = { media: media }
    task.observeField("response", "onNextMediaLinksRefreshResponse")
    task.control = "RUN"
    m.nextMediaLinksTask = task
end sub

sub onNextMediaLinksRefreshResponse(event as Object)
    response = event.getData()
    fallbackPayload = m.pendingNextPlaybackPayload
    reason = nextPlaybackRequestReasonFromPayload(fallbackPayload)
    pendingMediaId = m.pendingNextPlaybackMediaId
    m.pendingNextPlaybackMediaId = 0
    m.pendingNextPlaybackPayload = invalid
    m.nextMediaLinksTask = invalid

    if pendingMediaId <= 0 then return

    if responseRequiresSignIn(response)
        requestSignInAgain(response)
        return
    end if

    if response <> invalid and response.ok = true and response.media <> invalid
        responseMediaId = 0
        if response.media.mediaId <> invalid then responseMediaId = response.media.mediaId
        if responseMediaId = pendingMediaId
            m.top.nextPlayback = { ok: true, playback: playbackPayloadForMedia(response.media), reason: reason }
            return
        end if
        if fallbackPayload <> invalid and fallbackPayload.streamUrl <> invalid and fallbackPayload.streamUrl <> ""
            m.top.nextPlayback = { ok: true, playback: fallbackPayload, reason: reason }
            return
        end if
        message = "No playable next episode is available."
        if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
        m.top.nextPlayback = { ok: false, message: message, reason: reason }
        return
    end if

    if fallbackPayload <> invalid and fallbackPayload.streamUrl <> invalid and fallbackPayload.streamUrl <> ""
        m.top.nextPlayback = { ok: true, playback: fallbackPayload, reason: reason }
        return
    end if

    message = "No playable next episode is available."
    if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
    m.top.nextPlayback = { ok: false, message: message, reason: reason }
end sub

function nextPlaybackRequestReason(request as Dynamic) as String
    if request = invalid or type(request) <> "roAssociativeArray" then return ""
    if request.DoesExist("reason") <> true or request.reason = invalid then return ""
    if type(request.reason) = "String" or type(request.reason) = "roString" then return request.reason
    return ""
end function

function nextPlaybackRequestReasonFromPayload(payload as Dynamic) as String
    if payload = invalid or type(payload) <> "roAssociativeArray" then return ""
    if payload.DoesExist("requestReason") <> true or payload.requestReason = invalid then return ""
    if type(payload.requestReason) = "String" or type(payload.requestReason) = "roString" then return payload.requestReason
    return ""
end function

function nextPlaybackIntegerField(source as Dynamic, key as String, fallback as Integer) as Integer
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return value
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Int(value)
    return fallback
end function

sub cancelPlaybackPreflight()
    if m.mediaLinksTask <> invalid then m.mediaLinksTask.control = "STOP"
    m.mediaLinksTask = invalid
    m.pendingPlaybackMediaId = 0
    m.pendingPlaybackPayload = invalid
    if m.nextMediaLinksTask <> invalid then m.nextMediaLinksTask.control = "STOP"
    m.nextMediaLinksTask = invalid
    m.pendingNextPlaybackMediaId = 0
    m.pendingNextPlaybackPayload = invalid
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press <> true then return false

    if key = "options" and m.detailGroup.visible and isSingleVideoMovie()
        resetMovieViewing()
        return true
    end if

    if m.bookmarkOverlayOpen
        if key = "back"
            closeBookmarkOverlay()
            return true
        else if key = "up"
            moveBookmarkOverlayFolder(-1)
            return true
        else if key = "down"
            moveBookmarkOverlayFolder(1)
            return true
        else if key = "OK"
            toggleSelectedBookmarkFolder()
            return true
        end if
        return true
    end if

    if m.descriptionOverlayGroup.visible
        if key = "back" or key = "OK"
            closeDescriptionOverlay()
            return true
        else if key = "up"
            scrollDescriptionOverlay(-1)
            return true
        else if key = "down"
            scrollDescriptionOverlay(1)
            return true
        end if
        return true
    end if

    if key = "back" and m.detailGroup.visible and m.activeTab = "episodes" and m.focusArea = "episodes" and hasSeriesSeasons()
        m.focusArea = "seasons"
        updateSelectedMediaVisuals()
        return true
    end if

    if key = "back"
        cancelPlaybackPreflight()
        m.top.backRequested = true
        return true
    end if

    if m.errorGroup.visible
        if key = "OK"
            loadDetail()
            return true
        end if
        return false
    end if

    if m.detailGroup.visible <> true then return false

    if m.focusArea = "play"
        if key = "down"
            focusActiveTab()
            return true
        else if key = "right"
            m.focusArea = "bookmark"
            updateSelectedMediaVisuals()
            return true
        else if key = "OK"
            startSelectedPlayback()
            return true
        end if
    else if m.focusArea = "bookmark"
        if key = "down"
            focusActiveTab()
            return true
        else if key = "left"
            if m.playButton.visible
                m.focusArea = "play"
                updateSelectedMediaVisuals()
            end if
            return true
        else if key = "right" and hasPlayableTrailer()
            m.focusArea = "trailer"
            updateSelectedMediaVisuals()
            return true
        else if key = "right" and m.resetActionGroup.visible
            m.focusArea = "reset"
            updateSelectedMediaVisuals()
            return true
        else if key = "OK"
            openBookmarkOverlay()
            return true
        end if
    else if m.focusArea = "trailer"
        if key = "down"
            focusActiveTab()
            return true
        else if key = "left"
            m.focusArea = "bookmark"
            updateSelectedMediaVisuals()
            return true
        else if key = "right" and m.resetActionGroup.visible
            m.focusArea = "reset"
            updateSelectedMediaVisuals()
            return true
        else if key = "OK"
            startTrailerPlayback()
            return true
        end if
    else if m.focusArea = "reset"
        if key = "left"
            if hasPlayableTrailer() then m.focusArea = "trailer" else m.focusArea = "bookmark"
            updateSelectedMediaVisuals()
            return true
        else if key = "down"
            focusActiveTab()
            return true
        else if key = "OK"
            resetMovieViewing()
            return true
        end if
    else if m.focusArea = "tabs"
        if key = "up"
            if m.playButton.visible then m.focusArea = "play" else m.focusArea = "bookmark"
            updateSelectedMediaVisuals()
            updateDetailTabFocus()
            return true
        else if key = "left" or key = "right"
            if key = "left" and m.focusedTabIndex > 0 then m.focusedTabIndex = m.focusedTabIndex - 1
            if key = "right" and m.focusedTabIndex < m.detailTabs.Count() - 1 then m.focusedTabIndex = m.focusedTabIndex + 1
            updateDetailTabFocus()
            return true
        else if key = "down" or key = "OK"
            focusDetailTabContent()
            return true
        end if
    else if m.focusArea = "seasons"
        if key = "up"
            focusActiveTab()
            return true
        else if key = "left"
            moveSeason(-1)
            return true
        else if key = "right"
            moveSeason(1)
            return true
        else if key = "down" or key = "OK"
            m.focusArea = "episodes"
            updateSelectedMediaVisuals()
            return true
        end if
    else if m.focusArea = "episodes"
        if key = "up"
            if m.currentEpisodeIndex = 0
                if hasSeriesSeasons()
                    m.focusArea = "seasons"
                    updateSelectedMediaVisuals()
                else
                    focusActiveTab()
                end if
            else
                moveEpisode(-1)
            end if
            return true
        else if key = "down"
            if playableEpisodesForSeason(m.currentSeasonIndex).Count() = 0 or currentEpisodeIsLast() then return true
            moveEpisode(1)
            return true
        else if key = "OK"
            startSelectedPlayback()
            return true
        else if key = "options"
            toggleCurrentEpisodeWatched()
            return true
        end if
    else if m.focusArea = "similar"
        if key = "up" or key = "down"
            focusActiveTab()
            return true
        else if key = "left"
            moveSimilar(-1)
            return true
        else if key = "right"
            moveSimilar(1)
            return true
        else if key = "OK"
            selectSimilarItem()
            return true
        end if
    else if m.focusArea = "about"
        if key = "up"
            if m.aboutScrollStart = 0
                focusActiveTab()
            else
                scrollAboutTab(-1)
            end if
            return true
        else if key = "down"
            previousScrollStart = m.aboutScrollStart
            scrollAboutTab(1)
            if previousScrollStart = m.aboutScrollStart then focusActiveTab()
            return true
        else if key = "OK"
            openDescriptionOverlay()
            return true
        end if
    end if

    return false
end function
