import re

def extract_rooms(description):
    match = re.search(r'T(\d+)', description)
    if match:
        return int(match.group(1))
    return 'unknown'

def update_rooms(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as infile, open(output_file, 'w', encoding='utf-8') as outfile:
        property_info = {}
        current_property_id = None

        for line in infile:
            if line.startswith('facto('):
                parts = line.split(', ', 3)
                if len(parts) >= 3:
                    predicate = parts[1]
                    if predicate.startswith('property('):
                        current_property_id = predicate.split('(')[1].split(',')[0]
                        property_info[current_property_id] = extract_rooms(parts[2] + parts[3])
                    elif predicate.startswith('rooms('):
                        property_id = predicate.split('(')[1].split(',')[0]
                        if property_id in property_info:
                            line = f"facto({parts[0].split('(')[1]}, rooms({property_id}, {property_info[property_id]})).\n"
            outfile.write(line)

# Usage
input_file = '../Facts/transformed_properties.pl'
output_file = '../Facts/updated_transformed_properties.pl'
update_rooms(input_file, output_file)