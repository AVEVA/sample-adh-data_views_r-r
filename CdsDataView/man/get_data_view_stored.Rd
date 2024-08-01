\name{get_data_view_stored}
\alias{get_data_view_stored}
\title{Cds Data View Stored Data Retrieval}
\usage{
get_data_view_stored(data_access_endpoint, tenant_id, namespace_id, dataview_id, start_index, end_index, access_token)
}
\description{
Retrieves stored data from Cds for the specified data view at the specified time indexes,
parses the response, and returns the data as a data frame.
}
\examples{
data_access_endpoint <- "https://uswe.datahub.connect.aveva.com/api/v1"
tenant_id <- "<Cds tenant id>"
namespace_id <- "samples"
dataview_id <- "DataView1"
start_index <- "1/1/2021"
end_index <- "1/3/2021"

access_token <- get_auth(client_id, client_secret)

my_data_frame <- get_data_view_stored(data_access_endpoint, tenant_id, namespace_id, dataview_id, start_index, end_index, access_token)
}
