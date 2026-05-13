-- Creating tables for each csv files

-- query to create claim_type table
create table claim_type(
ID int Primary key,
cost_claims_year NVARCHAR(50),
cost_claim_by_type NVARCHAR(50),
claim_type VARCHAR(50)
)
