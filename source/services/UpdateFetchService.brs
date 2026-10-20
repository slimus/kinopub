' Called only from UpdateTask; no KinoPub credentials are sent to GitHub.
function updateFetchReleases() as Object
    client = KinoApiClient({
        apiBaseUrl: "https://api.github.com"
        headers: { "Accept": "application/vnd.github+json", "User-Agent": "KinoPub-Roku" }
    })
    response = client.get("/repos/slimus/kinopub/releases", { per_page: 30, page: 1 })
    if not response.ok then return { ok: false }
    if type(response.body) <> "roArray" then return { ok: false }
    return { ok: true, releases: response.body }
end function
