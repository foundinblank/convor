
<!-- README.md is generated from README.Rmd. Please edit that file -->
convor <img src="man/figures/logo.png" align="right" height=140/>
=================================================================

The goal of convor is to make data science at Convo easier!

### Installation

You can install the released version of convor from [GitHub](https://github.com/foundinblank/convor) with:

``` r
devtools::install_github("foundinblank/convor")
```

### Connections

Chiefly this package provides easy ways to connect to Convo's databases using the `RMariaDB` package. You'll need to configure that and your `my.cnf` file on your local machine.

``` r
# To connect to reporting database
convor::connect_reporting()
#> Connected to reporting.
```

### Data Munging

`parse_phone_number()` quickly strips all non-numeric characters from phone numbers.

`get_live_tdns()` will pull a list of all TDNs that were "live" - that is, in our `locations` table - on a specific date. Useful for historical customer base comparisons.
