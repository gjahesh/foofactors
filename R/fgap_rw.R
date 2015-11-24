#'This function takes the `gapmider` excerpt data frame and
#'compares `write.table()` and `saveRDS()` functions on mini data frame that is the result of the `fgap_coefs()`.
#'
#' @param dat gapminder data frame
#' @param na.rm removes NA (if any)
#'
#' @return txt and rds files and a mini data frame
#' @export
#' @examples
#' fgap_rw(gapminder::gapminder)
fgap_rw <- function(dat, na.rm= TRUE){

   # Apply gfgap_coefs()function to the grouped variables country and continent of gapminder data
  gfits<- dat %>%
    group_by(country, continent) %>%
    do(fgap_coefs(.))

  # Reorder factor country based on intercept
  jCoefs <- within(gfits, country <- reorder(country, intercept))

  # define a new variable that holds the original tail end of the data
  countryLevels <- data.frame(original = tail(levels(jCoefs$country)))

  # Write coefficients in a txt file with write.table()
  write.table(jCoefs, "jCoefs.txt", quote = FALSE, sep = "\t", row.names = FALSE)

  # Output the coefficients in an `RDS` format with saveRDS()
  saveRDS(jCoefs, "jCoefs.rds")

  # Read the `jCoefs.txt` file back with read.delim()
  jCoefsTable <- read.delim("jCoefs.txt")

  # Read the 'jCoefs.rds` file with `readRDS()`
  jCoefsRDS <- readRDS("jCoefs.rds")

  # add a new coulmn to countryLevel that's the tail end of the `jCoefs.RDS`
  countryLevels$postRDS <- tail(levels(jCoefsRDS$country))

  # add a new coulmn to countryLevel that's the tail end of the `jCoefs.txt`
  countryLevels$postTable <- tail(levels(jCoefsTable$country))

  #Clean up
  file.remove(list.files(pattern = "^jCoef"))

  # Compare the two files i.e. 'jCoefs.txt' and `jCoefs.RDS` with the original data.
  countryLevels

}
