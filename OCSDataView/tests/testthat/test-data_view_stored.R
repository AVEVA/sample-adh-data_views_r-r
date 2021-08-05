test_that("data view stored data retrieval works", {
  library(OCSDataView)
  # get config from yml
  test_config <- config::get()
  Sys.setenv(R_CONFIG_ACTIVE = "default")

  # get access token
  access_token <- get_auth(test_config$resource, test_config$client_id, test_config$client_secret)

  # data view configuration
  data_access_endpoint <- paste(test_config$resource, "/api/", test_config$api_version, sep = "")

  # execute the request
  my_data_frame <- get_data_view_stored(data_access_endpoint, test_config$tenant, test_config$namespace, test_config$test_only_dataview_id, test_config$test_only_start_index, test_config$test_only_end_index, access_token)

  # confirm the data frame is the same as what was expected
  wd <- getwd()
  setwd("..\\..\\..")
  comparison_df <- read.csv("storedSampleOutput.csv")
  setwd(wd)
  expect_true(all.equal(my_data_frame, comparison_df, check.names = FALSE))
})
