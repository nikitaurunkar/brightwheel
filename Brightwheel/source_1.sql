-- Databricks notebook source
CREATE TABLE IF NOT EXISTS test_access_control.first_source

select 
  
  lower(Name) as name,
  lower(`credential type`) as credential_type,
  `credential number` as credential_number,
  Status,
  cast(`expiration date` as timestamp) as expiration_date,
  cast(`disciplinary action` as boolean) as disciplinary_action,
  replace(lower(left(`address`, position (',' in (`address`)))),',','') as address,
  trim(left(right(`address`, position (','  in reverse(`address`))-1),3)) as State,
  cast(right(right(`address`, position (','  in reverse(`address`))-1),5) as int) as Zip,
  lower(county) as county,
  cast(replace(`Phone`,'-','') as int) as phone,
  cast(`First Issue Date` as timestamp) as first_issue_date,
  lower(`Primary Contact Name`) as primary_contact_name,
  lower(`Primary Contact Role`) as primary_contact_role
from testcsv.brightwheel_source1

-- COMMAND ----------

select *
from test_access_control.first_source
