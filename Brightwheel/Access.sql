-- Databricks notebook source
select *
from testcsv.brightwheel_raw_data

-- COMMAND ----------

select *
from testcsv.brightwheel_source1

-- COMMAND ----------

select *
from testcsv.brightwheel_source2

-- COMMAND ----------

select *
from testcsv.brightwheel_source3

-- COMMAND ----------

Notes

1. format phone number
2. format address 
3. Can have a seperate table Geo to normalize the data
4. Flags


Source 2
1. Seperate type license into number and texts and title
2. date matching for every source

Source 3 


-- COMMAND ----------

select *
from testcsv.brightwheel_raw_data r
LEFT JOIN  testcsv.brightwheel_source1 s
ON lower(r.street) like lower('%s.address%')

