
-- Use the `ref` function to select from other models
{{ config(materialized='table') }}

with source_data as (

select 
    cast(operation as int) as operation,
    `Operation Name` as operation_name,
    lower(`Address`) as address,
    lower(city) as city,
    state,
    cast(Zip as int) as zip,
    lower(County) as county,
    cast(replace(`Phone`,'-','') as int) as phone,
    `Type` as type,
    Status,
    cast(`Issue Date` as timestamp) as issue_date,
    cast(Capacity as int) as capacity,
    `Email Address` as email_address,
    cast(`Facility ID` as int) as facility_id,
    cast(Infant as boolean) as infant,
    cast(Toddler as boolean) as toddler,
    cast(Preschool as boolean) as preschool,
    cast(School as boolean) as school
FROM testcsv.brightwheel_source3

)

select *
from source_data