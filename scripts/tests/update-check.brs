sub main()
    check(updateVersionCompare("v0.10.0", "0.9.9") = 1, "Compare numeric components")
    check(updateVersionCompare("1.0.0", "1.0.0+build.2") = 0, "Ignore build metadata")
    check(updateVersionCompare("1.0.0", "1.0.0-rc.1") = 1, "Stable outranks prerelease")
    check(updateVersionCompare("1.0.0-rc.10", "1.0.0-rc.2") = 1, "Compare numeric prerelease identifiers")
    check(updateVersionCompare("1.0.0-alpha", "1.0.0-alpha.1") = -1, "Shorter prerelease sorts first")
    for each version in ["01.0.0", "1.2", "1.2.3-01", "1.2.3+", "garbage", "1.2.3.4"]
        check(updateParseVersion(version) = invalid, "Reject malformed SemVer: " + version)
    end for
    releases = [
        { tag_name: "v1.2.0", draft: false, prerelease: false, body: "Older" }
        { tag_name: "v2.0.0-rc.1", draft: false, prerelease: true }
        { tag_name: "v1.10.0", draft: false, prerelease: false, body: "Newest" }
        { tag_name: "v9.0.0", draft: true, prerelease: false }
        { tag_name: "v8.0.0-beta", draft: false, prerelease: false }
        { tag_name: "bad", draft: false, prerelease: false }
    ]
    result = updateSelectRelease(releases)
    check(result.version = "v1.10.0" and result.notes = "Newest", "Select greatest stable SemVer across page")
    check(updateSelectRelease([]) = invalid, "Empty page has no release")
    check(updateCheckDue(0, 1000000), "First launch checks")
    check(not updateCheckDue(1000000, 1604799), "Skip before seven days")
    check(updateCheckDue(1000000, 1604800), "Check at seven days")
    check(updateCheckDue(2000000, 1000000), "Recover from clock moving backwards")
    notes = updatePlainNotes("## Changes" + Chr(10) + "- **Fixed** playback")
    check(Instr(1, notes, "**") = 0 and Instr(1, notes, "Changes") > 0, "Clean Markdown for dialog")
    print "Update check tests passed."
end sub

sub check(condition, message)
    if not condition
        print "FAIL: " + message
        stop
    end if
end sub
