function kinoHomeRails() as Object
    return [
        { id: "popularMovies", title: "Popular Movies", endpoint: "/v1/items/popular", contentType: "movie", optional: false },
        { id: "newMovies", title: "New Movies", endpoint: "/v1/items/fresh", contentType: "movie", optional: false },
        { id: "popularSeries", title: "Popular Series", endpoint: "/v1/items/popular", contentType: "serial", optional: false },
        { id: "newSeries", title: "New Series", endpoint: "/v1/items/fresh", contentType: "serial", optional: false },
        { id: "newDocMovies", title: "New Documentaries", endpoint: "/v1/items/fresh", contentType: "documovie", optional: false },
        { id: "newDocSeries", title: "New Documentary Series", endpoint: "/v1/items/fresh", contentType: "docuserial", optional: false },
        { id: "newTvShows", title: "New TV Shows", endpoint: "/v1/items/fresh", contentType: "tvshow", optional: false },
        { id: "newConcerts", title: "New Concerts", endpoint: "/v1/items/fresh", contentType: "concert", optional: true },
        { id: "new3d", title: "New in 3D", endpoint: "/v1/items/fresh", contentType: "3D", optional: true }
    ]
end function

