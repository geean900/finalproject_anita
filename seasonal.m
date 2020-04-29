function[loc_year] = seasonal(LAT,LON)
% seasonal: Analyze monthly averages of global solar radiation at individual stations
%===================================================================
%
% USAGE:  [loc_year] = seasonal(LAT,LON)
%
% DESCRIPTION:
%   Use this function to collect the 30 year monthly averages of global solar radiation
%   from individual stations from the period January 1984 to December 2013
%
% INPUT:
%   LAT: latitude of the station 
%   LON: longitude of the station
%
% OUTPUT:
%    loc_year: the 12 monthly averages of global solar radiation for the
%    station
%  
%
% AUTHOR:   Anita Gee 
%
% REFERENCE:
%    Written for EESC 4464: Environmental Data Exploration and Analysis, Boston College
%    Data are from NASA?s Langley Research Center using POWER Data Access Viewer
%==================================================================
%% read the data in
filename = 'POWER_Global_Climatology_d8169934.csv';
solardata = readtable(filename);
solarpara = solardata.PARAMETER;
diffpara = solardata(strcmp(solarpara, 'DIFF'), :);
dnrpara = solardata(strcmp(solarpara, 'DNR'), :);
albedopara = solardata(strcmp(solarpara, 'SRF_ALB'), :);
%% use array method for diffuse radiation
lat = unique(diffpara.LAT); 
lon = unique(diffpara.LON);
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
%% array method for normal radiation 
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
%% Find the point closest to the latitude and longitude of the station
latbos=abs(lat-LAT);
[~,P]=min(latbos);
lonbos=abs(lon-(360-LON));
[~,P1]=min(lonbos);
%% pull out the 12 months from the monthly global solar radiation array
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
loc_year = zeros(1,12);
loc_year(1)=jan_bos;
loc_year(2)=feb_bos;
loc_year(3)=mar_bos;
loc_year(4)=apr_bos;
loc_year(5)=may_bos;
loc_year(6)=jun_bos;
loc_year(7)=jul_bos;
loc_year(8)=aug_bos;
loc_year(9)=sep_bos;
loc_year(10)=oct_bos;
loc_year(11)=nov_bos;
loc_year(12)=dec_bos;
end