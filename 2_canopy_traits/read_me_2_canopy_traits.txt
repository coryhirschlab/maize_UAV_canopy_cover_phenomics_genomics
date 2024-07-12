Julian Cooper
Hirsch Lab
University of Minnesota

Organization and contents of 2_canopy_traits
Performed in R, this step takes raw canopy cover values for each flight-year, performs QC and formatting, calculates loess predicted values, and extracts growth rates

2018-2021: QC, formatting, and loess predictions for individual years
	- R markdown file
	- data: 
		- plot_order:Plot names and boundary coordinates
		- field_data: Stand counts, experimental design info, and plots with weeds (2018 and 2020)
		- data_processing: Individual data files from each step of data wrangling in R markdown file
		- results: Final df with all environments and traits

combined_years: Merge all individual years and extract secondary traits
	- R markdown file combining results from each environment and calculating growth rates and other secondary traits not included in the final manuscript 
	- results: Final df with loess values and traits for future analyses, figures for growth curves and traits
	- data:
		- data_processing: Intermediary data files for loess merging and trait extraction
		- characterization: Pedigree and RM for Wisconsin Diversity Panel

weather_data: Weather data and GDD conversions for each year
	- saint_paul_weather_station
		- 2018-2021.xls: Dates and min/max temps
		- Date_to_GDD_StPaul_2018-2021: UAV flight dates and cumulative GDD
		- 30_yr_averages: Comparison of 2018-2021 temp and precipitation to 30 year St. Paul averages
		- raw_downloads: Temp and precipitation data for 2018-2021
	- rain.csv: Precipitation events at GDD of interest for 2018-2021
	- weather_300_1650_GDD_all_years.csv: All relevant weather at GDD of interest for 2018-2021
		


