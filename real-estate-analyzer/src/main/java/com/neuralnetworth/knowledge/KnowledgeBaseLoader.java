package com.neuralnetworth.knowledge;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.neuralnetworth.Model.Location;
import com.neuralnetworth.Model.Property;
import org.kie.api.runtime.KieSession;

import java.util.*;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class KnowledgeBaseLoader {

    private final String propertiesFilename;
    private final String locationsFilename;
    private final KieSession kieSession;

    public KnowledgeBaseLoader(KieSession kieSession){
        super();
        this.kieSession = kieSession;
        this.propertiesFilename = System.getenv("KNOWLEDGE_BASE_PROPERTIES_FILE");
        this.locationsFilename = System.getenv("KNOWLEDGE_BASE_LOCATIONS_FILE");
    }

    public KnowledgeBaseLoader(KieSession kieSession, String propertiesFilename, String locationsFilename) {
        super();
        this.kieSession = kieSession;
        this.propertiesFilename = propertiesFilename;
        this.locationsFilename = locationsFilename;
    }

    public ArrayList<Property> loadProperties() {
        JsonElement json = loadJsonFile(this.propertiesFilename);
        ArrayList<Property> properties = new ArrayList<>();
        if (json.isJsonArray()) {
            JsonArray jsonArray = json.getAsJsonArray();
            Gson gson = new Gson();
            for (JsonElement jsonElement : jsonArray) {
                String locationName = jsonElement.getAsJsonObject().get("location").getAsString();
                Collection<?> filteredLocations = this.kieSession.getObjects(new LocationFilter(locationName));
                Optional<Location> location = filteredLocations.stream()
                        .filter(obj -> obj instanceof Location)
                        .map(obj -> (Location) obj)
                        .findFirst();
                if(location.isEmpty()){
                    throw new RuntimeException("Location '" + locationName + "' not found");
                }
                jsonElement.getAsJsonObject().remove("location");
                Property property = gson.fromJson(jsonElement, Property.class);
                property.setLocation(location.get());
                properties.add(property);
            }
            return properties;
        }
        throw new RuntimeException("Could not load properties from " + this.propertiesFilename);
    }

    public ArrayList<Location> loadLocations() throws RuntimeException {
        JsonElement json = loadJsonFile(this.locationsFilename);
        ArrayList<Location> locations = new ArrayList<>();
        if (json.isJsonArray()) {
            JsonArray jsonArray = json.getAsJsonArray();
            Gson gson = new Gson();
            for (JsonElement jsonElement : jsonArray) {
                Location location = gson.fromJson(jsonElement, Location.class);
                locations.add(location);
            }
            return locations;
        }
        throw new RuntimeException("Could not load locations from " + this.propertiesFilename);
    }

    public void insertFakeFacts(KieSession kieSession) {
         // Create Location objects
         Location lisbon = new Location("lisboa", "low", "absent", "present",
         "absent", "absent", "present", "absent", "absent", "low", 70, "present",
         "present");
         Location porto = new Location("porto", "medium", "present", "present",
         "present", "absent", "present", "present", "absent", "medium", 35, "present",
         "absent");
         Location faro = new Location("faro", "high", "absent", "absent", "present",
         "present", "present", "present", "present", "high", 10, "absent", "absent");

         // Create Property objects
         Property property1 = new Property("property_1", "Property in Lisbon" ,
         lisbon, "present", "high", "high", "absent", "absent", "absent", "absent",
         "regular", "b", "absent", 2018, 6, 100f, 4, 25f, Collections.singletonList("south"), "apartment",
         "present", "present");
         Property property2 = new Property("property_2", "Property in Porto" , porto,
         "absent", "low", "low", "absent", "present", "absent", "present", "new", "e",
         "present", 1960, 1, 100f, 3, 33f, Collections.singletonList("north"), "residence", "absent", "present");
         Property property3 = new Property("property_3", "Property in Faro" , faro,
         "absent", "high", "high", "present", "present", "present", "present",
         "reform", "a", "absent", 2021, 4, 48f, 3, 16f, Collections.singletonList("east"), "apartment", "absent",
         "absent");

         // Insert facts (Location and Property objects) into the session
         kieSession.insert(lisbon);
         kieSession.insert(porto);
         kieSession.insert(faro);

         kieSession.insert(property1);
         kieSession.insert(property2);
         kieSession.insert(property3);
    }

    private JsonElement loadJsonFile(String filename) {
        try (FileReader reader = new FileReader(filename)) {
            return JsonParser.parseReader(reader);
        } catch (IOException e) {
            throw new RuntimeException("Failed to load JSON file: " + e);
        }
    }

}
