##' write frequency table for a factor
#'
#' @param a factor
#' @param b factor
#'
#' @return factor
#' @export
#' @examples
freq_out <- function(x) {
  xdf <- dplyr::data_frame(x)
  dplyr::count(xdf, x)
}
