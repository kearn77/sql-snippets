# Directory Overview
The queries in this directory use SQL and PL/pgSQL to generate two-tuples<br/>
from a sequence of numbers and its complement.  For example, s1 =<br/>
[1,2,3,4,5] and s2 = [5,4,3,2,1] would generate the tuples<br/>
[(1,5),(2,4),(3,3),(4,2),(5,1)].<br/>

Two approaches are taken.  The first approach, outlined in<br/>
[two_tuples_ctes.sql](sql_files/two_tuples_ctes.sql), uses common table expressions to generate the tuple<br/>
output.  The second approach, outlined in [two_tuples_function.sql](sql_files/two_tuples_function.sql), calls<br/>
a function named "get_series_table" in lieu of common table<br/>
expressions.<br/>

Both queries produce the same table, which can be found in the output<br/>
directory.<br/>
