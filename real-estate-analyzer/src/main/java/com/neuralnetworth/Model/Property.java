package com.neuralnetworth.Model;

// Property class
public class Property {
    private String id;
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

    //Inferred attributes
    private String crimeRate;
    private String security;

    public Property(String id, Location location, String securitySystem, String acousticInsulation,
                    String thermalComfort, String elevator, String ramps, String swimmingPool,
                    String garden, String propertyCondition, String energyRating, String garage,
                    int yearConstruction, int floorLevel, int area, int rooms, int areaPerRoom,
                    String sunOrientation, String propertyType) {
        this.id = id;
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
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

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
}
