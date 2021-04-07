# Data View Retrieval in R

**Version:** 1.0.0

[![Build Status](https://dev.azure.com/osieng/engineering/_apis/build/status/product-readiness/osisoft.sample-ocs-data_views_r-r?branchName=main)](https://dev.azure.com/osieng/engineering/_build/latest?definitionId=3168&branchName=main)

This sample consists of an [R Package](OCSDataView) and an [R Script](Sample.R). 

The package, [OCSDataView](OCSDataView), is intended to be a bare bones client library currently capable of two actions:
  1. Authenticating to OSIsoft Cloud Services (OCS) with client credentials (client ID and client secret), returning an access token
  1. Querying interpolated data from a data view, returning it as a data frame. 
  
This is expected to be the most common way for OCS data to be used within R, and further features can be added in the future based on customer feedback.

The R script, [Sample.R](Sample.R), is a standalone script that demonstrates usage of the library's authentication function as well as retrieval of interpolated data from a data view and storing it into an R data frame. This data frame could then be used as desired within R.

**NOTE:** At this time, the package is not hosted on [CRAN](https://cran.r-project.org/) or any other R Package repository, and there are currently no plans to publish it outside of this GitHub sample.  
If the package is not installed locally, the source code for the functions could be used as reference when building a custom script performing the same, or similar, actions. The source code is located in [the package's R folder](OCSDataView\R)

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
The data we are using is available in our sample-ocs-bulk_upload-dotnet repository SampleCollections [folder](https://github.com/osisoft/sample-ocs-bulk_upload-dotnet/tree/master/SampleCollections/DataViewWind). The steps to upload this data are included in that folder. This sample also skips over the exercise of creating the data view, as this is included in the data that you can upload. To see how to create a Data View programmatically, please look at our other samples [here](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/DATA_VIEWS_README.md).

This sample data is similar to what you might have from a site where the data has unexpected values and not every turbine behaves exactly the same. The data is only for 1 day. Repeating this exercise but using more days of data would give you a better prediction.

### Install the Library

#### Using R Studio
- Clone this repository to a local drive
- Open [OCSDataView.Rproj](OCSDataView\OCSDataView.Rproj) in RStudio
- Select `Build` > `Load All` (Ctrl + Shift + L)
- Select `Build` > `Install and Restart` (Ctrl + Shift + B)

#### Using tar.gz file
Note: Following version control best practices, the package's .tar.gz file is not hosted on GitHub, but can be built locally from the source code.
- Clone this repository to a local drive on a machine with RStudio
- Open the [OCSDataView\OCSDataView.Rproj](OCSDataView\OCSDataView.Rproj) in R Studio
- Select `Build` > `Build Source Package`
- Confirm that `OCSDataView_{version}.tar.gz` is now located in the sample directory
- Copy this file to any machine that would like to use the library
- Install the library using `install.packages` command:
  - `install.packages(path_to_file, repos = NULL, type="source")`
- Note: If installing the library from its .tar.gz file is desired, please provide `samples@osisoft.com` with details on the use case and feedback so we can discuss alternate hosting platforms for this file (such as [CRAN](https://cran.r-project.org/)).


#### Run the Sample
- Open [Sample.R](Sample.R) and set the data view configuration to point to the desired data view and time
  - By default, this sample is pointing to the bulk upload data view in the time range that contains data
  - If this sample is being used to retrieve other data, change this section's configuration accordingly
- Step through [Sample.R](Sample.R) and confirm the data frame is successfully created

## Running the automated test

### Test Using RStudio

The unit tests for this sample were built using [testthat](https://cran.r-project.org/web/packages/testthat/index.html).
- The authentication test confirms that a token of non-trivial length is returned
- The data view interpolated data test confirms that the correct data is received for the specified time period. This is done by obtaining the data frame from the library, then using the [all.equal](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/all.equal) function to compare it against a data frame generated from a locally-stored csv representing the "correct" answer. This style of test ensures that data retrieval and pagination are working.

To run the automated tests:
- Open the library in RStudio
- Prepare the `sampleoutput.csv` for comparison (this repo's .gitignore prevents any sampleoutput.csv file from being checked in)
  - If using Wind Turbine Data
    - Rename the provided [sampleoutput_placeholder.csv](sampleoutput_placeholder.csv) file to `sampleoutput.csv`
    - Confirm that the [Bulk Upload Sample](https://github.com/osisoft/sample-ocs-bulk_upload-dotnet) has been run and the necessary data and data view are in your OCS Namespace
  - If using a different data set
    - Obtain a csv of the data view output for this period using a tool of your choice
      - For example, use this sample to generate a data frame, visually inspect it for accuracy, then save it to csv using [write.csv](https://www.rdocumentation.org/packages/AlphaPart/versions/0.8.1/topics/write.csv)
    - Save this csv as `sampleoutput.csv` in the sample's root folder
- Replace the values prefixed with `test_only_` in the `config.yml` file as necessary.
  - Note: The placeholder file preloads these data view values for use with the [Bulk Upload Sample](https://github.com/osisoft/sample-ocs-bulk_upload-dotnet) wind turbine data
- Execute the tests in the R terminal
  - library(devtools)
  - use_testthat
  - test()

---

Tested against R 4.0.3

For the main OCS samples page [ReadMe](https://github.com/osisoft/OSI-Samples-OCS)  
For the main OSIsoft samples page [ReadMe](https://github.com/osisoft/OSI-Samples)
