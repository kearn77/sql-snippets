/*
These functions take a player_id as input and return the associated
first or last name as output.  Collectively, they eliminate the need for
simple joins.
*/

-- Returns a player's first name.
CREATE OR REPLACE FUNCTION get_first_name(local_id INT) RETURNS TEXT AS $$
  BEGIN
    RETURN (SELECT first_name FROM player_information WHERE player_id = local_id);
  END;
$$ LANGUAGE plpgsql;

-- Returns a player's last name.
CREATE OR REPLACE FUNCTION get_last_name(local_id INT) RETURNS TEXT AS $$
  BEGIN
    RETURN (SELECT last_name FROM player_information WHERE player_id = local_id);
  END;
$$ LANGUAGE plpgsql;
