/*
 * A common table expression that calculates a cumulative millisecond
 * sum for every track in an album.  Referenced at line sixty-five.
*/
WITH ms_sums AS (

  SELECT
    album_id,
    track_id,
    name,
    milliseconds,
    SUM(milliseconds) OVER w AS runtime_ms
  FROM
    track
  WINDOW w AS
    (
      PARTITION BY album_id ORDER BY track_id 
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )

), 

/*
 * A common table expression that calculates an album's total runtime.
 * Referenced at line sixty-six.
*/
ms_totals AS (

  SELECT
    album_id,
    SUM(milliseconds) AS total_runtime
  FROM
    track
  GROUP BY
    album_id

)

/*
 * SQL query that lists the approximate starting and ending times of an
 * album's tracks.  A common table expression named ms_sums calculates
 * cumulative millisecond sums by track, providing a track's end time.
 * The lag function provides the previous track's end time and, by
 * extension, the current track's start time.  The where clause filters
 * for album's that have a total runtime less than one hour.
*/
SELECT 
  album_id,
  track_id,
  get_album_name(album_id),   
  name,

    SUBSTRING(
      LAG(ms_text(runtime_ms), 1, '00:00:00') OVER w
      FROM '^\d\d:(\d\d:\d\d)') AS 

  starts_at,

    SUBSTRING(
      ms_text(runtime_ms)
      FROM '^\d\d:(\d\d:\d\d)') AS 

  ends_at
FROM 
  ms_sums INNER JOIN
  ms_totals t USING(album_id)
WHERE
  t.total_runtime >= 1.8e+6 AND
  t.total_runtime < 3.6e+6
WINDOW w AS 
  (
    PARTITION BY album_id
  )
ORDER BY
  album_id ASC
LIMIT 50
;
