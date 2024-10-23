package com.neuralnetworth.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// Property class
public class Property {
    private String id;
    private String title;
    private Location location;
    private String securitySystem;
    private String acousticInsulation;
    private String thermalComfort;
    private String elevator;
    private String ramps;
    private String swimmingPool;
    private String garden;
    private String propertyCondition;
    private String energyRating;
    private String garage;
    private int yearConstruction;
    private int floorLevel;
    private Float area;
    private int rooms;
    private Float areaPerRoom;
    private String sunOrientation;
    private String propertyType;
    private String opticalFiber;
    private String smartAppliances;
    private String publicParking;
    private Float price;
    private String typology;
    private List<String> images;


    // Calculated
    private final List<String> services;
    private final Map<String, Float> metaScores;
    private final Map<String, Integer> weights;
    private final Map<String, Float> scores;

    //Inferred attributes
    private String crimeRate;
    private String security;
    private String noiseLevel;
    private String soundComfort;
    private String overallComfort;
    private String accessibility;
    private String amenities;
    private String maintenance;
    private String energyEfficiency;
    private String connectivity;
    private String serviceLevel;
    private String viewQuality;
    private String viewQualityLevel;
    private int numberOfServices;
    private String spaciousness;
    private String sunExposure;
    private String overallParking;
    private String buildState;
    private String potentialAppreciation;
    private Float totalScore;


    public Property(String id, String title, Location location, String securitySystem, String acousticInsulation,
                    String thermalComfort, String elevator, String ramps, String swimmingPool,
                    String garden, String propertyCondition, String energyRating, String garage,
                    int yearConstruction, int floorLevel, Float area, int rooms, Float areaPerRoom,
                    String sunOrientation, String propertyType, String opticalFiber, String smartAppliances) {
        this.id = id;
        this.title = title;
        this.location = location;
        this.securitySystem = securitySystem;
        this.acousticInsulation = acousticInsulation;
        this.thermalComfort = thermalComfort;
        this.elevator = elevator;
        this.ramps = ramps;
        this.swimmingPool = swimmingPool;
        this.garden = garden;
        this.propertyCondition = propertyCondition;
        this.energyRating = energyRating;
        this.garage = garage;
        this.yearConstruction = yearConstruction;
        this.floorLevel = floorLevel;
        this.area = area;
        this.rooms = rooms;
        this.areaPerRoom = areaPerRoom;
        this.sunOrientation = sunOrientation;
        this.propertyType = propertyType;
        this.opticalFiber = opticalFiber;
        this.smartAppliances = smartAppliances;

        this.services = new ArrayList<>();
        this.metaScores = new HashMap<>();
        this.weights = new HashMap<>();
        this.scores = new HashMap<>();

        metaScores.put("high", 1f);
        metaScores.put("medium", 0.7f);
        metaScores.put("low", 0.4f);

        weights.put("security", 10);
        weights.put("comfort", 15);
        weights.put("accessibility", 8);
        weights.put("maintenance", 12);
        weights.put("energyEfficiency", 10);
        weights.put("services", 10);
        weights.put("connectivity", 7);
        weights.put("viewQuality", 8);
        weights.put("spaciousness", 10);
        weights.put("sunExposure", 5);
        weights.put("parking", 5);
        weights.put("buildState", 5);
        weights.put("potentialAppreciation", 5);
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public Location getLocation() { return location; }
    public void setLocation(Location location) { this.location = location; }

    public String getSecuritySystem() { return securitySystem; }
    public void setSecuritySystem(String securitySystem) { this.securitySystem = securitySystem; }

    public String getAcousticInsulation() { return acousticInsulation; }
    public void setAcousticInsulation(String acousticInsulation) { this.acousticInsulation = acousticInsulation; }

    public String getThermalComfort() { return thermalComfort; }
    public void setThermalComfort(String thermalComfort) { this.thermalComfort = thermalComfort; }

    public String getElevator() { return elevator; }
    public void setElevator(String elevator) { this.elevator = elevator; }

    public String getRamps() { return ramps; }
    public void setRamps(String ramps) { this.ramps = ramps; }

    public String getSwimmingPool() { return swimmingPool; }
    public void setSwimmingPool(String swimmingPool) { this.swimmingPool = swimmingPool; }

    public String getGarden() { return garden; }
    public void setGarden(String garden) { this.garden = garden; }

    public String getPropertyCondition() { return propertyCondition; }
    public void setPropertyCondition(String propertyCondition) { this.propertyCondition = propertyCondition; }

    public String getEnergyRating() { return energyRating; }
    public void setEnergyRating(String energyRating) { this.energyRating = energyRating; }

    public String getGarage() { return garage; }
    public void setGarage(String garage) { this.garage = garage; }

    public int getYearConstruction() { return yearConstruction; }
    public void setYearConstruction(int yearConstruction) { this.yearConstruction = yearConstruction; }

    public int getFloorLevel() { return floorLevel; }
    public void setFloorLevel(int floorLevel) { this.floorLevel = floorLevel; }

    public float getArea() { return area; }
    public void setArea(float area) { this.area = area; }

    public int getRooms() { return rooms; }
    public void setRooms(int rooms) { this.rooms = rooms; }

    public float getAreaPerRoom() { return areaPerRoom; }
    public void setAreaPerRoom(float areaPerRoom) { this.areaPerRoom = areaPerRoom; }

    public String getSunOrientation() { return sunOrientation; }
    public void setSunOrientation(String sunOrientation) { this.sunOrientation = sunOrientation; }

    public String getPropertyType() { return propertyType; }
    public void setPropertyType(String propertyType) { this.propertyType = propertyType; }

    public String getOpticalFiber() { return opticalFiber; }
    public void setOpticalFiber(String opticalFiber) { this.opticalFiber = opticalFiber; }

    public String getSmartAppliances() { return smartAppliances; }
    public void setSmartAppliances(String smartAppliances) { this.smartAppliances = smartAppliances; }

    public String getCrimeRate() { return crimeRate; }
    public void setCrimeRate(String crimeRate) { this.crimeRate = crimeRate; }

    public String getPublicParking() { return publicParking; }
    public void setPublicParking(String publicParking) { this.publicParking = publicParking; }

    public String getSecurity() { return security; }
    public void setSecurity(String security) { this.security = security; }

    public String getNoiseLevel() { return noiseLevel; }
    public void setNoiseLevel(String noiseLevel) { this.noiseLevel = noiseLevel; }

    public String getSoundComfort() { return soundComfort; }
    public void setSoundComfort(String soundComfort) { this.soundComfort = soundComfort; }

    public String getOverallComfort() { return overallComfort; }
    public void setOverallComfort(String overallComfort) { this.overallComfort = overallComfort; }

    public String getAccessibility() { return accessibility; }
    public void setAccessibility(String accessibility) { this.accessibility = accessibility; }

    public String getAmenities() { return amenities; }
    public void setAmenities(String amenities) { this.amenities = amenities; }

    public String getMaintenance() { return maintenance; }
    public void setMaintenance(String maintenance) { this.maintenance = maintenance; }

    public String getEnergyEfficiency() { return energyEfficiency; }
    public void setEnergyEfficiency(String energyEfficiency) { this.energyEfficiency = energyEfficiency; }

    public String getConnectivity() { return connectivity; }
    public void setConnectivity(String connectivity) { this.connectivity = connectivity; }

    public String getServiceLevel() { return serviceLevel; }
    public void setServiceLevel(String serviceLevel) { this.serviceLevel = serviceLevel; }

    public String getViewQuality() { return viewQuality; }
    public void setViewQuality(String viewQuality) { this.viewQuality = viewQuality; }

    public String getViewQualityLevel() {return viewQualityLevel; }
    public void setViewQualityLevel(String viewQualityLevel) { this.viewQualityLevel = viewQualityLevel; }


    public int getNumberOfServices() { return numberOfServices; }
    public void setNumberOfServices(int numberOfServices) { this.numberOfServices = numberOfServices; }

    public List<String> getServices() { return services; }
    public void addService(String service) {
        this.services.add(service);
        int count = this.services.size();
        setNumberOfServices(count);
    }

    public String getSpaciousness() { return spaciousness; }
    public void setSpaciousness(String spaciousness) { this.spaciousness = spaciousness; }

    public String getSunExposure() { return sunExposure; }
    public void setSunExposure(String sunExposure) { this.sunExposure = sunExposure; }

    public String getOverallParking() { return overallParking; }
    public void setOverallParking(String overallParking) { this.overallParking = overallParking; }

    public String getBuildState() { return buildState; }
    public void setBuildState(String buildState) { this.buildState = buildState; }

    public String getPotentialAppreciation() { return potentialAppreciation; }
    public void setPotentialAppreciation(String potentialAppreciation) {
        this.potentialAppreciation = potentialAppreciation;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getTypology() {
        return typology;
    }

    public void setTypology(String typology) {
        this.typology = typology;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

    public float getMetaScore(String value) { return metaScores.get(value); }

    public float getWeight(String value) { return weights.get(value); }

    public Map<String, Float> getScores() { return scores; }
    public void setScore(String key, Float value) { this.scores.put(key, value); }

    public float getTotalScore() { return totalScore; }
    public void setTotalScore(float totalScore) { this.totalScore = totalScore; }

    public void calculateTotalScore() {
        float temp = 0f;
        for (Float value : scores.values()) {
            temp += value;
        }
        this.setTotalScore(temp);
    }

    public void printInferredAttributes() {
        System.out.println("\n --------------------------------------------------");
        System.out.println("Property Name: " + this.title);
        System.out.println("Inferred Attributes:");
        System.out.println("  Crime Rate: " + (this.crimeRate != null ? this.crimeRate : "Not set"));
        System.out.println("  Security: " + (this.security != null ? this.security : "Not set"));
        System.out.println("  Noise Level: " + (this.noiseLevel != null ? this.noiseLevel : "Not set"));
        System.out.println("  Sound Comfort: " + (this.soundComfort != null ? this.soundComfort : "Not set"));
        System.out.println("  Overall Comfort: " + (this.overallComfort != null ? this.overallComfort : "Not set"));
        System.out.println("  Accessibility: " + (this.accessibility != null ? this.accessibility : "Not set"));
        System.out.println("  Amenities: " + (this.amenities != null ? this.amenities : "Not set"));
        System.out.println("  Maintenance: " + (this.maintenance != null ? this.maintenance : "Not set"));
        System.out.println("  EnergyEfficiency: " + (this.energyEfficiency != null ? this.energyEfficiency : "Not set"));
        System.out.println("  Connectivity: " + (this.connectivity != null ? this.connectivity : "Not set"));
        System.out.println("  ServiceLevel: " + (this.serviceLevel != null ? this.serviceLevel : "Not set"));
        System.out.println("  ViewQuality: " + (this.viewQuality != null ? this.viewQuality : "Not set"));
        System.out.println("  ViewQualityLevel: " + (this.viewQualityLevel != null ? this.viewQualityLevel : "Not set"));
        System.out.println("  NumberOfServices: " + this.numberOfServices);
        System.out.println("  Spaciousness: " + (this.spaciousness != null ? this.spaciousness : "Not set"));
        System.out.println("  SunExposer: " + (this.sunExposure != null ? this.sunExposure : "Not set"));
        System.out.println("  OverallParking: " + (this.overallParking != null ? this.spaciousness : "Not set"));
        System.out.println("  BuildState: " + (this.buildState != null ? this.buildState : "Not set"));
        System.out.println("  PotentialAppreciation: " + (this.potentialAppreciation != null ? this.potentialAppreciation : "Not set"));
        System.out.println("  Scores: " + (this.scores != null ? this.scores : "Not set"));
        System.out.println("  TotalScore: " + (this.totalScore != null ? this.totalScore : "Not set"));
    }

    @Override
    public String toString() {
        return "Property {" +
                "id='" + id + '\'' +
                ", name='" + title + '\'' +
                ", location=" + location.getName() +
                ", securitySystem='" + securitySystem + '\'' +
                ", acousticInsulation='" + acousticInsulation + '\'' +
                ", thermalComfort='" + thermalComfort + '\'' +
                ", elevator='" + elevator + '\'' +
                ", ramps='" + ramps + '\'' +
                ", swimmingPool='" + swimmingPool + '\'' +
                ", garden='" + garden + '\'' +
                ", propertyCondition='" + propertyCondition + '\'' +
                ", energyRating='" + energyRating + '\'' +
                ", garage='" + garage + '\'' +
                ", yearConstruction=" + yearConstruction +
                ", floorLevel=" + floorLevel +
                ", area=" + area +
                ", rooms=" + rooms +
                ", areaPerRoom=" + areaPerRoom +
                ", sunOrientation='" + sunOrientation + '\'' +
                ", propertyType='" + propertyType + '\'' +
                ", crimeRate='" + crimeRate + '\'' +
                ", security='" + security + '\'' +
                ", noiseLevel='" + noiseLevel + '\'' +
                ", soundComfort='" + soundComfort + '\'' +
                ", overallComfort='" + overallComfort + '\'' +
                ", accessibility='" + accessibility + '\'' +
                ", amenities='" + amenities + '\'' +
                ", maintenance='" + maintenance + '\'' +
                ", energyEfficiency='" + energyEfficiency + '\'' +
                '}';
    }
}
