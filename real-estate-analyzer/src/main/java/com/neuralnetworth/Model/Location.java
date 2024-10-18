package com.neuralnetworth.Model;

// Location class
public class Location {
    private String name;
    private String crimeRate;
    private String airport;
    private String busyTraffic;
    private String nearbySchools;
    private String nearbyPublicTransport;
    private String nearbyHospitals;
    private String nearbySupermarkets;
    private String nearbyLeisureAreas;
    private String parking;
    private int last5YearsIncreased;

    public Location(String name, String crimeRate, String airport, String busyTraffic,
                    String nearbySchools, String nearbyPublicTransport,
                    String nearbyHospitals, String nearbySupermarkets,
                    String nearbyLeisureAreas, String parking, int last5YearsIncreased) {
        this.name = name;
        this.crimeRate = crimeRate;
        this.airport = airport;
        this.busyTraffic = busyTraffic;
        this.nearbySchools = nearbySchools;
        this.nearbyPublicTransport = nearbyPublicTransport;
        this.nearbyHospitals = nearbyHospitals;
        this.nearbySupermarkets = nearbySupermarkets;
        this.nearbyLeisureAreas = nearbyLeisureAreas;
        this.parking = parking;
        this.last5YearsIncreased = last5YearsIncreased;
    }

    // Getters and Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCrimeRate() { return crimeRate; }
    public void setCrimeRate(String crimeRate) { this.crimeRate = crimeRate; }

    public String getAeroport() { return airport; }
    public void setAeroport(String airport) { this.airport = airport; }

    public String getBusyTraffic() { return busyTraffic; }
    public void setBusyTraffic(String busyTraffic) { this.busyTraffic = busyTraffic; }

    public String getNearbySchools() { return nearbySchools; }
    public void setNearbySchools(String nearbySchools) { this.nearbySchools = nearbySchools; }

    public String getNearbyPublicTransport() { return nearbyPublicTransport; }
    public void setNearbyPublicTransport(String nearbyPublicTransport) { this.nearbyPublicTransport = nearbyPublicTransport; }

    public String getNearbyHospitals() { return nearbyHospitals; }
    public void setNearbyHospitals(String nearbyHospitals) { this.nearbyHospitals = nearbyHospitals; }

    public String getNearbySupermarkets() { return nearbySupermarkets; }
    public void setNearbySupermarkets(String nearbySupermarkets) { this.nearbySupermarkets = nearbySupermarkets; }

    public String getNearbyLeisureAreas() { return nearbyLeisureAreas; }
    public void setNearbyLeisureAreas(String nearbyLeisureAreas) { this.nearbyLeisureAreas = nearbyLeisureAreas; }

    public String getParking() { return parking; }
    public void setParking(String parking) { this.parking = parking; }

    public int getLast5YearsIncreased() { return last5YearsIncreased; }
    public void setLast5YearsIncreased(int last5YearsIncreased) { this.last5YearsIncreased = last5YearsIncreased; }
}
