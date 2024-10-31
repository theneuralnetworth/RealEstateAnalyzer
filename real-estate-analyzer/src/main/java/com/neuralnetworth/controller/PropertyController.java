package com.neuralnetworth.controller;

import com.neuralnetworth.Model.Location;
import com.neuralnetworth.Model.Property;
import com.neuralnetworth.knowledge.KnowledgeBaseLoader;
import org.kie.api.event.rule.*;
import org.kie.api.runtime.KieContainer;
import org.kie.api.event.rule.AfterMatchFiredEvent;
import org.kie.api.runtime.KieSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController

@RequestMapping("/api/realestates")
@CrossOrigin(origins = "*")
public class PropertyController {

    @Autowired
    private KieContainer kieContainer;

    private static final Map<String, Map<String, List<String>>> triggeredRulesMap = new HashMap<>();

    @PostMapping("/getrealestates")
    public ResponseEntity<List<Property>> getRealEstates(@RequestBody(required = false) Map<String, Object> requestBody) {
        KieSession kSession = kieContainer.newKieSession("ksession-rules");
        if (kSession == null) {
            System.out.println("Failed to load KieSession.");
            return ResponseEntity.ok(new ArrayList<>());
        } else {
            System.out.println("KieSession loaded successfully.");
        }

        System.out.println("Body Request -> " + requestBody);
        Map<String, Integer> preferences = (Map<String, Integer>) requestBody.get("preferences");
        Map<String, Object> filter = (Map<String, Object>) requestBody.get("filter") == null
                ? new HashMap<>() : (Map<String, Object>) requestBody.get("filter");

        Map<String, Object> priceFilter = filter.get("price") == null ? new HashMap<>() : (Map<String, Object>) filter.get("price");
        int minPrice = priceFilter.get("min") == null ? 0 : (int) priceFilter.get("min");
        int maxPrice = priceFilter.get("max") == null ? 999999999 : (int) priceFilter.get("max");

        String locationFilter = filter.get("location") == null ? "" : (String) filter.get("location");
        String typologyFilter = filter.get("typology") == null ? "" : (String) filter.get("typology");


        kSession.addEventListener(new AgendaEventListener() {
            @Override
            public void afterMatchFired(AfterMatchFiredEvent event) {
                // Track the triggered rules
                String ruleName = event.getMatch().getRule().getName();
                //System.out.println(event.getMatch().getFactHandles());

                for (Object object : event.getMatch().getObjects()) {
                    if (object instanceof Property) {
                        Property property = (Property) object;
                        String characteristic = ruleName.toLowerCase(Locale.ROOT).split(" ")[0];

                        property.getJustifications().putIfAbsent(characteristic, new ArrayList<>());

                        if (!property.getJustifications().get(characteristic).contains(ruleName)) {
                            property.getJustifications().get(characteristic).add(ruleName);
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
        kbLoader.loadProperties().forEach(p -> {
            if (preferences != null) {
                p.setPrefSecurity(preferences.containsKey("safety") ? (float) preferences.get("safety") / 10 : 1f);
                p.setPrefComfort(preferences.containsKey("comfort") ? (float) preferences.get("comfort") / 10 : 1f);
                p.setPrefAccessibility(preferences.containsKey("accessibility") ? (float) preferences.get("accessibility") / 10 : 1f);
                p.setPrefMaintenance(preferences.containsKey("maintenance") ? (float) preferences.get("maintenance") / 10 : 1f);
                p.setPrefEnergyEfficiency(preferences.containsKey("energy_efficiency") ? (float) preferences.get("energy_efficiency") / 10 : 1f);
                p.setPrefServices(preferences.containsKey("services") ? (float) preferences.get("services") / 10 : 1f);
                p.setPrefConnectivity(preferences.containsKey("connectivity") ? (float) preferences.get("connectivity") / 10 : 1f);
                p.setPrefViewQuality(preferences.containsKey("view_quality") ? (float) preferences.get("view_quality") / 10 : 1f);
                p.setPrefSpaciousness(preferences.containsKey("spaciousness") ? (float) preferences.get("spaciousness") / 10 : 1f);
                p.setPrefSunExposure(preferences.containsKey("sun_exposure") ? (float) preferences.get("sun_exposure") / 10 : 1f);
                p.setPrefParking(preferences.containsKey("parking") ? (float) preferences.get("parking") / 10 : 1f);
                p.setPrefBuildState(preferences.containsKey("state") ? (float) preferences.get("state") / 10 : 1f);
                p.setPrefPotentialAppreciation(preferences.containsKey("potential_appreciation") ? (float) preferences.get("potential_appreciation") / 10 : 1f);
            }
            kSession.insert(p);
        });

        System.out.println("Location filter -> " + locationFilter);
        System.out.println("Typology filter -> " + typologyFilter);

        kSession.fireAllRules();
        List<Property> properties = kSession.getObjects().stream()
                .filter(obj -> obj instanceof Property)
                .map(obj -> (Property) obj)
                .filter(property ->
                        (minPrice == 0 || property.getPrice() >= minPrice) &&
                        (maxPrice == 999999999 || property.getPrice() <= maxPrice))
                .filter(property ->
                        locationFilter == null || locationFilter.isEmpty() ||
                        Objects.equals(property.getLocation().getName(), locationFilter))
                .filter(property ->
                        typologyFilter == null || typologyFilter.isEmpty() ||
                        Objects.equals(property.getTypology().toLowerCase(), typologyFilter.toLowerCase()))
                .sorted(Comparator.comparing(Property::getTotalScore).reversed())
                .collect(Collectors.toList());


        kSession.dispose();

        return ResponseEntity.ok(properties);
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
        Property property1 = new Property("property_1", "Property in Lisbon" , lisbon, "present", "high", "high", "absent", "absent", "absent", "absent", "regular", "b", "absent", 2018, 6, 100f, 4, 25f, Collections.singletonList("south"), "apartment", "present", "present");
        Property property2 = new Property("property_2", "Property in Porto" , porto, "absent", "low", "low", "absent", "present", "absent", "present", "new", "e", "present", 1960, 1, 100f, 3, 33f, Collections.singletonList("north"), "residence", "present", "absent");
        Property property3 = new Property("property_3", "Property in Faro" , faro, "absent", "high", "high", "present", "present", "present", "present", "reform", "a", "absent", 2021, 4, 48f, 3, 16f, Collections.singletonList("east"), "apartment", "absent", "absent");
        properties.add(property1);
        properties.add(property2);
        properties.add(property3);

        return properties;
    }
}
