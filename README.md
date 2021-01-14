# Client Credential Flow Sample

**verison:** 1.0.0

[![Build Status](https://dev.azure.com/osieng/engineering/_apis/build/status/product-readiness/OCS/osisoft.sample-ocs-authentication_client_credentials-r?repoName=osisoft%2Fsample-ocs-authentication_client_credentials-r&branchName=main)](https://dev.azure.com/osieng/engineering/_build/latest?definitionId=<id>&repoName=osisoft%2Fsample-ocs-authentication_client_credentials-r&branchName=main)

This client uses the OAuth2/OIDC Client Credential Flow to obtain an access token. See the main OCS Authentication samples page [README](https://github.com/osisoft/OSI-Samples-OCS/blob/master/docs/AUTHENTICATION_README.md) for more information about this flow.

## Requirements

The sample is configured using the file [config.placeholder.yml](config.placeholder.yml). Before editing, rename this file to `config.yml`. This repository's `.gitignore` rules should prevent the file from ever being checked in to any fork or branch, to ensure credentials are not compromised.

Replace the placeholders in the `config.yml` file with your Tenant Id, Namespace Id, Client Id and Client Secret, and the current Api Version.

Developed against R version 4.0.3

## Running the sample

### Prerequisites

- Register a Client Credential client in OCS.
- Replace the placeholders in the `appsettings.json` file with your Tenant Id, Client Id, and Client Secret obtained from registration.
- [Download R](https://cran.r-project.org/mirrors.html)
- The sample uses the following three R libraries, however they will be installed if missing
  - [httr](https://cran.r-project.org/web/packages/httr/index.html)
  - [jsonlite](https://cran.r-project.org/web/packages/jsonlite/index.html)
  - [config](https://cran.r-project.org/web/packages/config/index.html)
- The automated test uses the following library:
  - [testthat](https://cran.r-project.org/web/packages/testthat/index.html)

### Using Visual Studio

- Load the .csproj
- Rebuild project
- Run it
  - If you want to see the token and other outputs from the program, put a breakpoint at the end of the main method and run in debug mode

### Using Command Line

- Make sure you have the install location of dotnet added to your path
- Run the following command from the location of this project:

```shell
dotnet run
```

## Running the automated test

### Test Using Visual Studio

- Load the .csproj from the ClientCredentialFlowTest directory above this in Visual Studio
- Rebuild project
- Open Test Explorer and make sure there is one test called Test1 showing
- Run the test

### Test Using Command Line

- Make sure you have the install location of dotnet added to your path
- Run the following command from the location of the ClientCredentialFlowTest project:

```shell
dotnet test
```

---

Tested against DotNet 3.1.

For the general steps or switch languages see the Task [ReadMe](../../)  
For the main OCS page [ReadMe](https://github.com/osisoft/OSI-Samples-OCS)  
For the main samples page on master [ReadMe](https://github.com/osisoft/OSI-Samples)


required pacakges:
install.packages("httr")
install.packages("jsonlite")
install.packages("config")

usethis::use_testthat()
testthis::use_integration_tests()

testthis::test_integration()