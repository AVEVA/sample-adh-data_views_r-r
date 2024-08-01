test_that("authentication works", {
  library(CdsDataView)
  # get config from yml
  test_config <- config::get()
  Sys.setenv(R_CONFIG_ACTIVE = "default")

  # get auth response
  access_token <- get_auth(test_config$resource, test_config$client_id, test_config$client_secret)

  # confirm receipt of a string longer than 100 characters (presumed to be an access token)
  expect_gt(nchar(access_token), 100)
})
