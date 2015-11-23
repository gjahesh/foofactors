
context("freq_out()")

test_that("freq_out() writes frequency table for factors", {
  library(gapminder)
  library(dplyr)
  test_gfactor <- freq_out(gapminder$country)
  #test the levels of Factor Country
  expect_equal(
    nrow(test_gfactor),nlevels(gapminder$country))

  #test the number of observations of Factor Country
  expect_equal(
    mean(test_gfactor$n), 12
    )
})

test_that("freq_out() returns a data frame",{
  library(gapminder)
  test_country <- freq_out(gapminder$continent)
  expect_is(test_country,"data.frame")
})

test_that("No parameter passed",{
  expect_error( freq_out())
})
