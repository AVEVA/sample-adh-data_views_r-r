# Required libraries for this script
if (!require("jsonlite")) install.packages("jsonlite")
if (!require("httr")) install.packages("httr")
if (!require("config")) install.packages("config")
library("jsonlite")
library("httr")
library("config")

# Access the config file's 'default' section
config <- config::get() # defaults to config.yml
Sys.setenv(R_CONFIG_ACTIVE = "default")

# Request an access token from the token endpoint
body_list = list("grant_type" = "client_credentials", "client_id" = config$client_id, "client_secret" = config$client_secret)
token_url = paste(config$resource, "/identity/connect/token", sep="")
get_auth <- POST(token_url, body = body_list, encode = "form")

if(get_auth$status_code != 200){
  stop(paste("error retrieving access token:", get_auth$status_code, sep=" "))
}

# Process the response and obtain the access token
get_auth_text <- content(get_auth, "text", encoding = "UTF-8")
get_auth_json <- fromJSON(get_auth_text, flatten=TRUE)
access_token <- get_auth_json$access_token 

# Using this access token, obtain a list of streams
streams_req_url = paste(config$resource, "/api/", config$api_version, "/tenants/", config$tenant, "/namespaces/", config$namespace, "/streams", sep = "")
get_streams <- GET(streams_req_url, add_headers(authorization = paste("Bearer", access_token, sep = " ")), accept("text/plain"), content_type_json())

if(get_streams$status_code != 200){
  stop(paste("error retrieving streams:", get_streams$status_code, sep=" "))
}

get_streams_text <- content(get_streams, "text", encoding = "UTF-8")
get_streams_json <- fromJSON(get_streams_text, flatten=TRUE)
get_streams_json$Id #outputs the list of streams


