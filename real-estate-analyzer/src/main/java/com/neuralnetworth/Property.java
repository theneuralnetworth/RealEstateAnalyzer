package com.neuralnetworth;

public class Property {
    private final int id;
    private Location location;

    public Property(int id, Location location) {
        this.id = id;
        this.location = location;
    }

    public int getId() {
        return id;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public String toString() {
        return "Property [id=" + id + ", location=" + location + "]";
    }
}
