package com.neuralnetworth.Model;

import java.util.ArrayList;
import java.util.List;

// Property class
public class Property {
    private String id;
    private String name;
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
    private float area;
    private int rooms;
    private float areaPerRoom;
    private String sunOrientation;
    private String propertyType;
    //private List<String> servicesList;

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
    //private String services;

    public Property(String id, String name, Location location, String securitySystem, String acousticInsulation,
                    String thermalComfort, String elevator, String ramps, String swimmingPool,
                    String garden, String propertyCondition, String energyRating, String garage,
                    int yearConstruction, int floorLevel, int area, int rooms, int areaPerRoom,
                    String sunOrientation, String propertyType) {
        this.id = id;
        this.name = name;
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
        //this.servicesList = new ArrayList<>();
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

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
    public void setArea(int area) { this.area = area; }

    public int getRooms() { return rooms; }
    public void setRooms(int rooms) { this.rooms = rooms; }

    public float getAreaPerRoom() { return areaPerRoom; }
    public void setAreaPerRoom(int areaPerRoom) { this.areaPerRoom = areaPerRoom; }

    public String getSunOrientation() { return sunOrientation; }
    public void setSunOrientation(String sunOrientation) { this.sunOrientation = sunOrientation; }

    public String getPropertyType() { return propertyType; }
    public void setPropertyType(String propertyType) { this.propertyType = propertyType; }

    public String getCrimeRate() { return crimeRate; }
    public void setCrimeRate(String crimeRate) { this.crimeRate = crimeRate; }

    public String getSecurity() { return security; }
    public void setSecurity(String security) { this.security = security; }

    public String getNoiseLevel() { return this.noiseLevel; }
    public void setNoiseLevel(String noiseLevel) { this.noiseLevel = noiseLevel; }

    public String getSoundComfort() { return this.soundComfort; }
    public void setSoundComfort(String soundComfort) { this.soundComfort = soundComfort; }

    public String getOverallComfort() { return this.overallComfort; }
    public void setOverallComfort(String overallComfort) { this.overallComfort = overallComfort; }

    public String getAccessibility() { return this.accessibility; }
    public void setAccessibility(String accessibility) { this.accessibility = accessibility; }

    public String getAmenities() { return amenities; }
    public void setAmenities(String amenities) { this.amenities = amenities; }

    public String getMaintenance() { return maintenance; }
    public void setMaintenance(String maintenance) { this.maintenance = maintenance; }

    public String getEnergyEfficiency() { return energyEfficiency; }
    public void setEnergyEfficiency(String energyEfficiency) { this.energyEfficiency = energyEfficiency; }

    /*public List<String> getServicesList() {
        return servicesList;
    }

    public void setServicesList(List<String> servicesList) {
        this.servicesList = servicesList;
    }

    public void addServices(String service) {
        if (!servicesList.contains(service)) {
            this.servicesList.add(service);
        }
    }

    public String getServices() {
        return services;
    }

    public void setServices(String services) {
        this.services = services;
    }*/

    public void printInferredAttributes() {
        System.out.println("\n --------------------------------------------------");
        System.out.println("Property Name: " + this.name);
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
        //System.out.println("  Services: " + (this.services != null ? this.services : "Not set"));
    }

    @Override
    public String toString() {
        return "Property {" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
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
