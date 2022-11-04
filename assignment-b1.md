assignment-b1
================

# Getting Started

Load the libraries for this assignment:

``` r
library(tidyverse)
library(datateachr)
library(testthat)
```

# Exercise 1: Make a Function & Exercise 2: Document your Function

``` r
# Make the function
count_NA <- function(data, col_name) {
  if(!is.character(col_name)) {
    stop("col_name needs to be a string")
  } else if (!(col_name %in% colnames(data))) {
    stop("'", col_name, "' does not exist in the data")
  } else {
    return(as_tibble(data %>% summarise(across(col_name, ~sum(is.na(.x))))))
  }
}

# Document the function
#' Count the missing values (NA) of a variable in a dataset
#'
#' @description `count_NA` returns the count of missing values (NA) in a specified column `col_name` of a given dataset `data`
#'
#' @param data Dataset to retrieve the specific column from
#' @param col_name Name of the column (string input) to count missing value(s)
#'
#' @return A tibble (of the dimensions 1 x 1) with variable "col_name" and its value of the integer count of missing values (NA) 
```

# Exercise 3: Include examples

Examples using the “cancer\_sample” dataset from the package
“datateachr”

``` r
# Count the missing values of the "diagnosis" and "radius_mean" variables in the "cancer_sample" dataset
count_NA(cancer_sample, "diagnosis")
```

    ## Note: Using an external vector in selections is ambiguous.
    ## ℹ Use `all_of(col_name)` instead of `col_name` to silence this message.
    ## ℹ See <https://tidyselect.r-lib.org/reference/faq-external-vector.html>.
    ## This message is displayed once per session.

    ## # A tibble: 1 × 1
    ##   diagnosis
    ##       <int>
    ## 1         0

``` r
count_NA(cancer_sample, "radius_mean")
```

    ## # A tibble: 1 × 1
    ##   radius_mean
    ##         <int>
    ## 1           0

``` r
# A failed example, as the input is not a string
# The error message of "col_name needs to be a string" will appear
count_NA(cancer_sample, 123)
```

    ## Error in count_NA(cancer_sample, 123): col_name needs to be a string

``` r
# A failed example, as the input is not a column in the "cancer_sample" dataset
# The error message of "'diagnosis_year' does not exist in the data" will appear
count_NA(cancer_sample, "diagnosis_year")
```

    ## Error in count_NA(cancer_sample, "diagnosis_year"): 'diagnosis_year' does not exist in the data

# Exercise 4: Test the Function

``` r
# Three expect statements are used to test the function
test_that("Test the function 'count_NA' with dataset 'cancer_sample'", {
  expect_equal(count_NA(cancer_sample, "diagnosis"), as_tibble(summarise(cancer_sample, across(diagnosis, ~ sum(is.na(.x))))))
  expect_equal(count_NA(cancer_sample, "radius_mean"), as_tibble(summarise(cancer_sample, across(radius_mean, ~ sum(is.na(.x))))))
  expect_error(count_NA(cancer_sample, 123), "col_name needs to be a string")
  expect_error(count_NA(cancer_sample, "diagnosis_year"), "'diagnosis_year' does not exist in the data")
  expect_true(is_tibble(count_NA(cancer_sample, "diagnosis")))
})
```

    ## Test passed 🎉
