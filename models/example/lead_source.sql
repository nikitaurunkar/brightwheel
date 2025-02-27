
-- Use the `ref` function to select from other models
{{ config(materialized='table') }}

with source_data as (

select 
  cast(id as int) as id,
  cast(is_deleted as boolean) as is_deleted,
  last_name,
  first_name,
  title,
  company,
  street,
  city,
  CASE WHEN state = 'New York' then 'NY'
       WHEN state = 'California' then 'CA'
       WHEN state = 'Maryland' then 'MD'
       WHEN state = 'Iowa' then 'IO'
       WHEN state = 'Florida' then 'FL'
       WHEN state = 'Oregon' then 'OR'
       WHEN state = 'Wiscosin' then 'WI'
       WHEN state = 'Pennsylvania' then 'PA'
    ELSE state end as state,
  cast(postal_code as int) as zip,
  CASE WHEN country = 'United States' then 'US' when country = 'Canada' then 'CA' else country end as country,
  cast(phone as int) as phone,
  cast(mobile_phone as int) as mobile_phone,
  email,
  website,
  lead_source,
  status,
  cast(is_converted as boolean) as is_converted,
  cast(created_date as timestamp) as created_date,
  cast(last_modified_date as timestamp) as last_modified_date,
  cast(last_activity_date as timestamp) as last_activity_date,
  outreach_stage_c as outreach_stage,
  current_enrollment_c as current_enrollment,
  cast(capacity_c as int) as capacity,
  cast(lead_source_last_updated_c as timestamp) as lead_source_last_updated, 
  cast(brightwheel_school_uuid_c as int) as brightwheel_school_uuid

from testcsv.brightwheel_raw_data

)

select *
from source_data