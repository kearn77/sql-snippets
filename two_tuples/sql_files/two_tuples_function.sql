/*
Traverse a series in ascending and descending order, creating
two-tuples along the traveral.  i_value represents the tuple's
first element, j_value represents the tuple's second element.
*/

SELECT
	t1.num AS "i_value",
	t2.num AS "j_value",
	(t1.num,t2.num) AS "2-Tuple"
FROM
	(SELECT * from get_series_table(75,99)) AS t1
	FULL OUTER JOIN
	(SELECT * from get_series_table(99,75)) AS t2
ON
	t1.table_id = t2.table_id
;
