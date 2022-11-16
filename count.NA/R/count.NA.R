#' @title Count the missing values (NA) of a variable in a dataset
#'
#' @description `count.NA` returns the count of missing values (NA) in a specified column `col_name` of a given dataset `data`
#'
#' @param data Dataset to retrieve the specific column from
#' @param col_name Name of the column (string input) to count missing value(s)
#'
#' @return A tibble (of the dimensions 1 x 1) with variable "col_name" and its value of the integer count of missing values (NA)
#' @importFrom dplyr as_tibble summarise across %>%
#' @export
count.NA <- function(data, col_name) {
  if(!is.character(col_name)) {
    stop("col_name needs to be a string")
  } else if (!(col_name %in% colnames(data))) {
    stop("'", col_name, "' does not exist in the data")
  } else {
    return(as_tibble(data %>% summarise(across(col_name, ~sum(is.na(.x))))))
  }
}
#' @examples
#' library(datateachr)
#' count.NA(cancer_sample, "diagnosis")
#' count.NA(vancouver_trees, "species_name")
