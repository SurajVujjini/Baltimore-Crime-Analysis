use project;
select * from crime;
select * from CRIME_CODES;
select * from crime_location;
select * from date_time;

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS   
--ALTER TABLE crime_location ADD CONSTRAINT new FOREIGN KEY; 
ALTER TABLE crime_location ADD FOREIGN KEY (RowID) REFERENCES date_time(RowID);
ALTER TABLE crime_location ADD FOREIGN KEY (RowId) REFERENCES crime(RowID);
ALTER TABLE crime ADD FOREIGN KEY (RowId) REFERENCES date_time(RowID);

select Distinct Description as Types_of_crimes  from crime;
select count(Description) as AGG_ASSAULTS from crime where Description='AGG. ASSAULT';
select count(Description) as AUTO_THEFT from crime where Description='AUTO THEFT';
select count(Description) as ROBBERY_STREET from crime where Description='ROBBERY - STREET';
select count(Description) as ROBBERY_COMMERCIAL from crime where Description='ROBBERY - COMMERCIAL';
select count(Description) as LARCENY_FROM_AUTO from crime where Description='LARCENY FROM AUTO';
select count(Description) as RAPE from crime where Description='RAPE';
select count(Description) as ROBBERY_CARJACKING from crime where Description='ROBBERY - CARJACKING';
select count(Description) as No_of_Homicides from crime where Description='HOMICIDE';
select count(Description) as COMMON_ASSAULT from crime where Description='COMMON ASSAULT';
select count(Description) as BURGLARY from crime where Description='BURGLARY';
select count(Description) as LARCENY from crime where Description='LARCENY';
select count(Description) as ROBBERY_RESIDENCE from crime where Description='ROBBERY - RESIDENCE';
select count(Description) as ARSON from crime where Description='ARSON';

ALTER TABLE crime ADD FOREIGN KEY (CrimeCode) REFERENCES CRIME_CODES(CrimeCode);

--crimes with respect to the date
select crime_date,count(crime_date) as totalcrimes from date_time group by crime_date;

--date with most number of accidents
select top 1 crime_date as most_crime_date from date_time group by crime_date order by count(*) desc;

--crimes with respect to the months
 
--day with most number of accidents recorded
select top 1 day as most_crime_day from date_time group by day order by count(*) desc;

--hour with most number of accidents
alter table date_time alter column crime_time char(20);
select top 1 substring(crime_time, 1,2) as most_accidents_hour from date_time group by substring(crime_time,1,2) order by count(*) desc;

--count of crimes with respect to the crime type
select Description,count(Total_Incidents) as crimes_count from crime group by Description; 

--Districts and crimes happened till date 
select District, count(District) as count_of_crimes from crime_location group by District order by count(District) desc; 

--District with highest crime rate and its count
select top 1 District, count(District) as count_of_crimes from crime_location group by District order by count(District) desc; 

--Geolocation with highest crimes happened
select top 1 GeoLocation,count(GeoLocation) as no_of_crimes from crime_location group by GeoLocation; 



