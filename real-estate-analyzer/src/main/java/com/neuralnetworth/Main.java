package com.neuralnetworth;

import com.neuralnetworth.Model.Location;
import com.neuralnetworth.Model.Property;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.api.KieServices;
import org.kie.api.event.rule.AfterMatchFiredEvent;
import org.kie.api.event.rule.*;
import java.util.*;


public class Main {
    private static final Map<String, Map<String, List<String>>> triggeredRulesMap = new HashMap<>();

    public static void main(String[] args) {
        try {
            KieServices ks = KieServices.Factory.get();
            KieContainer kContainer = ks.getKieClasspathContainer();

            KieSession kSession = kContainer.newKieSession("ksession-rules");
            if (kSession == null) {
                System.out.println("Failed to load KieSession.");
                return;
            } else {
                System.out.println("KieSession loaded successfully.");
            }

            kSession.addEventListener(new AgendaEventListener() {
                @Override
                public void afterMatchFired(AfterMatchFiredEvent event) {
                    // Track the triggered rules
                    String ruleName = event.getMatch().getRule().getName();
                   System.out.println(event.getMatch().getFactHandles());

                    for (Object object : event.getMatch().getObjects()) {
                        if (object instanceof Property) {
                            Property property = (Property) object;
                            String propertyName = property.getName();

                            String characteristic = ruleName.toLowerCase(Locale.ROOT).split(" ")[0];

                            triggeredRulesMap.putIfAbsent(propertyName, new HashMap<>());
                            triggeredRulesMap.get(propertyName).putIfAbsent(characteristic, new ArrayList<>());
                            triggeredRulesMap.get(propertyName).get(characteristic).add(ruleName);
                        }
                    }
                }


                // Other overridden methods can be left empty
                @Override
                public void beforeMatchFired(BeforeMatchFiredEvent event) {}
                @Override
                public void matchCreated(MatchCreatedEvent event) {}
                @Override
                public void matchCancelled(MatchCancelledEvent event) {}
                @Override
                public void agendaGroupPopped(AgendaGroupPoppedEvent event) {}
                @Override
                public void agendaGroupPushed(AgendaGroupPushedEvent event) {}
                @Override
                public void beforeRuleFlowGroupActivated(RuleFlowGroupActivatedEvent event) {}
                @Override
                public void afterRuleFlowGroupActivated(RuleFlowGroupActivatedEvent event) {}
                @Override
                public void beforeRuleFlowGroupDeactivated(RuleFlowGroupDeactivatedEvent event) {}
                @Override
                public void afterRuleFlowGroupDeactivated(RuleFlowGroupDeactivatedEvent event) {}
            });

            // Create Location objects
            Location lisbon = new Location("lisboa", "low", "absent", "present", "absent", "absent", "present", "absent", "absent", "low", 70);
            Location porto = new Location("porto", "medium", "present", "present", "present", "absent", "present", "present", "absent", "medium", 35);
            Location faro = new Location("faro", "high", "absent", "absent", "present", "present", "present", "present", "present", "high", 10);


            // Create Property objects
            Property property1 = new Property("property_1", "Property in Lisbon" , lisbon, "present", "high", "high", "absent", "absent", "absent", "absent", "regular", "b", "absent", 2018, 6, 100, 4, 25, "south", "apartment");
            Property property2 = new Property("property_2", "Property in Porto" , porto, "absent", "low", "low", "absent", "present", "absent", "present", "new", "e", "present", 1960, 1, 100, 3, 33, "north", "residence");
            Property property3 = new Property("property_3", "Property in Faro" , faro, "absent", "high", "high", "present", "present", "present", "present", "reform", "a", "absent", 2021, 4, 48, 3, 16, "east", "apartment");

            // Insert facts (Location and Property objects) into the session
            kSession.insert(lisbon);
            kSession.insert(porto);
            kSession.insert(faro);

            kSession.insert(property1);
            kSession.insert(property2);
            kSession.insert(property3);

            // Fire all rules
            kSession.fireAllRules();

            // Triggered rules
            System.out.println("\n --------------------------------------------------------------");
            System.out.println("Triggered Rules Map:");
            for (Map.Entry<String, Map<String, List<String>>> propertyEntry : triggeredRulesMap.entrySet()) {
                System.out.println("\nProperty: " + propertyEntry.getKey());
                for (Map.Entry<String, List<String>> characteristicEntry : propertyEntry.getValue().entrySet()) {
                    System.out.println("  Characteristic: " + characteristicEntry.getKey() + " -> Rules: " + characteristicEntry.getValue());
                }
            }


            // Close the session
            kSession.dispose();

            // Output the results to verify
            property1.printInferredAttributes();
            property2.printInferredAttributes();
            property3.printInferredAttributes();

        } catch (Throwable e) {
            e.printStackTrace();
        }
    }
}

