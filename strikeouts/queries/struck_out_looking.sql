-- Batters who struck out looking.
SELECT
  COUNT(batter_id) FILTER(
    WHERE pitch_sequence NOT SIMILAR TO '%(S|T)') AS 
  strikeouts,
  batter_first,
  batter_last
FROM
  july_strikeouts
GROUP BY
  batter_id,
  batter_first,
  batter_last
ORDER BY
  strikeouts DESC,
  batter_last ASC,
  batter_first ASC
;
