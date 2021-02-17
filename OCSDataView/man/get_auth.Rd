\name{get_auth}
\alias{get_auth}
\title{OCS Client Credential Authentication}
\usage{
get_auth(client_id, client_secret)
}
\description{
When provided with a client id and client secret, this function will
connect to OCS's token endpoint and return the response. The response will
contain the access token and token lifetime, among others, in its content.
}
\examples{
client_id <- "12345"
client_secret <- "67890"
auth_response <- get_auth(client_id, client_secret)
auth_response_text <- content(auth_response, "text", encoding = "UTF-8")
auth_response_json <- fromJSON(auth_response_text, flatten=TRUE)
access_token <- auth_response_json$access_token
}
