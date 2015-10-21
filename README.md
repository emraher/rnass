rnass
=======

```{r echo=FALSE}
knitr::opts_chunk$set(
  comment = "#>",
  warning = FALSE,
  message = FALSE
)
```

[![Build Status](https://api.travis-ci.org/emraher/rnass.png)](https://travis-ci.org/emraher/rnass)

## Interface to USDA NASS QuickStats

## WARNING
This is my first attempt for an R package. I heavily benefited from [ropensci/rusda](https://github.com/ropensci/rusda) and [ropensci/rnoaa](https://github.com/ropensci/rnoaa). 

## Description

From USDA/NASS:

"The National Agricultural Statistics Service (NASS) offers Quick Stats, an on-line database containing official published aggregate estimates related to U.S. agricultural production. NASS develops these estimates from data collected through:

    1) hundreds of sample surveys conducted each year covering virtually every aspect of U.S. agriculture
    2) the Census of Agriculture conducted every five years providing state- and county-level aggregates

The Quick Stats application programming interface (API) provides direct access to the statistical information in the Quick Stats database. We invite developers to use this API and to give us feedback so we can continue to improve it." 

`rnass` is an attempt to an interface to Quick Stats. Note that in order to use this package you will need and API key. Request your key from [here](http://quickstats.nass.usda.gov/api).

## Get rnass

```{r eval=FALSE}
install.packages("devtools")
devtools::install_github("emraher/rnass")
```

And load `rnass`

```{r}
library("rnass")
```

## Example 1
Get count

```{r}
count <- nass_count(source_desc = "SURVEY", token = "YOUR API KEY")
count <- nass_count(source_desc = "SURVEY", year = "1990", token = "YOUR API KEY")
```



## Example 2
Get parameters

```{r}
parameters <- nass_param(param = "source_desc", token = "YOUR API KEY")
parameters <- nass_param(param = "region_desc", token = "YOUR API KEY")
```

## Example 3
Get data

```{r}
data <- nass_data(source_desc = "SURVEY", sector_desc = "CROPS", commodity_desc = "CORN", state_name = "KANSAS", year = "2014", token ="YOUR API KEY" )
```


