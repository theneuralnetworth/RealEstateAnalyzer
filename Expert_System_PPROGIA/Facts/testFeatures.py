import json

def extract_distinct_features(file_path):
    features = set()  # Use a set to store distinct features

    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)  # Load the JSON data
        for property in data:
            for feature in property.get("features", []):
                features.add(feature.strip())  # Add feature to the set

    return features

# Example usage
file_path = '/Users/luispaula/Desktop/MEIA/RealEstateAnalyzer/Expert_System_PPROGIA/ImoveisData/extracted_property_data.json'
distinct_features = extract_distinct_features(file_path)

print("Distinct features found:")
for feature in distinct_features:
    print(feature)