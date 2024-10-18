package com.neuralnetworth;

import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.api.KieServices;
import com.neuralnetworth.Model.Location;
import com.neuralnetworth.Model.Property;

public class Main {
    public static void main(String[] args) {
        try {
            // Load KieServices and KieContainer
            KieServices ks = KieServices.Factory.get();
            KieContainer kContainer = ks.getKieClasspathContainer();

            // Load the KieSession from the rules.drl file
            KieSession kSession = kContainer.newKieSession("ksession-rules");
            if (kSession == null) {
                System.out.println("Failed to load KieSession.");
                return;
            } else {
                System.out.println("KieSession loaded successfully.");
            }

            // Create Location objects
            // Create Location objects with the updated constructor
            Location lisbon = new Location("lisboa", "low", "absent", "present", "absent", "absent", "present", "absent", "absent", "low", 70);
            Location porto = new Location("porto", "medium", "present", "present", "present", "absent", "present", "present", "absent", "medium", 35);
            Location faro = new Location("faro", "high", "absent", "absent", "present", "present", "present", "present", "present", "high", 10);


            // Create Property objects
            Property property1 = new Property("property_1", lisbon, "present", "high", "high", "absent", "absent", "absent", "absent", "regular", "b", "absent", 2018, 6, 100, 4, 25, "south", "apartment");
            Property property2 = new Property("property_2", porto, "absent", "low", "low", "absent", "present", "absent", "present", "new", "e", "present", 1960, 1, 100, 3, 33, "north", "residence");
            Property property3 = new Property("property_3", faro, "absent", "high", "high", "present", "present", "present", "present", "reform", "a", "absent", 2021, 4, 48, 3, 16, "east", "apartment");

            // Insert facts (Location and Property objects) into the session
            kSession.insert(lisbon);
            kSession.insert(porto);
            kSession.insert(faro);

            kSession.insert(property1);
            kSession.insert(property2);
            kSession.insert(property3);

            // Fire all rules
            kSession.fireAllRules();

            // Close the session
            kSession.dispose();

            // Output the results to verify
            System.out.println("Property 1 Crime Rate: " + property1.getCrimeRate());
            System.out.println("Property 1 Security: " + property1.getSecurity());

            System.out.println("Property 2 Crime Rate: " + property2.getCrimeRate());
            System.out.println("Property 2 Security: " + property2.getSecurity());

            System.out.println("Property 3 Crime Rate: " + property3.getCrimeRate());
            System.out.println("Property 3 Security: " + property3.getSecurity());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

