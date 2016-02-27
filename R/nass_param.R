#' Get metadata about USDA NASS column/header names.
#'
#' Get elements of different parameters.
#'
#' @export
#' @param param A valid parameter value. Available names are:
#' source_desc, sector_desc, group_desc, commodity_desc,
#' class_desc, prodn_practice_desc, util_practice_desc, statisticcat_desc,
#' unit_desc, short_desc, domain_desc, domaincat_desc, agg_level_desc,
#' state_ansi, state_fips_code, state_alpha, state_name, asd_code,
#' asd_desc, county_ansi, county_code, county_name, region_desc, zip_5,
#' watershed_code, watershed_desc, congr_district_code, country_code,
#' country_name, location_desc, year, freq_desc, begin_code, end_code,
#' reference_period_desc, week_ending, load_time, value, and CV %
#' @param token API key
#' @return A list containing metadata as data frame.

nass_param <- function(param = NULL, token = NULL, ...){
  require(httr)
  require(jsonlite)

  token <- check_key(token)
  if (!is.null(param)) {
    url <- paste0("http://quickstats.nass.usda.gov/api/get_param_values/?key=", token, "&param=", param )
    temp <- httr::GET(url)
    tt <- check_response(temp)
    if (is(tt, "list")) {
      all <- data.frame(unlist(tt))
    } else {
      warning("You should enter a correct parameter!")
    }
  } else{
    warning("You should enter a correct parameter!")
  }
  return(all)
}
