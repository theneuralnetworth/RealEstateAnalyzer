import json

# Load the JSON data
with open('/Users/luispaula/Desktop/MEIA/RealEstateAnalyzer/Expert_System_PPROGIA/ImoveisData/extracted_property_data.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

# Initialize a set to store distinct characteristics
distinct_characteristics = set()

# Iterate through each property
for property in data:
    for characteristic in property.get('characteristics', []):
        distinct_characteristics.add(characteristic['label'])

# Convert the set to a sorted list for better readability
distinct_characteristics = sorted(distinct_characteristics)

# Print the distinct characteristics
print(distinct_characteristics)