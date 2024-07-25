# Directory Overview<br/>
Please note that the queries in this directory reference the Chinook sample<br/>
database, which is made available under a [license that can be found here](CHINOOK_LICENSE.md).<br/>

Providing a robust "digital media store" based off of an iTunes<br/>
library, the Chinook database is an excellent resource for anyone who<br/>
wants to test their SQL knowledge or tinker with a new database<br/>
management system[^1].  A data model of the database's structure can be<br/>
found on the project's readme, which can be reached with the link<br/>
provided in footnote one.<br/>

The queries in this directory select the starting and ending times of<br/>
all tracks that compose an album with a runtime greater than or equal to<br/>
half-an-hour and less than one-hour.<br/>

## Query And Function Overview<br/>
There are two main queries in this directory - "track_start_end_cte.sql"<br/>
and "track_start_end_sub.sql."<br/>

The former uses window functions to calculate the start and end times of any<br/>
given track.  Moreover, it uses common table expressions to improve its select<br/>
statement's readability.  The latter query eschews this additional complexity<br/>
for brevity, including multiple sub-queries in its select statement's from<br/>
clause.<br/>

Both queries produce the same truncated output, which can be readily<br/>
confirmed with a diff utility.

Additionally, "directory_functions.sql" provides a host of functions that<br/>
simplify the two queries.  The majority of them convert milliseconds to<br/>
various components of a typical time, such as hours, minutes, seconds.<br/>
A function named "ms_text" converts milliseconds to TEXT in the<br/>
following format:  "hours:minutes:seconds:milliseconds."<br/>

[^1]: Luis Rocha, 2024, "chinook-database," 07/25/24,
  <https://github.com/lerocha/chinook-database>.
