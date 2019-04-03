%This script extracts values from two sheets inside a xlsx file. One
%contains "reference" sea level index points, i.e. not affected by
%subsidence or uplift. The second contains "displaced" sea level index
%points, i.e. potentially affected by post-depositional effects. The
%scripts uses paleo RSL elevations and associated uncertainties to
%calculate the amount of uplift-subsidence of one dataset with respect to
%the other. The calculation is done by re-iterating the difference between
%a random point in ine dataset with respect to a random point in the other
%dataset. The value for each random point is taken as a value within its
%standard deviation.
%Author: Alessio Rovere 25.Mar.2019

%Known bugs and welcome updates
%BUGS 
%N/A

%WELCOME UPDATES
%The approach is rather coarse, it would be interesting to include the time
%dimension in the calculations and compare only data that are actually
%falling into the same time frame.

%%%%%DISCLAIMER%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This MATLAB script is provided "as is", without any warranty of any sort. 
%The author makes no warranties, express ir implied that the algorithms and
%scripts are error-free nor guarantee the accuracy, completeness,
%usefulness, or adequacy available at or through these algorithms and
%scripts. The script should not be relied on for solving a problem whose incorrect 
%solution may result in damage to people or properties. You can use this
%script in such manner at your own risk.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

%read RSL data from excel into tables
Ref = readtable('RSLdata.xlsx','Sheet','Reference');
Sub = readtable('RSLdata.xlsx','Sheet','Subsiding');

%Use MC-like approach to calculate distributions for each data point
for i=1:100000
    %pick a random point in the subsiding data
    t=randi([1,size(Sub,1)]);
    MC_Sub=normrnd(Sub.RSL(t),Sub.RSLUncertainty(t));
    
    %pick a random point in the reference
    k=randi([1,size(Ref,1)]);
    MC_Ref=normrnd(Ref.RSL(k),Ref.RSLUncertainty(k));
    
    %subtract them
    MC_diff(i)=MC_Ref-MC_Sub;
end;

h=histfit(MC_diff)
h(1).FaceColor = 'k';
h(1).FaceAlpha = 0.1;
h(1).LineStyle = 'none';
h(2).Color = [.2 .2 .2];
mean(MC_diff)
std(MC_diff)

xlabel('Difference between RSL data (m)') 
ylabel('Frequency')
