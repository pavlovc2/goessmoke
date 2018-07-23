#' Extract FRP values from GOES images and calculate emissions
#' 
#' Based on input date and time range, download relevant GOES data,
#' extract FRP values, and calculate emissions. Processing is based 
#' on code provided in the \pkg{goesfire}.
#' 
#' @param start_date Date to begin emissions calculations
#' @param start_time Time on \code{start_date} to begin emissions calculations
#' @param end_date Date to end emissions calculations
#' @param end_time Time on \code{end_date} to end emissions calculations
#' @return Emissions estimates in csv format
#' TODO @examples
#'

goes_emissions <- function(start_date = NULL, start_time = NULL, 
	end_date = NULL, end_time = NULL) {

}