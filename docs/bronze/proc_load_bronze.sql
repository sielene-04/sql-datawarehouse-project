/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$
DECLARE 
       v_start_time TIMESTAMP;
	   v_end_time TIMESTAMP;
BEGIN
     v_start_time:= clock_timestamp();
        RAISE NOTICE '========================================================================================================';
		RAISE NOTICE ' bronze table loaded successfully';
		RAISE NOTICE '========================================================================================================';

		
        RAISE NOTICE'---------------------------------------------------------------------------------------------------------';
		RAISE NOTICE'crm bronze table loaded successfully';
		RAISE NOTICE'---------------------------------------------------------------------------------------------------------';

		BEGIN
		RAISE NOTICE '>> Truncating table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		RAISE NOTICE '>> Inserting table into: bronze.crm_cust_info';
		COPY bronze.crm_cust_info FROM
		'C:\Users\sajja\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		DELIMITER ',' CSV HEADER;

		EXCEPTION
		         WHEN OTHERS THEN
				      RAISE NOTICE 'Error in crm_cust_info: %', SQLERRM;
		END;

		BEGIN
		RAISE NOTICE '>> Truncating table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		
		RAISE NOTICE '>> Inserting table into: bronze.crm_prd_info';
		COPY bronze.crm_prd_info FROM
		'C:\Users\sajja\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		DELIMITER ',' CSV HEADER;

		EXCEPTION
		         WHEN OTHERS THEN
				      RAISE NOTICE 'Error in crm_prd_info: %', SQLERRM;
		END;

		BEGIN
		RAISE NOTICE '>> Truncating table: bronze.crm_sls_info';
		TRUNCATE TABLE bronze.crm_sls_info;
		
		RAISE NOTICE '>> Inserting table into: bronze.crm_sls_info';
		COPY bronze.crm_sls_info FROM 
		'C:\Users\sajja\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		DELIMITER ',' CSV HEADER;

		EXCEPTION
		         WHEN OTHERS THEN
				      RAISE NOTICE 'Error in crm_sls_info: %', SQLERRM;
		END;
		
		RAISE NOTICE'---------------------------------------------------------------------------------------------------------';
		RAISE NOTICE'erp bronze table loaded successfully';
		RAISE NOTICE'---------------------------------------------------------------------------------------------------------';

		BEGIN
		RAISE NOTICE '>> Truncating table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;

		RAISE NOTICE '>> Inserting table into: bronze.erp_cust_az12';
		COPY bronze.erp_cust_az12 FROM
		'C:\Users\sajja\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		DELIMITER ',' CSV HEADER;

		EXCEPTION
		         WHEN OTHERS THEN
				      RAISE NOTICE 'Error in erp_cust_az12: %', SQLERRM;
		END;

		BEGIN
		RAISE NOTICE '>> Truncating table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;

		RAISE NOTICE '>> Inserting table into: bronze.erp_loc_a101';
		COPY bronze.erp_loc_a101 FROM
		'C:\Users\sajja\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		DELIMITER ',' CSV HEADER;

		EXCEPTION
		         WHEN OTHERS THEN
				      RAISE NOTICE 'Error in erp_loc_a101: %', SQLERRM;
		END;

		BEGIN
		RAISE NOTICE '>> Truncating table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		RAISE NOTICE '>> Inserting table into: bronze.erp_px_cat_g1v2';
		COPY bronze.erp_px_cat_g1v2 FROM
		'C:\Users\sajja\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		DELIMITER ',' CSV HEADER;

		EXCEPTION
		         WHEN OTHERS THEN
				      RAISE NOTICE 'Error in erp_px_cat_g1v2: %', SQLERRM;
		END;
		v_end_time := clock_timestamp();
		RAISE NOTICE'=======================================================================';
		RAISE NOTICE'Bronze Load Completed';
		RAISE NOTICE'End Time: %',v_end_time;
		RAISE NOTICE'Total Duration: %', v_end_time - v_start_time;
		RAISE NOTICE'=======================================================================';
END;
$$
CALL bronze.load_bronze();


