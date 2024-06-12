DROP VIEW july_strikeouts;

CREATE OR REPLACE VIEW july_strikeouts AS

	WITH batters AS 
	
	(
	SELECT 
		* 
	from 
		player_information 
	where 
		player_id IN (SELECT player_id from batter_handedness)
		
	), pitchers AS 
	
	(
	SELECT 
		* 
	from 
		player_information 
	where 
		player_id IN (SELECT player_id from pitcher_handedness)
	)
	
	SELECT
		game_information.game_date AS "date",
		batters.player_id AS "batter_id",
		batters.first_name AS "batter_first",
		batters.last_name AS "batter_last",
		pitchers.player_id AS "pitcher_id",
		pitchers.first_name AS "pitcher_first",
		pitchers.last_name AS "pitcher_last",
		at_bat_specifics.balls AS "balls",
		at_bat_specifics.strikes AS "strikes",
		at_bat_specifics.pitch_sequence AS "pitch_sequence"
	FROM
		game_information INNER JOIN
		at_bat_specifics ON
		game_information.game_id = at_bat_specifics.game_id INNER JOIN
		batters ON
		batters.player_id = at_bat_specifics.batter_id INNER JOIN
		pitchers ON
		pitchers.player_id = at_bat_specifics.pitcher_id
	;
