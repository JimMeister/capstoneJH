# capstoneJH - Tools to clean and visualise NOAA data



## Description

The package includes several exported functions to handle NOAA data. The provided data set includes data on earthquakes starting year 2150 B.C. and contains dates, locations, magnitudes, severity (casualties, injuries...) and other details. 

This package handles basic data cleaning using function `eq_clean_data()` and then two types of visualizations. The first is a `ggplot2`-based earthquake timeline of selected earthquakes using `geom_timeline()` and `geom_timeline_label()` with optional usage of `theme_timeline()` function. The second visualization is based on `leaflet` package and shows the earthquakes with some basic parameters on a map.
