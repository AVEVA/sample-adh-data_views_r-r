library(config)
library(jsonlite)
library(httr)
library(OCSDataView)

#### Data View Configuration ####
dataview_id <- "WindTurbineData"
start_index <- "3/11/2020 00:00:00"
end_index <- "3/11/2020 02:00:00"
interval <- "00:00:05"
#################################

# get config from yml
config <- config::get() # defaults to config.yml
Sys.setenv(R_CONFIG_ACTIVE = "default")

# get auth response
access_token <- OCSDataView::get_auth(config$resource, config$client_id, config$client_secret)

# build the base url
data_access_endpoint <- paste(config$resource, "/api/", config$api_version, sep = "")

# Interpolated Data Retrieval #

# execute the request for interpolated data
my_interpolated_data_frame <- OCSDataView::get_data_view_interpolated(data_access_endpoint, config$tenant, config$namespace, dataview_id, start_index, end_index, interval, access_token)

# output the header, first and last 5 rows, and total row count to confirm the entire data view was returned
head(my_interpolated_data_frame)
tail(my_interpolated_data_frame)
nrow(my_interpolated_data_frame)

# Stored Data Retrieval #

# execute the request for stored data
my_stored_data_frame <- OCSDataView::get_data_view_stored(data_access_endpoint, config$tenant, config$namespace, dataview_id, start_index, end_index, access_token)

# output the header, first and last 5 rows, and total row count to confirm the entire data view was returned
head(my_stored_data_frame)
tail(my_stored_data_frame)
nrow(my_stored_data_frame)
