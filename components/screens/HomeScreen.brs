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
    m.browseNav = m.top.findNode("browseNav")
    m.collapsedBrowse = m.top.findNode("collapsedBrowse")
    m.browseContent = m.top.findNode("browseContent")
    m.browseFilterBar = m.top.findNode("browseFilterBar")
    m.browseTypeFilterBg = m.top.findNode("browseTypeFilterBg")
    m.browseTypeFilterLabel = m.top.findNode("browseTypeFilterLabel")
    m.browseGenreFilterBg = m.top.findNode("browseGenreFilterBg")
    m.browseGenreFilterLabel = m.top.findNode("browseGenreFilterLabel")
    m.browseCountryFilterBg = m.top.findNode("browseCountryFilterBg")
    m.browseCountryFilterLabel = m.top.findNode("browseCountryFilterLabel")
    m.browseYearFilterBg = m.top.findNode("browseYearFilterBg")
    m.browseYearFilterLabel = m.top.findNode("browseYearFilterLabel")
    m.browseFinishedFilterBg = m.top.findNode("browseFinishedFilterBg")
    m.browseFinishedFilterLabel = m.top.findNode("browseFinishedFilterLabel")
    m.browsePickerGroup = m.top.findNode("browsePickerGroup")
    m.browsePickerTitleLabel = m.top.findNode("browsePickerTitleLabel")
    m.browsePickerRowsHost = m.top.findNode("browsePickerRowsHost")
    m.browsePickerCursor = m.top.findNode("browsePickerCursor")
    m.browsePickerCursorBg = m.top.findNode("browsePickerCursorBg")
    m.browsePickerStatusLabel = m.top.findNode("browsePickerStatusLabel")
    m.browseLoadingGroup = m.top.findNode("browseLoadingGroup")
    m.browseEmptyGroup = m.top.findNode("browseEmptyGroup")
    m.browseEmptyLabel = m.top.findNode("browseEmptyLabel")
    m.browseErrorGroup = m.top.findNode("browseErrorGroup")
    m.browseErrorLabel = m.top.findNode("browseErrorLabel")
    m.browseRetryGroup = m.top.findNode("browseRetryGroup")
    m.browseResultsGroup = m.top.findNode("browseResultsGroup")
    m.browseResultsCountLabel = m.top.findNode("browseResultsCountLabel")
    m.browseOptionStatusLabel = m.top.findNode("browseOptionStatusLabel")
    m.browseResultGridHost = m.top.findNode("browseResultGridHost")
    m.browseResultCursor = m.top.findNode("browseResultCursor")
    m.browseScrollUpChevron = m.top.findNode("browseScrollUpChevron")
    m.browseScrollDownChevron = m.top.findNode("browseScrollDownChevron")
    m.browseNextPageStatus = m.top.findNode("browseNextPageStatus")
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
    m.collapsedActiveIndicator = m.top.findNode("collapsedActiveIndicator")
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
    m.historyColumns = 5
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
    m.homeMaxVisibleRails = 2
    m.homeCardWidth = 160
    m.homeCardSpacing = 180
    m.homeRailHeight = 266
    m.homeVisibleCards = 5
    m.homePerPage = 12
    m.browseLoaded = false
    m.browseOptionsLoaded = false
    m.isLoadingBrowse = false
    m.isLoadingBrowseOptions = false
    m.isLoadingBrowseNextPage = false
    m.browsePendingRefresh = false
    m.browseReachedEnd = false
    m.browseFailedNextPage = false
    m.browseItems = []
    m.browseCardNodes = []
    m.browseCardBgNodes = []
    m.browseCardIndexes = []
    m.browseCurrentPage = 0
    m.browseTotalPages = 0
    m.browseTotalItems = 0
    m.browsePerPage = 20
    m.browseColumns = 5
    m.browseVisiblePagePair = 0
    m.selectedBrowseIndex = 0
    m.visualSelectedBrowseIndex = -1
    m.browseFocusArea = "results"
    m.selectedBrowseFilterIndex = 0
    m.browsePickerVisible = false
    m.browsePickerItems = []
    m.browsePickerFilterId = ""
    m.selectedBrowsePickerIndex = 0
    m.browsePickerRowNodes = []
    m.browsePickerRowIndexes = []
    m.browseTypeMap = {}
    m.browseGenres = []
    m.browseCountries = []
    m.browseOptionErrorMessage = ""
    m.browseFilters = {
        contentType: ""
        genreId: ""
        countryId: ""
        yearRange: "all"
        finished: "any"
    }
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
    m.searchColumns = 5
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
        m.searchYearSortCheckLabel.text = "On"
    else
        m.searchYearSortCheckLabel.text = "Off"
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

function browseYearOptions() as Object
    return [
        { id: "all", title: "All" }
        { id: "2020s", title: "2020s" }
        { id: "2010s", title: "2010s" }
        { id: "2000s", title: "2000s" }
        { id: "1990s", title: "1990s" }
        { id: "1980s", title: "1980s" }
        { id: "older", title: "Older" }
    ]
end function

function browseFinishedOptions() as Object
    return [
        { id: "any", title: "Any" }
        { id: "finished", title: "Finished" }
        { id: "unfinished", title: "Unfinished" }
    ]
end function

function browseTypeOptions() as Object
    options = [{ id: "", title: "All" }]
    if m.browseTypeMap <> invalid
        for each key in m.browseTypeMap
            entry = m.browseTypeMap[key]
            if entry <> invalid
                title = browseOptionTitle(entry, key)
                options.Push({ id: key, title: title })
            end if
        end for
    end if
    return options
end function

function browseOptionsWithAny(items as Object, anyTitle as String) as Object
    options = [{ id: "", title: anyTitle }]
    if items <> invalid
        for each item in items
            options.Push({ id: browseOptionId(item), title: browseOptionTitle(item, browseOptionId(item)) })
        end for
    end if
    return options
end function

function browseOptionId(optionItem as Dynamic) as String
    if optionItem = invalid or type(optionItem) <> "roAssociativeArray" then return ""
    if optionItem.DoesExist("id") and optionItem.id <> invalid then return optionItem.id
    return ""
end function

function browseOptionTitle(optionItem as Dynamic, fallback as String) as String
    if optionItem = invalid or type(optionItem) <> "roAssociativeArray" then return fallback
    if optionItem.DoesExist("title") and optionItem.title <> invalid and optionItem.title <> "" then return optionItem.title
    return fallback
end function

sub loadBrowseIfNeeded(force as Boolean)
    loadBrowseOptionsIfNeeded(force)
    if m.isLoadingBrowse then return
    if force <> true and m.browseLoaded = true then return
    requestBrowsePage(1, false)
end sub

sub loadBrowseOptionsIfNeeded(force as Boolean)
    if m.isLoadingBrowseOptions then return
    if force <> true and m.browseOptionsLoaded then return

    m.isLoadingBrowseOptions = true
    task = CreateObject("roSGNode", "ContentTask")
    task.command = "loadBrowseOptions"
    task.request = {}
    task.observeField("response", "onBrowseOptionsResponse")
    task.control = "RUN"
    m.browseOptionsTask = task
end sub

sub onBrowseOptionsResponse(event as Object)
    response = event.getData()
    m.isLoadingBrowseOptions = false
    m.browseOptionErrorMessage = ""

    if response = invalid or response.ok <> true
        message = "Some Browse filters are unavailable."
        if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
        m.browseOptionErrorMessage = message
        renderBrowseOptionStatus()
        return
    end if

    if response.typeMap <> invalid then m.browseTypeMap = response.typeMap
    if response.genres <> invalid then m.browseGenres = response.genres
    if response.countries <> invalid then m.browseCountries = response.countries
    if response.genreError <> invalid and response.genreError <> "" then m.browseOptionErrorMessage = response.genreError
    if response.countryError <> invalid and response.countryError <> "" then m.browseOptionErrorMessage = response.countryError
    m.browseOptionsLoaded = m.browseOptionErrorMessage = ""
    renderBrowseFilters()
    renderBrowseOptionStatus()
end sub

sub requestBrowsePage(page as Integer, append as Boolean)
    if m.isLoadingBrowse or m.isLoadingBrowseNextPage then return

    if append
        m.isLoadingBrowseNextPage = true
        m.browseFailedNextPage = false
        m.browseNextPageStatus.text = "Loading more..."
    else
        m.isLoadingBrowse = true
        m.browseItems = []
        m.selectedBrowseIndex = 0
        m.browseVisiblePagePair = 0
        m.browseCurrentPage = 0
        m.browseTotalPages = 0
        m.browseTotalItems = 0
        m.browseReachedEnd = false
        m.browseFailedNextPage = false
        m.browseNextPageStatus.text = ""
        clearBrowseGrid()
        showBrowseState("loading")
    end if

    task = CreateObject("roSGNode", "ContentTask")
    task.command = "loadBrowseItems"
    task.request = browseRequest(page)
    task.observeField("response", "onBrowseItemsResponse")
    task.control = "RUN"
    m.browseTask = task
end sub

sub requestBrowseRefresh()
    if m.isLoadingBrowse or m.isLoadingBrowseNextPage
        m.browsePendingRefresh = true
        return
    end if

    requestBrowsePage(1, false)
end sub

function browseRequest(page as Integer) as Object
    return {
        page: page
        perpage: m.browsePerPage
        contentType: m.browseFilters.contentType
        genreId: m.browseFilters.genreId
        countryId: m.browseFilters.countryId
        yearRange: m.browseFilters.yearRange
        finished: m.browseFilters.finished
    }
end function

sub onBrowseItemsResponse(event as Object)
    response = event.getData()
    wasNextPage = m.isLoadingBrowseNextPage
    m.isLoadingBrowse = false
    m.isLoadingBrowseNextPage = false
    m.browseNextPageStatus.text = ""

    if m.browsePendingRefresh = true
        m.browsePendingRefresh = false
        requestBrowsePage(1, false)
        return
    end if

    if response = invalid or response.ok <> true
        message = "Unable to load Browse."
        if response <> invalid and response.message <> invalid and response.message <> "" then message = response.message
        if wasNextPage
            m.browseFailedNextPage = true
            m.browseNextPageStatus.text = "Unable to load more. Press OK to retry."
            updateBrowseFocusVisuals()
        else
            m.browseErrorLabel.text = message
            m.browseFocusArea = "error"
            showBrowseState("error")
        end if
        return
    end if

    if browseResponseMatchesFilters(response) <> true then return

    items = browseResponseItems(response)
    appendBrowseItems(items)
    updateBrowsePagination(response)
    renderBrowseGrid()
    m.browseLoaded = true

    if m.browseItems.Count() = 0
        m.browseEmptyLabel.text = "No Browse results for these filters."
        m.browseFocusArea = "filters"
        showBrowseState("empty")
    else
        if m.browseFocusArea <> "filters" then m.browseFocusArea = "results"
        showBrowseState("results")
    end if
end sub

function browseResponseMatchesFilters(response as Dynamic) as Boolean
    if response = invalid or type(response) <> "roAssociativeArray" then return false
    if response.contentType <> m.browseFilters.contentType then return false
    if response.genreId <> m.browseFilters.genreId then return false
    if response.countryId <> m.browseFilters.countryId then return false
    if response.yearRange <> m.browseFilters.yearRange then return false
    if response.finished <> m.browseFilters.finished then return false
    return true
end function

function browseResponseItems(response as Dynamic) as Object
    if response = invalid or type(response) <> "roAssociativeArray" then return []
    if response.items = invalid or type(response.items) <> "roArray" then return []
    return response.items
end function

sub showBrowseState(state as String)
    m.browseLoadingGroup.visible = state = "loading"
    m.browseEmptyGroup.visible = state = "empty"
    m.browseErrorGroup.visible = state = "error"
    m.browseResultsGroup.visible = state = "results"
    m.browseFilterBar.visible = state <> "loading"
    updateBrowseFocusVisuals()
    updateBrowseScrollChevrons()
end sub

sub appendBrowseItems(items as Dynamic)
    if items = invalid then return
    if type(items) <> "roArray" then return
    for each item in items
        m.browseItems.Push(item)
    end for
    if items.Count() = 0 then m.browseReachedEnd = true
end sub

sub updateBrowsePagination(response as Object)
    if response <> invalid and response.pagination <> invalid and type(response.pagination) = "roAssociativeArray"
        pagination = response.pagination
        if pagination.current <> invalid then m.browseCurrentPage = pagination.current
        if pagination.total <> invalid then m.browseTotalPages = pagination.total
        if pagination.total_items <> invalid then m.browseTotalItems = pagination.total_items
        if pagination.perpage <> invalid then m.browsePerPage = pagination.perpage
    end if
    if m.browseTotalItems <= 0 then m.browseTotalItems = m.browseItems.Count()
    if m.browseTotalPages > 0 and m.browseCurrentPage >= m.browseTotalPages then m.browseReachedEnd = true
    m.browseResultsCountLabel.text = listCountText(m.browseTotalItems, m.browseItems.Count(), hasMoreBrowsePages())
    m.browseFailedNextPage = false
end sub

sub clearBrowseGrid()
    childCount = m.browseResultGridHost.getChildCount()
    if childCount > 0 then m.browseResultGridHost.removeChildrenIndex(childCount, 0)
    m.browseCardNodes = []
    m.browseCardBgNodes = []
    m.browseCardIndexes = []
    m.browseResultCursor.visible = false
end sub

sub renderBrowseGrid()
    clearBrowseGrid()
    if m.browseItems.Count() = 0 then return

    m.browseVisiblePagePair = Int(m.selectedBrowseIndex / (m.browseColumns * 2))
    startIndex = m.browseVisiblePagePair * m.browseColumns * 2
    lastIndex = startIndex + (m.browseColumns * 2) - 1
    if lastIndex >= m.browseItems.Count() then lastIndex = m.browseItems.Count() - 1

    for index = startIndex to lastIndex
        cardInfo = createBrowseCard(m.browseItems[index], index)
        m.browseResultGridHost.appendChild(cardInfo.node)
        m.browseCardNodes.Push(cardInfo.node)
        m.browseCardBgNodes.Push(cardInfo.focusBg)
        m.browseCardIndexes.Push(index)
    end for

    updateBrowseFocusVisuals()
    updateBrowseScrollChevrons()
end sub

function createBrowseCard(item as Object, index as Integer) as Object
    visibleSlot = index MOD (m.browseColumns * 2)
    column = visibleSlot MOD m.browseColumns
    row = Int(visibleSlot / m.browseColumns)
    x = column * 178
    y = row * 226
    layout = posterBrowseCardLayout(x, y)
    layout.showYear = true
    return createMediaCard(item, layout)
end function

function browseVisibleWindowLastIndex() as Integer
    return ((m.browseVisiblePagePair + 1) * m.browseColumns * 2) - 1
end function

function hasMoreBrowsePages() as Boolean
    if m.browseReachedEnd then return false
    if m.browseTotalPages > 0 and m.browseCurrentPage >= m.browseTotalPages then return false
    return m.browseItems.Count() > 0
end function

sub updateBrowseFocusVisuals()
    browseFilterBgs = [m.browseTypeFilterBg, m.browseGenreFilterBg, m.browseCountryFilterBg, m.browseYearFilterBg, m.browseFinishedFilterBg]
    for index = 0 to browseFilterBgs.Count() - 1
        bg = browseFilterBgs[index]
        if index = m.selectedBrowseFilterIndex and m.selectedSection = "browse" and m.focusArea = "content" and m.browseFocusArea = "filters" and m.browsePickerVisible <> true
            bg.color = cardVisualStateColor(true, false)
        else
            bg.color = cardVisualStateColor(false, false)
        end if
    end for

    for nodeIndex = 0 to m.browseCardBgNodes.Count() - 1
        bg = m.browseCardBgNodes[nodeIndex]
        index = m.browseCardIndexes[nodeIndex]
        if index = m.selectedBrowseIndex and m.selectedSection = "browse" and m.focusArea = "content" and m.browseFocusArea = "results"
            bg.color = cardVisualStateColor(true, false)
        else
            bg.color = cardVisualStateColor(false, false)
        end if
    end for

    updateBrowseCursor()
    updateBrowsePickerFocus()
end sub

sub updateBrowseCursor()
    if m.browseResultCursor = invalid then return
    showCursor = m.browseResultsGroup.visible and m.focusArea = "content" and m.selectedSection = "browse" and m.browseFocusArea = "results" and m.browseItems.Count() > 0
    if showCursor <> true
        m.browseResultCursor.visible = false
        return
    end if

    visibleSlot = m.selectedBrowseIndex MOD (m.browseColumns * 2)
    column = visibleSlot MOD m.browseColumns
    row = Int(visibleSlot / m.browseColumns)
    m.browseResultCursor.translation = [column * 178, 156 + (row * 226)]
    m.browseResultCursor.visible = true
end sub

sub updateBrowseScrollChevrons()
    if m.browseScrollUpChevron = invalid or m.browseScrollDownChevron = invalid then return
    showHints = m.browseResultsGroup.visible and m.browseItems.Count() > 0
    m.browseScrollUpChevron.visible = showHints and m.browseVisiblePagePair > 0
    hasLoadedItemsBelow = browseVisibleWindowLastIndex() < (m.browseItems.Count() - 1)
    m.browseScrollDownChevron.visible = showHints and (hasLoadedItemsBelow or hasMoreBrowsePages())
end sub

sub openBrowsePicker()
    m.browsePickerFilterId = browseFilterIdForIndex(m.selectedBrowseFilterIndex)
    m.browsePickerItems = browsePickerItemsForFilter(m.browsePickerFilterId)
    m.selectedBrowsePickerIndex = browseSelectedPickerIndex(m.browsePickerItems, browseSelectedFilterValue(m.browsePickerFilterId))
    m.browsePickerVisible = true
    m.browsePickerGroup.visible = true
    m.browsePickerTitleLabel.text = browsePickerTitle(m.browsePickerFilterId)
    renderBrowsePickerRows()
end sub

sub closeBrowsePicker()
    m.browsePickerVisible = false
    m.browsePickerGroup.visible = false
    m.browsePickerItems = []
    m.browsePickerFilterId = ""
    m.selectedBrowsePickerIndex = 0
    clearBrowsePickerRows()
    updateBrowseFocusVisuals()
end sub

function browseFilterIdForIndex(index as Integer) as String
    if index = 0 then return "type"
    if index = 1 then return "genre"
    if index = 2 then return "country"
    if index = 3 then return "year"
    return "finished"
end function

function browsePickerTitle(filterId as String) as String
    if filterId = "type" then return "Choose type"
    if filterId = "genre" then return "Choose genre"
    if filterId = "country" then return "Choose country"
    if filterId = "year" then return "Choose year"
    return "Choose finished status"
end function

function browsePickerItemsForFilter(filterId as String) as Object
    if filterId = "type" then return browseTypeOptions()
    if filterId = "genre" then return browseOptionsWithAny(m.browseGenres, "Any")
    if filterId = "country" then return browseOptionsWithAny(m.browseCountries, "Any")
    if filterId = "year" then return browseYearOptions()
    return browseFinishedOptions()
end function

function browseSelectedFilterValue(filterId as String) as String
    if filterId = "type" then return m.browseFilters.contentType
    if filterId = "genre" then return m.browseFilters.genreId
    if filterId = "country" then return m.browseFilters.countryId
    if filterId = "year" then return m.browseFilters.yearRange
    return m.browseFilters.finished
end function

function browseSelectedPickerIndex(items as Object, selectedId as String) as Integer
    for index = 0 to items.Count() - 1
        if items[index].id = selectedId then return index
    end for
    return 0
end function

sub clearBrowsePickerRows()
    childCount = m.browsePickerRowsHost.getChildCount()
    if childCount > 0 then m.browsePickerRowsHost.removeChildrenIndex(childCount, 0)
    m.browsePickerRowNodes = []
    m.browsePickerRowIndexes = []
    m.browsePickerCursor.visible = false
end sub

sub renderBrowsePickerRows()
    clearBrowsePickerRows()
    maxRows = 5
    startIndex = m.selectedBrowsePickerIndex - 2
    if startIndex < 0 then startIndex = 0
    maxStart = m.browsePickerItems.Count() - maxRows
    if maxStart < 0 then maxStart = 0
    if startIndex > maxStart then startIndex = maxStart
    lastIndex = startIndex + maxRows - 1
    if lastIndex >= m.browsePickerItems.Count() then lastIndex = m.browsePickerItems.Count() - 1

    for index = startIndex to lastIndex
        row = CreateObject("roSGNode", "Group")
        row.translation = [0, (index - startIndex) * 44]
        label = CreateObject("roSGNode", "Label")
        label.text = m.browsePickerItems[index].title
        label.translation = [12, 10]
        label.width = 356
        label.color = "#F5F5F5"
        row.appendChild(label)
        m.browsePickerRowsHost.appendChild(row)
        m.browsePickerRowNodes.Push(row)
        m.browsePickerRowIndexes.Push(index)
    end for

    if m.browsePickerItems.Count() > 0
        m.browsePickerStatusLabel.text = StrI(m.selectedBrowsePickerIndex + 1).Trim() + " / " + StrI(m.browsePickerItems.Count()).Trim()
    else
        m.browsePickerStatusLabel.text = "No options available"
    end if

    updateBrowsePickerFocus()
end sub

sub updateBrowsePickerFocus()
    if m.browsePickerVisible <> true
        m.browsePickerCursor.visible = false
        return
    end if

    for index = 0 to m.browsePickerRowIndexes.Count() - 1
        optionIndex = m.browsePickerRowIndexes[index]
        if optionIndex = m.selectedBrowsePickerIndex
            m.browsePickerCursor.translation = [20, 58 + (index * 44)]
            m.browsePickerCursor.visible = true
            return
        end if
    end for
    m.browsePickerCursor.visible = false
end sub

sub moveBrowsePicker(delta as Integer)
    if m.browsePickerItems.Count() = 0 then return
    nextIndex = m.selectedBrowsePickerIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex >= m.browsePickerItems.Count() then nextIndex = m.browsePickerItems.Count() - 1
    if nextIndex = m.selectedBrowsePickerIndex then return
    m.selectedBrowsePickerIndex = nextIndex
    renderBrowsePickerRows()
end sub

sub selectBrowsePickerItem()
    if m.browsePickerItems.Count() = 0 then return
    selected = m.browsePickerItems[m.selectedBrowsePickerIndex]
    if m.browsePickerFilterId = "type" then m.browseFilters.contentType = selected.id
    if m.browsePickerFilterId = "genre" then m.browseFilters.genreId = selected.id
    if m.browsePickerFilterId = "country" then m.browseFilters.countryId = selected.id
    if m.browsePickerFilterId = "year" then m.browseFilters.yearRange = selected.id
    if m.browsePickerFilterId = "finished" then m.browseFilters.finished = selected.id
    closeBrowsePicker()
    m.browseFocusArea = "filters"
    renderBrowseFilters()
    requestBrowseRefresh()
end sub

sub moveBrowseFilter(delta as Integer)
    nextIndex = m.selectedBrowseFilterIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex > 4 then nextIndex = 4
    m.selectedBrowseFilterIndex = nextIndex
    updateBrowseFocusVisuals()
end sub

sub moveBrowseFocus(delta as Integer)
    if m.browseItems.Count() = 0 then return
    oldPagePair = Int(m.selectedBrowseIndex / (m.browseColumns * 2))
    nextIndex = m.selectedBrowseIndex + delta
    if nextIndex < 0 then nextIndex = 0
    if nextIndex >= m.browseItems.Count() then nextIndex = m.browseItems.Count() - 1
    if nextIndex = m.selectedBrowseIndex then return
    m.selectedBrowseIndex = nextIndex
    newPagePair = Int(m.selectedBrowseIndex / (m.browseColumns * 2))
    if newPagePair <> oldPagePair
        renderBrowseGrid()
    else
        updateBrowseFocusVisuals()
    end if
    loadNextBrowsePageIfNeeded()
end sub

sub loadNextBrowsePageIfNeeded()
    if m.browseReachedEnd then return
    if m.browseFailedNextPage then return
    if m.isLoadingBrowse or m.isLoadingBrowseNextPage then return
    if m.browseItems.Count() = 0 then return
    thresholdIndex = m.browseItems.Count() - 4
    if thresholdIndex < 0 then thresholdIndex = 0
    if m.selectedBrowseIndex >= thresholdIndex
        requestBrowsePage(m.browseCurrentPage + 1, true)
    end if
end sub

sub selectBrowseCard()
    if m.browseFailedNextPage
        requestBrowsePage(m.browseCurrentPage + 1, true)
        return
    end if
    if m.browseItems.Count() = 0 then return
    item = m.browseItems[m.selectedBrowseIndex]
    if item = invalid or item.itemId <= 0 then return
    m.top.videoSelected = item
end sub

sub renderBrowseFilters()
    m.browseTypeFilterLabel.text = "Type: " + browseSelectedTitle(browseTypeOptions(), m.browseFilters.contentType, "All")
    m.browseGenreFilterLabel.text = "Genre: " + browseSelectedTitle(browseOptionsWithAny(m.browseGenres, "Any"), m.browseFilters.genreId, "Any")
    m.browseCountryFilterLabel.text = "Country: " + browseSelectedTitle(browseOptionsWithAny(m.browseCountries, "Any"), m.browseFilters.countryId, "Any")
    m.browseYearFilterLabel.text = "Year: " + browseSelectedTitle(browseYearOptions(), m.browseFilters.yearRange, "All")
    m.browseFinishedFilterLabel.text = "Finished: " + browseSelectedTitle(browseFinishedOptions(), m.browseFilters.finished, "Any")
end sub

function browseSelectedTitle(options as Object, selectedId as String, fallback as String) as String
    for each optionItem in options
        if optionItem.id = selectedId then return optionItem.title
    end for
    return fallback
end function

sub renderBrowseOptionStatus()
    if m.browseOptionErrorMessage <> invalid and m.browseOptionErrorMessage <> ""
        m.browseOptionStatusLabel.text = m.browseOptionErrorMessage
    else
        m.browseOptionStatusLabel.text = ""
    end if
end sub

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
    palette = homeUiPalette()

    for index = m.bookmarkFolderVisibleStart to lastIndex
        folder = m.bookmarkFolders[index]
        row = CreateObject("roSGNode", "Group")
        row.translation = [0, (index - m.bookmarkFolderVisibleStart) * 52]

        bg = CreateObject("roSGNode", "Rectangle")
        bg.width = 260
        bg.height = 48
        bg.color = palette.surface
        row.appendChild(bg)

        title = CreateObject("roSGNode", "Label")
        title.text = folder.title
        title.translation = [16, 8]
        title.width = 228
        title.color = palette.text
        row.appendChild(title)

        count = CreateObject("roSGNode", "Label")
        count.text = bookmarkFolderCountText(folder)
        count.translation = [16, 30]
        count.width = 228
        count.color = palette.muted
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

function homeUiPalette() as Object
    return {
        surface: "#171D26"
        surfaceFocus: "#1D4ED8"
        surfaceSelected: "#273142"
        posterFallback: "#253142"
        text: "#F8FAFC"
        muted: "#9BA7BA"
        chipBg: "#111827"
        chipBorder: "#526172"
        progressTrack: "#2D3748"
        progressFill: "#F43F5E"
    }
end function

function cardVisualStateColor(isFocused as Boolean, isSelected as Boolean) as String
    palette = homeUiPalette()
    if isFocused then return palette.surfaceFocus
    if isSelected then return palette.surfaceSelected
    return palette.surface
end function

function createMediaCard(item as Object, layout as Object) as Object
    palette = homeUiPalette()

    card = CreateObject("roSGNode", "Group")
    card.translation = [layout.x, layout.y]

    focusBg = CreateObject("roSGNode", "Rectangle")
    focusBg.width = layout.cardWidth
    focusBg.height = layout.cardHeight
    focusBg.color = palette.surface
    card.appendChild(focusBg)

    fallback = CreateObject("roSGNode", "Rectangle")
    fallback.translation = [layout.posterX, 8]
    fallback.width = layout.posterWidth
    fallback.height = layout.posterHeight
    fallback.color = palette.posterFallback
    fallback.visible = true
    card.appendChild(fallback)

    poster = CreateObject("roSGNode", "Poster")
    poster.translation = [layout.posterX, 8]
    poster.width = layout.posterWidth
    poster.height = layout.posterHeight
    poster.uri = item.posterUrl
    poster.loadDisplayMode = "scaleToFit"
    card.appendChild(poster)
    appendTypeBadge(card, item)

    title = CreateObject("roSGNode", "Label")
    title.text = item.title
    title.translation = [layout.textX, 164]
    title.width = layout.textWidth
    title.height = 28
    title.color = palette.text
    card.appendChild(title)

    if layout.DoesExist("showYear") and layout.showYear
        yearText = cardYearText(item)
        if yearText <> ""
            year = CreateObject("roSGNode", "Label")
            year.text = yearText
            year.translation = [layout.textX, 190]
            year.width = layout.textWidth
            year.height = 24
            year.font.size = 24
            year.horizAlign = "right"
            year.color = palette.muted
            card.appendChild(year)
        end if
    end if

    subtitle = CreateObject("roSGNode", "Label")
    subtitle.text = item.subtitle
    if subtitle.text = "" and item.metadata <> invalid then subtitle.text = item.metadata
    subtitle.translation = [layout.textX, 188]
    subtitle.width = layout.textWidth
    subtitle.height = 0
    subtitle.color = palette.muted
    subtitle.visible = false
    card.appendChild(subtitle)

    if layout.DoesExist("showProgress") and layout.showProgress
        progressBg = CreateObject("roSGNode", "Rectangle")
        progressBg.translation = [layout.posterX, 154]
        progressBg.width = layout.posterWidth
        progressBg.height = 5
        progressBg.color = palette.progressTrack
        progressBg.visible = item.durationSeconds > 0 and item.progressSeconds > 0
        card.appendChild(progressBg)

        progressFill = CreateObject("roSGNode", "Rectangle")
        progressFill.translation = [layout.posterX, 154]
        progressFill.width = mediaProgressWidth(item, layout.posterWidth)
        progressFill.height = 5
        progressFill.color = palette.progressFill
        progressFill.visible = progressBg.visible
        card.appendChild(progressFill)
    end if

    return { node: card, focusBg: focusBg }
end function

function cardYearText(item as Object) as String
    if item = invalid or type(item) <> "roAssociativeArray" then return ""
    if item.DoesExist("year") <> true or item.year = invalid then return ""

    valueType = type(item.year)
    if valueType = "Integer" or valueType = "roInt" or valueType = "roInteger"
        if item.year > 0 then return StrI(item.year).Trim()
    else if valueType = "Float" or valueType = "Double" or valueType = "roFloat" or valueType = "roDouble"
        year = Int(item.year)
        if year > 0 then return StrI(year).Trim()
    else if valueType = "String" or valueType = "roString"
        return item.year.Trim()
    end if

    return ""
end function

function posterBrowseCardLayout(x as Integer, y as Integer) as Object
    return {
        x: x
        y: y
        cardWidth: 160
        cardHeight: 220
        posterX: 24
        posterWidth: 112
        posterHeight: 150
        textX: 8
        textWidth: 144
    }
end function

function createBookmarkCard(item as Object, index as Integer) as Object
    visibleSlot = index MOD (m.bookmarkColumns * 2)
    column = visibleSlot MOD m.bookmarkColumns
    row = Int(visibleSlot / m.bookmarkColumns)
    x = column * 178
    y = row * 226

    return createMediaCard(item, posterBrowseCardLayout(x, y))
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
            bg.color = cardVisualStateColor(true, false)
        else if folderIndex = m.selectedBookmarkFolderIndex
            bg.color = cardVisualStateColor(false, true)
        else
            bg.color = cardVisualStateColor(false, false)
        end if
    end for

    for nodeIndex = 0 to m.bookmarkItemBgNodes.Count() - 1
        bg = m.bookmarkItemBgNodes[nodeIndex]
        index = m.bookmarkItemIndexes[nodeIndex]
        if index = m.selectedBookmarkItemIndex and m.selectedSection = "bookmarks" and m.focusArea = "content" and m.bookmarksFocusArea = "items"
            bg.color = cardVisualStateColor(true, false)
        else
            bg.color = cardVisualStateColor(false, false)
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
    m.bookmarksCursor.translation = [300 + (column * 178), 96 + (row * 226)]
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
    x = column * 180
    y = row * 226

    layout = posterBrowseCardLayout(x, y)
    layout.showProgress = true
    return createMediaCard(item, layout)
end function

function historyProgressWidth(item as Object) as Integer
    return mediaProgressWidth(item, 112)
end function

function mediaProgressWidth(item as Object, maxWidth as Integer) as Integer
    if item.durationSeconds <= 0 or item.progressSeconds <= 0 then return 0
    width = Int((item.progressSeconds * maxWidth) / item.durationSeconds)
    if width < 1 then width = 1
    if width > maxWidth then width = maxWidth
    return width
end function

sub appendTypeBadge(card as Object, item as Object)
    badgeText = itemTypeBadgeText(item)
    if badgeText = "" then return

    palette = homeUiPalette()
    chipWidth = 64

    badgeBg = CreateObject("roSGNode", "Rectangle")
    badgeBg.translation = [24, 14]
    badgeBg.width = chipWidth
    badgeBg.height = 24
    badgeBg.color = palette.chipBg
    badgeBg.opacity = 0.82
    card.appendChild(badgeBg)

    badgeBorderTop = CreateObject("roSGNode", "Rectangle")
    badgeBorderTop.translation = [24, 14]
    badgeBorderTop.width = chipWidth
    badgeBorderTop.height = 1
    badgeBorderTop.color = palette.chipBorder
    card.appendChild(badgeBorderTop)

    badgeBorderBottom = CreateObject("roSGNode", "Rectangle")
    badgeBorderBottom.translation = [24, 37]
    badgeBorderBottom.width = chipWidth
    badgeBorderBottom.height = 1
    badgeBorderBottom.color = palette.chipBorder
    card.appendChild(badgeBorderBottom)

    badgeBorderLeft = CreateObject("roSGNode", "Rectangle")
    badgeBorderLeft.translation = [24, 14]
    badgeBorderLeft.width = 1
    badgeBorderLeft.height = 24
    badgeBorderLeft.color = palette.chipBorder
    card.appendChild(badgeBorderLeft)

    badgeBorderRight = CreateObject("roSGNode", "Rectangle")
    badgeBorderRight.translation = [23 + chipWidth, 14]
    badgeBorderRight.width = 1
    badgeBorderRight.height = 24
    badgeBorderRight.color = palette.chipBorder
    card.appendChild(badgeBorderRight)

    label = CreateObject("roSGNode", "Label")
    label.text = badgeText
    label.translation = [24, 15]
    label.width = chipWidth
    label.height = 22
    label.horizAlign = "center"
    label.color = palette.text
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
            focusBg.color = cardVisualStateColor(true, false)
        else if index = m.visualSelectedHistoryIndex
            focusBg.color = cardVisualStateColor(false, true)
        else
            focusBg.color = cardVisualStateColor(false, false)
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
    m.historyCursor.translation = [column * 180, 82 + (row * 226)]
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
    return createMediaCard(item, posterBrowseCardLayout(visibleCardSlot * m.homeCardSpacing, 38))
end function

sub updateHomeCardFocus()
    nodeIndex = 0
    for nodeIndex = 0 to m.homeCardNodes.Count() - 1
        focusBg = m.homeCardBgNodes[nodeIndex]
        position = m.homeCardPositions[nodeIndex]
        if position.railIndex = m.selectedHomeRailIndex and position.cardIndex = m.selectedHomeCardIndex
            focusBg.color = cardVisualStateColor(true, false)
        else if position.railIndex = m.visualSelectedHomeRailIndex and position.cardIndex = m.visualSelectedHomeCardIndex
            focusBg.color = cardVisualStateColor(false, true)
        else
            focusBg.color = cardVisualStateColor(false, false)
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
    chevronY = 96 + (railSlot * m.homeRailHeight) + 82
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
            ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
            ["?", "!", ",", ".", ":", "-", "'", """", "/"],
            ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
            ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
            ["z", "x", "c", "v", "b", "n", "m"],
            ["RU", "Space", "Backspace", "Clear", "Search"]
        ]
    end if

    return [
        ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
        ["?", "!", ",", ".", ":", "-", "'", """", "/"],
        ["й", "ц", "у", "к", "е", "н", "г", "ш", "щ", "з", "х", "ъ"],
        ["ф", "ы", "в", "а", "п", "р", "о", "л", "д", "ж", "э"],
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
        if row.Count() = 11 then rowOffset = 28
        if row.Count() = 9 then rowOffset = 56
        if row.Count() = 7 then rowOffset = 96

        for columnIndex = 0 to row.Count() - 1
            labelText = row[columnIndex]
            key = searchKeyboardActionForLabel(labelText)
            keyWidth = 56
            if key.type = "space" then keyWidth = 176
            if key.type = "backspace" then keyWidth = 132
            if key.type = "clear" then keyWidth = 96
            if key.type = "search" then keyWidth = 118

            x = rowOffset + (columnIndex * 64)
            if rowIndex = rows.Count() - 1
                x = columnIndex * 142
                if columnIndex = 1 then x = 74
                if columnIndex = 2 then x = 260
                if columnIndex = 3 then x = 402
                if columnIndex = 4 then x = 508
            end if
            y = rowIndex * 50

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
    x = column * 180
    y = row * 226

    layout = posterBrowseCardLayout(x, y)
    layout.showYear = true
    return createMediaCard(item, layout)
end function

sub updateSearchCardFocus()
    nodeIndex = 0
    for nodeIndex = 0 to m.searchCardNodes.Count() - 1
        focusBg = m.searchCardBgNodes[nodeIndex]
        index = m.searchCardIndexes[nodeIndex]
        if index = m.selectedSearchIndex and m.searchFocusArea = "results"
            focusBg.color = cardVisualStateColor(true, false)
        else if index = m.visualSelectedSearchIndex
            focusBg.color = cardVisualStateColor(false, true)
        else
            focusBg.color = cardVisualStateColor(false, false)
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
    m.searchResultCursor.translation = [column * 180, 236 + (row * 226)]
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
    m.browseContent.visible = section = "browse"
    m.searchContent.visible = section = "search"
    m.bookmarksContent.visible = section = "bookmarks"
    m.accountContent.visible = section = "account"

    if section = "watchAgain"
        m.menuIndex = 0
    else if section = "home"
        m.menuIndex = 1
        loadHomeIfNeeded(false)
    else if section = "browse"
        m.menuIndex = 2
        loadBrowseIfNeeded(false)
    else if section = "search"
        m.menuIndex = 3
    else if section = "bookmarks"
        m.menuIndex = 4
        loadBookmarkFoldersIfNeeded(false)
    else if section = "account"
        m.menuIndex = 5
        loadAccountInfo(false)
    end if

    updateMenuVisuals()
    updateBrowseFocusVisuals()
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
    updateBrowseFocusVisuals()
    updateBookmarksFocusVisuals()
end sub

sub updateMenuVisuals()
    palette = homeUiPalette()
    m.watchAgainNav.color = "#D1D5DB"
    m.homeNav.color = "#D1D5DB"
    m.browseNav.color = "#D1D5DB"
    m.searchNav.color = "#D1D5DB"
    m.bookmarksNav.color = "#D1D5DB"
    m.accountNav.color = "#D1D5DB"
    m.signOutNav.color = "#9CA3AF"
    m.signOutFocusBg.color = "#0F131A"

    m.collapsedWatchAgain.color = "#9CA3AF"
    m.collapsedHome.color = "#9CA3AF"
    m.collapsedBrowse.color = "#9CA3AF"
    m.collapsedSearch.color = "#9CA3AF"
    m.collapsedBookmarks.color = "#9CA3AF"
    m.collapsedAccount.color = "#9CA3AF"

    if m.menuIndex = 0
        m.navFocusBg.translation = [12, 112]
        m.collapsedActiveIndicator.translation = [0, 112]
        m.watchAgainNav.color = palette.text
        m.collapsedWatchAgain.color = palette.text
    else if m.menuIndex = 1
        m.navFocusBg.translation = [12, 172]
        m.collapsedActiveIndicator.translation = [0, 172]
        m.homeNav.color = palette.text
        m.collapsedHome.color = palette.text
    else if m.menuIndex = 2
        m.navFocusBg.translation = [12, 232]
        m.collapsedActiveIndicator.translation = [0, 232]
        m.browseNav.color = palette.text
        m.collapsedBrowse.color = palette.text
    else if m.menuIndex = 3
        m.navFocusBg.translation = [12, 292]
        m.collapsedActiveIndicator.translation = [0, 292]
        m.searchNav.color = palette.text
        m.collapsedSearch.color = palette.text
    else if m.menuIndex = 4
        m.navFocusBg.translation = [12, 352]
        m.collapsedActiveIndicator.translation = [0, 352]
        m.bookmarksNav.color = palette.text
        m.collapsedBookmarks.color = palette.text
    else if m.menuIndex = 5
        m.navFocusBg.translation = [12, 412]
        m.collapsedActiveIndicator.translation = [0, 412]
        m.accountNav.color = palette.text
        m.collapsedAccount.color = palette.text
    else
        m.navFocusBg.translation = [12, 616]
        m.collapsedActiveIndicator.translation = [0, 616]
        m.signOutNav.color = palette.text
        m.signOutFocusBg.color = "#2563EB"
    end if
end sub

sub moveMenu(delta as Integer)
    m.menuIndex = m.menuIndex + delta
    if m.menuIndex < 0 then m.menuIndex = 0
    if m.menuIndex > 6 then m.menuIndex = 6
    updateMenuVisuals()
end sub

sub activateMenuItem()
    if m.menuIndex = 0
        showSection("watchAgain")
    else if m.menuIndex = 1
        showSection("home")
    else if m.menuIndex = 2
        showSection("browse")
    else if m.menuIndex = 3
        showSection("search")
        resetSearchState()
    else if m.menuIndex = 4
        showSection("bookmarks")
    else if m.menuIndex = 5
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
        else if m.selectedSection = "browse"
            if m.browsePickerVisible
                if key = "up"
                    moveBrowsePicker(-1)
                    return true
                else if key = "down"
                    moveBrowsePicker(1)
                    return true
                else if key = "OK"
                    selectBrowsePickerItem()
                    return true
                else if key = "back" or key = "left"
                    closeBrowsePicker()
                    return true
                end if
            else if m.browseFocusArea = "error"
                if key = "OK"
                    requestBrowsePage(1, false)
                    return true
                else if key = "left" or key = "back"
                    setMenuExpanded(true)
                    return true
                end if
            else if m.browseFocusArea = "filters"
                if key = "left"
                    if m.selectedBrowseFilterIndex = 0
                        setMenuExpanded(true)
                    else
                        moveBrowseFilter(-1)
                    end if
                    return true
                else if key = "right"
                    moveBrowseFilter(1)
                    return true
                else if key = "down"
                    if m.browseItems.Count() > 0 then m.browseFocusArea = "results"
                    updateBrowseFocusVisuals()
                    return true
                else if key = "OK"
                    openBrowsePicker()
                    return true
                else if key = "back"
                    setMenuExpanded(true)
                    return true
                end if
            else if m.browseFocusArea = "results"
                if key = "left"
                    if m.selectedBrowseIndex MOD m.browseColumns = 0
                        setMenuExpanded(true)
                    else
                        moveBrowseFocus(-1)
                    end if
                    return true
                else if key = "right"
                    moveBrowseFocus(1)
                    return true
                else if key = "down"
                    moveBrowseFocus(m.browseColumns)
                    return true
                else if key = "up"
                    if m.selectedBrowseIndex < m.browseColumns
                        m.browseFocusArea = "filters"
                        updateBrowseFocusVisuals()
                    else
                        moveBrowseFocus(-m.browseColumns)
                    end if
                    return true
                else if key = "OK"
                    selectBrowseCard()
                    return true
                else if key = "back"
                    setMenuExpanded(true)
                    return true
                end if
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
