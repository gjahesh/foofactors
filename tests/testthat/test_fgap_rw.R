context("fgap_rw()")

test_that("fgaps_coefs() works fine?!",{
  library(gapminder)
  test_gcoefs <- fgap_rw(gapminder)
  expect_is(test_gcoefs,"data.frame")
})

test_that("No parameter passed",{
  expect_error( fgap_rw())
})
