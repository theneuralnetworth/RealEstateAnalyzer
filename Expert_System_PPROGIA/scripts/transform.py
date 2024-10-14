import re

def parse_boolean(value):
    return 'present' if value.lower() == 'true' else 'absent'

def parse_value(key, value):
    if key in ['ramps', 'elevator', 'swimming_pool', 'garden', 'hasGarage', 'hasParking', 'hasAirConditioning', 'hasSeaView', 'hasRiverView', 'hasForestView', 'hasSecurity']:
        return parse_boolean(value)
    elif key in ['area', 'price', 'pricePerSquareMeter']:
        return value.replace("'", "")
    else:
        return value

def transform_properties(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as infile, open(output_file, 'w', encoding='utf-8') as outfile:
        current_property = {}
        fact_counter = 1

        for line in infile:
            match = re.match(r'facto\((\d+),\s*(\w+)\(([^,]+),\s*(.+)\)\)\.', line.strip())
            if match:
                _, predicate, id, value = match.groups()
                
                if predicate == 'property':
                    if current_property:
                        write_property(outfile, current_property, fact_counter)
                        fact_counter += len(current_property) + len(current_property.get('image', []))
                    current_property = {'id': id, 'property': value}
                elif predicate == 'image':
                    current_property.setdefault('image', []).append(value)
                else:
                    current_property[predicate] = parse_value(predicate, value)

        if current_property:
            write_property(outfile, current_property, fact_counter)

def write_property(outfile, property_data, start_counter):
    counter = start_counter
    outfile.write(f"facto({counter}, property({property_data['id']}, {property_data['property']})).\n")
    counter += 1

    predicates = [
        'location_property', 'security_system', 'elevator', 'ramps', 'swimming_pool', 'garden',
        'property_condition', 'energy_rating', 'garage', 'year_construction', 'floor_level',
        'area', 'rooms', 'area_per_room', 'sun_orientation'
    ]

    for predicate in predicates:
        value = property_data.get(predicate, 'unknown')
        if predicate == 'security_system':
            value = property_data.get('hasSecurity', 'absent')
        elif predicate == 'garage':
            value = property_data.get('hasGarage', 'absent')
        outfile.write(f"facto({counter}, {predicate}({property_data['id']}, {value})).\n")
        counter += 1

    for image_url in property_data.get('image', []):
        outfile.write(f"facto({counter}, image({property_data['id']}, {image_url})).\n")
        counter += 1

    outfile.write("\n")

# Usage
input_file = '../Facts/properties.pl'
output_file = '../Facts/transformed_properties.pl'
transform_properties(input_file, output_file)