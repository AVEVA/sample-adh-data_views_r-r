test_that("data view interpolated data retrieval works", {

  # get config from yml
  config <- config::get() # defaults to config.yml
  Sys.setenv(R_CONFIG_ACTIVE = "default")

  client_id <- ""
  client_secret <- ""
  tenant <- ""
  namespace <- "Development"

  # get access token
  access_token <- get_auth(client_id, client_secret)

  # data view configuration
  dataview_id <- "WindTurbineData"
  start_index <- "3/11/2020"
  end_index <- "3/12/2020"
  interval <- "00:01:00"
  count <- "10000"
  resource <- "https://dat-b.osisoft.com"
  api_version <- "v1"
  data_access_endpoint <- paste(resource, "/api/", api_version, sep = "")

  # execute the request
  my_data_frame <- get_data_view_interpolated(data_access_endpoint, tenant, namespace, dataview_id, start_index, end_index, interval, count, access_token)

  # confirm the data frame has more than a header row. This presumes that the data frame contains at least one row of data
  expect_gt(nrow(my_data_frame), 2)
})
