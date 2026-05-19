-- ============================================================================
-- Layer: Bronze (Raw Ingestion / Staging)
-- Description: Creating target tables for raw CSV schema mirror ingestion.
--              Using VARCHAR for dates/decimals to prevent pipeline ingestion failures.
-- ============================================================================

-- Create Bronze Schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS mc_bronze;

-- 1. Create Raw Claims Type Table
DROP TABLE IF EXISTS mc_bronze.claim_type;
CREATE TABLE mc_bronze.claim_type (
    ID                  INT,
    cost_claims_year    VARCHAR(50),
    cost_claim_by_type  VARCHAR(50),
    claim_type          VARCHAR(50)
) CHARACTER SET utf8mb4;

-- 2. Create Raw Motor Vehicle Insurance Data Table
DROP TABLE IF EXISTS mc_bronze.mv_insurance;
CREATE TABLE mc_bronze.mv_insurance (
    ID                     INT,
    contract_str_date      VARCHAR(50),
    last_renewal_date      VARCHAR(50),
    next_renewal_date      VARCHAR(50),
    dob                    VARCHAR(50),
    dl_issue_date          VARCHAR(50),
    distribution_channel   INT,
    seniortiy_years        INT,
    policy_running_years   INT,
    max_policies           INT,
    max_products           INT,
    lapse                  INT,
    lapse_date             VARCHAR(50),
    payment                INT,
    premium                VARCHAR(50),
    claim_cost_yearly      VARCHAR(50),
    nclaim_year            INT,
    nclaim_history         INT,
    rclaim_history         VARCHAR(50),
    risk_type              INT,
    area                   INT,
    second_driver          VARCHAR(50),
    veh_registered_year    VARCHAR(50),
    veh_power              INT,
    veh_cylinder_cap       INT,
    veh_value              VARCHAR(50),
    veh_no_doors           INT,
    veh_fuel_type          VARCHAR(50),
    veh_lenght             VARCHAR(50),
    veh_weight             INT
) CHARACTER SET utf8mb4;
