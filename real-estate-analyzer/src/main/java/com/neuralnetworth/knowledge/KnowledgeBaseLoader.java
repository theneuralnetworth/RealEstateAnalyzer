package com.neuralnetworth.knowledge;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.FileReader;
import java.io.IOException;

public class KnowledgeBaseLoader {

    private String propertiesFilename;
    private String locationsFilename;

    public KnowledgeBaseLoader(String propertiesFilename, String locationsFilename) {
        super();
        this.propertiesFilename = propertiesFilename;
        this.locationsFilename = locationsFilename;
    }

    public void loadProperties() {
        JsonElement properties = loadJsonFile(this.propertiesFilename);

    }

    public void loadLocations() {
        JsonElement properties = loadJsonFile(this.propertiesFilename);

    }

    private JsonElement loadJsonFile(String filename) {
        try(FileReader reader = new FileReader(filename)){
            return JsonParser.parseReader(reader);
        }catch(IOException e){
            throw new RuntimeException("Failed to load JSON file: " + e);
        }
    }

}
