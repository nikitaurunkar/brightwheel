
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

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

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
