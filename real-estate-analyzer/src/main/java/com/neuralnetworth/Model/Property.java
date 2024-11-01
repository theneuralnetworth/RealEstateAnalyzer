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
    private List<String> sunOrientation;
    private String propertyType;
    private String opticalFiber;
    private String smartAppliances;
    private String publicParking;
    private Float price;
    private String typology;
    private List<String> images;


    // Calculated
    private List<String> services;
    private Map<String, Float> metaScores;
    private Map<String, Integer> weights;

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

    // preferences
    private Float prefSecurity;
    private Float prefComfort;
    private Float prefAccessibility;
    private Float prefMaintenance;
    private Float prefEnergyEfficiency;
    private Float prefServices;
    private Float prefConnectivity;
    private Float prefViewQuality;
    private Float prefSpaciousness;
    private Float prefSunExposure;
    private Float prefParking;
    private Float prefBuildState;
    private Float prefPotentialAppreciation;

    // scores
    private Float scoreSecurity;
    private Float scoreComfort;
    private Float scoreAccessibility;
    private Float scoreMaintenance;
    private Float scoreEnergyEfficiency;
    private Float scoreServices;
    private Float scoreConnectivity;
    private Float scoreViewQuality;
    private Float scoreSpaciousness;
    private Float scoreSunExposure;
    private Float scoreParking;
    private Float scoreBuildState;
    private Float scorePotentialAppreciation;
    private Float totalScore;

    private Map<String, List<String>> justifications;

    public Property() {
        this.services = new ArrayList<>();
        this.metaScores = new HashMap<>();
        this.weights = new HashMap<>();

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

        this.prefSecurity = 1f;
        this.prefComfort = 1f;
        this.prefAccessibility = 1f;
        this.prefMaintenance = 1f;
        this.prefEnergyEfficiency = 1f;
        this.prefServices = 1f;
        this.prefConnectivity = 1f;
        this.prefViewQuality = 1f;
        this.prefSpaciousness = 1f;
        this.prefSunExposure = 1f;
        this.prefParking = 1f;
        this.prefBuildState = 1f;
        this.prefPotentialAppreciation = 1f;

        this.scoreSecurity = 0f;
        this.scoreComfort = 0f;
        this.scoreAccessibility = 0f;
        this.scoreMaintenance = 0f;
        this.scoreEnergyEfficiency = 0f;
        this.scoreServices = 0f;
        this.scoreConnectivity = 0f;
        this.scoreViewQuality = 0f;
        this.scoreSpaciousness = 0f;
        this.scoreSunExposure = 0f;
        this.scoreParking = 0f;
        this.scoreBuildState = 0f;
        this.scorePotentialAppreciation = 0f;
        this.totalScore = -1f;

        this.justifications = new HashMap<>();
    }

    public Property(String id, String title, Location location, String securitySystem, String acousticInsulation,
                    String thermalComfort, String elevator, String ramps, String swimmingPool,
                    String garden, String propertyCondition, String energyRating, String garage,
                    int yearConstruction, int floorLevel, Float area, int rooms, Float areaPerRoom,
                    List<String> sunOrientation, String propertyType, String opticalFiber, String smartAppliances) {
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
        this.totalScore =0f;

        this.services = new ArrayList<>();
        this.metaScores = new HashMap<>();
        this.weights = new HashMap<>();

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

        this.justifications = new HashMap<>();
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

    public List<String> getSunOrientation() { return sunOrientation; }
    public void setSunOrientation(List<String> sunOrientation) { this.sunOrientation = sunOrientation; }

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

    public Float getPrefSecurity() {
        return prefSecurity;
    }

    public void setPrefSecurity(Float prefSecurity) {
        this.prefSecurity = prefSecurity;
    }

    public Float getPrefComfort() {
        return prefComfort;
    }

    public void setPrefComfort(Float prefComfort) {
        this.prefComfort = prefComfort;
    }

    public Float getPrefAccessibility() {
        return prefAccessibility;
    }

    public void setPrefAccessibility(Float prefAccessibility) {
        this.prefAccessibility = prefAccessibility;
    }

    public Float getPrefMaintenance() {
        return prefMaintenance;
    }

    public void setPrefMaintenance(Float prefMaintenance) {
        this.prefMaintenance = prefMaintenance;
    }

    public Float getPrefEnergyEfficiency() {
        return prefEnergyEfficiency;
    }

    public void setPrefEnergyEfficiency(Float prefEnergyEfficiency) {
        this.prefEnergyEfficiency = prefEnergyEfficiency;
    }

    public Float getPrefServices() {
        return prefServices;
    }

    public void setPrefServices(Float prefServices) {
        this.prefServices = prefServices;
    }

    public Float getPrefConnectivity() {
        return prefConnectivity;
    }

    public void setPrefConnectivity(Float prefConnectivity) {
        this.prefConnectivity = prefConnectivity;
    }

    public Float getPrefViewQuality() {
        return prefViewQuality;
    }

    public void setPrefViewQuality(Float prefViewQuality) {
        this.prefViewQuality = prefViewQuality;
    }

    public Float getPrefSpaciousness() {
        return prefSpaciousness;
    }

    public void setPrefSpaciousness(Float prefSpaciousness) {
        this.prefSpaciousness = prefSpaciousness;
    }

    public Float getPrefSunExposure() {
        return prefSunExposure;
    }

    public void setPrefSunExposure(Float prefSunExposure) {
        this.prefSunExposure = prefSunExposure;
    }

    public Float getPrefParking() {
        return prefParking;
    }

    public void setPrefParking(Float prefParking) {
        this.prefParking = prefParking;
    }

    public Float getPrefBuildState() {
        return prefBuildState;
    }

    public void setPrefBuildState(Float prefBuildState) {
        this.prefBuildState = prefBuildState;
    }

    public Float getPrefPotentialAppreciation() {
        return prefPotentialAppreciation;
    }

    public void setPrefPotentialAppreciation(Float prefPotentialAppreciation) {
        this.prefPotentialAppreciation = prefPotentialAppreciation;
    }

    public float getScoreSecurity() { return scoreSecurity; }
    public void setScoreSecurity(float scoreSecurity) { this.scoreSecurity = scoreSecurity; }

    public Float getScoreComfort() {
        return scoreComfort;
    }

    public void setScoreComfort(Float scoreComfort) {
        this.scoreComfort = scoreComfort;
    }

    public Float getScoreAccessibility() {
        return scoreAccessibility;
    }

    public void setScoreAccessibility(Float scoreAccessibility) {
        this.scoreAccessibility = scoreAccessibility;
    }

    public Float getScoreMaintenance() {
        return scoreMaintenance;
    }

    public void setScoreMaintenance(Float scoreMaintenance) {
        this.scoreMaintenance = scoreMaintenance;
    }

    public Float getScoreEnergyEfficiency() {
        return scoreEnergyEfficiency;
    }

    public void setScoreEnergyEfficiency(Float scoreEnergyEfficiency) {
        this.scoreEnergyEfficiency = scoreEnergyEfficiency;
    }

    public Float getScoreServices() {
        return scoreServices;
    }

    public void setScoreServices(Float scoreServices) {
        this.scoreServices = scoreServices;
    }

    public Float getScoreConnectivity() {
        return scoreConnectivity;
    }

    public void setScoreConnectivity(Float scoreConnectivity) {
        this.scoreConnectivity = scoreConnectivity;
    }

    public Float getScoreViewQuality() {
        return scoreViewQuality;
    }

    public void setScoreViewQuality(Float scoreViewQuality) {
        this.scoreViewQuality = scoreViewQuality;
    }

    public Float getScoreSpaciousness() {
        return scoreSpaciousness;
    }

    public void setScoreSpaciousness(Float scoreSpaciousness) {
        this.scoreSpaciousness = scoreSpaciousness;
    }

    public Float getScoreSunExposure() {
        return scoreSunExposure;
    }

    public void setScoreSunExposure(Float scoreSunExposure) {
        this.scoreSunExposure = scoreSunExposure;
    }

    public Float getScoreBuildState() {
        return scoreBuildState;
    }

    public void setScoreBuildState(Float scoreBuildState) {
        this.scoreBuildState = scoreBuildState;
    }

    public Float getScoreParking() {
        return scoreParking;
    }

    public void setScoreParking(Float scoreParking) {
        this.scoreParking = scoreParking;
    }

    public Float getScorePotentialAppreciation() {
        return scorePotentialAppreciation;
    }

    public void setScorePotentialAppreciation(Float scorePotentialAppreciation) {
        this.scorePotentialAppreciation = scorePotentialAppreciation;
    }

    public Map<String, List<String>> getJustifications() {
        return justifications;
    }

    public void setJustifications(Map<String, List<String>> justifications) {
        this.justifications = justifications;
    }

    public float getTotalScore() { return totalScore; }
    public void setTotalScore(float totalScore) { this.totalScore = totalScore; }

    public void calculateTotalScore() {
        this.setTotalScore(this.scoreAccessibility + this.scoreComfort + this.scoreConnectivity + this.scoreMaintenance + this.scoreParking +
                this.scorePotentialAppreciation + this.scoreBuildState + this.scoreEnergyEfficiency + this.scoreSecurity + this.scoreViewQuality + this.scoreSpaciousness
        + this.scoreSunExposure + this.scoreServices);
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
