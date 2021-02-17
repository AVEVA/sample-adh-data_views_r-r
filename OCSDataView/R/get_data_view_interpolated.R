get_data_view_interpolated <- function(data_access_endpoint, tenant_id, namespace_id, dataview_id, start_index, end_index, interval, count, bearer_token) {

  # build the correct URL from the provided properties
  dataview_req_url <- paste(data_access_endpoint, "/tenants/", tenant_id, "/namespaces/", namespace_id, "/DataViews/", dataview_id,
                            "/Data/Interpolated?startIndex=", start_index, "&endIndex=", end_index, "&interval=", interval, "&count=", count, sep = "")

  # execute the request
  data_view_response <- httr::GET(dataview_req_url, httr::add_headers(authorization = paste("Bearer", bearer_token, sep = " ")), httr::accept("text/plain"), httr::content_type_json())
}
