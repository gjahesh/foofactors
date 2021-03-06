% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fgap_coefs.R
\name{fgap_coefs}
\alias{fgap_coefs}
\title{Computes linear and robust regression coefficients for gapminder excerpt data frame.}
\usage{
fgap_coefs(dat, na.rm = FALSE)
}
\arguments{
\item{dat}{data frame gapminder}

\item{na.rm}{NA removal(if any)}
}
\value{
data frame
}
\description{
Computes linear and robust regression coefficients for gapminder excerpt data frame.
}
\examples{
fgap_coefs(gapminder::gapminder)
}

