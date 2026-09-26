sub main()
    m.failures = 0
    resetBookmarkTestState()
    m.selectedBookmarkItemIndex = 38
    moveBookmarkItemFocus(1)
    checkBookmark(m.requestedPage = 3, "Navigation past the second page requests page 3")

    resetBookmarkTestState()
    moveBookmarkItemFocus(1)
    checkBookmark(m.requestedPage = 3, "Right at item 40 requests the next page")
    resetBookmarkTestState()
    moveBookmarkItemFocus(4)
    checkBookmark(m.requestedPage = 3, "Down at item 40 requests the next page")

    resetBookmarkTestState()
    m.isLoadingBookmarkNextPage = true
    moveBookmarkItemFocus(4)
    checkBookmark(m.requestedPage = 0, "An in-flight request is not duplicated")
    resetBookmarkTestState()
    m.bookmarkReachedEnd = true
    moveBookmarkItemFocus(4)
    checkBookmark(m.requestedPage = 0, "No request after the last page")
    resetBookmarkTestState()
    m.bookmarkFailedNextPage = true
    moveBookmarkItemFocus(4)
    checkBookmark(m.requestedPage = 0, "Failed requests wait for explicit retry")

    resetBookmarkTestState()
    updateBookmarkPagination({ pagination: { current: 2, total: 0, total_items: 0, perpage: 20 } })
    checkBookmark(m.bookmarksNextPageStatus.text = "40+ videos", "Loaded count is not presented as the total")
    resetBookmarkTestState()
    m.bookmarkTotalItems = 85
    updateBookmarkPagination({ pagination: { current: 2, total: 0, total_items: 0, perpage: 20 } })
    checkBookmark(m.bookmarksNextPageStatus.text = "85 videos", "Folder count survives missing pagination totals")
    resetBookmarkTestState()
    updateBookmarkPagination({ pagination: { current: 2, total: 2, total_items: 40, perpage: 20 } })
    checkBookmark(hasMoreBookmarkPages() = false, "Known last page stops pagination")
    checkBookmark(m.bookmarksNextPageStatus.text = "40 videos", "Final count has no plus suffix")

    resetBookmarkTestState()
    for page = 3 to 5
        m.selectedBookmarkItemIndex = m.bookmarkItems.Count() - 1
        m.requestedPage = 0
        moveBookmarkItemFocus(4)
        checkBookmark(m.requestedPage = page, "Requests every subsequent page through 85 items")
        lastItem = page * 20
        if lastItem > 85 then lastItem = 85
        for itemId = m.bookmarkItems.Count() + 1 to lastItem
            m.bookmarkItems.Push({ itemId: itemId })
        end for
        updateBookmarkPagination({ pagination: { current: page, total: 5, total_items: 85, perpage: 20 } })
    end for
    moveBookmarkItemFocus(4)
    checkBookmark(m.selectedBookmarkItemIndex = 83, "Can navigate beyond item 80")
    moveBookmarkItemFocus(1)
    checkBookmark(m.bookmarkItems[m.selectedBookmarkItemIndex].itemId = 85, "Can reach the last item on page 5")
    checkBookmark(hasMoreBookmarkPages() = false, "Stops after page 5")
    if m.failures = 0 then print "Bookmark pagination tests passed."
end sub

sub resetBookmarkTestState()
    m.bookmarkItems = []
    for index = 1 to 40
        m.bookmarkItems.Push({ itemId: index })
    end for
    m.selectedBookmarkItemIndex = 39
    m.bookmarkColumns = 4
    m.bookmarkCurrentPage = 2
    m.bookmarkCurrentFolderId = 7
    m.bookmarkTotalPages = 0
    m.bookmarkTotalItems = 0
    m.bookmarkPerPage = 20
    m.bookmarkReachedEnd = false
    m.bookmarkFailedNextPage = false
    m.isLoadingBookmarkItems = false
    m.isLoadingBookmarkNextPage = false
    m.bookmarksNextPageStatus = { text: "" }
    m.requestedPage = 0
end sub

sub checkBookmark(condition as Boolean, message as String)
    if condition then return
    print "FAIL: " + message
    m.failures = m.failures + 1
end sub

' SceneGraph rendering and the network task are outside these state tests.
sub renderBookmarkItems()
end sub

sub updateBookmarksFocusVisuals()
end sub

sub requestBookmarkFolderItems(folderId as Integer, page as Integer, append as Boolean)
    m.requestedPage = page
end sub
