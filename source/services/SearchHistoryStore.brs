function SearchHistoryStore() as Object
    return {
        sectionName: "searchhistory"
        historyKey: "queriesJson"
        maxEntries: 10
        load: searchHistoryStoreLoad
        saveQuery: searchHistoryStoreSaveQuery
        normalizeQuery: searchHistoryStoreNormalizeQuery
        containsQuery: searchHistoryStoreContainsQuery
    }
end function

function searchHistoryStoreLoad() as Object
    section = CreateObject("roRegistrySection", m.sectionName)
    raw = section.Read(m.historyKey)
    if raw = invalid or raw = "" then return []

    parsed = ParseJson(raw)
    if parsed = invalid or type(parsed) <> "roArray" then return []

    queries = []
    for each query in parsed
        normalized = m.normalizeQuery(query)
        if normalized <> "" and m.containsQuery(queries, normalized) <> true
            queries.Push(normalized)
            if queries.Count() = m.maxEntries then exit for
        end if
    end for

    return queries
end function

function searchHistoryStoreSaveQuery(query as String) as Object
    normalized = m.normalizeQuery(query)
    if normalized = "" then return m.load()

    existing = m.load()
    updated = [normalized]

    for each savedQuery in existing
        if LCase(savedQuery) <> LCase(normalized)
            updated.Push(savedQuery)
            if updated.Count() = m.maxEntries then exit for
        end if
    end for

    section = CreateObject("roRegistrySection", m.sectionName)
    section.Write(m.historyKey, FormatJson(updated))
    section.Flush()
    return updated
end function

function searchHistoryStoreNormalizeQuery(query as Dynamic) as String
    if query = invalid then return ""
    queryType = type(query)
    if queryType <> "String" and queryType <> "roString" then return ""
    return query.Trim()
end function

function searchHistoryStoreContainsQuery(queries as Object, query as String) as Boolean
    for each savedQuery in queries
        if LCase(savedQuery) = LCase(query) then return true
    end for
    return false
end function
