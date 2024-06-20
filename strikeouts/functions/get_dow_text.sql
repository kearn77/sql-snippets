/*
Get the current day of the week as text.  Takes a date as an argument.
 */
CREATE OR REPLACE FUNCTION get_dow_text(i DATE) RETURNS TEXT AS $$
  DECLARE
    day_array TEXT[] := '{"SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"}';
  BEGIN
    RETURN (SELECT day_array[EXTRACT(dow FROM i)]);
  END;
$$ LANGUAGE plpgsql;

/*
Get the current day of the week as text.  Takes an int as an argument.
 */
CREATE OR REPLACE FUNCTION get_dow_text(i INT) RETURNS TEXT AS $$
  DECLARE
    day_array TEXT[] := '{"SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"}';
  BEGIN
    RETURN (SELECT day_array[i]);
  END;
$$ LANGUAGE plpgsql;
