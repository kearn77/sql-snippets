/*
Count the number of strikeouts where the first pitch thrown was a ball
vs a strike.
*/
SELECT
  COUNT(*) FILTER(WHERE regexp_replace(pitch_sequence, '[^A-Y]', '','g') SIMILAR TO '(B|V)%') AS ball_first,
  COUNT(*) FILTER(WHERE regexp_replace(pitch_sequence, '[^A-Y]', '','g') NOT SIMILAR TO '(B|V)%') AS strike_first
FROM
  july_strikeouts
;	
