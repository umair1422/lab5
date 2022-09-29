#' Title
#' @import httr
#' @import jsonlite
#'
library(httr)
library(jsonlite)

baseUrl <- "https://programming-quotes-api.herokuapp.com"


fetchRandomQuote <- function() {
  endPoint <- '/quotes/random'
  randomQuote <- GET(url = paste0(baseUrl,endPoint))
  randomQuote <- content(randomQuote, as="raw")
  json <- fromJSON(rawToChar(randomQuote))
  df <- flatten(as.data.frame(json))
  return(df)

}

#fetchRandomQuote()


fetchAllQuotes <- function() {
  endPoint <- '/quotes'
  randomQuote <- GET(url = paste0(baseUrl,endPoint))
  randomQuote <- content(randomQuote, as="raw")
  json <- fromJSON(rawToChar(randomQuote))
  df <- flatten(as.data.frame(json))
  return(df)
}

#fetchAllQuotes()

fetchQuoteByAuther <- function(author) {
  if(is.character(author))
  {
  endPoint <- '/quotes/author/'
  randomQuote <- GET(url = paste0(baseUrl,endPoint, author))
  randomQuote <- content(randomQuote, as="raw")
  json <- fromJSON(rawToChar(randomQuote))
  df <- flatten(as.data.frame(json))
  return(df)
  }
  else
    {
      stop("Wrong input type")
    }
}

#fetchQuoteByAuther(author = 'Edsger%20W.%20Dijkstra')

