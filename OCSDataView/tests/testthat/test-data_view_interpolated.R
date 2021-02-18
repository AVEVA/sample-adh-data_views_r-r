test_that("data view interpolated data retrieval works", {

  # get config from yml
  #test_config <- config::get(file = "OCSDataView\\conf\\test_config.yml")
  test_config <- config::get()
  Sys.setenv(R_CONFIG_ACTIVE = "default")

  # get access token
  access_token <- get_auth(test_config$client_id, test_config$client_secret)

  # data view configuration
  data_access_endpoint <- paste(test_config$resource, "/api/", test_config$api_version, sep = "")

  # execute the request
  my_data_frame <- get_data_view_interpolated(data_access_endpoint, test_config$tenant, test_config$namespace, test_config$test_only_dataview_id, test_config$test_only_start_index, test_config$test_only_end_index, test_config$test_only_interval, test_config$test_only_count, access_token)

  # confirm the data frame has more than a header row. This presumes that the data frame contains at least one row of data
  expect_gt(nrow(my_data_frame), 2)
})
