/*
 * SQL query that lists the approximate starting and ending times of an
 * album's tracks.  Because window functions cannot best nested, a
 * sub-query is required in the main FROM clause.  The where clause
 * filters for album's that have a runtime less than one hour.
*/
SELECT 
  album_id,
  track_id,
  get_album_name(album_id),
  name,

    SUBSTRING(
      LAG(ms_text(runtime_ms), 1, '00:00:00') OVER w_outer
      FROM '^\d\d:(\d\d:\d\d)') AS 

  starts_at,

    SUBSTRING(
      ms_text(runtime_ms)
      FROM '^\d\d:(\d\d:\d\d)') AS 

  ends_at
FROM (
        -- Provides a cumulative sum of milliseconds by track.
        SELECT
          album_id,
          track_id,
          name,
          milliseconds,
          SUM(milliseconds) OVER w_inner AS runtime_ms
        FROM
          track
        WINDOW w_inner AS
          (
            PARTITION BY album_id ORDER BY track_id 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
          )

    ) AS track_sums INNER JOIN
    (
        -- Provides a sum of milliseconds by album.
        SELECT
          album_id,
          SUM(milliseconds) AS album_runtime
        FROM
          track
        GROUP BY
          album_id

    ) AS album_sum USING(album_id)
WHERE
  album_runtime >= 1.8e+6 AND
  album_runtime < 3.6e+6
WINDOW w_outer AS 
  (
    PARTITION BY album_id
  )
ORDER BY
  album_id ASC
LIMIT 50;
;
