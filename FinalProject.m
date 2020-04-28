%% Final Project
%by Anita Gee
%% Read Data in
filename = 'POWER_Global_Climatology_d8169934.csv';
solardata = readtable(filename);
%% Separate the Parameters and put NaNs
solarpara = solardata.PARAMETER;
diffpara = solardata(strcmp(solarpara, 'DIFF'), :);
dnrpara = solardata(strcmp(solarpara, 'DNR'), :);
albedopara = solardata(strcmp(solarpara, 'SRF_ALB'), :);
lat = unique(diffpara.LAT); 
lon = unique(diffpara.LON);
diffann= diffpara.ANN;
dnrann= dnrpara.ANN;
albedoann= albedopara.ANN;
diffann(diffann == -999)=NaN
dnrann(dnrann == -999)=NaN
albedoann(albedoann == -999)=NaN
%% Global Annual Maps of Diffuse Radiation
%Using similar method to Data Lab #2
diff_ann = zeros(length(lon),length(lat));
diff_jan = zeros(length(lon),length(lat));
diff_feb = zeros(length(lon),length(lat));
diff_mar = zeros(length(lon),length(lat));
diff_apr = zeros(length(lon),length(lat));
diff_may = zeros(length(lon),length(lat));
diff_jun = zeros(length(lon),length(lat));
diff_jul = zeros(length(lon),length(lat));
diff_aug = zeros(length(lon),length(lat));
diff_sep = zeros(length(lon),length(lat));
diff_oct = zeros(length(lon),length(lat));
diff_nov = zeros(length(lon),length(lat));
diff_dec = zeros(length(lon),length(lat));
for i = 1:height(diffpara)
    latitude = diffpara.LAT(i);
    long = diffpara.LON(i);
    diff_an = diffpara.ANN(i);
    diff_an(diff_an == -999)=NaN;
   dnrjan = diffpara.JAN(i);
    dnrfeb = diffpara.FEB(i);
    dnrmar = diffpara.MAR(i);
    dnrapr = diffpara.APR(i);
    dnrmay = diffpara.MAY(i);
    dnrjun = diffpara.JUN(i);
    dnrjul = diffpara.JUL(i);
    dnraug = diffpara.AUG(i);
    dnrsep = diffpara.SEP(i);
    dnroct = diffpara.OCT(i);
    dnrnov = diffpara.NOV(i);
    dnrdec = diffpara.DEC(i);
     d=find(long ==lon);
    e=find(latitude == lat);  
   diff_ann(d,e) = diff_an;
  diff_jan(d,e) =dnrjan;
  diff_feb(d,e)=  dnrfeb ;
  diff_mar(d,e)=  dnrmar ;
  diff_apr(d,e)=  dnrapr ;
  diff_may(d,e)=  dnrmay  ;
   diff_jun(d,e)= dnrjun;
   diff_jul(d,e)= dnrjul ;
    diff_aug(d,e)=dnraug ;
    diff_sep(d,e)=dnrsep;
    diff_oct(d,e)=dnroct ;
  diff_nov(d,e)=  dnrnov;
   diff_dec(d,e)= dnrdec ;
end
%% Global Map of Diffuse Radiation
figure(1); clf
worldmap('World')
load coastlines
contourfm(lat,lon, diff_ann','linecolor','none')
geoshow(coastlat,coastlon,'Color','k')
colorbar
title('Annual Diffuse Radiation on a Horizontal Surface')
%%  Annual Global Map of Direct Normal Radiation
dnr_ann = zeros(length(lon),length(lat));
dnr_jan = zeros(length(lon),length(lat));
dnr_feb = zeros(length(lon),length(lat));
dnr_mar = zeros(length(lon),length(lat));
dnr_apr = zeros(length(lon),length(lat));
dnr_may = zeros(length(lon),length(lat));
dnr_jun = zeros(length(lon),length(lat));
dnr_jul = zeros(length(lon),length(lat));
dnr_aug = zeros(length(lon),length(lat));
dnr_sep = zeros(length(lon),length(lat));
dnr_oct = zeros(length(lon),length(lat));
dnr_nov = zeros(length(lon),length(lat));
dnr_dec = zeros(length(lon),length(lat));
for i = 1:height(dnrpara)
    latitude = dnrpara.LAT(i);
    long = dnrpara.LON(i);
    dnr_an = dnrpara.ANN(i);
    dnr_an(dnr_an == -999)=NaN;
    dnrjan = dnrpara.JAN(i);
    dnrfeb = dnrpara.FEB(i);
    dnrmar = dnrpara.MAR(i);
    dnrapr = dnrpara.APR(i);
    dnrmay = dnrpara.MAY(i);
    dnrjun = dnrpara.JUN(i);
    dnrjul = dnrpara.JUL(i);
    dnraug = dnrpara.AUG(i);
    dnrsep = dnrpara.SEP(i);
    dnroct = dnrpara.OCT(i);
    dnrnov = dnrpara.NOV(i);
    dnrdec = dnrpara.DEC(i);
    d=find(long ==lon);
    e=find(latitude == lat);  
   dnr_ann(d,e) = dnr_an;
  dnr_jan(d,e) =dnrjan;
  dnr_feb(d,e)=  dnrfeb ;
  dnr_mar(d,e)=  dnrmar ;
  dnr_apr(d,e)=  dnrapr ;
  dnr_may(d,e)=  dnrmay  ;
   dnr_jun(d,e)= dnrjun;
   dnr_jul(d,e)= dnrjul ;
    dnr_aug(d,e)=dnraug ;
    dnr_sep(d,e)=dnrsep;
    dnr_oct(d,e)=dnroct ;
  dnr_nov(d,e)=  dnrnov;
   dnr_dec(d,e)= dnrdec ;
end
%% Global Map of Normal Radiation
figure(2); clf
worldmap('World')
load coastlines
contourfm(lat,lon, dnr_ann','linecolor','none')
geoshow(coastlat,coastlon,'Color','k')
colorbar
title('Annual Direct Normal Radiation')
%% Total Annual Solar Radiation
global_ann = dnr_ann+diff_ann;
figure(3); clf
worldmap('World')
load coastlines
contourfm(lat,lon, global_ann','linecolor','none')
geoshow(coastlat,coastlon,'Color','k')
colorbar
title('Annual Total Solar Radiation')
%% Total Annual Solar Radiation that is greater than or equal to 4 kWh/m^2/day Globally
global_ann(global_ann<4)= NaN
figure(4); clf
worldmap('World')
load coastlines
contourfm(lat,lon, global_ann','linecolor','none')
geoshow(coastlat,coastlon,'Color','k')
colorbar
title('Annual Total Solar Radiation that is greater than or equal to 4 kWh/m^2/day')
%% Choosing Locations of Interest to Study the Seasonal Variations 
%and Whether they are Consistent and have enough solar radiation to 
% generate electricity using solar panels
% Having 4 peak hours per day which is an hour of sunlight at 1000 W/m^2 or
% 1 kW/m^2 or at least 4kWh/m^2 per day
% the units are kWh/m^2/day 
%Analyze the Seasonal Cycle of Different Climate Zones in North America
%more closely
%% Boston, MA Location 42.3601° N, 71.0589° W temperate climate 
latbos=abs(lat-42.3601);
[~,P]=min(latbos);
lonbos=abs(lon-(360-71.0589));
[~,P1]=min(lonbos);
 jan_bos = diff_jan(P1,P)+dnr_jan(P1,P);
 feb_bos = diff_feb(P1,P)+dnr_feb(P1,P);
 mar_bos = diff_mar(P1,P)+dnr_mar(P1,P);
 apr_bos=diff_apr(P1,P)+dnr_apr(P1,P);
 may_bos=diff_may(P1,P)+dnr_may(P1,P);
 jun_bos=diff_jun(P1,P)+dnr_jun(P1,P);
 jul_bos=diff_jul(P1,P)+dnr_jul(P1,P);
 aug_bos=diff_aug(P1,P)+dnr_aug(P1,P);
 sep_bos=diff_sep(P1,P)+dnr_sep(P1,P);
oct_bos=diff_oct(P1,P)+dnr_oct(P1,P);
 nov_bos=diff_nov(P1,P)+dnr_nov(P1,P);
 dec_bos=diff_dec(P1,P)+dnr_dec(P1,P);
bos_year = zeros(1,12);
bos_year(1)=jan_bos;
bos_year(2)=feb_bos;
bos_year(3)=mar_bos;
bos_year(4)=apr_bos;
bos_year(5)=may_bos;
bos_year(6)=jun_bos;
bos_year(7)=jul_bos;
bos_year(8)=aug_bos;
bos_year(9)=sep_bos;
bos_year(10)=oct_bos;
bos_year(11)=nov_bos;
bos_year(12)=dec_bos;
%Plot for Boston
month = [1:12];
x = linspace(0,12,12);
y = 4*ones(12);
scatter(month,bos_year,'filled')
hold on
plot(x,y)
hold off
title('Seasonal Cycle of Total Solar Radiation in Boston, MA')
ylabel('Total Solar Radiation (kWh/m^2/day)')
xlabel('month')
legend('data','line equal to 4kWh/m^2/day')
%% Temperate Subarctic Churchill, Manitoba in Canada 58.7684° N, 94.1650° W
church_yr=seasonal(58.7684,94.1650);
%%
scatter(month,church_yr,'filled')
hold on
plot(x,y)
hold off
title('Seasonal Cycle of Total Solar Radiation in Churchill, Manitoba')
ylabel('Total Solar Radiation (kWh/m^2/day)')
xlabel('month')
legend('data','line equal to 4kWh/m^2/day')
%% Tropical Rainforest Panama City, Panama 8.9824° N, 79.5199° W
pan_yr=seasonal(8.9824,79.5199);
%%
scatter(month,pan_yr,'filled')
hold on
plot(x,y)
hold off
title('Seasonal Cycle of Total Solar Radiation in Panama City, Panama')
ylabel('Total Solar Radiation (kWh/m^2/day)')
xlabel('month')
legend('data','line equal to 4kWh/m^2/day')
%% Tropical Desert Cabo San Lucas, Mexico 22.8905° N, 109.9167° W
cab_yr=seasonal(22.8905,109.9167);
%%
scatter(month,cab_yr,'filled')
hold on
plot(x,y)
hold off
title('Seasonal Cycle of Total Solar Radiation in Cabo San Lucas, Mexico')
ylabel('Total Solar Radiation (kWh/m^2/day)')
xlabel('month')
legend('data','line equal to 4kWh/m^2/day')
%% Humid Subtropical Orlando, Florida 28.5383° N, 81.3792° W
orl_yr=seasonal(28.5383,81.3792);
%%
scatter(month,orl_yr,'filled')
hold on
plot(x,y)
hold off
title('Seasonal Cycle of Total Solar Radiation in Orlando, FL')
ylabel('Total Solar Radiation (kWh/m^2/day)')
xlabel('month')
legend('data','line equal to 4kWh/m^2/day')
%% Temperature Grassland Helena, Montana 46.5891° N, 112.0391° W
hel_yr=seasonal(46.5891,112.0391);
%%
scatter(month,hel_yr,'filled')
hold on
plot(x,y)
hold off
title('Seasonal Cycle of Total Solar Radiation in Helena, MT')
ylabel('Total Solar Radiation (kWh/m^2/day)')
xlabel('month')
legend('data','line equal to 4kWh/m^2/day')
%% Tropical Grasslands Mexico City, Mexico 19.4326° N, 99.1332° W
mex_yr=seasonal(19.4326,99.1332);
%%
scatter(month,mex_yr,'filled')
hold on
plot(x,y)
hold off
title('Seasonal Cycle of Total Solar Radiation in Mexico City, Mexico')
ylabel('Total Solar Radiation (kWh/m^2/day)')
xlabel('month')
legend('data','line equal to 4kWh/m^2/day')
%% Subtropical Desert Torreón, Mexico 25.5428° N, 103.4068° W
tor_yr=seasonal(25.5428,103.4068);
%%
scatter(month,tor_yr,'filled')
hold on
plot(x,y)
hold off
title('Seasonal Cycle of Total Solar Radiation in Torreón, Mexico')
ylabel('Total Solar Radiation (kWh/m^2/day)')
xlabel('month')
legend('data','line equal to 4kWh/m^2/day')
%%  One Plot of All Locations
plot(month,bos_year,'color',[0 0 1],'LineWidth',3)
hold on
plot(month,church_yr, 'color',[0 0 .6],'LineWidth',3)
%plot(month,hel_yr,'color',[0 0 .3],'LineWidth',3)
%plot(month,orl_yr,'color',[0 0.5 0],'LineWidth',3)
%plot(month,tor_yr,'color',[0 1 0],'LineWidth',3)
plot(month,pan_yr,'color',[1 0 1],'LineWidth',3)
plot(month,cab_yr,'color',[.75 .75 0],'LineWidth',3)
%plot(month,mex_yr, 'color',[.5 .5 0],'LineWidth',3)
plot(x,y,'color',[.5843 .8157 .9882],'LineWidth',2.5)
hold off
title('Seasonal Cycle of Total Annual Solar Radiation at all Locations with Different Climate Zones')
legend('Boston(Temperate)','Churchill(Temperate Subarctic)','Panama City(Tropical Rainforest)', 'Cabo San Lucas(Tropical Desert)','line equal to 4kWh/m^2/day','location','eastoutside')%'Helena (Temperate Grassland)','Orlando (Humid Subtropical)','Torreón (Subtropical Desert)','Panama City (Tropical Rainforest)','Cabo San Lucas (Tropical Desert)', 'Mexico City (Tropical Grassland)', 'line equal to 4kWh/m^2/day','Location','eastoutside')
%% World Map of North America of Solar Radiation
lati = [42.3601,58.7684,8.9824,22.8905,28.5383,46.5891,19.4326,25.5428];
long = [360-71.0589,360-94.1650,360-79.5199,360-109.9167,360-81.3792,360-112.0391,360-99.1332,360-103.4068];
global_ann(global_ann<4)= NaN
worldmap([0 70],[-140 -50])
load coastlines
contourfm(lat,lon, global_ann','linecolor','none')
scatterm(lati,long,150,[1 0 0],'filled')
geoshow(coastlat,coastlon,'Color','k')
colorbar
title('Annual Total Solar Radiation greater than or equal to 4 kWh/m^2/day in North America and the Location of Stations')

%% Doing a Cutoff where 8 or more months have to be greater than or equal to 4 kWh/m^2/day 

allmonths_diff = cat(3,diff_jan,diff_feb,diff_mar,diff_apr,diff_may,diff_jun,diff_jul,diff_aug,diff_sep,diff_oct,diff_nov,diff_dec);
allmonths_dnr = cat(3,dnr_jan,dnr_feb,dnr_mar,dnr_apr,dnr_may,dnr_jun,dnr_jul,dnr_aug,dnr_sep,dnr_oct,dnr_nov,dnr_dec);
allmonths_ann = allmonths_diff+allmonths_dnr;
allmonths_ann(allmonths_ann==-999)=NaN
allmonths_ann(allmonths_ann<4)=NaN
%Nans represent the months that have less than 4 kWh
nans = zeros(length(lon),length(lat));
for i = 1: length(lat)
    for j = 1:length(lon)
    bos_months = squeeze(allmonths_ann(j,i,:));
    nans(j,i) = length(find(isnan(bos_months)==1));
    end
end

%% Global Map of 8 or more months have to be greater than or equal to 4 kWh/m^2/day 
nans(nans>4)=NaN
worldmap('World')
load coastlines
contourfm(lat,lon, nans','linecolor','none')
geoshow(coastlat,coastlon,'Color','k')
colorbar
title('Areas where solar panels should be built (4 or less months have less than 4 kWh/m^2/day)')
%% North America Map of 8 or more months have to be greater than or equal to 4 kwH/m^2/day 
worldmap([0 70],[-140 -50])
load coastlines
contourfm(lat,lon, nans','linecolor','none')
geoshow(coastlat,coastlon,'Color','k')
colorbar
title('Areas where solar panels should be built (4 or less months have less than 4 kWh/m^2/day)')

%% Global Map of 9 or more months have to greater than or equal to 4 kWh/m^2/day
nans(nans>3)=NaN
worldmap('World')
load coastlines
contourfm(lat,lon, nans','linecolor','none')
geoshow(coastlat,coastlon,'Color','k')
colorbar
title('Areas where solar panels should be built (3 or less months have less than 4 kWh/m^2/day)')
%% Map of North America of 9 or more months greater than or equal to 4 kWh/m^2/day
worldmap([0 70],[-140 -50])
load coastlines
contourfm(lat,lon, nans','linecolor','none')
geoshow(coastlat,coastlon,'Color','k')
colorbar
title('Areas where solar panels should be built (3 or less months have less than 4 kWh/m^2/day)')

%% Global Map of 0 months that have less than 4 kWh/m^2/day
nans(nans>0)=NaN
worldmap('World')
load coastlines
contourfm(lat,lon, nans','linecolor','none')
geoshow(coastlat,coastlon,'Color','k')
colorbar
title('Areas where solar panels absolutely should be built (0  months have less than 4 kWh/m^2/day)')
%% North America Map of 0 months that have less than 4 kWh/m^2/day
worldmap([0 70],[-140 -50])
load coastlines
contourfm(lat,lon, nans','linecolor','none')
geoshow(coastlat,coastlon,'Color','k')
colorbar
title('Areas where solar panels should be built (0 months have less than 4 kWh/m^2/day)')