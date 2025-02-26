# Brightwheel take home assesment

- The access.sql file is used query the csv imports from the dataset provided to me and for basic notes etc.
- The brightwheel folder has the transformation logic from source to intermediate tables.

- I have created a seperate repository for this assesment from Brightwheel in my personal Github folder. Since I am the only person using this repo, I did not create seperate branches to do any changes and then merge the branch into the main branch, but that would definately be something I would do in the real world.

**Here are the overall changes I made**
- Ensured the date format is consistent with all the tables (timestamp)
- Did not include any columns which were null and had no data
- Ensured the format for phone number is consistent
- Ensured the strings with capital values are converted into lower values for consistency
- Converted to boolean values where necessary
- Ensured consistent formatting within the columns. Eg: Changes 'United States' to US to allow consistency. There are similar issues with States, did not handle these in one of the cases

**Tables**
PS : Apart from the salesforce_leads table, all the tables should have a surrogate key (incremental numbers) as a key or a combination of multiple keys to create a primary_key. Here, I have not created any keys.

- source_leads : This table is the transformed version of the salesforce_leads table in the dataset.
  - Did not include the last_viewed_date, last_reference_date, email_bounced_reason and email_bounced_date as they were null. Can be added later if the data starts populating and as per need for reporting.
- source_1 : This is the transformed version of source1 from the given dataset
- source_2 : This is the transformed version of source2 from the given dataset
- source_3 : This is the transformed version of source3 from the given dataset

**Trade offs**
- I can normalize the tables further to have a seperate table for Geography which would have fields like address, state, city, country, zip etc. If this is a seperate Geo table, I would then only have a foreign key (Geography_id) in the source tables which would then join to the main geography table with the primary key being geography_id here.
I did not have time and enough data to create this , thought of importing some data from net to create Geo table, but would not been worth the effort since there is small data present here.

- Source 2 has 'ages accepted 1' to 'AA4' (Ages accepted 4) which has various attributes like :

  **Infants** : 0 - 11 months

  **Toddlers** : 12-23 months; 1 year

  **Preschool** : 24 - 48 months ; 2-4 years

  **School age**: Older than 5

These are essentially categories and definitions for each term. Instead of having them repeat on every row, I removed the definitions and only kept the category name in the transformed table. If given time, I would want to have a seperate table which stores these defintions and can be joined when needed to get the data. This can be also combined with the star level data as a junk dimension.

- Another one is the weekdays in source2
  - Mon to sunday columns are the timings for the school for every weekday.
  - These can be further transformed into buckets or proper timeframes referencing to the timings dimension. It can also be combined into a weekday and timings combination instead of having seperate columns for each weekday. This would depend on the used cases for reporting. 

 ** Future scope :**
Since these are only leads, the data does not have transactional information like amount, registered users etc. Can be used to understand the onboarding funnel, can also join to the transaction data to find various metrics like
1. Lead time between lead creation to account creation : Helpful for the sales team to understand their internal performance
2. To see how many leads are in working status Vs how many are just assigned or recycled etc. A historical snapshot table might also be needed for this.
3. Lifetime value of the customer : To see from lead creation date to latest payment date, how much is the avg. lifetime value of customer
4. Further understand the trends based on Geo or school type based on accepted ages.

Tests in future
- As there is more data, here are a few tests we can add to ensure consistency and data quality
  - For state,  there is only 2 character limit, to not allow to full forms vs short forms. Else if there is a Geo table, this can be coalesced to join with respective formats
  - For phone numbers : Ensuring no other fields are allowed like '()' or '-' and is only limited to integers
  - Ensuring there are no duplicate phone numbers or emails to allow for single entry per customer
  

