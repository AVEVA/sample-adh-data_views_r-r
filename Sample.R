library(config)
library(jsonlite)
library(httr)
library(OCSDataView)

#### Data View Configuration ####
dataview_id <- "WindTurbineData"
start_index <- "3/11/2020"
end_index <- "3/12/2020"
interval <- "00:01:00"
count <- "10000"
#################################

# get config from yml
config <- config::get() # defaults to config.yml
Sys.setenv(R_CONFIG_ACTIVE = "default")

# get auth response
access_token <- OCSDataView::get_auth(config$client_id, config$client_secret)


data_access_endpoint <- paste(config$resource, "/api/", config$api_version, sep = "")

# execute the request
my_data_frame <- OCSDataView::get_data_view_interpolated(data_access_endpoint, config$tenant, config$namespace, dataview_id, start_index, end_index, interval, count, access_token)

# output the header and first 5 rows of the data frame to confirm data
head(my_data_frame)

