#'This function shows how takes the `gapmider` excerpt data frame and 
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

  gfits<- dat %>%
    group_by(country, continent) %>%
    do(fgap_coefs(.))

  jCoefs <- within(gfits, country <- reorder(country, intercept))
  countryLevels <- data.frame(original = tail(levels(jCoefs$country)))
  write.table(jCoefs, "jCoefs.txt", quote = FALSE, sep = "\t", row.names = FALSE)
  saveRDS(jCoefs, "jCoefs.rds")
  jCoefsTable <- read.delim("jCoefs.txt")
  jCoefsRDS <- readRDS("jCoefs.rds")
  countryLevels$postRDS <- tail(levels(jCoefsRDS$country))
  countryLevels$postTable <- tail(levels(jCoefsTable$country))
  countryLevels
}
