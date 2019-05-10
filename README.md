# SE Asia Sealevel

This repository contains two zipped folders. 

The folder Subsidence contains the data and matlab script used to make Figure 6 of Bender et al. (submitted). The script extracts values from two sheets inside a xlsx file, that can be changed to plot data at other areas. One sheet contains "reference" sea level index points, i.e. not affected by subsidence or uplift. The second contains "displaced" sea level index points, i.e. potentially affected by post-depositional effects. The scripts uses paleo RSL elevations and associated uncertainties to calculate the amount of uplift-subsidence of one dataset with respect to the other. The calculation is done by re-iterating the difference between a random point in one dataset with respect to a random point in the other dataset. The value for each random point is taken as a value within its standard deviation.
WELCOME UPDATES - This approach is rather coarse, it would be interesting to include the time dimension in the calculations and compare only data that are actually falling into the same time frame.

The folder Common era plots contains the scripts and data used to build Figure 7 of Bender et al. (submitted). The script plots field data from an excel file sheet against data and models from Kopp et al., 2017 PNAS, and a map showing Common era data globally compared with common era data at the location of interest (coordinates are given in the "Location" sheet of the "Fiel data" excel file).
If you use this script, please add a reference to Kopp, R.E., Kemp, A.C., Bittermann, K., Horton, B.P., Donnelly, J.P., Gehrels, W.R., Hay, C.C., Mitrovica, J.X., Morrow, E.D., Rahmstorf, S., 2016. Temperature-driven global sea-level variability in the Common Era. PNAS 1–8. https://doi.org/10.1073/pnas.1517056113


If you use these scripts, please cite the following paper:
Bender, M., Mann, T., Stocchi, P., Kneer, D., Schöne, T., Jompa, J., Rovere, A. (submitted). Holocene and Common Era sea level changes in the Makassar Strait, Indonesia.


