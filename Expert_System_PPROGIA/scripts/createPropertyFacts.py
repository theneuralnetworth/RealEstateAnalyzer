import json

def extract_unique_features(data):
    unique_features = set()
    for property in data:
        unique_features.update(property['features'])
    return sorted(unique_features)

def generate_prolog_facts(data):
    facts = []
    fact_counter = 1
    unmapped_features = set()

    feature_mapping = {
        # Accessibility
        'acessibilidade para pessoas com mobilidade reduzida': 'hasAccessibility',
        'elevador': 'hasElevator',
        
        # Security
        hasSecurity
        'condomínio fechado': 'hasGatedCommunity',
        'estores anti-roubo': 'hasAntiTheftShutters',
        'intercomunicador / videoporteiro': 'hasIntercom',
        'monitorização': 'hasMonitoring',
        'portas e janelas de segurança': 'hasSecurityDoorsWindows',
        'sistema de alarme': 'hasAlarmSystem',

        # Outdoor Features
        'piscina': 'hasPool',

        hasOutdoorSpace
        'jardim': 'hasGarden',
        'terraço': 'hasTerrace',

        # Parking and Storage
        'garagem': 'hasGarage',
        'estacionamento': 'hasParking',

        # Appliances and Furnishings
        'ar condicionado': 'hasAirConditioning',

        # Views and Surroundings
        'vista mar': 'hasSeaView',
        'vista rio': 'hasRiverView',
        'floresta': 'hasForestView',
    }

    for property in data:
        # Property fact
        facts.append(f"facto({fact_counter}, property({property['id']}, '{property['title'].replace("'", "''")}', '{property['description'].replace("'", "''")}')).")
        fact_counter += 1

        # Individual feature facts
        for feature in property['features']:
            predicate = feature_mapping.get(feature.lower())
            if predicate:
                facts.append(f"facto({fact_counter}, {predicate}({property['id']})).")
                fact_counter += 1
            else:
                unmapped_features.add(feature)

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

    print("\nUnmapped features:")
    for feature in sorted(unmapped_features):
        print(f"'{feature}',")

    return facts

# Read the JSON file
with open('../ImoveisData/extracted_property_data.json', 'r', encoding='utf-8') as file:
    data = json.load(file)

# Extract unique features
unique_features = extract_unique_features(data)
print("Unique features found:")
for feature in unique_features:
    print(f"'{feature}',")

# Generate Prolog facts
prolog_facts = generate_prolog_facts(data)

# Write facts to a .pl file
with open('../ImoveisData/test/properties.pl', 'w', encoding='utf-8') as file:
    file.write('\n'.join(prolog_facts))

print("\nProlog facts have been generated and saved to 'ImoveisData/facts/properties.pl'")