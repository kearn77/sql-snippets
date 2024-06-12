def normalize_data(file_name, field_numbers) -> list:
    """
    Identify duplicate information for normalization.
    """
    normalized_data = []
    visited = []

    # Assumes source file has header information.
    for column in list(open(file_name,"r"))[1:]:
        all_fields = [i.strip() for i in column.split(',')]
        filtered_fields = [all_fields[i] for i in field_numbers]
            
        # Assumes first field_number is a primary key.
        if filtered_fields[0] in visited:
            continue

        visited.append(filtered_fields[0])
        normalized_data.append(','.join(filtered_fields) + "\n")

    return normalized_data

def get_player_csv(output_file) -> None:
    """
    Writes a csv of player information.
    """
    batters = normalize_data(
        "../source_files/fenway_july_strikeouts_2021.csv",
        [6,7,8]
        )
    pitchers = normalize_data(
        "../source_files/fenway_july_strikeouts_2021.csv",
        [10,11,12]
        )

    with open(output_file,"w") as fhand:
        for index,record in enumerate(batters + pitchers):
            fhand.write(f"{index+1},{record}")

def get_game_csv(output_file) -> None:
    """
    Writes a csv of general game information.
    """
    game_information = normalize_data("../source_files/fenway_july_strikeouts_2021.csv",[0,1,4])

    with open(output_file,"w") as fhand:

        for index,record in enumerate(game_information):
            fhand.write(f"{index+1},{record}")

def get_player_specifics(field_numbers, output_file, player_ids) -> None:
    """
    Writes a csv of batter or pitcher specifics.
    """
    player_specifics = normalize_data("../source_files/fenway_july_strikeouts_2021.csv",field_numbers)

    with open(output_file,"w") as fhand:

        for record in player_specifics:
            fields = [i.strip() for i in record.split(',')]
            current_id = player_ids[fields[0]]
            fhand.write(f"{current_id},{fields[1]}\n")

def get_at_bats(output_file,player_ids,game_ids,field_numbers=[0,6,10,2,3,14]) -> None:
    """
    Writes a csv of at bat information.
    """
    with open(output_file,"w") as fhand:
         
        for record in list(open("../source_files/fenway_july_strikeouts_2021.csv","r"))[1:]:
            # Filter desired field information.
            all_fields = [i.strip() for i in record.split(',')]
            filtered_fields = [all_fields[i] for i in field_numbers]

            # Identify foreign keys.
            game_id = game_ids[filtered_fields[0]]
            batter_id = player_ids[filtered_fields[1]] 
            pitcher_id = player_ids[filtered_fields[2]] 

            # Write to csv.
            at_bat_specifics = filtered_fields[3:]
            fhand.write(f"{game_id},{batter_id},{pitcher_id},{','.join(at_bat_specifics)}\n")


if __name__ == "__main__":
    get_player_csv("player_information.csv")
    get_game_csv("game_information.csv")

    player_data = dict()
    for record in list(open("player_information.csv","r")):
        fields = [i.strip() for i in record.split(',')]

        if fields[1] not in player_data:
            player_data[fields[1]] = fields[0]

    game_data = dict()
    for record in list(open("game_information.csv","r")):
        fields = [i.strip() for i in record.split(',')]

        if fields[1] not in player_data:
            game_data[fields[1]] = fields[0]
    
    get_player_specifics([6,9],"batter_handedness.csv",player_data)
    get_player_specifics([10,13],"pitcher_handedness.csv",player_data)
    get_at_bats("at_bat_specifics.csv",player_data,game_data)
