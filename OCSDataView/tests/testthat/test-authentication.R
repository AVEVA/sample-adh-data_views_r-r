test_that("authentication works", {
  # get config from yml
  config <- config::get() # defaults to config.yml
  Sys.setenv(R_CONFIG_ACTIVE = "default")

  client_id <- ""
  client_secret <- ""

  # get auth response
  access_token <- get_auth(client_id, client_secret)

  # confirm receipt of a string longer than 100 characters (presumed to be an access token)
  expect_gt(nchar(access_token), 100)
})
