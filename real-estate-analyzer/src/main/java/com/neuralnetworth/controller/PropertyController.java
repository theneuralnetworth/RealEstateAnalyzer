package com.neuralnetworth.controller;

import com.neuralnetworth.Model.Location;
import com.neuralnetworth.Model.Property;
import com.neuralnetworth.knowledge.KnowledgeBaseLoader;
import org.kie.api.event.rule.*;
import org.kie.api.runtime.KieContainer;
import org.kie.api.event.rule.AfterMatchFiredEvent;
import org.kie.api.runtime.KieSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController

@RequestMapping("/api/realestates")
public class PropertyController {

    @Autowired
    private KieContainer kieContainer;

    private static final Map<String, Map<String, List<String>>> triggeredRulesMap = new HashMap<>();

    @CrossOrigin(origins = "http://localhost:3000")
    @PostMapping("/getrealestates")
    public List<Property> getRealEstates(@RequestBody(required = false) Map<String, Object> requestBody) {
        KieSession kSession = kieContainer.newKieSession("ksession-rules");
        if (kSession == null) {
            System.out.println("Failed to load KieSession.");
            return new ArrayList<>();
        } else {
            System.out.println("KieSession loaded successfully.");
        }

        kSession.addEventListener(new AgendaEventListener() {
            @Override
            public void afterMatchFired(AfterMatchFiredEvent event) {
                // Track the triggered rules
                String ruleName = event.getMatch().getRule().getName();
                //System.out.println(event.getMatch().getFactHandles());

                for (Object object : event.getMatch().getObjects()) {
                    if (object instanceof Property) {
                        Property property = (Property) object;
                        String propertyName = property.getTitle();

                        String characteristic = ruleName.toLowerCase(Locale.ROOT).split(" ")[0];

                        triggeredRulesMap.putIfAbsent(propertyName, new HashMap<>());
                        triggeredRulesMap.get(propertyName).putIfAbsent(characteristic, new ArrayList<>());
                        if (!triggeredRulesMap.get(propertyName).get(characteristic).contains(ruleName)) {
                            triggeredRulesMap.get(propertyName).get(characteristic).add(ruleName);
                        }
                    }
                }
            }

            // Other overridden methods can be left empty
            @Override
            public void beforeMatchFired(BeforeMatchFiredEvent event) {
            }

            @Override
            public void matchCreated(MatchCreatedEvent event) {
            }

            @Override
            public void matchCancelled(MatchCancelledEvent event) {
            }

            @Override
            public void agendaGroupPopped(AgendaGroupPoppedEvent event) {
            }

            @Override
            public void agendaGroupPushed(AgendaGroupPushedEvent event) {
            }

            @Override
            public void beforeRuleFlowGroupActivated(RuleFlowGroupActivatedEvent event) {
            }

            @Override
            public void afterRuleFlowGroupActivated(RuleFlowGroupActivatedEvent event) {
            }

            @Override
            public void beforeRuleFlowGroupDeactivated(RuleFlowGroupDeactivatedEvent event) {
            }

            @Override
            public void afterRuleFlowGroupDeactivated(RuleFlowGroupDeactivatedEvent event) {
            }
        });

        KnowledgeBaseLoader kbLoader = new KnowledgeBaseLoader(kSession);
        //kbLoader.insertFakeFacts(kSession);
        kbLoader.loadLocations().forEach(kSession::insert);
        kbLoader.loadProperties().forEach(kSession::insert);

        kSession.fireAllRules();
        List<Property> properties = kSession.getObjects().stream().filter(obj -> obj instanceof Property).map(obj -> (Property) obj).collect(Collectors.toList());
        kSession.dispose();

        return  properties;
    }

    private List<Property> createProperties() {
        List<Location> locations = new ArrayList<>();
        Location lisbon = new Location("lisboa", "low", "absent", "present", "absent", "absent", "present", "absent", "absent", "low", 70, "present", "absent");
        Location porto = new Location("porto", "medium", "present", "present", "present", "absent", "present", "present", "absent", "medium", 35, "absent", "present");
        Location faro = new Location("faro", "high", "absent", "absent", "present", "present", "present", "present", "present", "high", 10, "absent", "absent");
        locations.add(lisbon);
        locations.add(porto);
        locations.add(faro);

        List<Property> properties = new ArrayList<>();
        Property property1 = new Property("property_1", "Property in Lisbon" , lisbon, "present", "high", "high", "absent", "absent", "absent", "absent", "regular", "b", "absent", 2018, 6, 100f, 4, 25f, "south", "apartment", "present", "present");
        Property property2 = new Property("property_2", "Property in Porto" , porto, "absent", "low", "low", "absent", "present", "absent", "present", "new", "e", "present", 1960, 1, 100f, 3, 33f, "north", "residence", "present", "absent");
        Property property3 = new Property("property_3", "Property in Faro" , faro, "absent", "high", "high", "present", "present", "present", "present", "reform", "a", "absent", 2021, 4, 48f, 3, 16f, "east", "apartment", "absent", "absent");
        properties.add(property1);
        properties.add(property2);
        properties.add(property3);

        return properties;
    }
}
