-- Creates a table with generate_series() and the row_number window function.
CREATE OR REPLACE FUNCTION get_series_table(i bigint, j bigint) RETURNS TABLE (table_id bigint, num bigint) AS $$
	DECLARE
		local_series bigint[];
	BEGIN
		IF i > j THEN
			select array(select generate_series(i,j,-1)) into local_series;
		ELSE
			select array(select generate_series(i,j)) into local_series;
		END IF;
		
		RETURN QUERY
			SELECT
				row_number() over() AS table_id,
				nums AS num
			FROM
				unnest(local_series) AS nums;
	END;
$$ LANGUAGE plpgsql;
