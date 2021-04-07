library(config)
library(jsonlite)
library(httr)
library(OCSDataView)

#### Data View Configuration ####
dataview_id <- "WindTurbineData"
start_index <- "3/11/2020"
end_index <- "3/12/2020"
interval <- "00:01:00"
#################################

# get config from yml
config <- config::get() # defaults to config.yml
Sys.setenv(R_CONFIG_ACTIVE = "default")

# get auth response
access_token <- OCSDataView::get_auth(config$resource, config$client_id, config$client_secret)

# build the base url
data_access_endpoint <- paste(config$resource, "/api/", config$api_version, sep = "")

# execute the request
my_data_frame <- OCSDataView::get_data_view_interpolated(data_access_endpoint, config$tenant, config$namespace, dataview_id, start_index, end_index, interval, access_token)

# output the header, first and last 5 rows, and total row count to confirm the entire data view was returned
head(my_data_frame)
tail(my_data_frame)
nrow(my_data_frame)
