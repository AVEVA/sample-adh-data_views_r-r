get_data_view_stored <- function(data_access_endpoint, tenant_id, namespace_id, dataview_id, start_index, end_index, bearer_token) {
  library(httr)
  library(jsonlite)

  # build the correct URL from the provided properties
  dataview_req_url <- paste(URLencode(data_access_endpoint), "/tenants/", URLencode(tenant_id), "/namespaces/", URLencode(namespace_id), "/DataViews/", URLencode(dataview_id),
                            "/Data/Stored?startIndex=", URLencode(start_index), "&endIndex=", URLencode(end_index), sep = "")

  overall_data_frame <- NULL
  more_results <- TRUE

  while (more_results) {

    # execute the request
    data_view_response <- httr::GET(dataview_req_url, httr::add_headers(authorization = paste("Bearer", bearer_token, sep = " ")), httr::accept("application/json"), httr::content_type_json())

    # verify the response
    if(data_view_response$status_code < 200 || data_view_response$status_code >= 300){
      stop(paste("Error retrieving data view stored data. Status code:", data_view_response$status_code, sep=" "))
    }

    # process the output into a data frame
    data_view_response_text <- content(data_view_response, "text", encoding = "UTF-8")
    data_view_response_json <- fromJSON(data_view_response_text, flatten=TRUE)

    # create a data frame from the data and bind it to the overall data frame
    this_data_frame <- as.data.frame(data_view_response_json)
    overall_data_frame <- rbind(overall_data_frame, this_data_frame)

    # check for another page of rows
    dataview_req_url <- data_view_response$headers$'next-page'
    if (is.null(dataview_req_url)) {
      more_results <- FALSE
    }
  }

  # return overall data frame
  return(overall_data_frame)
}
