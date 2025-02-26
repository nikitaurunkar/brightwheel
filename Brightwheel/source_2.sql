-- Databricks notebook source
CREATE TABLE IF NOT EXISTS test_access_control.second_source
select 
    split_part(lower(`Type License`),'-',1) as license_type ,
    split_part((`Type License`),'-',2) as license_number,
    lower(Company) as company,
    cast(case when `Accepts Subsidy` = 'Accepts Subsidy' then true else false end as boolean) as accepts_subsidy,
    cast(case when `year round` = 'Year Round' then true else false end as boolean) as year_round,
    cast(case when `Daytime Hours` = 'Daytime Hours' then true else false end as boolean) as daytime_hours,
    cast(split_part(`Star Level`, ' ', 1) as int) as star_level,
    mon, Tues, wed, Thurs, Friday, Saturday, Sunday,
    lower(`Name of Primary caregiver`) as name_of_primary_caregiver,
    Designation as designation,
    trim(replace(replace(replace(replace(replace(`Phone`,'-',''),'(',''),'') ,')',''),' ','')) as phone,
    Email as email,
    lower(Address1) as address,
    lower(city) as city,
    State,
    cast(zip as int) as zip,
    split_part((`subsidy contract number`),':',2) as subsidy_contract_number,
    cast(`total cap` as int) as capacity,
    left(`ages accepted 1`, charindex('(', `ages accepted 1`)-1) as ages_accepted_1,
    left(`AA2`, charindex('(', `AA2`)-1) as ages_accepted_2,
    left(`AA3`, charindex('(', `AA3`)-1) as ages_accepted_3,
    left(`AA4`, charindex('(', `AA4`)-1) as ages_accepted_4,
    cast(replace(`license monitoring since`,'Monitoring since','') as timestamp) as license_monitoring_since_date,
    `School Year Only` as school_year_only,
    left(`Evening Hours`, charindex('(', `Evening Hours`)-1) as evening_hours
from testcsv.brightwheel_source2

-- COMMAND ----------

select *
from test_access_control.second_source
