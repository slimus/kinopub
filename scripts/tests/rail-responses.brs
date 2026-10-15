sub main()
    placeholders = railLoadingItems(5)
    check(placeholders.Count() = 5, "loading reserves five card slots")
    check(placeholders[0].itemId = -1 and placeholders[4].itemId = -1, "loading slots cannot open content")
    m.homeGeneration = 2
    m.homeTasks = { first: {} , second: {} }
    m.homeRails = [{id:"first",state:"loading",items:[]}, {id:"second",state:"loading",items:[]}]
    m.selectedHomeRailIndex = 1
    m.selectedHomeCardIndex = 0
    m.renders = 0
    onHomeResponse(testEvent(0, 2, {ok:true,items:[{itemId:42}]}))
    check(m.homeRails[0].items[0].itemId = 42, "first response displays immediately")
    check(m.homeRails[1].state = "loading", "second request remains pending")
    check(m.selectedHomeRailIndex = 1, "response preserves focus")
    onHomeResponse(testEvent(1, 2, {ok:false}))
    check(m.homeRails[1].state = "error" and m.homeRails[1].items[0].isError, "row exposes retry")
    check(m.homeRails[0].items[0].itemId = 42, "failure preserves sibling")
    onHomeResponse(testEvent(0, 1, {ok:true,items:[{itemId:99}]}))
    check(m.homeRails[0].items[0].itemId = 42, "stale response ignored")
    onHomeResponse(testEvent(1, 2, {ok:true,items:[]}))
    check(m.homeRails[1].state = "loaded", "empty result settles row")
    check(m.renders = 3, "render only current responses")

    m.continueGeneration = 3
    m.continueTasks = { history: {}, newEpisodes: {} }
    m.continueRails = [{id:"history",title:"History",items:[]}, {id:"newEpisodes",title:"New Episodes",items:[]}]
    m.continueVisibleCards = 5
    m.selectedContinueRailIndex = 0
    m.selectedContinueCardIndex = 4
    onContinueSummaryResponse(testEvent(1, 3, {ok:true,items:[{itemId:7}]}))
    check(m.continueRails[1].items[0].itemId = 7, "continue second row can arrive first")
    check(m.selectedContinueCardIndex = 4, "unrelated row preserves card focus")
    onContinueSummaryResponse(testEvent(0, 3, invalid))
    check(m.continueRails[0].items[0].isError, "malformed response offers retry")
    check(m.selectedContinueCardIndex = 0, "shorter row clamps focus")
    onContinueSummaryResponse(testEvent(1, 2, {ok:false}))
    check(m.continueRails[1].items[0].itemId = 7, "continue stale response ignored")
    print "Rail response tests passed."
end sub

function testEvent(index as Integer, generation as Integer, response as Dynamic) as Object
    return {task:{request:{railIndex:index,generation:generation}},response:response,getRoSGNode: eventNode,getData: eventData}
end function
function eventNode() as Object
    return m.task
end function
function eventData() as Dynamic
    return m.response
end function
function responseRequiresSignIn(response as Dynamic) as Boolean
    return false
end function
sub renderHomeRails()
    m.renders++
end sub
sub renderContinueSummary()
    m.renders++
end sub
sub check(ok as Boolean, message as String)
    if ok <> true then print "FAIL: " + message
end sub
