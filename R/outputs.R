#' @title Generate CSV Files in RLA-Friendly Format
#'
#' @description Generates CSV files with CRLF line endings, `""` for `NA` values, and no row numbers. Intended for files to be uploaded to RLA. .txt or .csv endings may be used.
#' @param df Data fame to be written to.
#' @param filename File path and filename to write file to.
#' @keywords csv file text rl rla
#' @export
#' @examples write_csv_rla(billing_df, "~/Desktop/billing_df.txt")
#' write_csv_rla(df, filename)

write_csv_rla <- function(df, filename){
  write.csv(df, filename, eol = "\r\n", row.names = FALSE, na = "\"\"")
}
