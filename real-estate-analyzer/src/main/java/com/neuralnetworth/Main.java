package com.neuralnetworth;

import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;

public class Main {
    public static final void main(String[] args) {
        KieServices kieServices = KieServices.Factory.get();
        KieContainer kieContainer = kieServices.getKieClasspathContainer();
        KieSession kieSession = kieContainer.newKieSession("ksession-rules");

        if(kieSession == null) {
            System.out.println("Kie session is null");
            return;
        }

        Location lisbon = new Location("lisbon", "low");
        Property property = new Property(1, lisbon);

        kieSession.insert(lisbon);
        kieSession.insert(property);

        for(Object fact: kieSession.getObjects()){
            System.out.println(fact);
        }

        int firedRules = kieSession.fireAllRules();
        System.out.println("Rules fired: " + firedRules);
        kieSession.dispose();
    }
}
