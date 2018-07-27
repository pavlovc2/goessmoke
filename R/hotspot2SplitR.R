#' Convert GOES-16 hotspot data to input format for dispersion modeling
#'
#' This function reformats csv data to the required formatting for 
#' dispersion modeling, either data frame or json.
#'
#' @param in_df data.frame. Prepared GOES-16 hotspot data.
#' @param out_format string. "df" for data.frame or "json".
#' @param config_file string. Path to input config_file for HYSPLIT run
#' @return The desired output format to be input to the dispersion model

hotspot2disp <- function(in_df, out_format, config_file) {
	config <- read.csv(config_file)
	if(nrow(config) != 1) {
		stop("Error: Incorrect number of rows in config_file. 
			Expect 1 header row and one config row.")
	}
	if (out_format == "df") {
		# TODO: Calculate SEV plume rise
		plume_height <- 

		# TODO Calculate range based on max distance from fire

		# Create data frame
		out_dat <- data.frame(
			rate = 
			duration = 
			fire_start_day = 
			fire_start_hour = 
			pdiam = 1,
			density = 1,
			shape_factor = 1,
			range = c(),
			division = c(),
			lat = in_df$lat
			lon = in_df$lon
			height = plume_height
			duration = config$disphr
			start_day = as.Date(disp_start) # TODO: Finalize timezone handling
			start_hour = format(disp_start, "%H")
			direction = "forward",
			met_type = "hrrr")

		# Return data.frame
		return(out_dat)


	} else if (out_format == "json") {
		# TODO: Convert templatejson to internal data as in:
		# http://r-pkgs.had.co.nz/data.html

		# Check all required variables are defined
		required_vars <- c("grdlatne","grdlonne", "grdlatsw",
			"grdlonsw", "grdspace", "disphr", "disp_out_dir", "disp_start", 
			"export_out_dir", "met_dat_index", "met_dir", "viz_data_dir",
			"viz_img_dir", )
		if (!all(required_vars %in% names(config))) {
			missing_vars <- required_vars[required_vars %in% names(config)]
			stop(paste0("Error: Required variables not included", paste(missing_vars, collapse = ", ")))
		}

		# Assign config variables
		for (col in names(config)) {
			assign(col, config[[col]])
		}
		# Fire inputs 
		firecnt <- nrow(in_df)
		
		# TODO: Parse in_df to json fire info
		fireinfoall <- jsonlite::toJSON()

		# Run ID
		trunid <- UUIDgenerate()

		# Today's date
		today_dat <- as.Date(Sys.time())

		# Find and replace variable names in document


	}

}
