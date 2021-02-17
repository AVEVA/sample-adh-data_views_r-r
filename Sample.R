if (!require("config")) install.packages("config")
library("config")
library(jsonlite)
library(httr)
library(OCSDataView)

# get config from yml
config <- config::get() # defaults to config.yml
Sys.setenv(R_CONFIG_ACTIVE = "default")

# get auth response
auth_response <- OCSDataView::get_auth(config$client_id, config$client_secret)

# verify the response
if(auth_response$status_code != 200){
  stop(paste("Error retrieving access token. Status code:", auth_response$status_code, sep=" "))
}

# process the response and obtain the access token
auth_response_text <- content(auth_response, "text", encoding = "UTF-8")
auth_response_json <- fromJSON(auth_response_text, flatten=TRUE)
access_token <- auth_response_json$access_token

# data view configuration
dataview_id <- "OCS_to_R_sample"
start_index <- "2/16/2021"
end_index <- "2/17/2021"
interval <- "01:00:00"
count <- "26"
data_access_endpoint <- paste(config$resource, "/api/", config$api_version, sep = "")

# execute the request
data_view_response <- OCSDataView::get_data_view_interpolated(data_access_endpoint, config$tenant, config$namespace, dataview_id, start_index, end_index, interval, count, access_token)

# verify the response
if(data_view_response$status_code < 200 || data_view_response$status_code >= 300){
  stop(paste("Error retrieving access token. Status code:", data_view_response$status_code, sep=" "))
}

# process the output into a data frame
data_view_response_text <- content(data_view_response, "text", encoding = "UTF-8")
data_view_response_json <- fromJSON(data_view_response_text, flatten=TRUE)
my_data_frame <- as.data.frame(data_view_response_json)

# output the header and first 5 rows of the data frame to confirm data
head(my_data_frame)

