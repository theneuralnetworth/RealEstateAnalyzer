package com.neuralnetworth.knowledge;

import com.neuralnetworth.Model.Location;
import org.kie.api.runtime.ObjectFilter;

public class LocationFilter implements ObjectFilter {
    private final String locationName;

    public LocationFilter(String locationName) {
        this.locationName = locationName;
    }

    @Override
    public boolean accept(Object object) {
        if (object instanceof Location location) {
            return location.getName().equals(locationName);
        }
        return false;
    }
}
