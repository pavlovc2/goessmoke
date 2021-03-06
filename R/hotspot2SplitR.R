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

		# Create fire info 
		fire_info_all <- NULL
		for (irow in 1:nrow(in_df)) {
			event_id <- paste0("id", sample(1e12, 1))
			start_time <- in_df$start_time
			end_time <- in_df$end_time
			fire_area <- in_df$area
			fire_ecoregion <- "western"
			fire_lat <- in_df$lat
			fire_lon <- in_df$lon
			pm25_tot <- in_df$pm25
			pm_tot <- in_df$pm25
			pm25_tot_flam <- in_df$pm25/3
			pm25_tot_smold <- in_df$pm25/3
			pm25_tot_resid <- in_df$pm25/3
			heat_tot <- in_df$heat/3
			heat_tot_flam <- in_df$heat/3
			heat_tot_smold <- in_df$heat/3
			heat_tot_resid <- in_df$heat/3
			# Insert data into template

			# Append irow to fire_info_all
		}

		# Find and replace variable names in document


		# Insert full fire info

		return(out_dat)

	}

}
