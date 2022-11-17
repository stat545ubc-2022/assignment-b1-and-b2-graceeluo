library(datateachr)
library(tibble)

test_that("Test the function 'count.NA' with dataset 'cancer_sample'", {
  expect_equal(count.NA(cancer_sample, "diagnosis"), as_tibble(summarise(cancer_sample, across(diagnosis, ~ sum(is.na(.x))))))
  expect_equal(count.NA(cancer_sample, "radius_mean"), as_tibble(summarise(cancer_sample, across(radius_mean, ~ sum(is.na(.x))))))
  expect_error(count.NA(cancer_sample, 123), "col_name needs to be a string")
  expect_error(count.NA(cancer_sample, "diagnosis_year"), "'diagnosis_year' does not exist in the data")
  expect_true(is_tibble(count.NA(cancer_sample, "diagnosis")))
})

