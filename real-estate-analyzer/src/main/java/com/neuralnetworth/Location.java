package com.neuralnetworth;

public class Location {
    private String name;
    private String crimeRate;

    public Location(String name, String crimeRate) {
        this.name = name;
        this.crimeRate = crimeRate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCrimeRate() {
        return crimeRate;
    }

    public void setCrimeRate(String crimeRate) {
        this.crimeRate = crimeRate;
    }
}
