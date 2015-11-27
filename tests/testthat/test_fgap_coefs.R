context("fgap_coefs()")

test_that("fgaps_coefs() returns a data frame",{
  library(gapminder)
  test_gcoefs <- fgap_coefs(gapminder)
  expect_is(test_gcoefs,"data.frame")
})

test_that("No parameter passed",{
  expect_error( freq_out())
})

test_that("Number of observations of fgpas_coefs()",{
 library(gapminder)
 library(robustbase)
 library(dplyr)
 test_gcoefs <- fgap_coefs(gapminder)
  expect_true(is.list(test_gcoefs))
  expect_equivalent(length(test_gcoefs), 4)
})
