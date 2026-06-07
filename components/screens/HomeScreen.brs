sub init()
    m.collapsedMenu = m.top.findNode("collapsedMenu")
    m.expandedMenu = m.top.findNode("expandedMenu")
    m.navFocusBg = m.top.findNode("navFocusBg")
    m.signOutFocusBg = m.top.findNode("signOutFocusBg")
    m.watchAgainNav = m.top.findNode("watchAgainNav")
    m.homeNav = m.top.findNode("homeNav")
    m.searchNav = m.top.findNode("searchNav")
    m.bookmarksNav = m.top.findNode("bookmarksNav")
    m.accountNav = m.top.findNode("accountNav")
    m.signOutNav = m.top.findNode("signOutNav")
    m.contentHost = m.top.findNode("contentHost")
    m.watchAgainContent = m.top.findNode("watchAgainContent")
    m.homeContent = m.top.findNode("homeContent")
    m.homeLoadingGroup = m.top.findNode("homeLoadingGroup")
    m.homeEmptyGroup = m.top.findNode("homeEmptyGroup")
    m.homeErrorGroup = m.top.findNode("homeErrorGroup")
    m.homeErrorLabel = m.top.findNode("homeErrorLabel")
    m.homeRetryGroup = m.top.findNode("homeRetryGroup")
    m.homeRailsGroup = m.top.findNode("homeRailsGroup")
    m.homeRailsHost = m.top.findNode("homeRailsHost")
    m.homeCursor = m.top.findNode("homeCursor")
    m.homeScrollUpChevron = m.top.findNode("homeScrollUpChevron")
    m.homeScrollDownChevron = m.top.findNode("homeScrollDownChevron")
    m.homeRailLeftChevron = m.top.findNode("homeRailLeftChevron")
    m.homeRailRightChevron = m.top.findNode("homeRailRightChevron")
    m.searchContent = m.top.findNode("searchContent")
    m.bookmarksContent = m.top.findNode("bookmarksContent")
    m.bookmarksLoadingGroup = m.top.findNode("bookmarksLoadingGroup")
    m.bookmarksEmptyGroup = m.top.findNode("bookmarksEmptyGroup")
    m.bookmarksErrorGroup = m.top.findNode("bookmarksErrorGroup")
    m.bookmarksErrorLabel = m.top.findNode("bookmarksErrorLabel")
    m.bookmarksRetryGroup = m.top.findNode("bookmarksRetryGroup")
    m.bookmarksBodyGroup = m.top.findNode("bookmarksBodyGroup")
    m.bookmarkFoldersHost = m.top.findNode("bookmarkFoldersHost")
    m.bookmarkFolderScrollUpChevron = m.top.findNode("bookmarkFolderScrollUpChevron")
    m.bookmarkFolderScrollDownChevron = m.top.findNode("bookmarkFolderScrollDownChevron")
    m.bookmarkFolderStatusLabel = m.top.findNode("bookmarkFolderStatusLabel")
    m.bookmarkItemsTitleLabel = m.top.findNode("bookmarkItemsTitleLabel")
    m.bookmarkItemsHost = m.top.findNode("bookmarkItemsHost")
    m.bookmarksCursor = m.top.findNode("bookmarksCursor")
    m.bookmarkItemsScrollUpChevron = m.top.findNode("bookmarkItemsScrollUpChevron")
    m.bookmarkItemsScrollDownChevron = m.top.findNode("bookmarkItemsScrollDownChevron")
    m.bookmarksNextPageStatus = m.top.findNode("bookmarksNextPageStatus")
    m.accountContent = m.top.findNode("accountContent")
    m.searchBoxFocusBg = m.top.findNode("searchBoxFocusBg")
    m.searchQueryLabel = m.top.findNode("searchQueryLabel")
    m.searchYearSortFocusBg = m.top.findNode("searchYearSortFocusBg")
    m.searchYearSortCheckLabel = m.top.findNode("searchYearSortCheckLabel")
    m.searchMessageLabel = m.top.findNode("searchMessageLabel")
    m.recentSearchesGroup = m.top.findNode("recentSearchesGroup")
    m.recentSearchesHost = m.top.findNode("recentSearchesHost")
    m.searchKeyboardGroup = m.top.findNode("searchKeyboardGroup")
    m.searchKeyboardHost = m.top.findNode("searchKeyboardHost")
    m.searchKeyboardCursor = m.top.findNode("searchKeyboardCursor")
    m.searchKeyboardCursorBg = m.top.findNode("searchKeyboardCursorBg")
    m.searchLoadingGroup = m.top.findNode("searchLoadingGroup")
    m.searchEmptyGroup = m.top.findNode("searchEmptyGroup")
    m.searchNoResultsGroup = m.top.findNode("searchNoResultsGroup")
    m.searchNoResultsLabel = m.top.findNode("searchNoResultsLabel")
    m.searchErrorGroup = m.top.findNode("searchErrorGroup")
    m.searchErrorLabel = m.top.findNode("searchErrorLabel")
    m.searchResultsGroup = m.top.findNode("searchResultsGroup")
    m.searchResultGridHost = m.top.findNode("searchResultGridHost")
    m.searchResultsCountLabel = m.top.findNode("searchResultsCountLabel")
    m.searchResultCursor = m.top.findNode("searchResultCursor")
    m.searchScrollUpChevron = m.top.findNode("searchScrollUpChevron")
    m.searchScrollDownChevron = m.top.findNode("searchScrollDownChevron")
    m.searchNextPageStatus = m.top.findNode("searchNextPageStatus")
    m.accountLoadingGroup = m.top.findNode("accountLoadingGroup")
    m.accountErrorGroup = m.top.findNode("accountErrorGroup")
    m.accountErrorLabel = m.top.findNode("accountErrorLabel")
    m.accountRetryGroup = m.top.findNode("accountRetryGroup")
    m.accountDetailsGroup = m.top.findNode("accountDetailsGroup")
    m.accountDisplayNameLabel = m.top.findNode("accountDisplayNameLabel")
    m.accountUsernameLabel = m.top.findNode("accountUsernameLabel")
    m.accountSubscriptionStatusLabel = m.top.findNode("accountSubscriptionStatusLabel")
    m.accountSubscriptionDaysLabel = m.top.findNode("accountSubscriptionDaysLabel")
    m.accountSubscriptionEndLabel = m.top.findNode("accountSubscriptionEndLabel")
    m.accountRegisteredLabel = m.top.findNode("accountRegisteredLabel")
    m.historyLoadingGroup = m.top.findNode("historyLoadingGroup")
    m.historyEmptyGroup = m.top.findNode("historyEmptyGroup")
    m.historyErrorGroup = m.top.findNode("historyErrorGroup")
    m.historyErrorLabel = m.top.findNode("historyErrorLabel")
    m.historyRetryGroup = m.top.findNode("historyRetryGroup")
    m.historyGridGroup = m.top.findNode("historyGridGroup")
    m.historyGridHost = m.top.findNode("historyGridHost")
    m.historyCountLabel = m.top.findNode("historyCountLabel")
    m.historyCursor = m.top.findNode("historyCursor")
    m.historyScrollUpChevron = m.top.findNode("historyScrollUpChevron")
    m.historyScrollDownChevron = m.top.findNode("historyScrollDownChevron")
    m.historyNextPageStatus = m.top.findNode("historyNextPageStatus")
    m.collapsedWatchAgain = m.top.findNode("collapsedWatchAgain")
    m.collapsedHome = m.top.findNode("collapsedHome")
    m.collapsedSearch = m.top.findNode("collapsedSearch")
    m.collapsedBookmarks = m.top.findNode("collapsedBookmarks")
    m.collapsedAccount = m.top.findNode("collapsedAccount")
    m.exitDialog = m.top.findNode("exitDialog")
    m.exitYesFocusBg = m.top.findNode("exitYesFocusBg")
    m.exitNoFocusBg = m.top.findNode("exitNoFocusBg")
    m.exitYesLabel = m.top.findNode("exitYesLabel")
    m.exitNoLabel = m.top.findNode("exitNoLabel")

    m.selectedSection = "watchAgain"
    m.menuIndex = 0
    m.menuExpanded = false
    m.exitDialogVisible = false
    m.exitConfirmIndex = 1
    m.focusArea = "content"
    m.historyItems = []
    m.historyCardNodes = []
    m.historyCardBgNodes = []
    m.historyCurrentPage = 0
    m.historyTotalPages = 0
    m.historyTotalItems = 0
    m.historyPerPage = 20
    m.isLoadingHistory = false
    m.isLoadingNextPage = false
    m.historyReachedEnd = false
    m.historyFailedNextPage = false
    m.selectedHistoryIndex = 0
    m.visualSelectedHistoryIndex = -1
    m.historyColumns = 4
    m.historyVisiblePagePair = 0
    m.homeLoaded = false
    m.isLoadingHome = false
    m.homeRails = []
    m.homeRailNodes = []
    m.homeCardNodes = []
    m.homeCardBgNodes = []
    m.homeCardPositions = []
    m.selectedHomeRailIndex = 0
    m.selectedHomeCardIndex = 0
    m.visualSelectedHomeRailIndex = -1
    m.visualSelectedHomeCardIndex = -1
    m.homeVisibleRailStart = 0
    m.homeMaxVisibleRails = 3
    m.homeCardWidth = 220
    m.homeCardSpacing = 244
    m.homeRailHeight = 206
    m.homeVisibleCards = 4
    m.homePerPage = 12
    m.searchQuery = ""
    m.searchSubmittedQuery = ""
    m.searchSortByYear = true
    m.searchRequestSortByYear = true
    m.searchItems = []
    m.searchCardNodes = []
    m.searchCardBgNodes = []
    m.searchCardIndexes = []
    m.searchCurrentPage = 0
    m.searchTotalPages = 0
    m.searchTotalItems = 0
    m.searchPerPage = 20
    m.isLoadingSearch = false
    m.isLoadingSearchNextPage = false
    m.searchReachedEnd = false
    m.searchFailedNextPage = false
    m.selectedSearchIndex = 0
    m.visualSelectedSearchIndex = -1
    m.searchColumns = 4
    m.searchVisiblePagePair = 0
    m.searchFocusArea = "box"
    m.searchKeyboardLayout = "ru"
    m.searchKeyboardIndex = 0
    m.searchKeyboardKeys = []
    m.searchHistoryStore = SearchHistoryStore()
    m.recentSearches = m.searchHistoryStore.load()
    m.recentSearchNodes = []
    m.recentSearchBgNodes = []
    m.selectedRecentSearchIndex = 0
    m.bookmarksLoaded = false
    m.isLoadingBookmarks = false
    m.isLoadingBookmarkItems = false
    m.isLoadingBookmarkNextPage = false
    m.bookmarkReachedEnd = false
    m.bookmarkFailedNextPage = false
    m.bookmarkFolders = []
    m.bookmarkItems = []
    m.bookmarkFolderNodes = []
    m.bookmarkFolderBgNodes = []
    m.bookmarkFolderIndexes = []
    m.bookmarkItemNodes = []
    m.bookmarkItemBgNodes = []
    m.bookmarkItemIndexes = []
    m.selectedBookmarkFolderIndex = 0
    m.selectedBookmarkItemIndex = 0
    m.bookmarkCurrentFolderId = 0
    m.bookmarkCurrentPage = 0
    m.bookmarkTotalPages = 0
    m.bookmarkTotalItems = 0
    m.bookmarkPerPage = 20
    m.bookmarkColumns = 4
    m.bookmarkVisiblePagePair = 0
    m.bookmarkFolderVisibleStart = 0
    m.bookmarkMaxVisibleFolders = 8
    m.bookmarksFocusArea = "folders"
    m.accountLoaded = false
    m.isLoadingAccount = false
    m.accountInfo = invalid
    m.accountErrorMessage = ""

    showSection("watchAgain")
    setMenuExpanded(false)
    loadInitialHistory()
    m.top.setFocus(true)
end sub

sub resetSearchState()
    m.searchQuery = ""
    m.searchSubmittedQuery = ""
    m.searchSortByYear = true
    m.searchRequestSortByYear = true
    m.searchItems = []
    m.searchCardNodes = []
    m.searchCardBgNodes = []
    m.searchCardIndexes = []
    m.searchCurrentPage = 0
    m.searchTotalPages = 0
    m.searchTotalItems = 0
    m.isLoadingSearch = false
    m.isLoadingSearchNextPage = false
    m.searchReachedEnd = false
    m.searchFailedNextPage = false
    m.selectedSearchIndex = 0
    m.visualSelectedSearchIndex = -1
    m.searchVisiblePagePair = 0
    m.searchFocusArea = "box"
    m.searchKeyboardLayout = "ru"
    m.searchKeyboardIndex = 0
    m.selectedRecentSearchIndex = 0
    m.recentSearches = m.searchHistoryStore.load()
    if m.searchTask <> invalid then m.searchTask.control = "STOP"
    m.searchTask = invalid
    m.searchMessageLabel.text = ""
    m.searchNextPageStatus.text = ""
    renderSearchCount()
    clearSearchGrid()
    renderSearchQuery()
    renderSearchYearSort()
    renderRecentSearches()
    showSearchState("empty")
end sub

sub renderSearchQuery()
    if m.searchQuery = ""
        m.searchQueryLabel.text = "Search KinoPub"
        m.searchQueryLabel.color = "#9CA3AF"
    else
        m.searchQueryLabel.text = m.searchQuery
        m.searchQueryLabel.color = "#F5F5F5"
    end if
end sub

sub renderSearchYearSort()
    if m.searchYearSortCheckLabel = invalid then return
    if m.searchSortByYear
        m.searchYearSortCheckLabel.text = "[x]"
    else
        m.searchYearSortCheckLabel.text = "[ ]"
    end if
end sub

sub showSearchState(state as String)
    showRecentSearches = (state = "empty" and m.searchQuery.Trim() = "" and m.recentSearches.Count() > 0)
    m.searchKeyboardGroup.visible = state = "editing"
    m.searchLoadingGroup.visible = state = "loading"
    m.searchEmptyGroup.visible = state = "empty" and showRecentSearches <> true
    m.recentSearchesGroup.visible = showRecentSearches
    m.searchNoResultsGroup.visible = state = "emptyResults"
    m.searchErrorGroup.visible = state = "error"
    m.searchResultsGroup.visible = state = "results"
    updateSearchFocusVisuals()
    updateSearchScrollChevrons()
end sub

sub renderRecentSearches()
    childCount = m.recentSearchesHost.getChildCount()
    if childCount > 0 then m.recentSearchesHost.removeChildrenIndex(childCount, 0)

    m.recentSearchNodes = []
    m.recentSearchBgNodes = []

    if m.selectedRecentSearchIndex >= m.recentSearches.Count() then m.selectedRecentSearchIndex = m.recentSearches.Count() - 1
    if m.selectedRecentSearchIndex < 0 then m.selectedRecentSearchIndex = 0

    for index = 0 to m.recentSearches.Count() - 1
        row = CreateObject("roSGNode", "Group")
        row.translation = [0, index * 52]

        bg = CreateObject("roSGNode", "Rectangle")
        bg.width = 760
        bg.height = 44
        bg.color = "#2A2A2A"
        row.appendChild(bg)

        label = CreateObject("roSGNode", "Label")
        label.text = m.recentSearches[index]
        label.translation = [20, 12]
        label.width = 720
        label.color = "#F5F5F5"
        row.appendChild(label)

        m.recentSearchesHost.appendChild(row)
        m.recentSearchNodes.Push(row)
        m.recentSearchBgNodes.Push(bg)
    end for

    updateRecentSearchFocus()
end sub

sub updateRecentSearchFocus()
    for index = 0 to m.recentSearchBgNodes.Count() - 1
        bg = m.recentSearchBgNodes[index]
        if index = m.selectedRecentSearchIndex and m.searchFocusArea = "recent"
            bg.color = "#3B82F6"
        else
            bg.color = "#2A2A2A"
        end if
    end for
end sub

sub moveRecentSearchFocus(delta as Integer)
    if m.recentSearches.Count() = 0 then return
    nextIndex = m.selectedRecentSearchIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex >= m.recentSearches.Count() then nextIndex = m.recentSearches.Count() - 1
    m.selectedRecentSearchIndex = nextIndex
    updateRecentSearchFocus()
end sub

sub selectRecentSearch()
    if m.recentSearches.Count() = 0 then return
    m.searchQuery = m.recentSearches[m.selectedRecentSearchIndex]
    renderSearchQuery()
    submitSearch()
end sub

sub showAccountState(state as String)
    m.accountLoadingGroup.visible = state = "loading"
    m.accountErrorGroup.visible = state = "error"
    m.accountDetailsGroup.visible = state = "details"
end sub

sub loadAccountInfo(force as Boolean)
    if m.isLoadingAccount = true then return
    if force <> true and m.accountLoaded = true then return

    m.isLoadingAccount = true
    m.accountErrorMessage = ""
    showAccountState("loading")

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "loadUserInfo"
    task.request = {}
    task.observeField("response", "onAccountInfoResponse")
    task.control = "RUN"
    m.accountTask = task
end sub

sub onAccountInfoResponse(event as Object)
    response = event.getData()
    m.isLoadingAccount = false

    if response = invalid or response.ok <> true
        message = "Unable to load account information"
        if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
        m.accountErrorMessage = message
        m.accountErrorLabel.text = message
        showAccountState("error")
        return
    end if

    m.accountInfo = response.user
    m.accountLoaded = true
    renderAccountInfo()
    showAccountState("details")
end sub

sub renderAccountInfo()
    info = m.accountInfo
    if info = invalid then info = {}

    displayName = accountStringField(info, "displayName", "Account")
    username = accountStringField(info, "username", "")
    m.accountDisplayNameLabel.text = displayName

    if username <> ""
        m.accountUsernameLabel.text = "Username: " + username
    else
        m.accountUsernameLabel.text = ""
    end if

    active = accountBooleanField(info, "subscriptionActive", false)
    if active
        m.accountSubscriptionStatusLabel.text = "Active subscription"
        m.accountSubscriptionStatusLabel.color = "#86EFAC"
    else
        m.accountSubscriptionStatusLabel.text = "Inactive subscription"
        m.accountSubscriptionStatusLabel.color = "#FCA5A5"
    end if

    daysLeft = accountNumberField(info, "subscriptionDaysLeft", -1)
    if daysLeft >= 0
        m.accountSubscriptionDaysLabel.text = "Days left: " + accountDaysText(daysLeft)
    else
        m.accountSubscriptionDaysLabel.text = ""
    end if

    endDate = accountStringField(info, "subscriptionEndDate", "")
    if endDate <> ""
        m.accountSubscriptionEndLabel.text = "Ends: " + endDate
    else
        m.accountSubscriptionEndLabel.text = ""
    end if

    registeredDate = accountStringField(info, "registeredDate", "")
    if registeredDate <> ""
        m.accountRegisteredLabel.text = "Registered: " + registeredDate
    else
        m.accountRegisteredLabel.text = ""
    end if
end sub

function accountStringField(source as Dynamic, key as String, fallback as String) as String
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "String" or valueType = "roString" then return value
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return StrI(value).Trim()
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return Str(value).Trim()
    return fallback
end function

function accountNumberField(source as Dynamic, key as String, fallback as Float) as Float
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger" then return value
    if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble" then return value
    return fallback
end function

function accountBooleanField(source as Dynamic, key as String, fallback as Boolean) as Boolean
    if source = invalid or type(source) <> "roAssociativeArray" then return fallback
    if source.DoesExist(key) <> true or source[key] = invalid then return fallback
    value = source[key]
    valueType = type(value)
    if valueType = "Boolean" or valueType = "roBoolean" then return value
    return fallback
end function

function accountDaysText(daysLeft as Float) as String
    if daysLeft = Int(daysLeft) then return StrI(Int(daysLeft)).Trim()
    return Str(daysLeft).Trim()
end function

function listCountText(totalItems as Integer, loadedItems as Integer, hasMore as Boolean) as String
    count = totalItems
    suffix = ""

    if count <= 0
        count = loadedItems
        if hasMore then suffix = "+"
    end if

    if count <= 0 then return ""
    label = " videos"
    if count = 1 then label = " video"
    return StrI(count).Trim() + suffix + label
end function

sub showBookmarksState(state as String)
    m.bookmarksLoadingGroup.visible = state = "loading"
    m.bookmarksEmptyGroup.visible = state = "empty"
    m.bookmarksErrorGroup.visible = state = "error"
    m.bookmarksBodyGroup.visible = state = "body"
    updateBookmarksFocusVisuals()
end sub

sub loadBookmarkFoldersIfNeeded(force as Boolean)
    if m.isLoadingBookmarks then return
    if force <> true and m.bookmarksLoaded then return

    m.isLoadingBookmarks = true
    m.bookmarksFocusArea = "folders"
    showBookmarksState("loading")

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "loadBookmarkFolders"
    task.request = {}
    task.observeField("response", "onBookmarkFoldersResponse")
    task.control = "RUN"
    m.bookmarkFoldersTask = task
end sub

sub onBookmarkFoldersResponse(event as Object)
    response = event.getData()
    m.isLoadingBookmarks = false

    if response = invalid or response.ok <> true
        message = "Unable to load bookmarks"
        if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
        m.bookmarksErrorLabel.text = message
        showBookmarksState("error")
        return
    end if

    m.bookmarkFolders = []
    if response.folders <> invalid then m.bookmarkFolders = response.folders
    m.bookmarksLoaded = true
    m.selectedBookmarkFolderIndex = 0
    m.selectedBookmarkItemIndex = 0
    m.bookmarkFolderVisibleStart = 0
    m.bookmarksFocusArea = "folders"
    renderBookmarkFolders()

    if m.bookmarkFolders.Count() = 0
        m.bookmarkItems = []
        clearBookmarkItemsGrid()
        showBookmarksState("empty")
    else
        showBookmarksState("body")
        loadSelectedBookmarkFolderItems()
    end if
end sub

sub renderBookmarkFolders()
    childCount = m.bookmarkFoldersHost.getChildCount()
    if childCount > 0 then m.bookmarkFoldersHost.removeChildrenIndex(childCount, 0)
    m.bookmarkFolderNodes = []
    m.bookmarkFolderBgNodes = []
    m.bookmarkFolderIndexes = []

    normalizeBookmarkFolderWindow()
    lastIndex = m.bookmarkFolderVisibleStart + m.bookmarkMaxVisibleFolders - 1
    if lastIndex >= m.bookmarkFolders.Count() then lastIndex = m.bookmarkFolders.Count() - 1

    for index = m.bookmarkFolderVisibleStart to lastIndex
        folder = m.bookmarkFolders[index]
        row = CreateObject("roSGNode", "Group")
        row.translation = [0, (index - m.bookmarkFolderVisibleStart) * 52]

        bg = CreateObject("roSGNode", "Rectangle")
        bg.width = 260
        bg.height = 48
        bg.color = "#2A2A2A"
        row.appendChild(bg)

        title = CreateObject("roSGNode", "Label")
        title.text = folder.title
        title.translation = [16, 8]
        title.width = 228
        title.color = "#F5F5F5"
        row.appendChild(title)

        count = CreateObject("roSGNode", "Label")
        count.text = bookmarkFolderCountText(folder)
        count.translation = [16, 30]
        count.width = 228
        count.color = "#9CA3AF"
        row.appendChild(count)

        m.bookmarkFoldersHost.appendChild(row)
        m.bookmarkFolderNodes.Push(row)
        m.bookmarkFolderBgNodes.Push(bg)
        m.bookmarkFolderIndexes.Push(index)
    end for

    updateBookmarkFolderStatus()
    updateBookmarksFocusVisuals()
end sub

sub normalizeBookmarkFolderWindow()
    if m.selectedBookmarkFolderIndex < m.bookmarkFolderVisibleStart
        m.bookmarkFolderVisibleStart = m.selectedBookmarkFolderIndex
    else if m.selectedBookmarkFolderIndex >= m.bookmarkFolderVisibleStart + m.bookmarkMaxVisibleFolders
        m.bookmarkFolderVisibleStart = m.selectedBookmarkFolderIndex - m.bookmarkMaxVisibleFolders + 1
    end if
    maxStart = m.bookmarkFolders.Count() - m.bookmarkMaxVisibleFolders
    if maxStart < 0 then maxStart = 0
    if m.bookmarkFolderVisibleStart > maxStart then m.bookmarkFolderVisibleStart = maxStart
    if m.bookmarkFolderVisibleStart < 0 then m.bookmarkFolderVisibleStart = 0
end sub

function bookmarkFolderCountText(folder as Dynamic) as String
    if folder = invalid or folder.count = invalid then return ""
    count = folder.count
    label = " items"
    if count = 1 then label = " item"
    return StrI(count).Trim() + label
end function

sub updateBookmarkFolderStatus()
    if m.bookmarkFolderStatusLabel = invalid then return
    if m.bookmarkFolders.Count() = 0
        m.bookmarkFolderStatusLabel.text = ""
    else
        m.bookmarkFolderStatusLabel.text = StrI(m.selectedBookmarkFolderIndex + 1).Trim() + " / " + StrI(m.bookmarkFolders.Count()).Trim()
    end if
end sub

sub loadSelectedBookmarkFolderItems()
    if m.bookmarkFolders.Count() = 0 then return
    if m.isLoadingBookmarkItems or m.isLoadingBookmarkNextPage then return

    folder = m.bookmarkFolders[m.selectedBookmarkFolderIndex]
    m.bookmarkCurrentFolderId = folder.folderId
    m.bookmarkItemsTitleLabel.text = folder.title
    requestBookmarkFolderItems(folder.folderId, 1, false)
end sub

sub requestBookmarkFolderItems(folderId as Integer, page as Integer, append as Boolean)
    if m.isLoadingBookmarkItems or m.isLoadingBookmarkNextPage then return

    if append
        m.isLoadingBookmarkNextPage = true
        m.bookmarkFailedNextPage = false
        m.bookmarksNextPageStatus.text = "Loading more..."
    else
        m.isLoadingBookmarkItems = true
        m.bookmarkItems = []
        m.selectedBookmarkItemIndex = 0
        m.bookmarkVisiblePagePair = 0
        m.bookmarkCurrentPage = 0
        m.bookmarkTotalPages = 0
        m.bookmarkTotalItems = 0
        m.bookmarkReachedEnd = false
        m.bookmarkFailedNextPage = false
        m.bookmarksNextPageStatus.text = "Loading..."
    end if
    if append <> true then clearBookmarkItemsGrid()

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "loadBookmarkFolderItems"
    task.request = { folderId: folderId, page: page, perpage: m.bookmarkPerPage }
    task.observeField("response", "onBookmarkFolderItemsResponse")
    task.control = "RUN"
    m.bookmarkItemsTask = task
end sub

sub onBookmarkFolderItemsResponse(event as Object)
    response = event.getData()
    wasNextPage = m.isLoadingBookmarkNextPage
    m.isLoadingBookmarkItems = false
    m.isLoadingBookmarkNextPage = false
    m.bookmarksNextPageStatus.text = ""

    if response <> invalid and response.folderId <> invalid and response.folderId <> m.bookmarkCurrentFolderId
        return
    end if

    if response = invalid or response.ok <> true
        message = "Unable to load bookmark folder."
        if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
        if wasNextPage
            m.bookmarkFailedNextPage = true
            m.bookmarksNextPageStatus.text = "Unable to load more. Press OK to retry."
        else
            m.bookmarksNextPageStatus.text = message
        end if
        updateBookmarksFocusVisuals()
        return
    end if

    appendBookmarkItems(response.items)
    updateBookmarkPagination(response)
    renderBookmarkItems()
    showBookmarksState("body")
end sub

sub appendBookmarkItems(items as Dynamic)
    if items = invalid then return
    for each item in items
        m.bookmarkItems.Push(item)
    end for
    if items.Count() = 0 then m.bookmarkReachedEnd = true
end sub

sub updateBookmarkPagination(response as Object)
    if response.pagination <> invalid
        pagination = response.pagination
        if pagination.current <> invalid then m.bookmarkCurrentPage = pagination.current
        if pagination.total <> invalid then m.bookmarkTotalPages = pagination.total
        if pagination.total_items <> invalid then m.bookmarkTotalItems = pagination.total_items
        if pagination.perpage <> invalid then m.bookmarkPerPage = pagination.perpage
    end if
    if m.bookmarkTotalItems <= 0 then m.bookmarkTotalItems = m.bookmarkItems.Count()
    if m.bookmarkTotalPages > 0 and m.bookmarkCurrentPage >= m.bookmarkTotalPages then m.bookmarkReachedEnd = true

    countText = listCountText(m.bookmarkTotalItems, m.bookmarkItems.Count(), hasMoreBookmarkPages())
    if countText <> "" then m.bookmarksNextPageStatus.text = countText
    m.bookmarkFailedNextPage = false
end sub

sub clearBookmarkItemsGrid()
    childCount = m.bookmarkItemsHost.getChildCount()
    if childCount > 0 then m.bookmarkItemsHost.removeChildrenIndex(childCount, 0)
    m.bookmarkItemNodes = []
    m.bookmarkItemBgNodes = []
    m.bookmarkItemIndexes = []
    m.bookmarksCursor.visible = false
end sub

sub renderBookmarkItems()
    clearBookmarkItemsGrid()
    if m.bookmarkItems.Count() = 0
        m.bookmarksNextPageStatus.text = "This folder is empty."
        updateBookmarkScrollChevrons()
        return
    end if

    m.bookmarkVisiblePagePair = Int(m.selectedBookmarkItemIndex / (m.bookmarkColumns * 2))
    startIndex = m.bookmarkVisiblePagePair * m.bookmarkColumns * 2
    lastIndex = startIndex + (m.bookmarkColumns * 2) - 1
    if lastIndex >= m.bookmarkItems.Count() then lastIndex = m.bookmarkItems.Count() - 1

    for index = startIndex to lastIndex
        cardInfo = createBookmarkCard(m.bookmarkItems[index], index)
        m.bookmarkItemsHost.appendChild(cardInfo.node)
        m.bookmarkItemNodes.Push(cardInfo.node)
        m.bookmarkItemBgNodes.Push(cardInfo.focusBg)
        m.bookmarkItemIndexes.Push(index)
    end for

    updateBookmarksFocusVisuals()
    updateBookmarkScrollChevrons()
end sub

function bookmarkVisibleWindowLastIndex() as Integer
    return ((m.bookmarkVisiblePagePair + 1) * m.bookmarkColumns * 2) - 1
end function

function hasMoreBookmarkPages() as Boolean
    if m.bookmarkReachedEnd then return false
    if m.bookmarkTotalPages > 0 and m.bookmarkCurrentPage >= m.bookmarkTotalPages then return false
    return m.bookmarkItems.Count() > 0
end function

sub updateBookmarkScrollChevrons()
    if m.bookmarkFolderScrollUpChevron <> invalid
        showFolderHints = m.bookmarksBodyGroup.visible and m.bookmarkFolders.Count() > 0
        m.bookmarkFolderScrollUpChevron.visible = showFolderHints and m.bookmarkFolderVisibleStart > 0
        m.bookmarkFolderScrollDownChevron.visible = showFolderHints and (m.bookmarkFolderVisibleStart + m.bookmarkMaxVisibleFolders) < m.bookmarkFolders.Count()
    end if

    if m.bookmarkItemsScrollUpChevron = invalid or m.bookmarkItemsScrollDownChevron = invalid then return
    showItemHints = m.bookmarksBodyGroup.visible and m.bookmarkItems.Count() > 0
    if showItemHints <> true
        m.bookmarkItemsScrollUpChevron.visible = false
        m.bookmarkItemsScrollDownChevron.visible = false
        return
    end if

    m.bookmarkItemsScrollUpChevron.visible = m.bookmarkVisiblePagePair > 0
    hasLoadedItemsBelow = bookmarkVisibleWindowLastIndex() < (m.bookmarkItems.Count() - 1)
    m.bookmarkItemsScrollDownChevron.visible = hasLoadedItemsBelow or hasMoreBookmarkPages()
end sub

function createBookmarkCard(item as Object, index as Integer) as Object
    visibleSlot = index MOD (m.bookmarkColumns * 2)
    column = visibleSlot MOD m.bookmarkColumns
    row = Int(visibleSlot / m.bookmarkColumns)
    x = column * 190
    y = row * 210

    card = CreateObject("roSGNode", "Group")
    card.translation = [x, y]

    focusBg = CreateObject("roSGNode", "Rectangle")
    focusBg.width = 180
    focusBg.height = 168
    focusBg.color = "#2A2A2A"
    card.appendChild(focusBg)

    fallback = CreateObject("roSGNode", "Rectangle")
    fallback.translation = [8, 8]
    fallback.width = 82
    fallback.height = 124
    fallback.color = "#1F2937"
    card.appendChild(fallback)

    poster = CreateObject("roSGNode", "Poster")
    poster.translation = [8, 8]
    poster.width = 82
    poster.height = 124
    poster.uri = item.posterUrl
    poster.loadDisplayMode = "scaleToFit"
    card.appendChild(poster)
    appendTypeBadge(card, item)

    title = CreateObject("roSGNode", "Label")
    title.text = item.title
    title.translation = [102, 16]
    title.width = 70
    title.color = "#F5F5F5"
    card.appendChild(title)

    subtitle = CreateObject("roSGNode", "Label")
    subtitle.text = item.subtitle
    subtitle.translation = [102, 58]
    subtitle.width = 70
    subtitle.color = "#9CA3AF"
    card.appendChild(subtitle)

    return { node: card, focusBg: focusBg }
end function

sub moveBookmarkFolderFocus(delta as Integer)
    if m.bookmarkFolders.Count() = 0 then return
    nextIndex = m.selectedBookmarkFolderIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex >= m.bookmarkFolders.Count() then nextIndex = m.bookmarkFolders.Count() - 1
    if nextIndex = m.selectedBookmarkFolderIndex then return
    m.selectedBookmarkFolderIndex = nextIndex
    m.bookmarksFocusArea = "folders"
    renderBookmarkFolders()
    updateBookmarkFolderStatus()
    updateBookmarksFocusVisuals()
    loadSelectedBookmarkFolderItems()
end sub

sub moveBookmarkItemFocus(delta as Integer)
    if m.bookmarkItems.Count() = 0 then return
    oldPagePair = Int(m.selectedBookmarkItemIndex / (m.bookmarkColumns * 2))
    nextIndex = m.selectedBookmarkItemIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex >= m.bookmarkItems.Count() then nextIndex = m.bookmarkItems.Count() - 1
    if nextIndex = m.selectedBookmarkItemIndex then return
    m.selectedBookmarkItemIndex = nextIndex
    newPagePair = Int(m.selectedBookmarkItemIndex / (m.bookmarkColumns * 2))
    if newPagePair <> oldPagePair
        renderBookmarkItems()
    else
        updateBookmarksFocusVisuals()
    end if
    loadNextBookmarkPageIfNeeded()
end sub

sub updateBookmarksFocusVisuals()
    for index = 0 to m.bookmarkFolderBgNodes.Count() - 1
        bg = m.bookmarkFolderBgNodes[index]
        folderIndex = m.bookmarkFolderIndexes[index]
        if folderIndex = m.selectedBookmarkFolderIndex and m.selectedSection = "bookmarks" and m.focusArea = "content" and m.bookmarksFocusArea = "folders"
            bg.color = "#3B82F6"
        else if folderIndex = m.selectedBookmarkFolderIndex
            bg.color = "#4B5563"
        else
            bg.color = "#2A2A2A"
        end if
    end for

    for nodeIndex = 0 to m.bookmarkItemBgNodes.Count() - 1
        bg = m.bookmarkItemBgNodes[nodeIndex]
        index = m.bookmarkItemIndexes[nodeIndex]
        if index = m.selectedBookmarkItemIndex and m.selectedSection = "bookmarks" and m.focusArea = "content" and m.bookmarksFocusArea = "items"
            bg.color = "#3B82F6"
        else
            bg.color = "#2A2A2A"
        end if
    end for

    updateBookmarksCursor()
    updateBookmarkScrollChevrons()
end sub

sub updateBookmarksCursor()
    if m.bookmarksCursor = invalid then return
    showCursor = m.bookmarksBodyGroup.visible and m.focusArea = "content" and m.selectedSection = "bookmarks" and m.bookmarksFocusArea = "items" and m.bookmarkItems.Count() > 0
    if showCursor <> true
        m.bookmarksCursor.visible = false
        return
    end if

    visibleSlot = m.selectedBookmarkItemIndex MOD (m.bookmarkColumns * 2)
    column = visibleSlot MOD m.bookmarkColumns
    row = Int(visibleSlot / m.bookmarkColumns)
    m.bookmarksCursor.translation = [300 + (column * 190), 96 + (row * 210)]
    m.bookmarksCursor.visible = true
end sub

sub retryBookmarks()
    loadBookmarkFoldersIfNeeded(true)
end sub

sub selectBookmarkItem()
    if m.bookmarkFailedNextPage
        requestBookmarkFolderItems(m.bookmarkCurrentFolderId, m.bookmarkCurrentPage + 1, true)
        return
    end if

    if m.bookmarkItems.Count() = 0 then return
    item = m.bookmarkItems[m.selectedBookmarkItemIndex]
    if item = invalid or item.itemId <= 0 then return
    m.top.videoSelected = item
end sub

sub loadNextBookmarkPageIfNeeded()
    if m.bookmarkReachedEnd then return
    if m.bookmarkFailedNextPage then return
    if m.isLoadingBookmarkItems or m.isLoadingBookmarkNextPage then return
    if m.bookmarkItems.Count() = 0 then return
    thresholdIndex = m.bookmarkItems.Count() - 4
    if thresholdIndex < 0 then thresholdIndex = 0
    if m.selectedBookmarkItemIndex >= thresholdIndex
        requestBookmarkFolderItems(m.bookmarkCurrentFolderId, m.bookmarkCurrentPage + 1, true)
    end if
end sub

sub updateSearchFocusVisuals()
    if m.searchBoxFocusBg <> invalid
        if m.selectedSection = "search" and m.focusArea = "content" and m.searchFocusArea = "box"
            m.searchBoxFocusBg.color = "#3B82F6"
        else
            m.searchBoxFocusBg.color = "#374151"
        end if
    end if
    if m.searchYearSortFocusBg <> invalid
        if m.selectedSection = "search" and m.focusArea = "content" and m.searchFocusArea = "sort"
            m.searchYearSortFocusBg.opacity = 1
            m.searchYearSortFocusBg.color = "#3B82F6"
        else
            m.searchYearSortFocusBg.opacity = 0
            m.searchYearSortFocusBg.color = "#374151"
        end if
    end if
    updateSearchCardFocus()
    updateSearchKeyboardFocus()
    updateRecentSearchFocus()
end sub

sub loadInitialHistory()
    m.historyItems = []
    m.historyCardNodes = []
    m.historyCardBgNodes = []
    m.historyCurrentPage = 0
    m.historyTotalPages = 0
    m.historyTotalItems = 0
    m.historyReachedEnd = false
    m.historyFailedNextPage = false
    m.selectedHistoryIndex = 0
    m.visualSelectedHistoryIndex = -1
    m.historyVisiblePagePair = 0
    clearHistoryGrid()
    renderHistoryCount()
    showHistoryState("loading")
    requestHistoryPage(1, false)
end sub

sub requestHistoryPage(page as Integer, append as Boolean)
    if m.isLoadingHistory = true or m.isLoadingNextPage = true then return

    if append
        m.isLoadingNextPage = true
        m.historyFailedNextPage = false
        m.historyNextPageStatus.text = "Loading more..."
    else
        m.isLoadingHistory = true
    end if

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "loadHistoryPage"
    task.request = { page: page, perpage: 20 }
    task.observeField("response", "onHistoryPageResponse")
    task.control = "RUN"
    m.historyTask = task
end sub

sub onHistoryPageResponse(event as Object)
    response = event.getData()
    wasNextPage = m.isLoadingNextPage
    m.isLoadingHistory = false
    m.isLoadingNextPage = false

    if response = invalid or response.ok <> true
        handleHistoryError(response, wasNextPage)
        return
    end if

    appendHistoryItems(response.items)
    updateHistoryPagination(response)
    renderHistoryGrid()

    if m.historyItems.Count() = 0
        showHistoryState("empty")
    else
        showHistoryState("grid")
    end if
end sub

sub handleHistoryError(response as Dynamic, wasNextPage as Boolean)
    message = "Unable to load Watch Again"
    if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message

    if wasNextPage
        m.historyFailedNextPage = true
        m.historyNextPageStatus.text = "Unable to load more. Press OK to retry."
        updateHistoryCardFocus()
    else
        m.historyErrorLabel.text = message
        showHistoryState("error")
    end if
end sub

sub appendHistoryItems(items as Dynamic)
    if items = invalid then return
    for each item in items
        m.historyItems.Push(item)
    end for
    if items.Count() = 0 then m.historyReachedEnd = true
end sub

sub updateHistoryPagination(response as Object)
    if response.pagination <> invalid
        pagination = response.pagination
        if pagination.current <> invalid then m.historyCurrentPage = pagination.current
        if pagination.total <> invalid then m.historyTotalPages = pagination.total
        if pagination.total_items <> invalid then m.historyTotalItems = pagination.total_items
        if pagination.perpage <> invalid then m.historyPerPage = pagination.perpage
    end if

    if m.historyTotalPages > 0 and m.historyCurrentPage >= m.historyTotalPages then m.historyReachedEnd = true
    if m.historyReachedEnd
        m.historyNextPageStatus.text = ""
    else
        m.historyNextPageStatus.text = ""
    end if
    m.historyFailedNextPage = false
    renderHistoryCount()
end sub

sub renderHistoryCount()
    if m.historyCountLabel = invalid then return
    m.historyCountLabel.text = listCountText(m.historyTotalItems, m.historyItems.Count(), hasMoreHistoryPages())
end sub

sub showHistoryState(state as String)
    m.historyLoadingGroup.visible = state = "loading"
    m.historyEmptyGroup.visible = state = "empty"
    m.historyErrorGroup.visible = state = "error"
    m.historyGridGroup.visible = state = "grid"
    updateHistoryCursor()
    updateHistoryScrollChevrons()
end sub

sub clearHistoryGrid()
    childCount = m.historyGridHost.getChildCount()
    if childCount > 0 then m.historyGridHost.removeChildrenIndex(childCount, 0)
    m.historyCardNodes = []
    m.historyCardBgNodes = []
    m.historyCardIndexes = []
end sub

sub renderHistoryGrid()
    clearHistoryGrid()
    if m.historyItems.Count() = 0 then return

    m.historyVisiblePagePair = Int(m.selectedHistoryIndex / (m.historyColumns * 2))
    startIndex = m.historyVisiblePagePair * m.historyColumns * 2
    lastIndex = startIndex + (m.historyColumns * 2) - 1
    if lastIndex >= m.historyItems.Count() then lastIndex = m.historyItems.Count() - 1

    for index = startIndex to lastIndex
        cardInfo = createHistoryCard(m.historyItems[index], index)
        card = cardInfo.node
        m.historyGridHost.appendChild(card)
        m.historyCardNodes.Push(card)
        m.historyCardBgNodes.Push(cardInfo.focusBg)
        m.historyCardIndexes.Push(index)
    end for
    m.historyGridHost.translation = [0, 82]
    updateHistoryCardFocus()
    updateHistoryScrollChevrons()
end sub

function createHistoryCard(item as Object, index as Integer) as Object
    visibleSlot = index MOD (m.historyColumns * 2)
    column = visibleSlot MOD m.historyColumns
    row = Int(visibleSlot / m.historyColumns)
    x = column * 232
    y = row * 210

    card = CreateObject("roSGNode", "Group")
    card.translation = [x, y]

    focusBg = CreateObject("roSGNode", "Rectangle")
    focusBg.width = 220
    focusBg.height = 168
    focusBg.color = "#2A2A2A"
    card.appendChild(focusBg)

    fallback = CreateObject("roSGNode", "Rectangle")
    fallback.translation = [8, 8]
    fallback.width = 82
    fallback.height = 124
    fallback.color = "#1F2937"
    fallback.visible = true
    card.appendChild(fallback)

    poster = CreateObject("roSGNode", "Poster")
    poster.translation = [8, 8]
    poster.width = 82
    poster.height = 124
    poster.uri = item.posterUrl
    poster.loadDisplayMode = "scaleToFit"
    card.appendChild(poster)
    appendTypeBadge(card, item)

    title = CreateObject("roSGNode", "Label")
    title.text = item.title
    title.translation = [102, 16]
    title.width = 110
    title.color = "#F5F5F5"
    card.appendChild(title)

    subtitle = CreateObject("roSGNode", "Label")
    subtitle.text = item.subtitle
    subtitle.translation = [102, 58]
    subtitle.width = 110
    subtitle.color = "#9CA3AF"
    card.appendChild(subtitle)

    progressBg = CreateObject("roSGNode", "Rectangle")
    progressBg.translation = [102, 132]
    progressBg.width = 110
    progressBg.height = 5
    progressBg.color = "#374151"
    progressBg.visible = item.durationSeconds > 0 and item.progressSeconds > 0
    card.appendChild(progressBg)

    progressFill = CreateObject("roSGNode", "Rectangle")
    progressFill.translation = [102, 132]
    progressFill.width = historyProgressWidth(item)
    progressFill.height = 5
    progressFill.color = "#EF4444"
    progressFill.visible = progressBg.visible
    card.appendChild(progressFill)

    return { node: card, focusBg: focusBg }
end function

function historyProgressWidth(item as Object) as Integer
    if item.durationSeconds <= 0 or item.progressSeconds <= 0 then return 0
    width = Int((item.progressSeconds * 110) / item.durationSeconds)
    if width < 1 then width = 1
    if width > 110 then width = 110
    return width
end function

sub appendTypeBadge(card as Object, item as Object)
    badgeText = itemTypeBadgeText(item)
    if badgeText = "" then return

    badgeWidth = 82

    badgeBg = CreateObject("roSGNode", "Rectangle")
    badgeBg.translation = [8, 8]
    badgeBg.width = badgeWidth
    badgeBg.height = 22
    badgeBg.color = "#111827"
    badgeBg.opacity = 0.88
    card.appendChild(badgeBg)

    badgeBorderTop = CreateObject("roSGNode", "Rectangle")
    badgeBorderTop.translation = [8, 8]
    badgeBorderTop.width = badgeWidth
    badgeBorderTop.height = 1
    badgeBorderTop.color = "#D1D5DB"
    card.appendChild(badgeBorderTop)

    badgeBorderBottom = CreateObject("roSGNode", "Rectangle")
    badgeBorderBottom.translation = [8, 29]
    badgeBorderBottom.width = badgeWidth
    badgeBorderBottom.height = 1
    badgeBorderBottom.color = "#D1D5DB"
    card.appendChild(badgeBorderBottom)

    badgeBorderLeft = CreateObject("roSGNode", "Rectangle")
    badgeBorderLeft.translation = [8, 8]
    badgeBorderLeft.width = 1
    badgeBorderLeft.height = 22
    badgeBorderLeft.color = "#D1D5DB"
    card.appendChild(badgeBorderLeft)

    badgeBorderRight = CreateObject("roSGNode", "Rectangle")
    badgeBorderRight.translation = [7 + badgeWidth, 8]
    badgeBorderRight.width = 1
    badgeBorderRight.height = 22
    badgeBorderRight.color = "#D1D5DB"
    card.appendChild(badgeBorderRight)

    label = CreateObject("roSGNode", "Label")
    label.text = badgeText
    label.translation = [8, 11]
    label.width = badgeWidth
    label.height = 16
    label.horizAlign = "center"
    label.color = "#F5F5F5"
    card.appendChild(label)
end sub

function itemTypeBadgeText(item as Dynamic) as String
    if item = invalid or type(item) <> "roAssociativeArray" then return ""
    if item.DoesExist("typeBadge") <> true or item.typeBadge = invalid then return ""
    badge = item.typeBadge
    if type(badge) <> "String" and type(badge) <> "roString" then return ""
    badge = badge.Trim()
    badge = UCase(badge)
    if Len(badge) > 3 then badge = Left(badge, 3)
    return badge
end function

sub updateHistoryCardFocus()
    nodeIndex = 0
    for nodeIndex = 0 to m.historyCardNodes.Count() - 1
        focusBg = m.historyCardBgNodes[nodeIndex]
        index = m.historyCardIndexes[nodeIndex]
        if index = m.selectedHistoryIndex
            focusBg.color = "#3B82F6"
        else if index = m.visualSelectedHistoryIndex
            focusBg.color = "#4B5563"
        else
            focusBg.color = "#2A2A2A"
        end if
    end for
    updateHistoryCursor()
    updateHistoryScrollChevrons()
end sub

sub updateHistoryCursor()
    if m.historyCursor = invalid then return

    showCursor = m.historyGridGroup.visible and m.focusArea = "content" and m.selectedSection = "watchAgain" and m.historyItems.Count() > 0
    if showCursor <> true
        m.historyCursor.visible = false
        return
    end if

    visibleSlot = m.selectedHistoryIndex MOD (m.historyColumns * 2)
    column = visibleSlot MOD m.historyColumns
    row = Int(visibleSlot / m.historyColumns)
    m.historyCursor.translation = [column * 232, 82 + (row * 210)]
    m.historyCursor.visible = true
end sub

function historyVisibleWindowLastIndex() as Integer
    return ((m.historyVisiblePagePair + 1) * m.historyColumns * 2) - 1
end function

function hasMoreHistoryPages() as Boolean
    if m.historyReachedEnd then return false
    if m.historyTotalPages > 0 and m.historyCurrentPage >= m.historyTotalPages then return false
    return m.historyItems.Count() > 0
end function

sub updateHistoryScrollChevrons()
    if m.historyScrollUpChevron = invalid or m.historyScrollDownChevron = invalid then return

    showGridHints = m.historyGridGroup.visible and m.historyItems.Count() > 0
    if showGridHints <> true
        m.historyScrollUpChevron.visible = false
        m.historyScrollDownChevron.visible = false
        return
    end if

    m.historyScrollUpChevron.visible = m.historyVisiblePagePair > 0
    hasLoadedItemsBelow = historyVisibleWindowLastIndex() < (m.historyItems.Count() - 1)
    m.historyScrollDownChevron.visible = hasLoadedItemsBelow or hasMoreHistoryPages()
end sub

sub moveHistoryFocus(delta as Integer)
    if m.historyItems.Count() = 0 then return
    oldPagePair = Int(m.selectedHistoryIndex / (m.historyColumns * 2))
    nextIndex = m.selectedHistoryIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex >= m.historyItems.Count() then nextIndex = m.historyItems.Count() - 1
    m.selectedHistoryIndex = nextIndex
    newPagePair = Int(m.selectedHistoryIndex / (m.historyColumns * 2))
    if newPagePair <> oldPagePair
        renderHistoryGrid()
    else
        updateHistoryCardFocus()
    end if
    loadNextHistoryPageIfNeeded()
end sub

sub selectHistoryCard()
    if m.historyFailedNextPage
        requestHistoryPage(m.historyCurrentPage + 1, true)
        return
    end if

    if m.historyItems.Count() = 0 then return
    selectedItem = m.historyItems[m.selectedHistoryIndex]
    m.visualSelectedHistoryIndex = m.selectedHistoryIndex
    updateHistoryCardFocus()
    if selectedItem.itemId <= 0
        m.historyNextPageStatus.text = "Unable to open this video."
        return
    end if
    m.top.videoSelected = {
        itemId: selectedItem.itemId
        mediaId: selectedItem.mediaId
        watchCount: selectedItem.watchCount
        firstSeenSeconds: selectedItem.firstSeenSeconds
        lastSeenSeconds: selectedItem.lastSeenSeconds
        source: "watchAgain"
    }
end sub

sub retryInitialHistory()
    loadInitialHistory()
end sub

sub loadNextHistoryPageIfNeeded()
    ' Trigger when focus reaches the final four loaded cards.
    if m.historyReachedEnd then return
    if m.historyFailedNextPage then return
    if m.isLoadingHistory or m.isLoadingNextPage then return
    if m.historyItems.Count() = 0 then return
    thresholdIndex = m.historyItems.Count() - 4
    if thresholdIndex < 0 then thresholdIndex = 0
    if m.selectedHistoryIndex >= thresholdIndex
        requestHistoryPage(m.historyCurrentPage + 1, true)
    end if
end sub

sub updateHistoryGridOffset()
    renderHistoryGrid()
end sub

sub showHomeState(state as String)
    m.homeLoadingGroup.visible = state = "loading"
    m.homeEmptyGroup.visible = state = "empty"
    m.homeErrorGroup.visible = state = "error"
    m.homeRailsGroup.visible = state = "rails"
    updateHomeCursor()
    updateHomeChevrons()
end sub

sub loadHomeIfNeeded(force as Boolean)
    if m.isLoadingHome = true then return
    if force <> true and m.homeLoaded = true then return

    m.isLoadingHome = true
    m.homeErrorLabel.text = "Unable to load Home"
    showHomeState("loading")

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "loadHome"
    task.request = { perpage: m.homePerPage }
    task.observeField("response", "onHomeResponse")
    task.control = "RUN"
    m.homeTask = task
end sub

sub onHomeResponse(event as Object)
    response = event.getData()
    m.isLoadingHome = false

    if response = invalid or response.ok <> true
        m.homeLoaded = false
        message = "Unable to load Home."
        if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
        m.homeErrorLabel.text = message
        clearHomeRails()
        showHomeState("error")
        return
    end if

    m.homeLoaded = true
    m.homeRails = []
    if response.rails <> invalid then m.homeRails = response.rails
    m.selectedHomeRailIndex = 0
    m.selectedHomeCardIndex = 0
    m.visualSelectedHomeRailIndex = -1
    m.visualSelectedHomeCardIndex = -1
    m.homeVisibleRailStart = 0

    if m.homeRails.Count() = 0
        clearHomeRails()
        showHomeState("empty")
    else
        renderHomeRails()
        showHomeState("rails")
    end if
end sub

sub retryHome()
    loadHomeIfNeeded(true)
end sub

sub clearHomeRails()
    childCount = m.homeRailsHost.getChildCount()
    if childCount > 0 then m.homeRailsHost.removeChildrenIndex(childCount, 0)
    m.homeRailNodes = []
    m.homeCardNodes = []
    m.homeCardBgNodes = []
    m.homeCardPositions = []
end sub

sub renderHomeRails()
    clearHomeRails()
    if m.homeRails.Count() = 0 then return

    normalizeHomeVisibleWindow()
    lastRail = m.homeVisibleRailStart + m.homeMaxVisibleRails - 1
    if lastRail >= m.homeRails.Count() then lastRail = m.homeRails.Count() - 1

    for railIndex = m.homeVisibleRailStart to lastRail
        rail = m.homeRails[railIndex]
        visibleRailSlot = railIndex - m.homeVisibleRailStart
        railNode = createHomeRail(rail, railIndex, visibleRailSlot)
        m.homeRailsHost.appendChild(railNode)
        m.homeRailNodes.Push(railNode)
    end for

    updateHomeCardFocus()
    updateHomeChevrons()
end sub

sub normalizeHomeVisibleWindow()
    if m.selectedHomeRailIndex < m.homeVisibleRailStart
        m.homeVisibleRailStart = m.selectedHomeRailIndex
    end if

    if m.selectedHomeRailIndex >= m.homeVisibleRailStart + m.homeMaxVisibleRails
        m.homeVisibleRailStart = m.selectedHomeRailIndex - m.homeMaxVisibleRails + 1
    end if

    if m.homeVisibleRailStart < 0 then m.homeVisibleRailStart = 0
    maxStart = m.homeRails.Count() - m.homeMaxVisibleRails
    if maxStart < 0 then maxStart = 0
    if m.homeVisibleRailStart > maxStart then m.homeVisibleRailStart = maxStart
end sub

function createHomeRail(rail as Object, railIndex as Integer, visibleRailSlot as Integer) as Object
    railGroup = CreateObject("roSGNode", "Group")
    railGroup.translation = [0, visibleRailSlot * m.homeRailHeight]

    title = CreateObject("roSGNode", "Label")
    title.text = rail.title
    title.translation = [0, 0]
    title.width = 900
    title.color = "#D1D5DB"
    railGroup.appendChild(title)

    startCard = homeRailWindowStart(railIndex)
    endCard = startCard + m.homeVisibleCards
    if endCard >= rail.items.Count() then endCard = rail.items.Count() - 1

    for cardIndex = startCard to endCard
        cardInfo = createHomeCard(rail.items[cardIndex], cardIndex - startCard)
        railGroup.appendChild(cardInfo.node)
        m.homeCardNodes.Push(cardInfo.node)
        m.homeCardBgNodes.Push(cardInfo.focusBg)
        m.homeCardPositions.Push({ railIndex: railIndex, cardIndex: cardIndex })
    end for

    return railGroup
end function

function homeRailWindowStart(railIndex as Integer) as Integer
    selectedIndex = 0
    if railIndex = m.selectedHomeRailIndex then selectedIndex = m.selectedHomeCardIndex

    startIndex = selectedIndex - (m.homeVisibleCards - 1)
    if startIndex < 0 then startIndex = 0

    rail = m.homeRails[railIndex]
    maxStart = rail.items.Count() - (m.homeVisibleCards + 1)
    if maxStart < 0 then maxStart = 0
    if startIndex > maxStart then startIndex = maxStart
    return startIndex
end function

function createHomeCard(item as Object, visibleCardSlot as Integer) as Object
    card = CreateObject("roSGNode", "Group")
    card.translation = [visibleCardSlot * m.homeCardSpacing, 38]

    focusBg = CreateObject("roSGNode", "Rectangle")
    focusBg.width = 220
    focusBg.height = 168
    focusBg.color = "#2A2A2A"
    card.appendChild(focusBg)

    fallback = CreateObject("roSGNode", "Rectangle")
    fallback.translation = [8, 8]
    fallback.width = 82
    fallback.height = 124
    fallback.color = "#1F2937"
    fallback.visible = true
    card.appendChild(fallback)

    poster = CreateObject("roSGNode", "Poster")
    poster.translation = [8, 8]
    poster.width = 82
    poster.height = 124
    poster.uri = item.posterUrl
    poster.loadDisplayMode = "scaleToFit"
    card.appendChild(poster)
    appendTypeBadge(card, item)

    title = CreateObject("roSGNode", "Label")
    title.text = item.title
    title.translation = [102, 16]
    title.width = 110
    title.color = "#F5F5F5"
    card.appendChild(title)

    subtitle = CreateObject("roSGNode", "Label")
    subtitle.text = item.subtitle
    if subtitle.text = "" and item.metadata <> invalid then subtitle.text = item.metadata
    subtitle.translation = [102, 58]
    subtitle.width = 110
    subtitle.color = "#9CA3AF"
    card.appendChild(subtitle)

    return { node: card, focusBg: focusBg }
end function

sub updateHomeCardFocus()
    nodeIndex = 0
    for nodeIndex = 0 to m.homeCardNodes.Count() - 1
        focusBg = m.homeCardBgNodes[nodeIndex]
        position = m.homeCardPositions[nodeIndex]
        if position.railIndex = m.selectedHomeRailIndex and position.cardIndex = m.selectedHomeCardIndex
            focusBg.color = "#3B82F6"
        else if position.railIndex = m.visualSelectedHomeRailIndex and position.cardIndex = m.visualSelectedHomeCardIndex
            focusBg.color = "#4B5563"
        else
            focusBg.color = "#2A2A2A"
        end if
    end for
    updateHomeCursor()
    updateHomeChevrons()
end sub

sub updateHomeCursor()
    showCursor = m.homeRailsGroup.visible and m.focusArea = "content" and m.selectedSection = "home" and m.homeRails.Count() > 0
    if showCursor <> true
        m.homeCursor.visible = false
        return
    end if

    railSlot = m.selectedHomeRailIndex - m.homeVisibleRailStart
    cardSlot = m.selectedHomeCardIndex - homeRailWindowStart(m.selectedHomeRailIndex)
    m.homeCursor.translation = [cardSlot * m.homeCardSpacing, 96 + (railSlot * m.homeRailHeight)]
    m.homeCursor.visible = true
end sub

sub updateHomeChevrons()
    if m.homeScrollUpChevron = invalid then return

    showHints = m.homeRailsGroup.visible and m.homeRails.Count() > 0
    if showHints <> true
        m.homeScrollUpChevron.visible = false
        m.homeScrollDownChevron.visible = false
        m.homeRailLeftChevron.visible = false
        m.homeRailRightChevron.visible = false
        return
    end if

    m.homeScrollUpChevron.visible = m.homeVisibleRailStart > 0
    m.homeScrollDownChevron.visible = (m.homeVisibleRailStart + m.homeMaxVisibleRails) < m.homeRails.Count()

    focusedRail = m.homeRails[m.selectedHomeRailIndex]
    railSlot = m.selectedHomeRailIndex - m.homeVisibleRailStart
    chevronY = 96 + (railSlot * m.homeRailHeight) + 62
    m.homeRailLeftChevron.translation = [0, chevronY]
    m.homeRailRightChevron.translation = [1092, chevronY]
    m.homeRailLeftChevron.visible = m.selectedHomeCardIndex > 0
    m.homeRailRightChevron.visible = m.selectedHomeCardIndex < (focusedRail.items.Count() - 1)
end sub

sub moveHomeHorizontal(delta as Integer)
    if m.homeRails.Count() = 0 then return
    rail = m.homeRails[m.selectedHomeRailIndex]
    if rail.items.Count() = 0 then return

    nextIndex = m.selectedHomeCardIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex >= rail.items.Count() then nextIndex = rail.items.Count() - 1

    oldWindowStart = homeRailWindowStart(m.selectedHomeRailIndex)
    m.selectedHomeCardIndex = nextIndex
    newWindowStart = homeRailWindowStart(m.selectedHomeRailIndex)

    if newWindowStart <> oldWindowStart
        renderHomeRails()
    else
        updateHomeCardFocus()
    end if
end sub

sub moveHomeVertical(delta as Integer)
    if m.homeRails.Count() = 0 then return

    nextRailIndex = m.selectedHomeRailIndex + delta
    if nextRailIndex < 0 then nextRailIndex = 0
    if nextRailIndex >= m.homeRails.Count() then nextRailIndex = m.homeRails.Count() - 1

    if nextRailIndex = m.selectedHomeRailIndex
        updateHomeCardFocus()
        return
    end if

    m.selectedHomeRailIndex = nextRailIndex
    rail = m.homeRails[m.selectedHomeRailIndex]
    if m.selectedHomeCardIndex >= rail.items.Count() then m.selectedHomeCardIndex = rail.items.Count() - 1
    if m.selectedHomeCardIndex < 0 then m.selectedHomeCardIndex = 0

    renderHomeRails()
end sub

sub selectHomeCard()
    if m.homeRails.Count() = 0 then return
    rail = m.homeRails[m.selectedHomeRailIndex]
    if rail.items.Count() = 0 then return

    selectedItem = rail.items[m.selectedHomeCardIndex]
    m.visualSelectedHomeRailIndex = m.selectedHomeRailIndex
    m.visualSelectedHomeCardIndex = m.selectedHomeCardIndex
    updateHomeCardFocus()

    if selectedItem.itemId <= 0
        m.homeErrorLabel.text = "Unable to open this video."
        return
    end if

    m.top.videoSelected = {
        itemId: selectedItem.itemId
        mediaId: 0
        source: "home"
    }
end sub

function searchKeyboardRows() as Object
    if m.searchKeyboardLayout = "en"
        return [
            ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
            ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
            ["z", "x", "c", "v", "b", "n", "m"],
            ["RU", "Space", "Backspace", "Clear", "Search"]
        ]
    end if

    return [
        ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з"],
        ["ф", "ы", "в", "а", "п", "р", "о", "л", "д"],
        ["я", "ч", "с", "м", "и", "т", "ь", "б", "ю"],
        ["EN", "Space", "Backspace", "Clear", "Search"]
    ]
end function

function searchKeyboardActionForLabel(label as String) as Object
    if label = "RU" then return { type: "layout", value: "ru", label: "RU" }
    if label = "EN" then return { type: "layout", value: "en", label: "EN" }
    if label = "Space" then return { type: "space", value: " ", label: "Space" }
    if label = "Backspace" then return { type: "backspace", value: "", label: "Backspace" }
    if label = "Clear" then return { type: "clear", value: "", label: "Clear" }
    if label = "Search" then return { type: "search", value: "", label: "Search" }
    return { type: "char", value: label, label: label }
end function

sub renderSearchKeyboard()
    childCount = m.searchKeyboardHost.getChildCount()
    if childCount > 0 then m.searchKeyboardHost.removeChildrenIndex(childCount, 0)

    m.searchKeyboardKeys = []
    rows = searchKeyboardRows()

    for rowIndex = 0 to rows.Count() - 1
        row = rows[rowIndex]
        rowOffset = 0
        if rowIndex = 1 then rowOffset = 28
        if rowIndex = 2 then rowOffset = 56

        for columnIndex = 0 to row.Count() - 1
            labelText = row[columnIndex]
            key = searchKeyboardActionForLabel(labelText)
            keyWidth = 56
            if key.type = "space" then keyWidth = 176
            if key.type = "backspace" then keyWidth = 132
            if key.type = "clear" then keyWidth = 96
            if key.type = "search" then keyWidth = 118

            x = rowOffset + (columnIndex * 64)
            if rowIndex = 3
                x = columnIndex * 142
                if columnIndex = 1 then x = 74
                if columnIndex = 2 then x = 260
                if columnIndex = 3 then x = 402
                if columnIndex = 4 then x = 508
            end if
            y = rowIndex * 52

            group = CreateObject("roSGNode", "Group")
            group.translation = [x, y]

            bg = CreateObject("roSGNode", "Rectangle")
            bg.width = keyWidth
            bg.height = 42
            bg.color = "#2A2A2A"
            group.appendChild(bg)

            label = CreateObject("roSGNode", "Label")
            label.text = key.label
            label.translation = [0, 10]
            label.width = keyWidth
            label.horizAlign = "center"
            label.color = "#F5F5F5"
            group.appendChild(label)

            m.searchKeyboardHost.appendChild(group)
            key.x = x
            key.y = y
            key.width = keyWidth
            key.bg = bg
            m.searchKeyboardKeys.Push(key)
        end for
    end for

    if m.searchKeyboardIndex >= m.searchKeyboardKeys.Count() then m.searchKeyboardIndex = m.searchKeyboardKeys.Count() - 1
    if m.searchKeyboardIndex < 0 then m.searchKeyboardIndex = 0
    updateSearchKeyboardFocus()
end sub

sub updateSearchKeyboardFocus()
    for index = 0 to m.searchKeyboardKeys.Count() - 1
        key = m.searchKeyboardKeys[index]
        if key.bg <> invalid
            if index = m.searchKeyboardIndex
                key.bg.color = "#3B82F6"
            else
                key.bg.color = "#2A2A2A"
            end if
        end if
    end for

    if m.searchKeyboardKeys.Count() = 0
        m.searchKeyboardCursor.visible = false
        return
    end if

    selectedKey = m.searchKeyboardKeys[m.searchKeyboardIndex]
    m.searchKeyboardCursor.translation = [selectedKey.x, selectedKey.y]
    if m.searchKeyboardCursorBg <> invalid then m.searchKeyboardCursorBg.width = selectedKey.width
    m.searchKeyboardCursor.visible = m.searchKeyboardGroup.visible
end sub

sub activateSearchKeyboardKey()
    if m.searchKeyboardKeys.Count() = 0 then return
    key = m.searchKeyboardKeys[m.searchKeyboardIndex]

    if key.type = "char"
        m.searchQuery = m.searchQuery + key.value
    else if key.type = "space"
        m.searchQuery = m.searchQuery + " "
    else if key.type = "backspace"
        if Len(m.searchQuery) > 0 then m.searchQuery = Left(m.searchQuery, Len(m.searchQuery) - 1)
    else if key.type = "clear"
        m.searchQuery = ""
    else if key.type = "layout"
        m.searchKeyboardLayout = key.value
        m.searchKeyboardIndex = 0
        renderSearchKeyboard()
    else if key.type = "search"
        submitSearch()
    end if

    renderSearchQuery()
end sub

sub openSearchKeyboard()
    m.searchFocusArea = "keyboard"
    m.searchMessageLabel.text = ""
    renderSearchKeyboard()
    showSearchState("editing")
end sub

sub closeSearchKeyboard()
    m.searchFocusArea = "box"
    if m.searchItems.Count() > 0
        showSearchState("results")
    else
        showSearchState("empty")
    end if
end sub

sub moveSearchKeyboard(delta as Integer)
    if m.searchKeyboardKeys.Count() = 0 then return
    nextIndex = m.searchKeyboardIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex >= m.searchKeyboardKeys.Count() then nextIndex = m.searchKeyboardKeys.Count() - 1
    m.searchKeyboardIndex = nextIndex
    updateSearchKeyboardFocus()
end sub

sub moveSearchKeyboardVertical(direction as Integer)
    if m.searchKeyboardKeys.Count() = 0 then return
    current = m.searchKeyboardKeys[m.searchKeyboardIndex]
    bestIndex = m.searchKeyboardIndex
    bestDistance = 9999

    for index = 0 to m.searchKeyboardKeys.Count() - 1
        candidate = m.searchKeyboardKeys[index]
        if direction < 0 and candidate.y < current.y
            distance = Abs(candidate.x - current.x) + ((current.y - candidate.y) * 4)
            if distance < bestDistance
                bestDistance = distance
                bestIndex = index
            end if
        else if direction > 0 and candidate.y > current.y
            distance = Abs(candidate.x - current.x) + ((candidate.y - current.y) * 4)
            if distance < bestDistance
                bestDistance = distance
                bestIndex = index
            end if
        end if
    end for

    m.searchKeyboardIndex = bestIndex
    updateSearchKeyboardFocus()
end sub

sub saveSubmittedSearchQuery(query as String)
    m.recentSearches = m.searchHistoryStore.saveQuery(query)
    m.selectedRecentSearchIndex = 0
    renderRecentSearches()
end sub

sub submitSearch()
    query = m.searchQuery.Trim()
    if query = ""
        m.searchMessageLabel.text = "Enter a search term."
        return
    end if

    m.searchSubmittedQuery = query
    saveSubmittedSearchQuery(query)
    m.searchItems = []
    m.searchCardNodes = []
    m.searchCardBgNodes = []
    m.searchCardIndexes = []
    m.searchCurrentPage = 0
    m.searchTotalPages = 0
    m.searchTotalItems = 0
    m.searchReachedEnd = false
    m.searchFailedNextPage = false
    m.selectedSearchIndex = 0
    m.visualSelectedSearchIndex = -1
    m.searchVisiblePagePair = 0
    m.searchFocusArea = "results"
    m.searchMessageLabel.text = ""
    clearSearchGrid()
    renderSearchCount()
    requestSearchPage(1, false)
end sub

sub toggleSearchYearSort()
    m.searchSortByYear = m.searchSortByYear <> true
    renderSearchYearSort()
    updateSearchFocusVisuals()
    if m.searchSubmittedQuery.Trim() <> ""
        submitSearch()
    end if
end sub

sub requestSearchPage(page as Integer, append as Boolean)
    if m.isLoadingSearch = true or m.isLoadingSearchNextPage = true then return
    if m.searchSubmittedQuery.Trim() = "" then return

    if append
        m.isLoadingSearchNextPage = true
        m.searchFailedNextPage = false
        m.searchNextPageStatus.text = "Loading more..."
    else
        m.isLoadingSearch = true
        m.searchRequestQuery = m.searchSubmittedQuery
        m.searchRequestSortByYear = m.searchSortByYear
        showSearchState("loading")
    end if

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "searchItems"
    task.request = { q: m.searchSubmittedQuery, page: page, perpage: 20, sortByYear: m.searchSortByYear }
    task.observeField("response", "onSearchPageResponse")
    task.control = "RUN"
    m.searchTask = task
end sub

sub onSearchPageResponse(event as Object)
    response = event.getData()
    if m.searchSubmittedQuery = "" then return
    if response <> invalid and response.q <> invalid and response.q <> m.searchSubmittedQuery
        return
    end if
    if response <> invalid and response.sortByYear <> invalid and response.sortByYear <> m.searchSortByYear
        return
    end if

    wasNextPage = m.isLoadingSearchNextPage
    m.isLoadingSearch = false
    m.isLoadingSearchNextPage = false

    if response = invalid or response.ok <> true
        handleSearchError(response, wasNextPage)
        return
    end if

    appendSearchItems(response.items)
    updateSearchPagination(response)
    renderSearchGrid()

    if m.searchItems.Count() = 0
        m.searchNoResultsLabel.text = "No results for " + Chr(34) + m.searchSubmittedQuery + Chr(34)
        m.searchFocusArea = "box"
        showSearchState("emptyResults")
    else
        m.searchFocusArea = "results"
        showSearchState("results")
    end if
end sub

sub handleSearchError(response as Dynamic, wasNextPage as Boolean)
    message = "Unable to search."
    if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message

    if wasNextPage
        m.searchFailedNextPage = true
        m.searchNextPageStatus.text = "Unable to load more. Press OK to retry."
        updateSearchCardFocus()
    else
        m.searchErrorLabel.text = message
        m.searchFocusArea = "error"
        showSearchState("error")
    end if
end sub

sub appendSearchItems(items as Dynamic)
    if items = invalid then return
    for each item in items
        m.searchItems.Push(item)
    end for
    if items.Count() = 0 then m.searchReachedEnd = true
end sub

sub updateSearchPagination(response as Object)
    if response.pagination <> invalid
        pagination = response.pagination
        if pagination.current <> invalid then m.searchCurrentPage = pagination.current
        if pagination.total <> invalid then m.searchTotalPages = pagination.total
        if pagination.total_items <> invalid then m.searchTotalItems = pagination.total_items
        if pagination.perpage <> invalid then m.searchPerPage = pagination.perpage
    end if

    if m.searchTotalPages > 0 and m.searchCurrentPage >= m.searchTotalPages then m.searchReachedEnd = true
    if m.searchReachedEnd then m.searchNextPageStatus.text = "" else m.searchNextPageStatus.text = ""
    m.searchFailedNextPage = false
    renderSearchCount()
end sub

sub renderSearchCount()
    if m.searchResultsCountLabel = invalid then return
    m.searchResultsCountLabel.text = listCountText(m.searchTotalItems, m.searchItems.Count(), hasMoreSearchPages())
end sub

sub clearSearchGrid()
    childCount = m.searchResultGridHost.getChildCount()
    if childCount > 0 then m.searchResultGridHost.removeChildrenIndex(childCount, 0)
    m.searchCardNodes = []
    m.searchCardBgNodes = []
    m.searchCardIndexes = []
end sub

sub renderSearchGrid()
    clearSearchGrid()
    if m.searchItems.Count() = 0 then return

    m.searchVisiblePagePair = Int(m.selectedSearchIndex / (m.searchColumns * 2))
    startIndex = m.searchVisiblePagePair * m.searchColumns * 2
    lastIndex = startIndex + (m.searchColumns * 2) - 1
    if lastIndex >= m.searchItems.Count() then lastIndex = m.searchItems.Count() - 1

    for index = startIndex to lastIndex
        cardInfo = createSearchCard(m.searchItems[index], index)
        m.searchResultGridHost.appendChild(cardInfo.node)
        m.searchCardNodes.Push(cardInfo.node)
        m.searchCardBgNodes.Push(cardInfo.focusBg)
        m.searchCardIndexes.Push(index)
    end for

    updateSearchCardFocus()
    updateSearchScrollChevrons()
end sub

function createSearchCard(item as Object, index as Integer) as Object
    visibleSlot = index MOD (m.searchColumns * 2)
    column = visibleSlot MOD m.searchColumns
    row = Int(visibleSlot / m.searchColumns)
    x = column * 232
    y = row * 210

    card = CreateObject("roSGNode", "Group")
    card.translation = [x, y]

    focusBg = CreateObject("roSGNode", "Rectangle")
    focusBg.width = 220
    focusBg.height = 168
    focusBg.color = "#2A2A2A"
    card.appendChild(focusBg)

    fallback = CreateObject("roSGNode", "Rectangle")
    fallback.translation = [8, 8]
    fallback.width = 82
    fallback.height = 124
    fallback.color = "#1F2937"
    fallback.visible = true
    card.appendChild(fallback)

    poster = CreateObject("roSGNode", "Poster")
    poster.translation = [8, 8]
    poster.width = 82
    poster.height = 124
    poster.uri = item.posterUrl
    poster.loadDisplayMode = "scaleToFit"
    card.appendChild(poster)
    appendTypeBadge(card, item)

    title = CreateObject("roSGNode", "Label")
    title.text = item.title
    title.translation = [102, 16]
    title.width = 110
    title.color = "#F5F5F5"
    card.appendChild(title)

    subtitle = CreateObject("roSGNode", "Label")
    subtitle.text = item.subtitle
    if subtitle.text = "" and item.metadata <> invalid then subtitle.text = item.metadata
    subtitle.translation = [102, 58]
    subtitle.width = 110
    subtitle.color = "#9CA3AF"
    card.appendChild(subtitle)

    return { node: card, focusBg: focusBg }
end function

sub updateSearchCardFocus()
    nodeIndex = 0
    for nodeIndex = 0 to m.searchCardNodes.Count() - 1
        focusBg = m.searchCardBgNodes[nodeIndex]
        index = m.searchCardIndexes[nodeIndex]
        if index = m.selectedSearchIndex and m.searchFocusArea = "results"
            focusBg.color = "#3B82F6"
        else if index = m.visualSelectedSearchIndex
            focusBg.color = "#4B5563"
        else
            focusBg.color = "#2A2A2A"
        end if
    end for
    updateSearchCursor()
    updateSearchScrollChevrons()
end sub

sub updateSearchCursor()
    showCursor = m.searchResultsGroup.visible and m.focusArea = "content" and m.selectedSection = "search" and m.searchFocusArea = "results" and m.searchItems.Count() > 0
    if showCursor <> true
        m.searchResultCursor.visible = false
        return
    end if

    visibleSlot = m.selectedSearchIndex MOD (m.searchColumns * 2)
    column = visibleSlot MOD m.searchColumns
    row = Int(visibleSlot / m.searchColumns)
    m.searchResultCursor.translation = [column * 232, 236 + (row * 210)]
    m.searchResultCursor.visible = true
end sub

function searchVisibleWindowLastIndex() as Integer
    return ((m.searchVisiblePagePair + 1) * m.searchColumns * 2) - 1
end function

function hasMoreSearchPages() as Boolean
    if m.searchReachedEnd then return false
    if m.searchTotalPages > 0 and m.searchCurrentPage >= m.searchTotalPages then return false
    return m.searchItems.Count() > 0
end function

sub updateSearchScrollChevrons()
    if m.searchScrollUpChevron = invalid or m.searchScrollDownChevron = invalid then return

    showGridHints = m.searchResultsGroup.visible and m.searchItems.Count() > 0
    if showGridHints <> true
        m.searchScrollUpChevron.visible = false
        m.searchScrollDownChevron.visible = false
        return
    end if

    m.searchScrollUpChevron.visible = m.searchVisiblePagePair > 0
    hasLoadedItemsBelow = searchVisibleWindowLastIndex() < (m.searchItems.Count() - 1)
    m.searchScrollDownChevron.visible = hasLoadedItemsBelow or hasMoreSearchPages()
end sub

sub moveSearchFocus(delta as Integer)
    if m.searchItems.Count() = 0 then return
    oldPagePair = Int(m.selectedSearchIndex / (m.searchColumns * 2))
    nextIndex = m.selectedSearchIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex >= m.searchItems.Count() then nextIndex = m.searchItems.Count() - 1
    m.selectedSearchIndex = nextIndex
    newPagePair = Int(m.selectedSearchIndex / (m.searchColumns * 2))
    if newPagePair <> oldPagePair
        renderSearchGrid()
    else
        updateSearchCardFocus()
    end if
    loadNextSearchPageIfNeeded()
end sub

sub selectSearchCard()
    if m.searchFailedNextPage
        requestSearchPage(m.searchCurrentPage + 1, true)
        return
    end if

    if m.searchItems.Count() = 0 then return
    selectedItem = m.searchItems[m.selectedSearchIndex]
    m.visualSelectedSearchIndex = m.selectedSearchIndex
    updateSearchCardFocus()
    if selectedItem.itemId <= 0
        m.searchNextPageStatus.text = "Unable to open this video."
        return
    end if
    m.top.videoSelected = {
        itemId: selectedItem.itemId
        mediaId: 0
        source: "search"
    }
end sub

sub loadNextSearchPageIfNeeded()
    if m.searchReachedEnd then return
    if m.searchFailedNextPage then return
    if m.isLoadingSearch or m.isLoadingSearchNextPage then return
    if m.searchItems.Count() = 0 then return
    thresholdIndex = m.searchItems.Count() - 4
    if thresholdIndex < 0 then thresholdIndex = 0
    if m.selectedSearchIndex >= thresholdIndex
        requestSearchPage(m.searchCurrentPage + 1, true)
    end if
end sub

sub showSection(section as String)
    m.selectedSection = section
    m.watchAgainContent.visible = section = "watchAgain"
    m.homeContent.visible = section = "home"
    m.searchContent.visible = section = "search"
    m.bookmarksContent.visible = section = "bookmarks"
    m.accountContent.visible = section = "account"

    if section = "watchAgain"
        m.menuIndex = 0
    else if section = "home"
        m.menuIndex = 1
        loadHomeIfNeeded(false)
    else if section = "search"
        m.menuIndex = 2
    else if section = "bookmarks"
        m.menuIndex = 3
        loadBookmarkFoldersIfNeeded(false)
    else if section = "account"
        m.menuIndex = 4
        loadAccountInfo(false)
    end if

    updateMenuVisuals()
    updateSearchFocusVisuals()
    updateBookmarksFocusVisuals()
end sub

sub setMenuExpanded(expanded as Boolean)
    m.menuExpanded = expanded
    m.expandedMenu.visible = expanded
    m.collapsedMenu.visible = not expanded

    if expanded
        m.contentHost.translation = [316, 44]
        m.focusArea = "menu"
    else
        m.contentHost.translation = [116, 44]
        m.focusArea = "content"
    end if

    updateMenuVisuals()
    updateHistoryCursor()
    updateSearchFocusVisuals()
    updateHistoryScrollChevrons()
    updateSearchScrollChevrons()
    updateHomeCursor()
    updateHomeChevrons()
    updateBookmarksFocusVisuals()
end sub

sub updateMenuVisuals()
    m.watchAgainNav.color = "#D1D5DB"
    m.homeNav.color = "#D1D5DB"
    m.searchNav.color = "#D1D5DB"
    m.bookmarksNav.color = "#D1D5DB"
    m.accountNav.color = "#D1D5DB"
    m.signOutNav.color = "#9CA3AF"
    m.signOutFocusBg.color = "#181818"

    m.collapsedWatchAgain.color = "#9CA3AF"
    m.collapsedHome.color = "#9CA3AF"
    m.collapsedSearch.color = "#9CA3AF"
    m.collapsedBookmarks.color = "#9CA3AF"
    m.collapsedAccount.color = "#9CA3AF"

    if m.menuIndex = 0
        m.navFocusBg.translation = [12, 112]
        m.watchAgainNav.color = "#111827"
        m.collapsedWatchAgain.color = "#F5F5F5"
    else if m.menuIndex = 1
        m.navFocusBg.translation = [12, 172]
        m.homeNav.color = "#111827"
        m.collapsedHome.color = "#F5F5F5"
    else if m.menuIndex = 2
        m.navFocusBg.translation = [12, 232]
        m.searchNav.color = "#111827"
        m.collapsedSearch.color = "#F5F5F5"
    else if m.menuIndex = 3
        m.navFocusBg.translation = [12, 292]
        m.bookmarksNav.color = "#111827"
        m.collapsedBookmarks.color = "#F5F5F5"
    else if m.menuIndex = 4
        m.navFocusBg.translation = [12, 352]
        m.accountNav.color = "#111827"
        m.collapsedAccount.color = "#F5F5F5"
    else
        m.navFocusBg.translation = [12, 616]
        m.signOutNav.color = "#111827"
        m.signOutFocusBg.color = "#E5E7EB"
    end if
end sub

sub moveMenu(delta as Integer)
    m.menuIndex = m.menuIndex + delta
    if m.menuIndex < 0 then m.menuIndex = 0
    if m.menuIndex > 5 then m.menuIndex = 5
    updateMenuVisuals()
end sub

sub activateMenuItem()
    if m.menuIndex = 0
        showSection("watchAgain")
    else if m.menuIndex = 1
        showSection("home")
    else if m.menuIndex = 2
        showSection("search")
        resetSearchState()
    else if m.menuIndex = 3
        showSection("bookmarks")
    else if m.menuIndex = 4
        showSection("account")
    else
        m.top.signOutRequested = true
    end if
end sub

sub showExitConfirmation()
    m.exitDialogVisible = true
    m.exitConfirmIndex = 1
    m.exitDialog.visible = true
    updateExitConfirmationVisuals()
end sub

sub hideExitConfirmation()
    m.exitDialogVisible = false
    m.exitDialog.visible = false
end sub

sub moveExitConfirmationFocus()
    if m.exitConfirmIndex = 0
        m.exitConfirmIndex = 1
    else
        m.exitConfirmIndex = 0
    end if
    updateExitConfirmationVisuals()
end sub

sub updateExitConfirmationVisuals()
    if m.exitConfirmIndex = 0
        m.exitYesFocusBg.color = "#E5E7EB"
        m.exitNoFocusBg.color = "#2A2A2A"
        m.exitYesLabel.color = "#111827"
        m.exitNoLabel.color = "#D1D5DB"
    else
        m.exitYesFocusBg.color = "#2A2A2A"
        m.exitNoFocusBg.color = "#E5E7EB"
        m.exitYesLabel.color = "#D1D5DB"
        m.exitNoLabel.color = "#111827"
    end if
end sub

sub activateExitConfirmation()
    if m.exitConfirmIndex = 0
        m.top.exitRequested = true
    else
        hideExitConfirmation()
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if press <> true then return false

    if m.exitDialogVisible
        if key = "left" or key = "right"
            moveExitConfirmationFocus()
            return true
        else if key = "OK"
            activateExitConfirmation()
            return true
        else if key = "back"
            hideExitConfirmation()
            return true
        end if
        return true
    end if

    if m.focusArea = "content"
        if m.selectedSection = "watchAgain"
            if key = "left"
                if m.selectedHistoryIndex MOD m.historyColumns = 0
                    setMenuExpanded(true)
                else
                    moveHistoryFocus(-1)
                end if
                return true
            else if key = "right"
                moveHistoryFocus(1)
                return true
            else if key = "down"
                moveHistoryFocus(m.historyColumns)
                return true
            else if key = "up"
                moveHistoryFocus(-m.historyColumns)
                return true
            else if key = "OK"
                if m.historyErrorGroup.visible
                    retryInitialHistory()
                else
                    selectHistoryCard()
                end if
                return true
            else if key = "back"
                setMenuExpanded(true)
                return true
            end if
        else if m.selectedSection = "home"
            if key = "left"
                if m.selectedHomeCardIndex = 0
                    setMenuExpanded(true)
                else
                    moveHomeHorizontal(-1)
                end if
                return true
            else if key = "right"
                moveHomeHorizontal(1)
                return true
            else if key = "down"
                moveHomeVertical(1)
                return true
            else if key = "up"
                moveHomeVertical(-1)
                return true
            else if key = "OK"
                if m.homeErrorGroup.visible
                    retryHome()
                else
                    selectHomeCard()
                end if
                return true
            else if key = "back"
                setMenuExpanded(true)
                return true
            end if
        else if m.selectedSection = "search"
            if m.searchFocusArea = "keyboard"
                if key = "left"
                    moveSearchKeyboard(-1)
                    return true
                else if key = "right"
                    moveSearchKeyboard(1)
                    return true
                else if key = "up"
                    moveSearchKeyboardVertical(-1)
                    return true
                else if key = "down"
                    moveSearchKeyboardVertical(1)
                    return true
                else if key = "OK"
                    activateSearchKeyboardKey()
                    return true
                else if key = "back"
                    closeSearchKeyboard()
                    return true
                end if
            else if m.searchFocusArea = "box"
                if key = "OK"
                    openSearchKeyboard()
                    return true
                else if key = "down"
                    m.searchFocusArea = "sort"
                    updateSearchFocusVisuals()
                    return true
                else if key = "left" or key = "back"
                    setMenuExpanded(true)
                    return true
                end if
            else if m.searchFocusArea = "sort"
                if key = "OK"
                    toggleSearchYearSort()
                    return true
                else if key = "up"
                    m.searchFocusArea = "box"
                    updateSearchFocusVisuals()
                    return true
                else if key = "down"
                    if m.searchItems.Count() > 0
                        m.searchFocusArea = "results"
                        updateSearchFocusVisuals()
                    else if m.recentSearches.Count() > 0 and m.recentSearchesGroup.visible
                        m.searchFocusArea = "recent"
                        m.selectedRecentSearchIndex = 0
                        updateSearchFocusVisuals()
                    end if
                    return true
                else if key = "left" or key = "back"
                    setMenuExpanded(true)
                    return true
                end if
            else if m.searchFocusArea = "recent"
                if key = "up"
                    if m.selectedRecentSearchIndex = 0
                        m.searchFocusArea = "sort"
                        updateSearchFocusVisuals()
                    else
                        moveRecentSearchFocus(-1)
                    end if
                    return true
                else if key = "down"
                    moveRecentSearchFocus(1)
                    return true
                else if key = "OK"
                    selectRecentSearch()
                    return true
                else if key = "left" or key = "back"
                    setMenuExpanded(true)
                    return true
                end if
            else if m.searchFocusArea = "error"
                if key = "OK"
                    requestSearchPage(1, false)
                    return true
                else if key = "left" or key = "back"
                    setMenuExpanded(true)
                    return true
                end if
            else if m.searchFocusArea = "results"
                if key = "left"
                    if m.selectedSearchIndex MOD m.searchColumns = 0
                        setMenuExpanded(true)
                    else
                        moveSearchFocus(-1)
                    end if
                    return true
                else if key = "right"
                    moveSearchFocus(1)
                    return true
                else if key = "down"
                    moveSearchFocus(m.searchColumns)
                    return true
                else if key = "up"
                    if m.selectedSearchIndex < m.searchColumns
                        m.searchFocusArea = "sort"
                        updateSearchFocusVisuals()
                    else
                        moveSearchFocus(-m.searchColumns)
                    end if
                    return true
                else if key = "OK"
                    if m.searchErrorGroup.visible
                        requestSearchPage(1, false)
                    else
                        selectSearchCard()
                    end if
                    return true
                else if key = "back"
                    setMenuExpanded(true)
                    return true
                end if
            end if
        else if m.selectedSection = "bookmarks"
            if m.bookmarksErrorGroup.visible
                if key = "OK"
                    retryBookmarks()
                    return true
                else if key = "left" or key = "back"
                    setMenuExpanded(true)
                    return true
                end if
            else if m.bookmarksFocusArea = "folders"
                if key = "left" or key = "back"
                    setMenuExpanded(true)
                    return true
                else if key = "up"
                    moveBookmarkFolderFocus(-1)
                    return true
                else if key = "down"
                    moveBookmarkFolderFocus(1)
                    return true
                else if key = "right"
                    if m.bookmarkItems.Count() > 0 then m.bookmarksFocusArea = "items"
                    updateBookmarksFocusVisuals()
                    return true
                else if key = "OK"
                    loadSelectedBookmarkFolderItems()
                    return true
                end if
            else if m.bookmarksFocusArea = "items"
                if key = "left"
                    if m.selectedBookmarkItemIndex MOD m.bookmarkColumns = 0
                        m.bookmarksFocusArea = "folders"
                        updateBookmarksFocusVisuals()
                    else
                        moveBookmarkItemFocus(-1)
                    end if
                    return true
                else if key = "right"
                    moveBookmarkItemFocus(1)
                    return true
                else if key = "up"
                    moveBookmarkItemFocus(-m.bookmarkColumns)
                    return true
                else if key = "down"
                    moveBookmarkItemFocus(m.bookmarkColumns)
                    return true
                else if key = "OK"
                    selectBookmarkItem()
                    return true
                else if key = "back"
                    m.bookmarksFocusArea = "folders"
                    updateBookmarksFocusVisuals()
                    return true
                end if
            end if
        else if m.selectedSection = "account"
            if key = "OK"
                if m.accountErrorGroup.visible
                    loadAccountInfo(true)
                end if
                return true
            else if key = "left" or key = "back"
                setMenuExpanded(true)
                return true
            end if
        else if key = "left" or key = "back"
            setMenuExpanded(true)
            return true
        end if
        return false
    end if

    if key = "up"
        moveMenu(-1)
        return true
    else if key = "down"
        moveMenu(1)
        return true
    else if key = "OK"
        activateMenuItem()
        return true
    else if key = "right"
        setMenuExpanded(false)
        return true
    else if key = "back"
        showExitConfirmation()
        return true
    end if

    return false
end function
