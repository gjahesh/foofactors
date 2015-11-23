#' Computes linear and robust regression coefficients for gapminder excerpt data frame.
#'
#' @param dat data frame gapminder
#' @param na.rm NA removal(if any)
#'
#' @return data frame
#' @export
#' @import dplyr
#' @import gapminder
#' @import robustbase
#' @examples
#' fgap_coefs(gapminder::gapminder)
fgap_coefs <- function(dat,na.rm = FALSE){
  j_fit    <- lm(lifeExp~ I(year - min(dat$year)), dat)
  j_coef   <- coef(j_fit)
  r_fit    <- lmrob(lifeExp ~ I(year - min(dat$year)), dat)
  r_coef   <- coef(r_fit)
  gCoefs   <- setNames(data.frame(t(j_coef),t(r_coef)),
           c("intercept","slope","r_intercept","r_slope"))
}
