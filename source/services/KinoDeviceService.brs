function KinoDeviceService(client as Object) as Object
    return {
        client: client
        current: kinoDeviceCurrent
        settings: kinoDeviceSettings
        save: kinoDeviceSave
        validate: kinoDeviceValidate
    }
end function

function kinoDeviceCurrent(accessToken as String) as Object
    response = m.validate(m.client.get("/v1/device/info", { access_token: accessToken }, m.client.defaultTimeoutMs))
    if response.ok <> true then return response
    device = response.body.device
    if type(device) <> "roAssociativeArray" then return { ok: false, error: "invalid_response", message: "Device information was not readable." }
    if device.id = invalid then return { ok: false, error: "invalid_response", message: "Device ID was missing." }
    return { ok: true, device: device }
end function

function kinoDeviceSettings(accessToken as String, deviceId as Dynamic) as Object
    path = "/v1/device/" + kinoApiStringValue(deviceId) + "/settings"
    response = m.validate(m.client.get(path, { access_token: accessToken }, m.client.defaultTimeoutMs))
    if response.ok <> true then return response
    if type(response.body.settings) <> "roAssociativeArray" then return { ok: false, error: "invalid_response", message: "Device settings were not readable." }
    return { ok: true, settings: response.body.settings }
end function

function kinoDeviceSave(accessToken as String, deviceId as Dynamic, changes as Object) as Object
    path = "/v1/device/" + kinoApiStringValue(deviceId) + "/settings"
    return m.validate(m.client.postJson(path, { access_token: accessToken }, changes, m.client.defaultTimeoutMs))
end function

function kinoDeviceValidate(response as Object) as Object
    if response.ok <> true then return response
    if type(response.body) <> "roAssociativeArray" then return { ok: false, error: "invalid_response", message: "Device response was not readable." }
    if response.body.status <> invalid and response.body.status <> 200
        return { ok: false, status: response.body.status, error: "device_settings", message: "Unable to update or load device settings." }
    end if
    return response
end function
