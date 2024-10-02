import os
import json


def read_json_files(directory_path):
    # List to store the contents of all JSON files

    housesdata = {}
    # Iterate over all the files in the directory
    for filename in os.listdir(directory_path):
        # Construct the full file path
        file_path = os.path.join(directory_path, filename)

        # Check if the file is a JSON file
        if filename.endswith(".json") and os.path.isfile(file_path):
            try:
                # Open and read the JSON file
                with open(file_path, "r", encoding="utf-8") as file:
                    data = json.load(file)
                    housesdata.appen{
                        "id": json_data["ad"]["id"],
                        "features": json_data["ad"]["features"],
                        "characteristics": [
                            {
                                "label": characteristic["label"],
                                "localizedValue": characteristic["localizedValue"],
                            }
                            for characteristic in json_data["ad"]["characteristics"]
                        ],
                        "images": [
                            image["medium"] for image in json_data["ad"]["images"]
                        ],
                        "location": json_data["ad"]["location"]["county"]["name"],
                    }
                    print(f"Successfully read {filename}")
            except Exception as e:
                print(f"Error reading {filename}: {e}")

    return housesdata


# Example usage
directory = "/Users/luispaula/Desktop/MEIA/RealEstateAnalyzer/ImoveisData/property_data"
json_data = read_json_files(directory)

# Optionally, you can print or process the loaded JSON data
for data in json_data:
    print(data)





def process_json_file(json_data):
    return {
        "id": json_data["ad"]["id"],
        "features": json_data["ad"]["features"],
        "characteristics": [
            {"label": characteristic["label"], "localizedValue": characteristic["localizedValue"]}
            for characteristic in json_data["ad"]["characteristics"]
        ],
        "images": [
            image["medium"]
            for image in json_data["ad"]["images"]
        ],
        "location": json_data["ad"]["location"]["county"]["name"]
        
        
