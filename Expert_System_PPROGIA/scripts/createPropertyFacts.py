import json

def generate_prolog_facts(data):
    facts = []
    fact_counter = 1

    for property in data:
        # Property fact
        facts.append(f"facto({fact_counter}, property({property['id']}, '{property['title'].replace("'", "''")}', '{property['description'].replace("'", "''")}')).")
        fact_counter += 1

        # Features fact
        features_str = ', '.join([f"'{feature}'" for feature in property['features']])
        facts.append(f"facto({fact_counter}, features({property['id']}, [{features_str}])).")
        fact_counter += 1

        # Characteristics facts
        for characteristic in property['characteristics']:
            label = characteristic['label'].lower().replace(' ', '_').replace('º', '')
            value = characteristic['localizedValue'].replace("'", "''")
            facts.append(f"facto({fact_counter}, {label}({property['id']}, '{value}')).")
            fact_counter += 1

        # Images facts
        for image_url in property['images']:
            facts.append(f"facto({fact_counter}, image({property['id']}, '{image_url}')).")
            fact_counter += 1

        # Location fact
        facts.append(f"facto({fact_counter}, location({property['id']}, '{property['location']}')).")
        fact_counter += 1

    return facts

# Read the JSON file
with open('/Users/luispaula/Desktop/MEIA/RealEstateAnalyzer/ImoveisData/extracted_property_data.json', 'r', encoding='utf-8') as file:
    data = json.load(file)

# Generate Prolog facts
prolog_facts = generate_prolog_facts(data)

# Write facts to a .pl file
with open('/Users/luispaula/Desktop/MEIA/RealEstateAnalyzer/ImoveisData/facts/properties.pl', 'w', encoding='utf-8') as file:
    file.write('\n'.join(prolog_facts))

print("Prolog facts have been generated and saved to 'ImoveisData/facts/properties.pl'")