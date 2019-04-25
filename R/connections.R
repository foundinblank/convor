# Obviously all these needs to be loaded in my.cnf first.

#' @title Connect to Tassolog's ACD database
#'
#' @description Connect to the "acd" database on Tassolog. A [acd] RMariaDB connection should be defined in your my.cnf file.
#' @keywords connect acd
#' connect_acd()
connect_acd <- function() {
  acd <<- DBI::dbConnect(RMariaDB::MariaDB(), group = "acd")
  if (exists("acd")) {
    message("Connected to acd.")
  }
  else{
    message("Connection failed!")
  }
}

#' @title Connect to Tassolog's allen_release database
#'
#' @description Connect to the "allen_release" database on Tassolog. A [allen_release] RMariaDB connection should be defined in your my.cnf file.
#' @keywords connect allen release
#' connect_allen_release()
connect_allen_release <- function() {
  allen_release <<- DBI::dbConnect(RMariaDB::MariaDB(), group = "allen_release")
  if (exists("allen_release")) {
    message("Connected to allen_release.")
  }
  else{
    message("Connection failed!")
  }
}

#' @title Connect to Tassolog's agents_analytics database
#'
#' @description Connect to the "agents_analytics" database on Tassolog. A [agents_analytics] RMariaDB connection should be defined in your my.cnf file.
#' @keywords connect agents analytics
#' connect_agents_analytics()
connect_agents_analytics <- function() {
  agents_analytics <<- DBI::dbConnect(RMariaDB::MariaDB(), group = "agents_analytics")
  if (exists("agents_analytics")) {
    message("Connected to agents_analytics.")
  }
  else{
    message("Connection failed!")
  }
}

#' @title Connect to Tassolog's billing database
#'
#' @description Connect to the "billing" database on Tassolog. A [billing] RMariaDB connection should be defined in your my.cnf file.
#' @keywords connect billing
#' connect_billing()
connect_billing <- function() {
  billing <<- DBI::dbConnect(RMariaDB::MariaDB(), group = "billing")
  if (exists("billing")) {
    message("Connected to billing.")
  }
  else{
    message("Connection failed!")
  }
}

#' @title Connect to Tassolog's grouphead database
#'
#' @description Connect to the "grouphead" database on Tassolog. A [grouphead] RMariaDB connection should be defined in your my.cnf file.
#' @keywords connect grouphead
#' connect_grouphead()
connect_grouphead <- function() {
  grouphead <<- DBI::dbConnect(RMariaDB::MariaDB(), group = "grouphead")
  if (exists("grouphead")) {
    message("Connected to grouphead.")
  }
  else{
    message("Connection failed!")
  }
}

#' @title Connect to Tassolog's reporting database
#'
#' @description Connect to the "reporting" database on Tassolog. A [reporting] RMariaDB connection should be defined in your my.cnf file.
#' @keywords connect reporting
#' connect_reporting()
connect_reporting <- function() {
  reporting <<- DBI::dbConnect(RMariaDB::MariaDB(), group = "reporting")
  if (exists("reporting")) {
    message("Connected to reporting.")
  }
  else{
    message("Connection failed!")
  }
}

#' @title Connect to Tassolog's urd database
#'
#' @description Connect to the "urd" database on Tassolog. A [urd] RMariaDB connection should be defined in your my.cnf file.
#' @keywords connect urd
#' connect_urd()
connect_urd <- function() {
  urd <<- DBI::dbConnect(RMariaDB::MariaDB(), group = "urd")
  if (exists("urd")) {
    message("Connected to urd.")
  }
  else{
    message("Connection failed!")
  }
}

#' @title Connect to Tassolog's allen_release, reporting, and urd databases.
#'
#' @description A convenience function. This invokes the connect_allen_release(), connect_reporting(), and connect_urd() functions.
#' @keywords connect allen release reporting urd
#' connect_big3()
connect_big3 <- function() {
  connect_allen_release()
  connect_reporting()
  connect_urd()
}


#' @title Connect to Snowflake Data Warehouse
#'
#' @description Connect to Snowflake Data Warehouse, our data warehouse. A [convodatawarehouse] odbc connection should be defined in your .odbc.ini file.
#' @keywords connect snowflake
#' connect_snowflake()
connect_snowflake <- function() {
  snowflake <<- RODBC::odbcConnect("convodatawarehouse")
  if (exists("snowflake")) {
    message("Connected to Snowflake.")
  }
  else{
    message("Connection failed!")
  }
}

#' @title Retrieve results from a query to Snowflake
#'
#' @description Will send the query to Snowflake and retrieve results in tidyverse-friendly format (i.e., a tibble with lower-case names).
#' @keywords query snowflake
#' tbl_snowflake()
tbl_snowflake <- function(x) {
  RODBC::sqlQuery(snowflake, x) %>%
    tibble::as_tibble() %>%
    janitor::clean_names()
}

