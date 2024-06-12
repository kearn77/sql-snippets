-- Pitchers who recorded a strikeout after throwing a strike on the first pitch.
SELECT
  COUNT(pitcher_id) FILTER (
	WHERE REGEXP_REPLACE(pitch_sequence,'[^A-Y]','','g') NOT SIMILAR TO '(B|V)%') AS 
  strikeouts,
  pitcher_first,
  pitcher_last
FROM
  july_strikeouts
GROUP BY
  pitcher_id,
  pitcher_first,
  pitcher_last
ORDER BY
  strikeouts DESC,
  pitcher_last ASC,
  pitcher_first ASC
;
