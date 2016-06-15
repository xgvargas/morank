getRank = (title, year, cb = formatRank) ->
    par =
        plot: 'short'
        r: 'json'
        t: title
        tomatoes: 'true'

    par.y = year if year != null and year != ''

    console.log title, year

    $.getJSON 'http://www.omdbapi.com', par, cb

formatRank = (data) ->
    console.log data
    $('#spinner').hide()

    if data.Response == "False"
        $('#failed').show()
        # $('#form').show()
    else
        $('#form').hide()
        $('#result').show()
        $('#Title .content').html data.Title
        $('#Released .content').html data.Released
        $('#Genre .content').html data.Genre
        $('#Runtime .content').html data.Runtime
        $('#Actors .content').html data.Actors
        $('#Awards .content').html data.Awards
        $('#Country .content').html data.Country
        $('#Director .content').html data.Director
        $('#Language .content').html data.Language
        $('#Metascore .content').html data.Metascore
        $('#Plot .content').html data.Plot
        $('#Production .content').html data.Production
        $('#Type .content').html data.Type
        $('#Writer .content').html data.Writer
        $('#imdbRating .content').html data.imdbRating
        $('#imdbVotes .content').html data.imdbVotes
        $('#tomatoFresh .content').html data.tomatoFresh
        $('#tomatoMeter .content').html data.tomatoMeter
        $('#tomatoRating .content').html data.tomatoRating
        $('#tomatoReviews .content').html data.tomatoReviews
        $('#tomatoRotten .content').html data.tomatoRotten
        # $('body').css background: "url(#{data.Poster})"
        $('#poster').attr src: data.Poster
        return

$ ->
    $('#langTitle').html chrome.i18n.getMessage 'popup_title'
    $('#langYear').html chrome.i18n.getMessage 'popup_year'

    $('#Title .title').html chrome.i18n.getMessage 'popup_title'
    $('#Type .title').html chrome.i18n.getMessage 'popup_type'
    $('#Genre .title').html chrome.i18n.getMessage 'popup_genre'
    $('#Runtime .title').html chrome.i18n.getMessage 'popup_runtime'
    $('#Released .title').html chrome.i18n.getMessage 'popup_released'
    $('#Country .title').html chrome.i18n.getMessage 'popup_country'
    $('#Director .title').html chrome.i18n.getMessage 'popup_director'
    $('#Writer .title').html chrome.i18n.getMessage 'popup_writer'
    $('#Language .title').html chrome.i18n.getMessage 'popup_language'
    $('#Metascore .title').html chrome.i18n.getMessage 'popup_metascore'
    $('#imdbRating .title').html chrome.i18n.getMessage 'popup_imdbRating'
    $('#imdbVotes .title').html chrome.i18n.getMessage 'popup_imdbVotes'
    $('#tomatoFresh .title').html chrome.i18n.getMessage 'popup_tomatoFresh'
    $('#tomatoMeter .title').html chrome.i18n.getMessage 'popup_tomatoMeter'
    $('#tomatoRating .title').html chrome.i18n.getMessage 'popup_tomatoRating'
    $('#tomatoReviews .title').html chrome.i18n.getMessage 'popup_tomatoReviews'
    $('#tomatoRotten .title').html chrome.i18n.getMessage 'popup_tomatoRotten'
    $('#Actors .title').html chrome.i18n.getMessage 'popup_actors'
    $('#Plot .title').html chrome.i18n.getMessage 'popup_plot'
    $('#Production .title').html chrome.i18n.getMessage 'popup_production'
    $('#Awards .title').html chrome.i18n.getMessage 'popup_awards'

    $('#search').click ->
        $('#failed').hide()
        $('#spinner').show()
        # chrome.runtime.getBackgroundPage (bgPage) ->
        #     console.log bgPage
        #     bgPage.getRank $('#title').val(), $('#year').val()
        getRank $('#title').val(), $('#year').val()

    chrome.runtime.onMessage.addListener (message, sender, callback) ->
        $('#title').val message.selection
        $('#year').val('')
        Materialize.updateTextFields()

    chrome.tabs.executeScript code: "chrome.runtime.sendMessage({selection: window.getSelection().toString() });"


# chrome.runtime.onMessage.addListener (message, sender, callback) ->
#     if message.query?
#         console.log "trabalhando... #{message.query}"
#         getRank message.query
#         # callback()




# Actors: "Harvey Keitel, Tim Roth, Michael Madsen, Chris Penn"
# Awards: "9 wins & 15 nominations."
# Country: "USA"
# Director: "Quentin Tarantino"
# Genre: "Crime, Drama, Thriller"
# Language: "English"
# Metascore: "78"
# Plot: "After a simple jewelry heist goes terribly wrong, the surviving criminals begin to suspect that one of them is a police informant."
# Poster: "http://ia.media-imdb.com/images/M/MV5BMTQxMTAwMDQ3Nl5BMl5BanBnXkFtZTcwODMwNTgzMQ@@._V1_SX300.jpg"
# Production: "Miramax Films"
# Released: "02 Sep 1992"
# Runtime: "99 min"
# Title: "Reservoir Dogs"
# Type: "movie"
# Writer: "Quentin Tarantino, Roger Avary (background radio dialog), Quentin Tarantino (background radio dialog)"
# imdbRating: "8.4"
# imdbVotes: "649,074"
# tomatoFresh: "56"
# tomatoMeter: "90"
# tomatoRating: "8.8"
# tomatoReviews: "62"
# tomatoRotten: "6"
