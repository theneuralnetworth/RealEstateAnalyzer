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
        'acessibilidade para pessoas com mobilidade reduzida': 'hasAccessibility',
        'elevador': 'hasElevator',
        'piscina': 'hasPool',
        'jardim': 'hasGarden',
        'garagem': 'hasGarage',
        'estacionamento': 'hasParking',
        'ar condicionado': 'hasAirConditioning',
        'vista mar': 'hasSeaView',
        'vista rio': 'hasRiverView',
        'floresta': 'hasForestView',
    }

    # Security feature counting
    security_features = [
        'condomínio fechado',
        'estores anti-roubo',
        'intercomunicador / videoporteiro',
        'monitorização',
        'portas e janelas de segurança',
        'sistema de alarme'
    ]

    special_chars_map = {
        'preço': 'price',
        'área': 'area',
        'preço/m2': 'pricePerSquareMeter',
        'nova construção': 'newConstruction',
        'certificado energético': 'energyClass',
        'n.º de casas de banho': 'numberBathrooms',
        'aquecimento': 'heating',
        'fase de acabamento': 'status',
        'n.º de andares': 'numberFloors',
        'tipo de imóvel': 'propertyType',
        'ano de construção': 'buildYear',
        'tipologia': 'typology'
    }

    for property in data:
        # Property fact
        facts.append(f"facto({fact_counter}, property({property['id']}, '{property['title'].replace("'", "''")}', '{property['description'].replace("'", "''")}')).")
        fact_counter += 1
        security_count = 0

        print(f"Property Features > {property['features']}")

        # Check for features in feature_mapping
        for feature in feature_mapping.keys():
            # Check if the property has the feature
            has_feature = feature.lower() in (f.lower() for f in property['features'])
            predicate = special_chars_map.get(feature.lower(), feature_mapping[feature.lower()])

            facts.append(f"facto({fact_counter}, {predicate}({property['id']}, {str(has_feature).lower()})).")
            fact_counter += 1
            
            # Count security features separately
            if has_feature and feature in security_features:
                security_count += 1

        # Check for security features
        for security_feature in security_features:
            has_security_feature = security_feature.lower() in (f.lower() for f in property['features'])
            if has_security_feature:
                security_count += 1

        # Create hasSecurity fact based on the count
        if security_count >= 1:
            security_value = str(True).lower()
        else:
            security_value = str(False).lower()

        facts.append(f"facto({fact_counter}, hasSecurity({property['id']}, {security_value})).")
        fact_counter += 1

        # Characteristics facts
        for characteristic in property['characteristics']:
            original_label = characteristic['label'].lower()
            value = characteristic['localizedValue'].replace("'", "''")
            
            # Use the mapped value if it exists in special_chars_map, otherwise use the original (cleaned) label
            label = special_chars_map.get(original_label, original_label.replace(' ', '_').replace('º', ''))
            
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
# with open('/Users/luispaula/Desktop/MEIA/RealEstateAnalyzer/ImoveisData/extracted_property_data.json', 'r', encoding='utf-8') as file:
with open('C:/ISEP/Neural Networth/RealEstateAnalyzer/Expert_System_PPROGIA/utils/ImoveisData/formatted_property_data.json', 'r', encoding='utf-8') as file:
    data = json.load(file)

# Generate Prolog facts
prolog_facts = generate_prolog_facts(data)

# Write facts to a .pl file
with open('C:/ISEP/Neural Networth/RealEstateAnalyzer/Expert_System_PPROGIA/utils/ImoveisData/saved_properties.pl', 'w', encoding='utf-8') as file:
    file.write('\n'.join(prolog_facts))

print("Prolog facts have been generated and saved to 'ImoveisData/facts/saved_properties.pl'")
