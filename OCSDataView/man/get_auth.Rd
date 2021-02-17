\name{get_auth}
\alias{get_auth}
\title{OCS Client Credential Authentication}
\usage{
get_auth(client_id, client_secret)
}
\description{
When provided with a client id and client secret, this function will
connect to the OCS token endpoint, parse the response, and return
the access token.
}
\examples{
client_id <- "<value from OCS>"
client_secret <- "<value from OCS>"
access_token <- get_auth(client_id, client_secret)
}
