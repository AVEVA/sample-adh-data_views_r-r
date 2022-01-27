\name{get_auth}
\alias{get_auth}
\title{ADH Client Credential Authentication}
\usage{
get_auth(resource, client_id, client_secret)
}
\description{
When provided with a client id and client secret, this function will
connect to the ADH token endpoint at the specified resource,
parse the response, and return the access token.
}
\examples{
resource <- "https://uswe.datahub.connect.aveva.com"
client_id <- "<value from ADH>"
client_secret <- "<value from ADH>"
access_token <- get_auth(resource, client_id, client_secret)
}
