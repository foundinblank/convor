#' @title Parse Phone Numbers
#'
#' @description Drops all non-numeric characters from phone numbers (and maybe any other strings).
#' @param x Character vector of values to parse.
#' @keywords parse number
#' @export
#' @examples x <- c('(858) 555-1234', '(619) 555-6898', '585-555-5432')
#' parse_phone_number(x)

parse_phone_number <- function(x){
  gsub("[- .)(+]|[a-zA-Z]*:?","", x)
}


#' @title Get Live TDNs On a Specific Date
#'
#' @description For a specified date, this function will return a list of all TDNs from locations created up to that date, and all archived TDNs that were created prior to that date and deleted after that date. Also will cast phone numbers as character type, and remove duplicate TDNs. Requires an active connection to allen_release via connect_allen_release().
#' @param x Date value
#' @keywords live tdn user active
#' @export
#' @examples get_live_tdns('2018-01-01') # Pulls all live TDNs on January 1, 2018.


get_live_tdns <- function(x){
  live_loc <- tbl(allen_release, "locations") %>%
    filter(created_at < x) %>%
    select(phone_number, created_at) %>%
    mutate(phone_number = as.character(phone_number)) %>%
    collect()
  live_arc <- tbl(allen_release, "archived_profiles") %>%
    filter(location_created_at < x) %>%
    filter(location_deleted_at >= x) %>%
    select(phone_number, location_created_at, location_deleted_at) %>%
    mutate(phone_number = as.character(phone_number)) %>%
    rename(created_at = location_created_at,
           deleted_at = location_deleted_at) %>%
    collect()
  bind_rows(live_loc, live_arc) %>%
    group_by(phone_number) %>%
    slice(1) %>%
    ungroup()
}
