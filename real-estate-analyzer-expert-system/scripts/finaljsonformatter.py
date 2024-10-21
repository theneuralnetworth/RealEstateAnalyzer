import json
from datetime import datetime
import random

# Sample JSON input (from your previous example)
input_file = '../ImoveisData/formatted_property_data.json'

with open(input_file, 'r', encoding='utf-8') as f:
    data = json.load(f)



# Get current year
current_year = datetime.now().year


# Function to extract the number of rooms from "Tipologia"
def get_number_of_rooms(tipologia_value):
    try:
        # Extract the number after 'T' (e.g., "T0" -> 0)
        number_of_rooms = int(tipologia_value[1:])
        # If it's T0, treat it as 1 room (studio)
        return number_of_rooms + 1
    except:
        return None 

# Iterate through the items to add the features to the "characteristics" section of the JSON
for item in data:
    # Handle ramps (Acessibilidade para pessoas com mobilidade reduzida)
    ramps_present = 'Acessibilidade para pessoas com mobilidade reduzida' in item.get("features", [])
    item["characteristics"].append({
        "label": "ramps",
        "localizedValue": "present" if ramps_present else "absent"
    })
    
    # Handle security system based on features
    security_features = ["portas e janelas de segurança", "monitorização", "estores anti-roubo"]
    security_present = any(feature in item.get("features", []) for feature in security_features)
    item["characteristics"].append({
        "label": "security_system",
        "localizedValue": "present" if security_present else "absent"
    })
    
    # Elevator check
    elevator_present = 'elevador' in item.get("features", [])
    item["characteristics"].append({
        "label": "elevator",
        "localizedValue": "present" if elevator_present else "absent"
    })
    
    # Swimming pool check
    swimming_pool_present = 'piscina' in item.get("features", [])
    item["characteristics"].append({
        "label": "swimming_pool",
        "localizedValue": "present" if swimming_pool_present else "absent"
    })
    
    # Garden check
    garden_present = 'jardim' in item.get("features", [])
    item["characteristics"].append({
        "label": "garden",
        "localizedValue": "present" if garden_present else "absent"
    })


    # Check if "year_construction" already exists
    year_exists = any(char["label"] == "Ano de construção" for char in item["characteristics"])
    
    # If "year_construction" doesn't exist, apply the logic
    if not year_exists:
        # Get the value of "Nova construção"
        nova_construcao = next((char['localizedValue'] for char in item["characteristics"] if char["label"] == "Nova construção"), "não")
        
        # If "Nova construção" is "sim", use the current year, otherwise generate a random year between 1980 and 2020
        if nova_construcao == "sim":
            year_of_construction = current_year
        else:
            year_of_construction = random.randint(1980, 2020)
        
        # Add the year_of_construction to the characteristics
        item["characteristics"].append({
            "label": "Ano de construção",
            "localizedValue": year_of_construction
        })

    garage_exists = 'garagem' in item.get("features", [])
    
    # If garage exists, mark it as "present", otherwise generate a random value for "garage"
    if garage_exists:
        garage_value = "present"
    else:
        garage_value = random.choices(['present', 'absent'], weights=[30,70], k=1)[0]
    
    # Add the garage label to the characteristics
    item["characteristics"].append({
        "label": "garage",
        "localizedValue": garage_value
    })


    random_optical = random.choices(['present', 'absent'], weights=[90, 10], k=1)[0]
    item["characteristics"].append({
        "label": "optical_fiber",
        "localizedValue": random_optical
    })

    orientations = ['north', 'south', 'east', 'west']
    random_orientation = random.choice(orientations)
    item["characteristics"].append({
        "label": "sun_orientation",
        "localizedValue": random_orientation
    })


    floor_exists = any(char["label"] == "Andar" for char in item["characteristics"])
    
    # If "floor" doesn't exist, apply the logic
    if  floor_exists:
        # Get the value of "floor"
        floor = next((char['localizedValue'] for char in item["characteristics"] if char["label"] == "Andar"))
        
        
        if floor == "rés do chão":
            floor_number = 0
        else:
            floor_number = floor
        
        # Add the year_of_construction to the characteristics
        item["characteristics"].append({
            "label": "floor number",
            "localizedValue": floor_number
        })

    random_smart= random.choice(['present', 'absent'])

    item["characteristics"].append({
        "label": "smart_appliances",
        "localizedValue": random_smart
    })

    tipologia = next((char['localizedValue'] for char in item["characteristics"] if char["label"] == "Tipologia"), None)
    
    if tipologia:
        # Get the number of rooms based on the tipologia (T0, T1, T2, etc.)
        number_of_rooms = get_number_of_rooms(tipologia)
        
        if number_of_rooms is not None:
            # Add the number_of_rooms to the characteristics
            item["characteristics"].append({
                "label": "number_of_rooms",
                "localizedValue": number_of_rooms
            })

     # Now, calculate the area per room if "Área" exists
            area = next((char['localizedValue'] for char in item["characteristics"] if char["label"] == "Área"), None)
            
            if area:
                # Convert area from string to a float (remove "m²" and spaces)
                area_value = float(area.replace("m²", "").strip().replace(",", "."))
                
                # Calculate area per room
                area_per_room = area_value / number_of_rooms
                
                # Add the area_per_room to the characteristics
                item["characteristics"].append({
                    "label": "area_per_room",
                    "localizedValue": round(area_per_room, 2)  # Round to 2 decimal places
                })

           

        

            if year_of_construction < 1995:
                termalconfort = 'low'
            elif 1995 <= year_of_construction < 2010:
                termalconfort = 'medium'
            else:
                termalconfort = 'high'

            item["characteristics"].append({
                    "label": "thermalconfort",
                    "localizedValue": termalconfort
                })
        
            item["characteristics"].append({
                    "label": "acoustic_insulation",
                    "localizedValue": termalconfort
                })

        

        




# Output the updated JSON
with open('../ImoveisData/finalproperties.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, ensure_ascii=False, indent=4)



