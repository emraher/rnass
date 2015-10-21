#' Helper functions
#'
#' @keywords internal


# CHECK IF THERE IS A API TOKEN AVAILABLE -------------------------------------
check_key <- function(x){
  tmp <- if(is.null(x)) Sys.getenv("NASS_KEY", "") else x
  if(tmp == "") getOption("nasskey", stop("need an API key for NASS data")) else tmp
}


# CHECK GET RESPONSE FROM PAGE. DECIDE IF COUNT (NUMBER IF COUNT) OR DATA ------
check_response <- function(x){
  if (x$status_code == 400){
    warning(paste0("Bad Request, Error ", x$status_code, ". Parameter value is wrong!"))
  } else if (x$status_code == 413){
    warning(paste0("Limit Exceeded, Error ", x$status_code, ". Too many observations returned!"))
  } else if (x$status_code == 415){
    warning(paste0("Unsupported Media Type, Error ", x$status_code, ". Choose csv, json, or xml!"))
  } else if (x$status_code == 401){
    warning(paste0("Unauthorized, Error ", x$status_code, ". Token is not valid!"))
  } else if(x$status_code == 200){
    # NO ERRORS ------------------------------------------------------------------
    if(x$headers$`content-type` == 'application/json'){
      # JSON COUNT --------------------------------------------------------------
      if (names(content(x)) != "data"){
        res <- content(x, as = 'text', encoding = "UTF-8")
        out <- fromJSON(res, simplifyVector = FALSE)
      } else if (names(content(x)) == "data") {
        # JSON DATA ----------------------------------------------------------------
        out <- names(content(x))
      } else {
        warning("Something happened. Probably you broke internet!")
      }
    } else if (x$headers$`content-type` == 'text/xml') {
      # XML DATA -------------------------------------------------------------------
      out <- names(content(x))
    } else if (x$headers$`content-type` == 'text/csv'){
      # CSV DATA -------------------------------------------------------------------
      out <- names(content(x))
    } else {
      warning("Something happened. Probably you broke internet!")
    }
    return(out)
  }
}