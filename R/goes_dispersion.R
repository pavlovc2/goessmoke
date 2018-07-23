#' HYSPLIT dispersion of smoke
#'
#' Run HYSPLIT dispersion model using emissions from GOES fires from
#' \code{goes_emissions}
#' @param 

# To convert HYSPLIT output to netCDF, run:
#./hysplit2netcdf -igrid_1--disp\(forward\)-17-01-01-09-lat_38.5145_long_-122.68-height_100-6h -ogrid.nc -x1000000.0 -d1 -l-1 working_dir=~/Downloads/
# Above requires hysplit2netcdf, which seems only to be available in Linux. Condsider running in docker