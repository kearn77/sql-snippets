/*
Traverse a series in ascending and descending order, creating
two-tuples along the traveral.  i_value represents the tuple's
first element, j_value represents the tuple's second element.
*/

with

tableOne as (
	select
		i_values as i_value,
		row_number() over() as table_id
	from
		generate_series(75,99) as i_values
), 

tableTwo as (
	select
		j_values as j_value,
		row_number() over() as table_id
	from
		generate_series(99,75,-1) as j_values
)

select
	tableOne.i_value,
	tableTwo.j_value,
	(tableOne.i_value,tableTwo.j_value) as "2-Tuple"
from
	tableOne
	full outer join
	tableTwo
on
	tableOne.table_id = tableTwo.table_id
;
