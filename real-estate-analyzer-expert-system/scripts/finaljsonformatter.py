import json
from datetime import datetime
import random

# Sample JSON input (from your previous example)
input_file = '../ImoveisData/formatted_property_data.json'

with open(input_file, 'r', encoding='utf-8') as f:
    data = json.load(f)



# Get current year
current_year = datetime.now().year

properties = {}
property_list = []


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
for item in data[:40]:
    
    new_property = {}
    
    id_imovel = item.get("id")
    title = item.get("title", "").replace("'", "")
    description = item.get("description", "").replace("'", "")
    location = item.get("location", "").replace("'", "").lower()
    
    for characteristic in item["characteristics"]:
        if characteristic["label"] == "Preço":
            price = characteristic["localizedValue"].replace('€', '').replace(' ', '')
          
        if characteristic["label"] == "Área":
            area = characteristic["localizedValue"].replace('m²', '').replace(' ', '')
        
        if characteristic["label"] == "Tipologia":
            typology = characteristic["localizedValue"]
            
        if characteristic["label"] == "Certificado energético":
            energyRate = characteristic["localizedValue"].lower()
      
        
        
        if characteristic["label"] == "N.º de casas de banho":
            toilets  = characteristic["localizedValue"]
            
            
            
    
    new_property["id"] = id_imovel
    new_property["title"] = title
    new_property["description"] = description
    new_property["location"] = location
    new_property["price"] = price
    new_property["areaSqm"] = area
    new_property["typology"] =  typology
    
    possible_values = ['a', 'b', 'c', 'd', 'f']
    if energyRate  == "isento / em curso":
        new_property["energyRating"] = random.choice(possible_values)
    elif energyRate  == "a_plus":
        new_property["energyRating"] =  "a"
    else :
        new_property["energyRating"] =  energyRate
        
    new_property["toiletsNumber"] =  toilets
    
    
    # Handle ramps (Acessibilidade para pessoas com mobilidade reduzida)
    ramps_present = 'Acessibilidade para pessoas com mobilidade reduzida' in item.get("features", [])
    #item["characteristics"].append({
     #   "label": "ramps",
      #  "localizedValue": "present" if ramps_present else "absent"
    #})
    new_property["ramps"] = "present" if ramps_present else "absent"
    
    
    # Handle security system based on features
    security_features = ["portas e janelas de segurança", "monitorização", "estores anti-roubo"]
    security_present = any(feature in item.get("features", []) for feature in security_features)
    #item["characteristics"].append({
    #    "label": "security_system",
    #    "localizedValue": "present" if security_present else "absent"
    #})
    new_property["securitySystem"] = "present" if security_present else "absent"
    
    # Elevator check
    elevator_present = 'elevador' in item.get("features", [])
    #item["characteristics"].append({
     #   "label": "elevator",
      #  "localizedValue": "present" if elevator_present else "absent"
    #})
    new_property["elevator"] = "present" if elevator_present else "absent"
    
    # Swimming pool check
    swimming_pool_present = 'piscina' in item.get("features", [])
    #item["characteristics"].append({
    #    "label": "swimming_pool",
    #    "localizedValue": "present" if swimming_pool_present else "absent"
    #})
    new_property["swimmingPool"] = "present" if swimming_pool_present else "absent"
    
    # Garden check
    garden_present = 'jardim' in item.get("features", [])
    #item["characteristics"].append({
    #    "label": "garden",
    #    "localizedValue": "present" if garden_present else "absent"
    #})
    new_property["garden"] = "present" if garden_present else "absent"
    
    #print(new_property)


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
        #item["characteristics"].append({
        #    "label": "Ano de construção",
        #    "localizedValue": year_of_construction
        #})
        new_property["yearConstruction"] = year_of_construction

    garage_exists = 'garagem' in item.get("features", [])
    
    # If garage exists, mark it as "present", otherwise generate a random value for "garage"
    if garage_exists:
        garage_value = "present"
    else:
        garage_value = random.choices(['present', 'absent'], weights=[30,70], k=1)[0]
    
    # Add the garage label to the characteristics
    #item["characteristics"].append({
    #    "label": "garage",
    #    "localizedValue": garage_value
    #})
    new_property["garage"] = garage_value


    random_optical = random.choices(['present', 'absent'], weights=[90, 10], k=1)[0]
    #item["characteristics"].append({
    #    "label": "optical_fiber",
    #    "localizedValue": random_optical
    #})
    new_property["opticalFiber"] = random_optical

    orientations = ['north', 'south', 'east', 'west']
    random_orientation = random.choice(orientations)
    #item["characteristics"].append({
    #    "label": "sun_orientation",
    #    "localizedValue": random_orientation
    #})
    new_property["sunOrientation"] = random_orientation


    floor_exists = any(char["label"] == "Andar" for char in item["characteristics"])
    
    # If "floor" doesn't exist, apply the logic
    if  floor_exists:
        # Get the value of "floor"
        floor = next((char['localizedValue'] for char in item["characteristics"] if char["label"] == "Andar"))
        
        
        if floor == "rés do chão":
            floor_number = 0
        else:
            floor_number = floor_exists
            
    else : 
        
        floor_number = random.randint(0, 5)
        
        # Add the year_of_construction to the characteristics
        #item["characteristics"].append({
        #    "label": "floor number",
        #    "localizedValue": floor_number
        #})
        new_property["floorLevel"] = floor_number

    random_smart= random.choice(['present', 'absent'])

    #item["characteristics"].append({
    #    "label": "smart_appliances",
    #    "localizedValue": random_smart
    #})
    new_property["smartAppliances"] = random_smart

    tipologia = next((char['localizedValue'] for char in item["characteristics"] if char["label"] == "Tipologia"), None)
    
    if tipologia:
        # Get the number of rooms based on the tipologia (T0, T1, T2, etc.)
        number_of_rooms = get_number_of_rooms(tipologia)
        
        if number_of_rooms is not None:
            # Add the number_of_rooms to the characteristics
            #item["characteristics"].append({
            #    "label": "number_of_rooms",
            #    "localizedValue": number_of_rooms
            #})
            new_property["numberRooms"] = number_of_rooms

     # Now, calculate the area per room if "Área" exists
            area = next((char['localizedValue'] for char in item["characteristics"] if char["label"] == "Área"), None)
            
            if area:
                # Convert area from string to a float (remove "m²" and spaces)
                area_value = float(area.replace("m²", "").strip().replace(",", "."))
                
                # Calculate area per room
                area_per_room = area_value / number_of_rooms
                
                # Add the area_per_room to the characteristics
                #item["characteristics"].append({
                #    "label": "area_per_room",
                #    "localizedValue": round(area_per_room, 2)  # Round to 2 decimal places
                #})
                new_property["areaPerRoom"] = round(area_per_room, 2)

           

        

            if year_of_construction < 1995:
                termalconfort = 'low'
            elif 1995 <= year_of_construction < 2010:
                termalconfort = 'medium'
            else:
                termalconfort = 'high'

            #item["characteristics"].append({
            #        "label": "thermalconfort",
            #        "localizedValue": termalconfort
            #    })
        
            #item["characteristics"].append({
            #        "label": "acoustic_insulation",
            #        "localizedValue": termalconfort
            #    })
            
            new_property["thermalComfort"] = termalconfort
            new_property["acousticInsulation"] = termalconfort
        new_property["images"] = item.get("images")

    property_list.append(new_property)
    
#print(property_list)

        




# Output the updated JSON
with open('../ImoveisData/finalpropertiesDrools.json', 'w', encoding='utf-8') as f:
     json.dump(property_list, f, ensure_ascii=False, indent=4)



