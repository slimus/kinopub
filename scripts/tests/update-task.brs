sub main()
    nowSeconds = CreateObject("roDateTime").AsSeconds()
    m.savedState = { lastAttempt: nowSeconds, release: { version: "v1.2.0", notes: "Cached" } }
    m.top = { manual: false }
    m.fetchCount = 0
    checkUpdates()
    check(m.fetchCount = 0 and m.top.response.skipped, "Automatic check skips recent registry timestamp")
    m.top.manual = true
    m.fetchResult = { ok: true, releases: [{ tag_name: "v1.3.0", body: "New", draft: false, prerelease: false }] }
    checkUpdates()
    check(m.fetchCount = 1 and m.savedState.release.version = "v1.3.0", "Manual check bypasses interval and persists fresh release")
    m.fetchResult = { ok: false }
    checkUpdates()
    check(m.fetchCount = 2 and not m.top.response.ok and m.savedState.release.version = "v1.3.0", "Manual failure preserves cached update")
    m.top.manual = false
    m.savedState.lastAttempt = nowSeconds - 604800
    checkUpdates()
    check(m.fetchCount = 3 and m.savedState.lastAttempt >= nowSeconds, "Failed background attempt persists timestamp")
    checkUpdates()
    check(m.fetchCount = 3, "Do not retry failed background check before a week")
    m.top.manual = true
    m.fetchResult = { ok: true, releases: [] }
    checkUpdates()
    check(m.savedState.release = invalid, "Successful empty response clears withdrawn release")
    print "Update task tests passed."
end sub

function updateLoadState()
    return m.savedState
end function

sub updateSaveState(state)
    m.savedState = state
end sub

function updateFetchReleases()
    m.fetchCount = m.fetchCount + 1
    return m.fetchResult
end function

sub check(condition, message)
    if not condition
        print "FAIL: " + message
        stop
    end if
end sub
