if (!require("pacman")) install.packages("pacman", repos = "https://cran.r-project.org", quiet = TRUE)
update.packages("testthat", repos = "https://cran.r-project.org", quiet = TRUE)

require("pacman", quietly = TRUE)
p_load("testthat", "xml2")

options(testthat.output_file = ".\\output.xml")
test_results <- testthat::test_local(path=".\\OCSDataView", reporter="junit")
