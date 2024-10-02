import json
import os
from typing import Dict, Any

def extract_data(data: Dict[str, Any]) -> Dict[str, Any]:
    ad = data['pageProps']['ad']
    extracted = {
        'id': ad.get('id', ''),
        'features': ad.get('features', []),
        'characteristics': [],
        'images': [],
        'location': '',
        'title': '',
        'description': ''
    }

    # Extract characteristics
    for char in ad.get('characteristics', []):
        extracted['characteristics'].append({
            'label': char.get('label', ''),
            'localizedValue': char.get('localizedValue', '')
        })

    # Extract medium images
    for image in ad.get('images', []):
        if 'medium' in image:
            extracted['images'].append(image['medium'])

    # Extract location
    if 'location' in ad and 'address' in ad['location'] and 'county' in ad['location']['address']:
        extracted['location'] = ad['location']['address']['county'].get('name', '')

    # Extract title and description from SEO
    if 'seo' in ad:
        extracted['title'] = ad['seo'].get('title', '')
        extracted['description'] = ad['seo'].get('description', '')

    return extracted

def process_files(directory: str) -> list:
    extracted_data = []
    for filename in os.listdir(directory):
        if filename.endswith('.json'):
            file_path = os.path.join(directory, filename)
            with open(file_path, 'r', encoding='utf-8') as file:
                try:
                    data = json.load(file)
                    extracted = extract_data(data)
                    extracted_data.append(extracted)
                except json.JSONDecodeError:
                    print(f"Error decoding JSON in file: {filename}")
                except KeyError as e:
                    print(f"KeyError in file {filename}: {str(e)}")
    return extracted_data

# Directory containing the JSON files
directory = "/Users/luispaula/Desktop/MEIA/RealEstateAnalyzer/ImoveisData/property_data"

# Process all files and extract data
extracted_data = process_files(directory)

# Write the extracted data to a new JSON file
with open('extracted_property_data.json', 'w', encoding='utf-8') as file:
    json.dump(extracted_data, file, ensure_ascii=False, indent=2)

print("Data extraction complete. Results saved in 'extracted_property_data.json'")