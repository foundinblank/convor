#' @title Parse Phone Numbers
#'
#' @description Drops all non-numeric characters from phone numbers (and maybe any other strings).
#' @param x Character vector of values to parse.
#' @keywords parse number
#' @export
#' @examples
#' parse_phone_number()

parse_phone_number <- function(x){
  gsub("[- .)(+]|[a-zA-Z]*:?","", x)
}
