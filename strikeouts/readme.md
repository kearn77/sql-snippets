# Directory Overview
This directory normalizes data found in a [csv file](source_files/fenway_july_strikeouts_2021.csv) outlining strikeouts<br/>
at Fenway Park in July of 2021.  It includes five queries that explore<br/>
a database view titled "july_strikeouts."  [Please refer to this<br/>
important disclosure about the data](IMPORTANT_RETROSHEET_NOTICE.md).<br/>

# Table Schema
Information about the tables referenced in the below queries can be<br/>
found in the [table_schemas directory](table_schemas/).  Moreover, the contents of the<br/>
tables can be found in the [table_output directory](table_output/).<br/>

# Normalization
The [python script](normalization/database_setup.py) used to normalize the data can be found in the<br/>
normalization directory.<br/>

# Query Overview

## [july_strikeouts_view.sql](queries/july_strikeouts_view.sql)<br/>
Uses common table expressions and multiple inner joins to create a view<br/>
of the data that mirrors the source file.  The query's output can be<br/>
found [here](table_output/july_strikeouts_view.csv).<br/>

## [first_pitch_result.sql](queries/first_pitch_result.sql)<br/>
Uses the count window function and filtering to compare strikeouts where<br/>
the pitcher threw a ball to start the count versus a strike.  The<br/>
query's output can be found [here](query_output/first_pitch_result.csv).

## [first_pitch_ball.sql](queries/first_pitch_ball.sql)<br/>
Counts the number of times a pitcher struck out a batter while throwing<br/>
a ball to start the count.  The query's output can be found [here](query_output/first_pitch_ball.csv).<br/>

## [first_pitch_strike.sql](queries/first_pitch_strike.sql)<br/>
Counts the number of times a pitcher struck out a batter while throwing<br/>
a strike to start the count.  The query's output can be found [here](query_output/first_pitch_strike.csv).<br/>

## [struck_out_looking.sql](queries/struck_out_looking.sql)<br/>
Counts the number of times a batter struck out looking.  The query's<br/>
output can be found [here](query_output/struck_out_looking.csv).<br/>

## [strikeouts_by_pitcher_rollup.sql](queries/strikeouts_by_pitcher_rollup.sql)<br/>
Provides strikeout sums for every pitcher, game date, and day of the<br/>
week.  Accomplished with the rollup subclause.  The query's output can<br/>
be found [here](query_output/strikeouts_rollup.csv).<br/>

# Function Overview
The [functions directory](functions/) outlines three functions - [get_dow_text](functions/get_dow_text.sql),<br/>
[get_first_name](functions/get_player_name.sql#L8), and [get_last_name](functions/get_player_name.sql#L15) - that are called by the above SQL<br/>
files.  get_first_name and get_last_name take a player's id as input and<br/>
return either their first or last name as output.  get_dow_text, which<br/>
is overloaded to accept both date and int inputs, provides a text<br/>
representation of the day of the week.<br/>
