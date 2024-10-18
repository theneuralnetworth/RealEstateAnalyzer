import json

def generate_prolog_facts(data):
    facts = []
    unique_predicates = set(['image', 'location'])  # To store unique predicates
    fact_counter = 1
    unmapped_features = set()

    feature_mapping = {
        'acessibilidade para pessoas com mobilidade reduzida': 'ramps',
        'elevador': 'elevator',
        'piscina': 'swimming_pool',
        'jardim': 'garden',
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
        'price per meter': 'pricePerSquareMeter',
        'nova construção': 'property_condition',
        'certificado energético': 'energy_rating',
        'n.º de casas de banho': 'numberBathrooms',
        'aquecimento': 'heating',
        'fase de acabamento': 'status',
        'n.º de andares': 'numberFloors',
        'tipo de imóvel': 'propertyType',
        'ano de construção': 'year_construction',
        'tipologia': 'typology'
    }

    characteristics_to_ignore = ['status', 'serviços_à_distância', 'disponível_a_partir_de', 'material_de_construção']

    for property in data:
        # Property fact
        facts.append(f"facto({fact_counter}, property({property['id']}, '{property['title'].replace("'", "''")}', '{property['description'].replace("'", "''")}')).")
        unique_predicates.add(f"property({property['id']}, '{property['title'].replace("'", "''")}', '{property['description'].replace("'", "''")}')")  # Add to unique predicates
        fact_counter += 1
        security_count = 0


        # -------------------------- Check for features ------------------------#
        for feature in feature_mapping.keys():
            # Check if the property has the feature
            has_feature = feature.lower() in (f.lower() for f in property['features'])
            predicate = special_chars_map.get(feature.lower(), feature_mapping.get(feature.lower(), feature))

            facts.append(f"facto({fact_counter}, {predicate}({property['id']}, {str(has_feature).lower()})).")
            unique_predicates.add(f"{predicate}({property['id']}, {str(has_feature).lower()})")  # Add to unique predicates
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
        unique_predicates.add(f"hasSecurity({property['id']}, {security_value})")  # Add to unique predicates
        fact_counter += 1

        # ------------------------ Characteristics facts ----------------------------- #
        for characteristic in property['characteristics']:
            original_label = characteristic['label'].lower()
            value = characteristic['localizedValue'].replace("'", "''")
            label = ""
            
            label = special_chars_map[original_label] if original_label in special_chars_map else original_label.replace(' ', '_').replace('º', '')

            # property_condition in reality is "is_new_build", if yes then its "new", else we assume its "regular"
            if label == 'property_condition':
                value = 'new' if value == 'sim' else 'regular'
            
            if label == 'andar':
                value = 0 if value in ['rés do chão', 'águas furtadas', 'semi-cave'] else value

            # Format energy class to match rules values
            if label == 'energy_rating':
                value = 'absent' if value == 'isento / em curso' else value.lower()
                if len(value) > 1:
                    if value[1] == '++':
                        value = f"{value[0]}_plus_plus" 
                    elif value[1] == '+':
                        value = f"{value[0]}_plus" 
                    elif value[1] == '-':
                        value = f"{value[0]}_minus"

            value = '4_plus' if label == 'numberBathrooms' and value == '4 ou mais' else value
            
            # Remove €, m2 for price, area and pricePerSquareMeter values
            value = value.replace('€/m²','').replace('m²', '').replace('€', '').replace(' ', '') if label in ['price', 'area', 'pricePerSquareMeter', 'despesas_adicionais'] else value

            # characteristics to ignore
            if label not in characteristics_to_ignore: 
                facts.append(f"facto({fact_counter}, {label}({property['id']}, '{value}')).")
                unique_predicates.add(f"{label}({property['id']}, '{value}')")  # Add to unique predicates
                fact_counter += 1

        #  ------------------------ Images facts ---------------------#
        for image_url in property['images']:
            facts.append(f"facto({fact_counter}, image({property['id']}, '{image_url}')).")
            fact_counter += 1

        # -------------------------- Location fact -------------------#
        facts.append(f"facto({fact_counter}, location_property({property['id']}, '{property['location'].lower()}')).")
        fact_counter += 1

    # Extract only the predicate names (e.g., "property", "hasSecurity")
    predicate_names = {pred.split('(')[0] for pred in unique_predicates}

    # Write unique predicate names to a new .pl file
    with open('C:/ISEP/Neural Networth/RealEstateAnalyzer/Expert_System_PPROGIA/utils/ImoveisData/unique_predicates.txt', 'w', encoding='utf-8') as file:
        file.write('\n'.join(predicate_names))

    # Print unmapped features at the end of the function
    print("Unmapped features:", sorted(unmapped_features))  # Print 
    return facts

# Read the JSON file
# with open('/Users/luispaula/Desktop/MEIA/RealEstateAnalyzer/ImoveisData/extracted_property_data.json', 'r', encoding='utf-8') as file:
with open('C:/ISEP/Neural Networth/RealEstateAnalyzer/Expert_System_PPROGIA/utils/ImoveisData/formatted_property_data.json', 'r', encoding='utf-8') as file:
    data = json.load(file)

# Generate Prolog facts
prolog_facts = generate_prolog_facts(data)

# Write facts to a .pl file
with open('C:/ISEP/Neural Networth/RealEstateAnalyzer/Expert_System_PPROGIA/utils/ImoveisData/properties.pl', 'w', encoding='utf-8') as file:
    file.write('\n'.join(prolog_facts))

print("Prolog facts have been generated and saved to 'ImoveisData/facts/saved_properties.pl'")
