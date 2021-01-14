if (!require("pacman")) install.packages("pacman", repos = "https://cran.r-project.org", quiet = TRUE)
require("pacman", quietly = TRUE)
p_load("testthat", "xml2")

library(testthat)
source('..\\Sample.R')

test_that("authentication was successful", {
  expect_equal(get_auth$status_code, 200)
})

test_that("authentication was successful", {
  expect_equal(get_streams$status_code, 200)
})