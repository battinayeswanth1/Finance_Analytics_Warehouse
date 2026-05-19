-- ============================================================================
-- Layer: Silver (Cleaned / Validated / Enriched)
-- Description: Performing complete ETL transformation from Bronze staging. 
--              Handles string-to-date conversions, parsing float formatting, 
--              and transforming categorical integer keys into clean business text labels.
-- ============================================================================

-- 1. Transform and Load Motor Vehicle Insurance Data
TRUNCATE TABLE mc_silver.mv_insurance;

INSERT INTO mc_silver.mv_insurance
SELECT 
    id,
    STR_TO_DATE(NULLIF(contract_str_date, ''), '%d/%m/%Y'), 
    STR_TO_DATE(NULLIF(last_renewal_date, ''), '%d/%m/%Y'), 
    STR_TO_DATE(NULLIF(next_renewal_date, ''), '%d/%m/%Y'), 
    STR_TO_DATE(NULLIF(dob, ''), '%d/%m/%Y'), 
    STR_TO_DATE(NULLIF(dl_issue_date, ''), '%d/%m/%Y'),      
    CASE
        WHEN distribution_channel = 0 THEN 'Direct'
        WHEN distribution_channel = 1 THEN 'Agent'
        ELSE 'Unknown'
    END,
    seniortiy_years,
    policy_running_years,
    max_policies,
    max_products,
    lapse,
    STR_TO_DATE(NULLIF(lapse_date, ''), '%d/%m/%Y'),      
    CASE
        WHEN STR_TO_DATE(NULLIF(lapse_date, ''), '%d/%m/%Y') IS NULL THEN 'Active'
        ELSE 'Lapsed'
    END,
    CASE
        WHEN payment = 0 THEN 'Annual'
        WHEN payment = 1 THEN 'Installments'
        ELSE 'Unknown'
    END,
    CAST(REPLACE(premium, ',', '.') AS FLOAT),                 
    CAST(REPLACE(claim_cost_yearly, ',', '.') AS FLOAT),        
    nclaim_year,
    nclaim_history,
    CAST(REPLACE(rclaim_history, ',', '.') AS FLOAT),           
    CONCAT('Risk level ', risk_type),      
    CASE
        WHEN area = 1 THEN 'Urban'
        ELSE 'Rural'
    END,
    CASE
        WHEN second_driver = '1' THEN 'Yes'
        ELSE 'No'
    END,
    CAST(veh_registered_year AS UNSIGNED),
    veh_power,
    veh_cylinder_cap,
    CAST(REPLACE(veh_value, ',', '.') AS FLOAT),             
    veh_no_doors,
    CASE
        WHEN veh_fuel_type = 'P' THEN 'Petrol'
        WHEN veh_fuel_type = 'D' THEN 'Diesel'
        ELSE 'Unknown'
    END,
    CAST(REPLACE(NULLIF(veh_lenght, 'NA'), ',', '.') AS FLOAT),
    veh_weight
FROM mc_bronze.mv_insurance;

-- 2. Transform and Load Claims Type Data
TRUNCATE TABLE mc_silver.claim_type;

INSERT INTO mc_silver.claim_type
SELECT
    id,
    CAST(REPLACE(cost_claims_year, ',', '.') AS FLOAT),
    CAST(REPLACE(cost_claim_by_type, ',', '.') AS FLOAT),
    claim_type
FROM mc_bronze.claim_type;
