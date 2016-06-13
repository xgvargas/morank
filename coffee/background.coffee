# chrome.omnibox.onInputStarted.addListener ->
# chrome.omnibox.onInputCancelled.addListener ->

# chrome.omnibox.onInputChanged.addListener (text, suggest) ->
# chrome.omnibox.onInputEntered.addListener (string, disposition) ->

# chrome.tabs.onUpdated.addListener (tabId, changeInfo, tab) ->

# chrome.tabs.onUpdated.addListener (activeInfo) ->

chrome.contextMenus.create
    id       : "viewRating"
    title    : "View Ratting"
    contexts : ["selection"]

chrome.contextMenus.onClicked.addListener (info, tab) ->
    getRank info.selectionText

# chrome.runtime.onMessage.addListener (message, sender, response) ->


getRank = (title, year) ->
    par =
        plot: 'short'
        r: 'json'
        t: title
        tomatoes: 'true'

    par.y = year if year != null and year != ''

    console.log title, year

    $.getJSON 'http://www.omdbapi.com', par, showInfo

window.getRank = getRank
@getRank = getRank

showInfo = (data) ->
    console.log  data
    if data.Response == "False"
        chrome.notifications.create
            type: 'basic'
            iconUrl: 'icon38.png'
            title: 'Failed!!!'
            message: 'Movie not found'
    else
        chrome.notifications.create
            type: 'list'
            iconUrl: 'icon38.png'
            title: data.Title
            message: 'sou um texto longo....'
            items: [
                {title: 'Released', message: data.Released}
                {title: 'Genre', message: data.Genre}
                {title: 'Runtime', message: data.Runtime}
                {title: 'Actors', message: data.Actors}
                {title: 'Awards', message: data.Awards}
                {title: 'Country', message: data.Country}
                {title: 'Director', message: data.Director}
                {title: 'Language', message: data.Language}
                {title: 'Metascore', message: data.Metascore}
                {title: 'Plot', message: data.Plot}
                {title: 'Poster', message: data.Poster}
                {title: 'Production', message: data.Production}
                {title: 'Type', message: data.Type}
                {title: 'Writer', message: data.Writer}
                {title: 'imdbRating', message: data.imdbRating}
                {title: 'imdbVotes', message: data.imdbVotes}
                {title: 'tomatoFresh', message: data.tomatoFresh}
                {title: 'tomatoMeter', message: data.tomatoMeter}
                {title: 'tomatoRating', message: data.tomatoRating}
                {title: 'tomatoReviews', message: data.tomatoReviews}
                {title: 'tomatoRotten', message: data.tomatoRotten}
            ]
