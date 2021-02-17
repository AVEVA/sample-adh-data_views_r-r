test_that("data view interpolated data retrieval works", {

  # get config from yml
  config <- config::get() # defaults to config.yml
  Sys.setenv(R_CONFIG_ACTIVE = "default")

  # get auth response
  auth_response <- get_auth(config$client_id, config$client_secret)

  # data view configuration
  dataview_id <- "kduffy_EF_DataView1"
  start_index <- "3/3/2017"
  end_index <- "7/13/2018"
  interval <- "1.00:00:00"
  count <- "100000"
  data_access_endpoint <- paste(config$resource, "/api/", config$api_version, sep = "")

  # execute the request
  data_view_response <- get_data_view_interpolated(data_access_endpoint, config$tenant_id, config$namespace_id, dataview_id, start_index, end_index, interval, count, access_token)

})
