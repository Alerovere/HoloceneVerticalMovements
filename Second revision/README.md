# SE Asia Sealevel
This repository contains three folders with data and scripts to analyze/plot them. The content of this folder was used in the following paper: 

> Bender, M., Mann, T., Stocchi, P., Kneer, D., Schöne, T., Illigner, J., Jompa, J., and Rovere, A.: Late Holocene (0–6 ka) sea-level changes in the Makassar Strait, Indonesia, Clim. Past, 16, 1187–1205, https://doi.org/10.5194/cp-16-1187-2020, 2020.

## Folder GIA Models
This folder contains NetCDF files of the 54 GIA models described in the paper (subfolder "All_GIA_Models") and an extract of the sea level data points presented in the paper in xslx format, that serves as template for RSl observations. Three jupyter notebooks are provided to extract and plot both models and data.

### Modern GIA rates calculation
This script extracts RSL data from the models in the folder "GIA Model Plotting scripts/All_GIA_models" and calculates the rate of GIA since the last time step (1000 years for ANICE, 500 years for ICE5g and ICE6g). Then, it calculates the total vertical land movement (VLM) due to GIA. This approximates current GIA-related VLM. 

### GIA maps
This script is designed to plot the Relative Sea Level as predicted by different GIA models, contained into the folder "All_GIA_models".

### RSL versus Time plots
This script is written to extract localized RSL predictions from GIA models and compare them to RSL observations under user-selected uplift or subsidence scenarios.

## Folder RSL density plots
### Sea Level Data plot
This script plots sea level data to highlight spatio-temporal clustering using the seaborn Kernel Density Estimate plot template. Relative Sea Level data is provided via a spreadsheet. Two example spreadsheets are given inside the folder, and were used in Bender et al.

## Folder Vertical crustal movement calculations
### Orthogonal Distance Regression 
This scripts calculates the residual vertical land movement starting from Common Era RSL data, once post-industrial RSL rise and GIA are taken into account. The results are then plotted together with an orthogonal distance regression that represents the crustal movement since the RSL index points were formed. In the submitted version of the paper, the outputs of this scripts were substituted by the outputs of the one below.

### Montecarlo Regression for RSL data
This scripts loads Common Era sea level data and calculates residual vertical land movements (VLM), once post-industrial RSL rise and GIA are taken into account. The calculation of VLM is done by randomply sampling (10<sup>4</sup> times) corrected RSL and age within their error bars and fitting a linear regression through the points. Max, min, average and Standard deviation slopes of regression lines (corresponding to VLM) are then calculated and plotted.

## Acknowledgments
If you use this work, please consider citing this paper:

> Bender, M., Mann, T., Stocchi, P., Kneer, D., Schöne, T., Illigner, J., Jompa, J., and Rovere, A.: Late Holocene (0–6 ka) sea-level changes in the Makassar Strait, Indonesia, Clim. Past, 16, 1187–1205, https://doi.org/10.5194/cp-16-1187-2020, 2020.

This work was supported through grant SEASCHANGE (RO-5245/1-1) from the Deutsche Forschungsgemeinschaft (DFG) as part of the Special Priority Program (SPP)-1889 “Regional Sea Level Change and Society”
