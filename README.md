# goessmoke
Smoke dispersion modeling for GOES-16 fire detections 

## Purpose
This repository provides simple wrappers to model smoke from wildfires detected by GOES-16

## Dependancies
The package requires the SplitR package to run the HYSPLIT dispersion model. The package is not avaialble on CRAN and can be installed using: 
```devtools::install_github("rich-iannone/SplitR")```
Depending on the development cycle, additional features, such as HRRR data download, may only be available in the pavlovc2 fork, installed using:
```devtools::install_github("pavlovc2/SplitR")```

Depending on the meterological data desired for HYSPLIT dispersion, you may need to download the desired meteorological data. Suggested data sets include:
[NOAA High Resolution Rapid Refresh](https://rapidrefresh.noaa.gov/hrrr/)

## Installation
```devtools::install_github("pavlovc2/goessmoke")```

## Usage
