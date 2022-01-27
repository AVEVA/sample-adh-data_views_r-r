\name{get_data_view_interpolated}
\alias{get_data_view_interpolated}
\title{ADH Data View Interpolated Data Retrieval}
\usage{
get_data_view_interpolated(data_access_endpoint, tenant_id, namespace_id, dataview_id, start_index, end_index, interval, access_token)
}
\description{
Retrieves interpolated data from ADH for the specified data view at the specified time indexes,
parses the response, and returns the data as a data frame.
}
\examples{
data_access_endpoint <- "https://uswe.datahub.connect.aveva.com/api/v1"
tenant_id <- "<ADH tenant id>"
namespace_id <- "samples"
dataview_id <- "DataView1"
start_index <- "1/1/2021"
end_index <- "1/3/2021"
interval <- "01:00:00"

access_token <- get_auth(client_id, client_secret)

my_data_frame <- get_data_view_interpolated(data_access_endpoint, tenant_id, namespace_id, dataview_id, start_index, end_index, interval, access_token)
}
