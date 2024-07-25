# Overview
This repository is devoted to solving small, manageable problems with<br/>
SQL. Although psql is used throughout, I suspect the solutions provided<br/>
will be applicable to most database engines and SQL implementations.<br/>

The repository's structure is straightforward - each directory outlines<br/>
a coding problem, that problem's solution in the form of .sql files,<br/>
and the output of all SQL queries.<br/>

Please note that PostgreSQL is released under the following [license](PostgreSQL_license.md).

## [Two-Tuples](/two_tuples)<br/>
The queries in this directory use SQL and PL/psSQL to generate<br/>
two-tuples from a sequence of numbers and its complement.  For example,<br/>
s1 = [1,2,3,4,5] and s2 = [5,4,3,2,1] would generate the tuples<br/>
[(1,5),(2,4),(3,3),(4,2),(5,1)].<br/>

## [Strikeouts](/strikeouts)<br/>
This directory normalizes data found in a [csv file](/strikeouts/source_files/fenway_july_strikeouts_2021.csv) outlining strikeouts<br/>
at Fenway Park in July of 2021.  It includes five queries that explore<br/>
a database view titled "july_strikeouts."  [Please refer to this<br/>
important disclosure about the data, which is made available by<br/>
Retrosheet](/strikeouts/IMPORTANT_RETROSHEET_NOTICE.md).<br/>

## [Albums under One Hour](/albums_under_one_hour/)<br/>
Please note that the queries in this directory reference the Chinook sample<br/>
database, which is made available under a [license that can be found here](/albums_under_one_hour/CHINOOK_LICENSE.md).<br/>

Providing a robust "digital media store" based off of an iTunes<br/>
library, the Chinook database is an excellent resource for anyone who<br/>
wants to test their SQL knowledge or tinker with a new database<br/>
management system[^1].  A data model of the database's structure can be<br/>
found on the project's readme, which can be reached with the link<br/>
provided in footnote one.<br/>

The queries in this directory select the starting and ending times of<br/>
all tracks that compose an album with a runtime greater than or equal to<br/>
half-an-hour and less than one-hour.<br/>

[^1]: Luis Rocha, 2024, "chinook-database," 07/25/24,
  <https://github.com/lerocha/chinook-database>.