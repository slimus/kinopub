sub init()
    m.top.functionName = "checkUpdates"
end sub

sub checkUpdates()
    state = updateLoadState()
    nowSeconds = CreateObject("roDateTime").AsSeconds()
    if not m.top.manual and not updateCheckDue(state.lastAttempt, nowSeconds)
        m.top.response = { ok: true, state: state, skipped: true }
        return
    end if
    ' Persist the attempt before networking, including failed automatic checks.
    state.lastAttempt = nowSeconds
    updateSaveState(state)
    response = updateFetchReleases()
    if response.ok
        state.release = updateSelectRelease(response.releases)
        updateSaveState(state)
    end if
    response.state = state
    m.top.response = response
end sub
