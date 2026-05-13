-- Query to load claim_type data 
truncate table mc_bronze.claim_type;
load data local infile '/Users/yeswanthbattina/Downloads/sample type claim.csv'
into table mc_bronze.claim_type
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
