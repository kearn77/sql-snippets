# Overview
This repository is devoted to solving small, manageable problems with<br/>
SQL. Although PSQL is used throughout, I suspect the solutions provided<br/>
will be applicable to most database engines and SQL implementations.<br/>

The repository's structure is straightforward - each directory outlines<br/>
a coding problem, that problem's solution in the form of .sql files,<br/>
and the output of all SQL queries.<br/>

## [Two-Tuples](/two_tuples)<br/>
The queries in this directory use SQL and PLPGSQL to generate<br/>
two-tuples from a sequence of numbers and its complement.  For example,<br/>
s1 = [1,2,3,4,5] and s2 = [5,4,3,2,1] would generate the tuples<br/>
[(1,5),(2,4),(3,3),(4,2),(5,1)].<br/>

## [Strikeouts](/strikeouts)<br/>
This directory normalizes data found in a [csv file](/strikeouts/source_files/fenway_july_strikeouts_2021.csv) outlining strikeouts<br/>
at Fenway Park in July of 2021.  It includes five queries that explore<br/>
a database view titled "july_strikeouts."  [Please refer to this<br/>
important disclosure about the data, which is made available by<br/>
Retrosheet.](/strikeouts/IMPORTANT_RETROSHEET_NOTICE.md).<br/>
