if (!require("pacman")) install.packages("pacman", repos = "https://cran.r-project.org", quiet = TRUE)

require("pacman", quietly = TRUE)
p_load("testthat", "xml2")

options(testthat.output_file = ".\\output.xml")
test_results <- testthat::test_dir(path=".\\OCSDataView\\tests\\testthat", reporter="junit")