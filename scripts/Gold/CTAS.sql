
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

-- Creating a dimension table for vehicle using CTAS
	drop table if exists mc_gold.dim_vehicle;
create table mc_gold.dim_vehicle as(
select 
	ID,
    veh_registered_year as vehicle_registered_year,
    veh_power as vehicle_power,
    veh_value as vehicle_value,
    veh_no_doors as vehicle_no_doors,
    veh_fuel_type as vehicle_fuel_type,
    veh_lenght as vehicle_lenght,
    veh_weight as vehicle_weight
from mc_silver.mv_insurance
)
