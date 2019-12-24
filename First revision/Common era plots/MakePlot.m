%This script extracts values from the supplementary material spreadsheets
%of Kopp et al., 2016 (PNAS) and plots them together original field data
%listed in a spreadsheet (see field data.xlsx).
%Author: Alessio Rovere 25.Mar.2019

%Known bugs and welcome updates
% N/A

%WELCOME UPDATES
% Add different colors for the different RSL proxy sites

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

%read Kopp et al., 2016 (PNAS) supplementary material (models)
GSL_ML21 = readtable('pnas.1517056113.sd03.xls','Sheet','GSL ML21');
GSL_ML22 = readtable('pnas.1517056113.sd03.xls','Sheet','GSL ML22');
GSL_ML11 = readtable('pnas.1517056113.sd03.xls','Sheet','GSL ML11');

%read Kopp et al., 2016 (PNAS) proxy data
RSLdata = readtable('pnas.1517056113.sd02.xls','Sheet','Data');
RSLdatacut = readtable('CUT_pnas.1517056113.sd02.xls','Sheet','Data');

%read proxy data from survey
data = readtable('field data.xlsx','Sheet','Common era');
%convert radiocarbon age to age CE
data.meanAge=1950-data.meanAge;

figure
subplot(2,2,1)
hold on
%Plots proxy data
xpos=RSLdata.Age_2s;
xneg=RSLdata.Age_2s_1;
ypos=(RSLdata.RSL_1s)*1000;
yneg=(RSLdata.RSL_1s_1)*1000;
SLIplot=errorbar(RSLdata.Age_CE_,(RSLdata.RSL_m_)*1000,yneg,ypos,xneg,xpos,'.');
SLIplot.MarkerSize=0.1;
SLIplot.Color = 'k';
SLIplot.CapSize = 0.1;
SLIplot.LineWidth = 1;
%Plots proxy data
xpos=data.ageError;
xneg=data.ageError;
ypos=(data.VerticalError)*1000;
yneg=(data.VerticalError)*1000;
SLIplot=errorbar(data.meanAge,(data.RSL)*1000,yneg,ypos,xneg,xpos,'.');
SLIplot.MarkerSize=0.1;
SLIplot.Color = 'b';
SLIplot.CapSize = 0.1;
SLIplot.LineWidth = 3;

xlabel('Age (Years CE)') 
ylabel('RSL (mm)')
xlim([(min(RSLdata.Age_CE_)-max(RSLdata.Age_2s_1))-30 2000]) 
hold off

subplot(2,2,2)
hold on
%Plots proxy data
xpos=data.ageError;
xneg=data.ageError;
ypos=(data.VerticalError)*1000;
yneg=(data.VerticalError)*1000;
SLIplot=errorbar(data.meanAge,(data.RSL)*1000,yneg,ypos,xneg,xpos,'.');
SLIplot.MarkerSize=0.1;
SLIplot.Color = 'b';
SLIplot.CapSize = 0.1;
SLIplot.LineWidth = 3;
%Plots proxy data
xpos=RSLdatacut.Age_2s;
xneg=RSLdatacut.Age_2s_1;
ypos=(RSLdatacut.RSL_1s)*1000;
yneg=(RSLdatacut.RSL_1s_1)*1000;
SLIplot=errorbar(RSLdatacut.Age_CE_,(RSLdatacut.RSL_m_)*1000,yneg,ypos,xneg,xpos,'.');
SLIplot.MarkerSize=0.1;
SLIplot.Color = 'k';
SLIplot.CapSize = 0.1;
SLIplot.LineWidth = 1;

xlabel('Age (Years CE)') 
ylabel('RSL (mm)')
xlim([(min(RSLdatacut.Age_CE_)-max(RSLdatacut.Age_2s_1))-30 2000]) 
hold off

subplot(2,2,3)
hold on
%Plots proxy data
xpos=data.ageError;
xneg=data.ageError;
ypos=(data.VerticalError)*1000;
yneg=(data.VerticalError)*1000;
SLIplot=errorbar(data.meanAge,(data.RSL)*1000,yneg,ypos,xneg,xpos,'.');
SLIplot.MarkerSize=0.1;
SLIplot.Color = 'b';
SLIplot.CapSize = 0.1;
SLIplot.LineWidth = 2;

%plots Kopp et al., 2018 model ML21
x_data = GSL_ML21.Year;
y_data = GSL_ML21.mm-3.85; %refers to modern MSL
lower_confidence_band_y = y_data-(GSL_ML21.x1s);
upper_confidence_band_y = y_data+GSL_ML21.x1s;
x_plot = [x_data; flipud(x_data)];                                          % Original Column Vectors
y_plot = [lower_confidence_band_y; flipud(upper_confidence_band_y)];        % Original Column Vectors
x_plot = [x_data' fliplr(x_data')];                                         % Transposed To Row Vectors
y_plot = [lower_confidence_band_y' fliplr(upper_confidence_band_y')];       % Transposed To Row Vectors
patch(x_plot, y_plot, 'k', 'FaceAlpha',0.3, 'EdgeColor','none')

%plots Kopp et al., 2018 model ML22
x_data = GSL_ML22.Year;
y_data = GSL_ML22.mm-3.24; %refers to modern MSL;
lower_confidence_band_y = y_data-(GSL_ML22.x1s);
upper_confidence_band_y = y_data+GSL_ML22.x1s;
x_plot = [x_data; flipud(x_data)];                                          % Original Column Vectors
y_plot = [lower_confidence_band_y; flipud(upper_confidence_band_y)];        % Original Column Vectors
x_plot = [x_data' fliplr(x_data')];                                         % Transposed To Row Vectors
y_plot = [lower_confidence_band_y' fliplr(upper_confidence_band_y')];       % Transposed To Row Vectors
patch(x_plot, y_plot, 'k', 'FaceAlpha',0.3, 'EdgeColor','k', 'EdgeAlpha',0.8)

%plots Kopp et al., 2018 model ML11 (commented out as it plots pretty much
%above ML21)
% x_data = GSL_ML11.Year;
% y_data = GSL_ML11.mm-3.84; %refers to modern MSL;
% lower_confidence_band_y = y_data-(GSL_ML11.x1s);
% upper_confidence_band_y = y_data+GSL_ML11.x1s;
% x_plot = [x_data; flipud(x_data)];                                          % Original Column Vectors
% y_plot = [lower_confidence_band_y; flipud(upper_confidence_band_y)];        % Original Column Vectors
% x_plot = [x_data' fliplr(x_data')];                                         % Transposed To Row Vectors
% y_plot = [lower_confidence_band_y' fliplr(upper_confidence_band_y')];       % Transposed To Row Vectors
% figure(1)
% plot(x_data, y_data)
% hold on
% patch(x_plot, y_plot, 'k', 'FaceAlpha',0.3, 'EdgeColor','k', 'EdgeAlpha',0.8)

hold off

xlabel('Age (Years CE)') 
ylabel('RSL (mm)')
xlim([min(data.meanAge)-min(xpos)-100 +inf]) 
ylim([min((data.RSL)*1000)-min(ypos)-100 max((data.RSL)*1000)+max(ypos)+100])

subplot(2,2,4)
worldmap world
geoshow('landareas.shp', 'FaceColor', [0.5 0.5 0.5]);
geoshow(RSLdata.Latitude__N_,RSLdata.Longitude__E_,'DisplayType','point','Marker', '.','MarkerEdgeColor', 'k','MarkerSize',20);
hold on
studysite = readtable('field data.xlsx','Sheet','Location');
geoshow(studysite{1,1},studysite{1,2},'DisplayType','point','Marker', 'h','MarkerFaceColor', 'y','MarkerEdgeColor', 'k','MarkerSize',15);

          