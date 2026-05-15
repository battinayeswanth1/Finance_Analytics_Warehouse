
-- Creating a star schema
-- Creating a dimension table for customer using CTAS
drop table if exists mc_gold.dim_customer;
create table mc_gold.dim_customer as(
select 
	ID,
    dob as customer_DOB,
    dl_issue_date as customer_DL_issue_date,
    seniortiy_years as cutomer_driving_experience
from mc_silver.mv_insurance
