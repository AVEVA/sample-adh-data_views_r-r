get_auth <- function(client_id, client_secret) {

  # configuration constants
  token_enpoint <- "https://dat-b.osisoft.com/identity/connect/token"
  grant_type <- "client_credentials"

  # build the message body and execute the POST command
  body_list = list("grant_type" = grant_type, "client_id" = client_id, "client_secret" = client_secret)
  auth_response <- httr::POST(token_enpoint, body = body_list, encode = "form")
}
