if (!require("pacman")) install.packages("pacman", repos = "https://cran.r-project.org", quiet = TRUE)
if (!require("testthat")) install.packages("testthat", repos = "https://cran.r-project.org", quiet = TRUE)
if (!require("config")) install.packages("config", repos = "https://cran.r-project.org", quiet = TRUE)
if (!require("httr")) install.packages("httr", repos = "https://cran.r-project.org", quiet = TRUE)
if (!require("jsonlite")) install.packages("jsonlite", repos = "https://cran.r-project.org", quiet = TRUE)

install.packages("OCSDataView", repos=NULL, type="source")

require("pacman", quietly = TRUE)
p_load("testthat", "xml2")

options(testthat.output_file = ".\\output.xml")
test_results <- testthat::test_dir(path=".\\OCSDataView\\tests\\testthat", reporter="junit")
