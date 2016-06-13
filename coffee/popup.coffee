# getRank = (title, year, cb = formatRank) ->
#     par =
#         plot: 'short'
#         r: 'json'
#         t: title
#         tomatoes: 'true'

#     par.y = year if year != null and year != ''

#     console.log title, year

#     $.getJSON 'http://www.omdbapi.com', par, cb

# formatRank = (data) ->
#     console.log data
#     $('#spinner').hide()

#     if data.Response == "False"
#         $('#failed').show()
#         # $('#form').show()
#     else
#         $('#form').hide()
#         $('#result').show()
#         $('#Title').html data.Title
#         $('#Released').html data.Released
#         $('#Genre').html data.Genre
#         $('#Runtime').html data.Runtime
#         $('#Actors').html data.Actors
#         $('#Awards').html data.Awards
#         $('#Country').html data.Country
#         $('#Director').html data.Director
#         $('#Language').html data.Language
#         $('#Metascore').html data.Metascore
#         $('#Plot').html data.Plot
#         $('#Poster').html data.Poster
#         $('#Production').html data.Production
#         $('#Type').html data.Type
#         $('#Writer').html data.Writer
#         $('#imdbRating').html data.imdbRating
#         $('#imdbVotes').html data.imdbVotes
#         $('#tomatoFresh').html data.tomatoFresh
#         $('#tomatoMeter').html data.tomatoMeter
#         $('#tomatoRating').html data.tomatoRating
#         $('#tomatoReviews').html data.tomatoReviews
#         $('#tomatoRotten').html data.tomatoRotten
#         return

$ ->

    $('#search').click ->
        $('#failed').hide()
        $('#spinner').show()
        chrome.runtime.getBackgroundPage (bgPage) ->
            console.log bgPage
            bgPage.getRank $('#title').val(), $('#year').val()


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
