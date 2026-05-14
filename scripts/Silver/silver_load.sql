
-- loading motor vehicle insurance table form bronze layer to siver after cleaning the data
TRUNCATE TABLE mc_silver.mv_insurance;
INSERT INTO mc_silver.mv_insurance(
SELECT 
	id,
	str_to_date(nullif(contract_str_date,''), '%d/%m/%Y'), 
    str_to_date(nullif(last_renewal_date,''), '%d/%m/%Y'), 
    str_to_date(nullif(next_renewal_date,''), '%d/%m/%Y'), 
    str_to_date(nullif(dob,''), '%d/%m/%Y'), 
    str_to_date(nullif(dl_issue_date,''), '%d/%m/%Y'), 	  
    case
		when distribution_channel = 0 then 'Direct'
        when distribution_channel = 1 then 'Agent'
        else 'Unknown'
	end,
    seniortiy_years,
    policy_running_years,
    max_policies,
    max_products,
    lapse,
	str_to_date(nullif(lapse_date,''), '%d/%m/%Y'), 	    
    case
		when str_to_date(nullif(lapse_date,''), '%d/%m/%Y') is null then 'Active'
        else 'Lapsed'
        end,
    payment,
	cast(replace(premium,',','.') as float),					 
    cast(replace(claim_cost_yearly,',','.') as float), 		   
    nclaim_year,
    nclaim_history,
    cast(replace(rclaim_history,',','.') as float),			   
    concat('Risk level','', risk_type),		  
    case
		when area = 1 then 'Urban'
        else 'Rural'
	end,
    case
		when second_driver = 1 then 'Yes'
        else 'No'
	end,
    cast(veh_registered_year as unsigned),
    veh_power,
    veh_cylinder_cap,
    cast(replace(veh_value,',','.') as float), 			
    veh_no_doors,
    case
		when veh_fuel_type = 'P' then 'Petrol'
        when veh_fuel_type = 'D' then 'Diesel'
        else 'Unknown'
	end,
    cast(replace(nullif(veh_lenght,'NA'),',','.') as float) ,
    veh_weight
from mc_bronze.mv_insurance)

-- loading claim_type data from bronze layer to silver layer after cleaning the data
truncate table mc_silver.claim_type;
INSERT INTO mc_silver.claim_type
select
	id,
    cast(replace(cost_claims_year,',','.') as float),
    cast(replace(cost_claim_by_type,',','.') as float),
    claim_type
from mc_bronze.claim_type;

