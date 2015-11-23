This Package is built for Homework8 of STAT547 course to explore the process of building an R package using `devtools()`. The primary skeleton of this package is from [Write your own R Package](http://stat545-ubc.github.io/packages00_index.html) hands on activity, and the aim as it's mentioned in [Homework8](http://stat545-ubc.github.io/hw10_package.html) description is to add more functionality and testing to `foofactors()` initial package.

There work flow of the building a package is well described in [Jenny's Write your own R package](http://stat545-ubc.github.io/hw10_package.html), also I have put my understandings and work flow in a `readme.rmd` for `homework8` here.

### Steps for installing the `foofactors` package

#### 1. Install and load `devtools`

install.packages("devtools") library(devtools) devtools::install\_github("gjahesh/foofactors")

#### 2. Loading foofactors

devtools::library(foofactors)

#### 3. Browsing through the R pacakge structure

1.  Rscripts for functions are in `R` folder
2.  Tests for functions are in the `test` folder
3.  Documentation could be found in DESCRIPTION file and `vignette` folder
