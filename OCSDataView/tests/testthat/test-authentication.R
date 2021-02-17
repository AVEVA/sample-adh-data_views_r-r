test_that("authentication works", {
  # get config from yml
  config <- config::get() # defaults to config.yml
  Sys.setenv(R_CONFIG_ACTIVE = "default")

  client_id <- ""
  client_secret <- ""

  # get auth response
  auth_response <- get_auth(client_id, client_secret)

  # confirm receipt of a successful status code in response
  expect_equal(auth_response$status_code, 200)
})
