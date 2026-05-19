-- ============================================================================
-- Layer: Silver (Cleaned / Validated / Enriched)
-- Description: Creating structured tables with casted physical data types 
--              (DATE, FLOAT, INT) and descriptive textual lookups.
-- ============================================================================

-- Create Silver Schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS mc_silver;

-- 1. Create Cleaned Motor Vehicle Insurance Data Table
DROP TABLE IF EXISTS mc_silver.mv_insurance;
CREATE TABLE mc_silver.mv_insurance (
    ID                     INT,
    contract_str_date      DATE,
    last_renewal_date      DATE,
    next_renewal_date      DATE,
    dob                    DATE,
    dl_issue_date          DATE,
    distribution_channel   VARCHAR(50),
    seniortiy_years        INT,
    policy_running_years   INT,
    max_policies           INT,
    max_products           INT,
    lapse                  INT,
    lapse_date             DATE,
    policy_status          VARCHAR(50),
    payment                VARCHAR(50),
    premium                FLOAT,
    claim_cost_yearly      FLOAT,
    nclaim_year            INT,
    nclaim_history         INT,
    rclaim_history         FLOAT,
    risk_type              VARCHAR(50),
    area                   VARCHAR(50),
    second_driver          VARCHAR(50),
    veh_registered_year    INT,
    veh_power              INT,
    veh_cylinder_cap       INT,
    veh_value              FLOAT,
    veh_no_doors           INT,
    veh_fuel_type          VARCHAR(50),
    veh_lenght             FLOAT,
    veh_weight             INT
) CHARACTER SET utf8mb4;

-- 2. Create Cleaned Claims Type Table
DROP TABLE IF EXISTS mc_silver.claim_type;
CREATE TABLE mc_silver.claim_type (
    ID                     INT,
    cost_claims_yearly     FLOAT,
    cost_claim_by_type     FLOAT,
    claim_type             VARCHAR(50)
) CHARACTER SET utf8mb4;
