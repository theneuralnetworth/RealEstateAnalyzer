import re

def extract_location(line):
    match = re.search(r'location_property\([^,]+,\s*\'([^\']+)\'', line)
    if match:
        return match.group(1)
    return None

def get_unique_locations(input_file):
    locations = set()
    with open(input_file, 'r', encoding='utf-8') as infile:
        for line in infile:
            if 'location_property' in line:
                location = extract_location(line)
                if location:
                    locations.add(location)
    return sorted(locations)

# Usage
input_file = '../Facts/updated_transformed_properties.pl'
unique_locations = get_unique_locations(input_file)

print("Unique locations found in the file:")
for location in unique_locations:
    print(f"- {location}")

print(f"\nTotal number of unique locations: {len(unique_locations)}")