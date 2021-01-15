if (!require("pacman")) install.packages("pacman", repos = "https://cran.r-project.org", quiet = TRUE)
require("pacman", quietly = TRUE)
p_load("testthat", "xml2")

#Path to the test folder
#For the automated build, this must be ".", if errors occur, try specifying the full path (i.e. from C:\)
path <- "."
path <- "C:\\Users\\kduffy\\Documents\\readiness\\github\\githubdesktop\\sample-ocs-authentication_client_credentials-r\\OCSClientCredsAuth\\tests"

options(testthat.output_file = paste(path, "\\output.xml", sep = ""))
test_results <- test_dir(path, env = test_env(), reporter="junit")