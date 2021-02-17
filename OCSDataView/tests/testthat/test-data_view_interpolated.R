test_that("data view interpolated data retrieval works", {

  # get config from yml
  config <- config::get() # defaults to config.yml
  Sys.setenv(R_CONFIG_ACTIVE = "default")

  client_id <- ""
  client_secret <- ""
  tenant <- ""
  namespace <- "Development"

  # get access token
  auth_response <- get_auth(client_id, client_secret)
  auth_response_text <- httr::content(auth_response, "text", encoding = "UTF-8")
  auth_response_json <- jsonlite::fromJSON(auth_response_text, flatten=TRUE)
  access_token <- auth_response_json$access_token

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
  data_view_response <- get_data_view_interpolated(data_access_endpoint, tenant, namespace, dataview_id, start_index, end_index, interval, count, access_token)

  # confirm receipt of a successful status code in response
  expect_equal(data_view_response$status_code, 200)
})
