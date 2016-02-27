#' Get data from the USDA NASS data query.
#'
#' Data request will not return more than 50,000 records/rows.
#' It is better to check count of records using nass_count()
#'
#' @export
#'
#' @param source_desc           See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param sector_desc           See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param group_desc            See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param commodity_desc        See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param class_desc            See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param prodn_practice_desc   See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param util_practice_desc    See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param statisticcat_desc     See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param unit_desc             See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param short_desc            See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param domain_desc           See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param domaincat_desc        See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param agg_level_desc        See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param state_ansi            See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param state_fips_code       See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param state_alpha           See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param state_name            See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param asd_code              See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param asd_desc              See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param county_ansi           See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param county_code           See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param county_name           See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param region_desc           See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param zip_5                 See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param watershed_code        See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param watershed_desc        See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param congr_district_code   See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param country_code          See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param country_name          See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param location_desc         See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param year                  See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param freq_desc             See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param begin_code            See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param end_code              See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param reference_period_desc See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param week_ending           See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param load_time             See USDA webpage for explanations. You can use nass_param() to see the values.
#' @param token API key
#' @return A data frame

nass_data <- function(source_desc = NULL,
                       sector_desc = NULL,
                       group_desc = NULL,
                       commodity_desc = NULL,
                       class_desc = NULL,
                       prodn_practice_desc = NULL,
                       util_practice_desc = NULL,
                       statisticcat_desc = NULL,
                       unit_desc = NULL,
                       short_desc = NULL,
                       domain_desc = NULL,
                       domaincat_desc = NULL,
                       agg_level_desc = NULL,
                       state_ansi = NULL,
                       state_fips_code = NULL,
                       state_alpha = NULL,
                       state_name = NULL,
                       asd_code = NULL,
                       asd_desc = NULL,
                       county_ansi = NULL,
                       county_code = NULL,
                       county_name = NULL,
                       region_desc = NULL,
                       zip_5 = NULL,
                       watershed_code = NULL,
                       watershed_desc = NULL,
                       congr_district_code = NULL,
                       country_code = NULL,
                       country_name = NULL,
                       location_desc = NULL,
                       year = NULL,
                       freq_desc = NULL,
                       begin_code = NULL,
                       end_code = NULL,
                       reference_period_desc = NULL,
                       week_ending = NULL,
                       load_time = NULL,
                       token = NULL){
  token <- check_key(token)


  args <- list(source_desc = source_desc,
               sector_desc = sector_desc,
               group_desc = group_desc,
               commodity_desc = commodity_desc,
               class_desc = class_desc,
               prodn_practice_desc = prodn_practice_desc,
               util_practice_desc = util_practice_desc,
               statisticcat_desc = statisticcat_desc,
               unit_desc = unit_desc,
               short_desc = short_desc,
               domain_desc = domain_desc,
               domaincat_desc = domaincat_desc,
               agg_level_desc = agg_level_desc,
               state_ansi = state_ansi,
               state_fips_code = state_fips_code,
               state_alpha = state_alpha,
               state_name = state_name,
               asd_code = asd_code,
               asd_desc = asd_desc,
               county_ansi = county_ansi,
               county_code = county_code,
               county_name = county_name,
               region_desc = region_desc,
               zip_5 = zip_5,
               watershed_code = watershed_code,
               watershed_desc = watershed_desc,
               congr_district_code = congr_district_code,
               country_code = country_code,
               country_name = country_name,
               location_desc = location_desc,
               year = year,
               freq_desc = freq_desc,
               begin_code = begin_code,
               end_code = end_code,
               reference_period_desc = reference_period_desc,
               week_ending = week_ending,
               load_time = load_time)

  url <- paste0("http://quickstats.nass.usda.gov/api/api_GET/?key=", token, "&")

  if (!is.null(args)) {
    url <- httr::modify_url(url, query = args)
    url <- paste0(url, "&format=json")
    temp <- httr::GET(url)
    tt <- check_response(temp)

    if (is(temp$headers, "list")){
      data <- jsonlite::fromJSON(url)
      data <- data[['data']]
      data$Value <- gsub(",", "", data$Value, ignore.case = TRUE)
      data$Value <- as.numeric(data$Value)
    } else {
      warning("You should enter a correct parameter!")
    }
  } else {
    warning("You should enter a correct parameter!")
  }

  return(data)
}
