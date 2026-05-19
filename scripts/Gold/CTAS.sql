-- ============================================================================
-- Layer: Gold (Analytical / Star Schema Modeling)
-- Description: Generating the optimized warehouse layer using CTAS blocks.
--              Transforms flat transactional metrics into a clean Star Schema 
--              consisting of 4 Dimensions and 1 Fact table.
-- ============================================================================

-- Create Gold Schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS mc_gold;

-- 1. Create Customer Dimension Table
DROP TABLE IF EXISTS mc_gold.dim_customer;
CREATE TABLE mc_gold.dim_customer AS
SELECT 
    ID,
    dob AS customer_DOB,
    dl_issue_date AS customer_DL_issue_date,
    seniortiy_years AS cutomer_driving_experience
FROM mc_silver.mv_insurance;

-- 2. Create Vehicle Dimension Table
DROP TABLE IF EXISTS mc_gold.dim_vehicle;
CREATE TABLE mc_gold.dim_vehicle AS
SELECT 
    ID,
    veh_registered_year AS vehicle_registered_year,
    veh_power AS vehicle_power,
    veh_value AS vehicle_value,
    veh_no_doors AS vehicle_no_doors,
    veh_fuel_type AS vehicle_fuel_type,
    veh_lenght AS vehicle_lenght,
    veh_weight AS vehicle_weight
FROM mc_silver.mv_insurance;

-- 3. Create Policy Dimension Table
DROP TABLE IF EXISTS mc_gold.dim_policy;
CREATE TABLE mc_gold.dim_policy AS
SELECT 
    ID,
    policy_running_years,
    distribution_channel,
    policy_status,
    payment,
    risk_type,
    area,
    second_driver
FROM mc_silver.mv_insurance;

-- 4. Create Dates Dimension Table
DROP TABLE IF EXISTS mc_gold.dim_dates;
CREATE TABLE mc_gold.dim_dates AS
SELECT 
    ID,
    contract_str_date AS contract_start_date,
    last_renewal_date,
    next_renewal_date
FROM mc_silver.mv_insurance;

-- 5. Create Core Insurance Fact Table
DROP TABLE IF EXISTS mc_gold.fact_insurance;
CREATE TABLE mc_gold.fact_insurance AS
SELECT 
    ID,
    premium,
    claim_cost_yearly,
    -- Deriving driver risk classification matching analytics specifications
    CASE 
        WHEN nclaim_year = 0 THEN 'Clean Record'
        WHEN nclaim_year BETWEEN 1 AND 2 THEN 'Minor History'
        ELSE 'Frequent Claimant'
    END AS driver_risk_segment
FROM mc_silver.mv_insurance;

-- 6. Create Secondary Claim Breakdown Table (From standalone Silver file)
DROP TABLE IF EXISTS mc_gold.dim_claim;
CREATE TABLE mc_gold.dim_claim AS
SELECT
    ID,
    cost_claims_yearly AS yearly_claims,
    cost_claim_by_type AS claims_by_type,
    claim_type
FROM mc_silver.claim_type;
