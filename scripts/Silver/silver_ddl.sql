
-- creating mootor vehicle insurance data table in silver layer
use mc_silver;
drop table if exists mc_silver.mv_insurance;
create table mv_insurance(
ID 							INT,
contract_str_date 			DATE,
last_renewal_date 			DATE,
next_renewal_date 			DATE,
dob 			  			DATE,
dl_issue_date 	  			DATE,
distribution_channel		INT,
seniortiy_years 			INT,
policy_running_years 		INT,
max_policies 				INT,
max_products				INT,
lapse						INT,
lapse_date					DATE,
policy_status				VARCHAR(50),
payment						INT,
premium 					FLOAT,
claim_cost_yearly 			FLOAT,
nclaim_year					INT,
nclaim_history 				INT,
rclaim_history 				FLOAT,
risk_type					VARCHAR(50),
area						VARCHAR(50),
second_driver 				VARCHAR(50),
veh_registered_year 		INT,
veh_power 					INT,
veh_cylinder_cap 			INT,
veh_value 					FLOAT,
veh_no_doors 				INT,
veh_fuel_type 				VARCHAR(50),
veh_lenght					FLOAT,
veh_weight 					INT
)CHARACTER SET utf8mb4;

-- creating claim_type table in silver layer
use mc_silver;
drop table if exists mc_silver.claim_type;
create table claim_type(
ID 						int,
cost_claims_yearly		float,
cost_claim_by_type 		float,
claim_type 				VARCHAR(50)
) CHARACTER SET utf8mb4;
