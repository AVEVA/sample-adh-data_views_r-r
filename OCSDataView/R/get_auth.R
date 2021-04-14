get_auth <- function(resource, client_id, client_secret) {
  library(httr)
  library(jsonlite)

  # configuration constants
  token_enpoint <- paste(resource, "/identity/connect/token", sep="")
  grant_type <- "client_credentials"

  # build the message body and execute the POST command
  body_list = list("grant_type" = grant_type, "client_id" = client_id, "client_secret" = client_secret)
  auth_response <- POST(token_enpoint, body = body_list, encode = "form")

  # verify the response
  if(auth_response$status_code != 200){
    stop(paste("Error retrieving access token. Status code:", auth_response$status_code, sep=" "))
  }

  # process the response and obtain the access token
  auth_response_text <- content(auth_response, "text", encoding = "UTF-8")
  auth_response_json <- fromJSON(auth_response_text, flatten=TRUE)

  # return the access token
  access_token <- auth_response_json$access_token
}
