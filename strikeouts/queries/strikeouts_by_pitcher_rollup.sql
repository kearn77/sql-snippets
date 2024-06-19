-- A CTE of all strikeouts, grouped by game_date and pitcher_id.
WITH strikeouts_by_pitcher AS (
  SELECT
    date AS game_date,
    pitcher_id,
    COUNT(*) AS strikeouts
  FROM
    july_strikeouts
  GROUP BY
    date,
    pitcher_id
  ORDER BY
    game_date ASC,
    strikeouts DESC
)

/*
Strikeout sums provided for pitcher, game date, and day of the week,
performed via rollup.  Ordered by strikeouts descending for every game
date.  This is accomplished through the use of a case expression that
assigns lower priorities to higher columns within the rollup hierarchy.
*/
SELECT
  get_dow_text(day_num::INT) AS "DayOfWeek",
  game_date AS "GameDate",
  get_last_name(pitcher_id) AS "PitcherFirst",
  get_first_name(pitcher_id) AS "PitcherLast",
  strikeouts AS "Strikeouts"
FROM
  (
    SELECT
      EXTRACT(dow FROM game_date) + 1 AS day_num,
      game_date,
      pitcher_id, 
      SUM(strikeouts) AS strikeouts
    FROM 
      strikeouts_by_pitcher 
    GROUP BY
      ROLLUP(day_num, game_date, pitcher_id)
    ORDER BY
      day_num ASC,
      game_date ASC,
      (
        CASE
          WHEN pitcher_id IS NOT NULL THEN 4
	  WHEN pitcher_id IS NULL AND game_date IS NULL THEN 3
	  WHEN pitcher_id IS NULL THEN 2
	  ELSE 1 
	END) DESC,
      strikeouts DESC,
      get_last_name(pitcher_id) ASC) AS main
;
