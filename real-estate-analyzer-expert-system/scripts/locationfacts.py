import json

# Sample JSON input (from your previous example)
input_json_file = '../ImoveisData/locations.json'

# Load the data from the JSON file
with open(input_json_file, 'r', encoding='utf-8') as f:
    data = json.load(f)
# Initialize fact counter
fact_counter = 14

# Function to generate facts
def generate_prolog_facts(data):
    prolog_facts = []
    global fact_counter

    for location_data in data:
        location = location_data["name"].replace("'", "")
        
        # Fact: Location Crime Rate
        prolog_facts.append(f"fact({fact_counter}, location_crime_rate('{location}', {location_data['crimeRate']})).")
        fact_counter += 1
        
        # Fact: Nearby Schools
        prolog_facts.append(f"fact({fact_counter}, nearby_schools('{location}', {location_data['nearbySchools']})).")
        fact_counter += 1
        
        # Fact: Nearby Public Transport
        prolog_facts.append(f"fact({fact_counter}, nearby_public_transport('{location}', {location_data['nearbyPublicTransport']})).")
        fact_counter += 1
        
        # Fact: Nearby Hospitals
        prolog_facts.append(f"fact({fact_counter}, nearby_hospitals('{location}', {location_data['nearbyHospitals']})).")
        fact_counter += 1
        
        # Fact: Nearby Supermarkets
        prolog_facts.append(f"fact({fact_counter}, nearby_supermarkets('{location}', {location_data['nearbySupermarkets']})).")
        fact_counter += 1
        
        # Fact: Nearby Leisure Areas
        prolog_facts.append(f"fact({fact_counter}, nearby_leisure_areas('{location}', {location_data['nearbyLeisureAreas']})).")
        fact_counter += 1
        
        # Fact: Parking Availability
        prolog_facts.append(f"fact({fact_counter}, parking('{location}', {location_data['parking']})).")
        fact_counter += 1
        
        # Fact: Last 5 years appreciation rate
        prolog_facts.append(f"fact({fact_counter}, last_5_years_increased('{location}', {location_data['last5YearsIncreased']})).")
        fact_counter += 1
        
        # Fact: Forest proximity
        prolog_facts.append(f"fact({fact_counter}, forest('{location}', {location_data['forest']})).")
        fact_counter += 1
        
        # Fact: Beach proximity
        prolog_facts.append(f"fact({fact_counter}, beach('{location}', {location_data['beach']})).")
        fact_counter += 1

        # Fact: airport proximity
        prolog_facts.append(f"fact({fact_counter}, airport('{location}', {location_data['airport']})).")
        fact_counter += 1

        # Fact: busy_traffic
        prolog_facts.append(f"fact({fact_counter}, busy_traffic('{location}', {location_data['busyTraffic']})).")
        fact_counter += 1
        
        # Add a blank line for better readability between locations
        prolog_facts.append("")

    return prolog_facts

# Generate the Prolog facts
prolog_facts = generate_prolog_facts(data)

# Output the Prolog facts
output_file_path = '../Facts/location_facts.pl'
with open(output_file_path, 'w', encoding='utf-8') as f:
    for fact in prolog_facts:
        f.write(fact + '\n')

print(f"Prolog facts written to {output_file_path}")