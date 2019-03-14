#' @title Load URD Users file
#'
#' @description Will read in the newest Users-M-DD-YYYY.xlsx file downloaded from RoulkaLoube's URD portal, and clean up dates/fields. You must have downloaded the file already and it must be in the `~/Downloads` folder.
#' @keywords rl rla urd xlsx xls
#' @export
#' @examples load_urd_users()
#' load_urd_users()

load_urd_users <- function(){
  # Get URD filename
  urd_filenames <- list.files("~/Downloads/", pattern = "Users_(.*).xlsx")
  the_filename <- urd_filenames[length(urd_filenames)]

  # Read in URD file
  readxl::read_xlsx(glue::glue("~/Downloads/{the_filename}")) %>%
    janitor::clean_names() %>%
    mutate_at(vars(registration_date, termination_date), lubridate::mdy_hms)
}
