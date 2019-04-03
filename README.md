# HoloceneVerticalMovements

This script extracts values from two sheets inside a xlsx file. One contains "reference" sea level index points, i.e. not affected by subsidence or uplift. The second contains "displaced" sea level index points, i.e. potentially affected by post-depositional effects. The scripts uses paleo RSL elevations and associated uncertainties to calculate the amount of uplift-subsidence of one dataset with respect to
the other. The calculation is done by re-iterating the difference between a random point in ine dataset with respect to a random point in the other dataset. The value for each random point is taken as a value within its standard deviation.

WELCOME UPDATES
The approach is rather coarse, it would be interesting to include the time dimension in the calculations and compare only data that are actually falling into the same time frame.
