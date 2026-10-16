sub main()
    client = { get: fakeGet, postFormBody: fakePost, defaultTimeoutMs: 15000 }
    client.reply = { ok: true, status: 200, body: { device: { id: 42, title: "Living room" } } }
    service = KinoDeviceService(client)
    result = service.current("token")
    check(result.ok and result.device.id = 42, "Find current device")
    check(client.path = "/v1/device/info" and client.query.access_token = "token", "Current device uses authenticated endpoint")
    client.reply = { ok: true, status: 200, body: { settings: { useSsl: { value: 1 }, serverLocation: { type: "list", value: [{ id: 5, label: "Europe", selected: 1 }] } } } }
    result = service.settings("token", 42)
    check(result.ok and result.settings.useSsl.value = 1, "Preserve API settings and SSL key")
    check(client.path = "/v1/device/42/settings", "Settings target current device ID")
    client.reply = { ok: true, status: 200, body: { status: 200 } }
    result = service.save("token", 42, { useSsl: false })
    check(result.ok and client.body.Count() = 1 and client.body.useSsl = false, "Save only changed field including false")
    check(client.query.access_token = "token", "Token stays in query")
    client.reply = { ok: true, status: 200, body: { status: 400 } }
    check(service.save("token", 42, { support4k: true }).ok = false, "Reject application error in HTTP 200")
    client.reply = { ok: true, status: 200, body: {} }
    check(service.current("token").ok = false, "Reject missing device")
    check(service.settings("token", 42).ok = false, "Reject missing settings")
    client.reply = { ok: false, status: 401, error: "unauthorized", message: "Sign in again" }
    check(service.settings("token", 42).error = "unauthorized", "Preserve authorization errors")
    print "Device settings tests passed."
end sub

function fakeGet(path, query, timeout)
    m.path = path
    m.query = query
    return m.reply
end function

function fakePost(path, query, body, timeout)
    m.path = path
    m.query = query
    m.body = body
    return m.reply
end function

sub check(condition, message)
    if not condition
        print "FAIL: " + message
        stop
    end if
end sub
