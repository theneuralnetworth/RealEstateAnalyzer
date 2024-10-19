import re
import random
import json
import os
import random

# Function to read JSON data from a file in a directory
def read_json_from_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        return json.load(file)

# Function to process the data and generate Prolog facts
def generate_prolog_facts(data, output_file_path):
    fact_counter = 91  # Counter to track the fact number globally





    
    prolog_facts = []
    
    for item in data:
        id_imovel = item.get("id")
        title = item.get("title").replace("'", "")
        description = item.get("description").replace("'", "")
        location = item.get("location").replace("'", "")
        
        # Fact: Property
        prolog_facts.append(f"fact({fact_counter}, property({id_imovel}, '{title}', '{description}')).")
        fact_counter += 1
        
        # Fact: Location Property
        prolog_facts.append(f"fact({fact_counter}, location_property({id_imovel}, '{location.lower()}')).")
        fact_counter += 1
        
        # Handle ramps (Acessibilidade para pessoas com mobilidade reduzida)
        ramps_present = 'Acessibilidade para pessoas com mobilidade reduzida' in item.get("features", [])
        prolog_facts.append(f"fact({fact_counter}, ramps({id_imovel}, {'present' if ramps_present else 'absent'})).")
        fact_counter += 1
        
        # Handle security system based on features
        security_features = ["portas e janelas de segurança", "monitorização", "estores anti-roubo"]
        security_present = any(feature in item.get("features", []) for feature in security_features)
        prolog_facts.append(f"fact({fact_counter}, security_system({id_imovel}, {'present' if security_present else 'absent'})).")
        fact_counter += 1
        
        # Elevator check
        prolog_facts.append(f"fact({fact_counter}, elevator({id_imovel}, {'present' if 'elevador' in item.get('features', []) else 'absent'})).")
        fact_counter += 1
        
        # Swimming pool check
        swimming_pool_present = 'piscina' in item.get("features", [])
        prolog_facts.append(f"fact({fact_counter}, swimming_pool({id_imovel}, {'present' if swimming_pool_present else 'absent'})).")
        fact_counter += 1
        
        # Garden check
        garden_present = 'jardim' in item.get("features", [])
        prolog_facts.append(f"fact({fact_counter}, garden({id_imovel}, {'present' if garden_present else 'absent'})).")
        fact_counter += 1
        
        # Property condition
        prolog_facts.append(f"fact({fact_counter}, property_condition({id_imovel}, 'regular')).")
        fact_counter += 1
        
        # Extract characteristics (e.g., price, energy rating, area, etc.)
        characteristics = item.get("characteristics", [])
        area = 0
        rooms = 0
        price = None
        year_of_construction = None
        
        for char in characteristics:
            if char['label'] == 'Preço':
                price = re.sub(r'[^\d]', '', char['localizedValue'])  # Remove non-numeric characters
                prolog_facts.append(f"fact({fact_counter}, price({id_imovel}, {price})).")
                fact_counter += 1
            if char['label'] == 'Certificado energético':
                energy_rating = char['localizedValue']
                prolog_facts.append(f"fact({fact_counter}, energy_rating({id_imovel}, '{energy_rating.lower()}')).")
                fact_counter += 1
            if char['label'] == 'Área':
                area = int(re.search(r'\d+', char['localizedValue']).group())
                prolog_facts.append(f"fact({fact_counter}, area({id_imovel}, {area})).")
                fact_counter += 1
            if char['label'] == 'Tipologia':
                tipologia = char['localizedValue']
                rooms = int(re.search(r'\d+', tipologia).group()) if re.search(r'\d+', tipologia) else 0
                prolog_facts.append(f"fact({fact_counter}, rooms({id_imovel}, {rooms})).")
                fact_counter += 1
            if char['label'] == 'Ano de construção':
                year_of_construction = re.search(r'\d+', char['localizedValue']).group()
        
        # If year_of_construction is found, add the fact, otherwise mark as absent
        if year_of_construction:
            prolog_facts.append(f"fact({fact_counter}, year_construction({id_imovel}, {year_of_construction})).")
        else:
            random_year = random.randint(1980, 2020)
            prolog_facts.append(f"fact({fact_counter}, year_construction({id_imovel}, {random_year})).")
        fact_counter += 1
        
        # Default fact for garage
        #prolog_facts.append(f"fact({fact_counter}, garage({id_imovel}, absent)).")
        #fact_counter += 1

        random_garage = random.choice(['present', 'absent'])
        prolog_facts.append(f"fact({fact_counter}, garage({id_imovel}, {random_garage})).")
        fact_counter += 1

        
        #random_optical = random.choice(['present', 'absent'], weights=[70, 30], k=1)[0]
        random_optical = random.choices(['present', 'absent'], weights=[70, 30], k=1)[0]
        prolog_facts.append(f"fact({fact_counter}, optical_fiber({id_imovel}, {random_optical})).")
        fact_counter += 1

        random_smart = random.choice(['present', 'absent'])
        prolog_facts.append(f"fact({fact_counter}, smart_appliances({id_imovel}, {random_smart})).")
        fact_counter += 1
        
        # Random floor level between 1 and 6
        random_floor_level = random.randint(1, 6)
        prolog_facts.append(f"fact({fact_counter}, floor_level({id_imovel}, {random_floor_level})).")
        fact_counter += 1
        
        # Calculate area per room
        area_per_room = area / rooms if rooms > 0 else area
        prolog_facts.append(f"fact({fact_counter}, area_per_room({id_imovel}, {area_per_room})).")
        fact_counter += 1
        
        # Random sun orientation
        orientations = ['north', 'south', 'east', 'west']
        random_orientation = random.choice(orientations)
        prolog_facts.append(f"fact({fact_counter}, sun_orientation({id_imovel}, {random_orientation})).")
        fact_counter += 1
        
        # Image facts
        images = item.get("images", [])
        for image in images:
            prolog_facts.append(f"fact({fact_counter}, image({id_imovel}, '{image}')).")
            fact_counter += 1
        
        # Add a blank line for better readability between properties
        prolog_facts.append("")

    # Write the generated Prolog facts to a file
    with open(output_file_path, 'w', encoding='utf-8') as output_file:
        for fact in prolog_facts:
            output_file.write(fact + '\n')

# Generate the Prolog facts and write to a file
directory = '../ImoveisData/'  # Directory where the JSON file is located
file_name = 'formatted_property_data.json'  # Name of the JSON file
output_file = '../ImoveisData/prolog_facts.pl'  # Output Prolog file
file_path = os.path.join(directory, file_name)

# Read the JSON data from the file
json_data = read_json_from_file(file_path)

# Generate the Prolog facts and write to a file
generate_prolog_facts(json_data, output_file)