package com.neuralnetworth;

public class PropertyFact {
    private String attribute;
    private String value;
    private Property property;

    public PropertyFact(String attribute, Property property, String value) {
        this.attribute = attribute;
        this.value = value;
        this.property = property;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Property getProperty() {
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }
}
