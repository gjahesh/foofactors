#'function to write and read data frames to plain text delimited files while
#'retaining factor evels by using writing/reading a companion file'
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
