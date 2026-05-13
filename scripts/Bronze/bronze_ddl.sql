-- Creating tables for each csv files

-- query to create claim_type table
drop table if exists mc_bronze.claim_type;
create table claim_type(
ID int Primary key,
cost_claims_year VARCHAR(50),
cost_claim_by_type VARCHAR(50),
claim_type VARCHAR(50)
)
