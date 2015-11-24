context("fgap_rw()")

test_that("fgaps_coefs() works fine?!",{
  library(gapminder)
  test_rw <- fgap_rw(gapminder::gapminder)
  expect_is(test_rw,"data.frame")
})

test_that("No parameter passed",{
  expect_error( fgap_rw())
})

test_that("checking the output",{

  test_rw <- fgap_rw(gapminder)
  expect_equal_to_reference(test_rw,"jCoefs.rds")

})

