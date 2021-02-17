# Data View Retrieval in R

**verison:** 1.0.0

[![Build Status](https://dev.azure.com/osieng/engineering/_apis/build/status/product-readiness/OCS/osisoft.sample-ocs-authentication_client_credentials-r?repoName=osisoft%2Fsample-ocs-authentication_client_credentials-r&branchName=main)](https://dev.azure.com/osieng/engineering/_build/latest?definitionId=<id>&repoName=osisoft%2Fsample-ocs-authentication_client_credentials-r&branchName=main)

This sample is intended to be a bare bones client library capable of authenticating to OSIsoft Cloud Services (OCS) with client credentials (client ID and client secret), then obtaining interpolated data from a data view. This is expected to be the most common way for OCS data to be used within R, and further features can be built out in the future based on feedback.

The library can be installed and invoked as is, or the underlying code can be used in a stand alone script as needed.

[Sample.R](Sample.R) is a standalone script that demonstrates usage of the library's authentication function as well as retrieval of interpolated data from a data view and storing it into an R data frame. This data frame could then be used as desired within R.

## Requirements

[Sample.R](Sample.R) is configured using the file [config.placeholder.yml](config.placeholder.yml). Before editing, rename this file to `config.yml`. This repository's `.gitignore` rules should prevent the file from ever being checked in to any fork or branch, to ensure credentials are not compromised.

Replace the placeholders in the `config.yml` file with your Tenant Id, Namespace Id, Client Id and Client Secret, and the current Api Version.

Developed against R version 4.0.3

## Running the sample

### Prerequisites

- Register a Client Credential client in OCS.
- Replace the placeholders in the `config.yml` file with your Tenant Id, Client Id, and Client Secret obtained from registration.
- [Download R](https://cran.r-project.org/mirrors.html)
- [Sample.R](Sample.R) and the library use the following three R libraries, however they will be installed if missing
  - [httr](https://cran.r-project.org/web/packages/httr/index.html)
  - [jsonlite](https://cran.r-project.org/web/packages/jsonlite/index.html)
  - [config](https://cran.r-project.org/web/packages/config/index.html)
- The automated test uses the following library:
  - [testthat](https://cran.r-project.org/web/packages/testthat/index.html)

### (Optional) Write Sample Data to OCS and Create the Data View
The data we are using is available in our sample-ocs-bulk_upload-dotnet repository SampleCollections [folder](https://github.com/osisoft/sample-ocs-bulk_upload-dotnet/tree/master/SampleCollections/DataViewWind). The steps to upload this data are included in that folder. This sample also skips over the exercise of creating the data view, this is included in the data that you can upload. To see how to create a Data View programmatically, please look at our other samples [here](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/DATA_VIEWS_README.md).

This sample data is similar to what you might have from a site where the data has unexpected values and not every turbine behaves exactly the same. The data is only for 1 day. Repeating this exercise but using more days of data would give you a better prediction.

### Using R Studio

#### Install the Library
- Open [OCSDataView.Rproj](OCSDataView\OCSDataView.Rproj) in RStudio
- Select `Build` > `Load All` (Ctrl + Shift + L)
- Select `Build` > `Install and Restart` (Ctrl + Shift + B)

#### Run the Sample
- Open [Sample.R](Sample.R) and set the data view configuration to point to the desired data view and time
  - By default, this sample is pointing to the bulk upload data view in the time range that contains data
  - If this sample is being used to retrieve other data, change this section's configuration accordingly
- Step through [Sample.R](Sample.R) and confirm the data frame is successfully created

## Running the automated test

### Test Using RStudio

- Open the library in RStudio
- Confirm the config.yml file has the `testing_only` configuration items filled in
- Execute the tests in the terminal
  - library(devtools)
  - use_testthat
  - test()

---

Tested against R 4.0.3

For the main OCS page [ReadMe](https://github.com/osisoft/OSI-Samples-OCS)  
For the main samples page on master [ReadMe](https://github.com/osisoft/OSI-Samples)
