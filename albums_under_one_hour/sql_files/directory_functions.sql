/*
 * Returns the hours component of a time in the following format:
 * 'hours:minutes:seconds:milliseconds'.
*/
CREATE OR REPLACE FUNCTION ms_hours(num BIGINT)
  RETURNS NUMERIC
  LANGUAGE SQL
  IMMUTABLE
  RETURNS NULL ON NULL INPUT
  RETURN num::NUMERIC / (1000*60*60)::NUMERIC; 

/*
 * Returns the minutes component of a time in the following format:
 * 'hours:minutes:seconds:milliseconds'.
*/
CREATE OR REPLACE FUNCTION ms_minutes(num BIGINT)
  RETURNS NUMERIC
  LANGUAGE SQL
  IMMUTABLE
  RETURNS NULL ON NULL INPUT
  RETURN ms_hours(num) % 1 * 60;

/*
 * Returns the seconds component of a time in the following format:
 * 'hours:minutes:seconds:milliseconds'.
*/
CREATE OR REPLACE FUNCTION ms_seconds(num BIGINT)
  RETURNS NUMERIC
  LANGUAGE SQL
  IMMUTABLE
  RETURNS NULL ON NULL INPUT
  RETURN ms_minutes(num) % 1 * 60;

/*
 * Returns the milliseconds component of a time in the following format:
 * 'hours:minutes:seconds:milliseconds'.
*/
CREATE OR REPLACE FUNCTION ms_milliseconds(num BIGINT)
  RETURNS NUMERIC
  LANGUAGE SQL
  IMMUTABLE
  RETURNS NULL ON NULL INPUT
  RETURN ms_seconds(num) % 1 * 60;

/*
 * Returns a TEXT representation of time in the following format:
 * 'hours:minutes:seconds:milliseconds'.
*/
CREATE OR REPLACE FUNCTION ms_text(num BIGINT)
  RETURNS TEXT
  LANGUAGE SQL
  IMMUTABLE
  RETURNS NULL ON NULL INPUT
  RETURN    LPAD(FLOOR(ms_hours(num))::TEXT, 2, '0')
         || ':'
         || LPAD(FLOOR(ms_minutes(num))::TEXT, 2, '0')
         || ':'
         || LPAD(FLOOR(ms_seconds(num))::TEXT, 2, '0')
         || ':'
         || LPAD(FLOOR(ms_milliseconds(num))::TEXT, 2, '0');

/*
 * Returns an album title when given a valid album_id.
*/
CREATE OR REPLACE FUNCTION get_album_name(album_id INTEGER)
  RETURNS TEXT
  LANGUAGE SQL
  STABLE
  RETURNS NULL ON NULL INPUT
  RETURN (
            SELECT 
              title 
            FROM 
              album 
            WHERE 
              album_id = $1
  );
