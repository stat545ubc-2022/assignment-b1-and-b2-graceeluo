
<!-- README.md is generated from README.Rmd. Please edit that file -->

# count.NA

<!-- badges: start -->

<!--badges: end -->

The goal of count.NA is to count the missing values (NA) in a specified
column `col_name` of a given dataset `data`.

## Installation

You can install the development version of count.NA from \[GitHub\]
(<https://github.com/>) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-graceeluo/count.NA")
#> Downloading GitHub repo stat545ubc-2022/assignment-b1-and-b2-graceeluo@HEAD
#> * checking for file ‘/private/var/folders/th/vq9zt5511b924513_f35jcrr0000gn/T/Rtmpz6l9th/remotes1216ec9c76c7/stat545ubc-2022-assignment-b1-and-b2-graceeluo-a3143fb/count.NA/DESCRIPTION’ ... OK
#> * preparing ‘count.NA’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘count.NA_0.0.0.9000.tar.gz’
```

## Example

This is a basic example using the column ‘diagnosis’ from the
‘cancer\_sample’ dataset:

``` r
library(count.NA) #load in the package
library(datateachr) #load in example datasets
count.NA(cancer_sample, "diagnosis")
#> # A tibble: 1 × 1
#>   diagnosis
#>       <int>
#> 1         0
```
