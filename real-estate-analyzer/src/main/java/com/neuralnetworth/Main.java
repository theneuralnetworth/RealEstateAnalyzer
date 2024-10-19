package com.neuralnetworth;

import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.api.runtime.rule.StatefulRuleSession;

public class Main {
    public static final void main(String[] args) {
        KieServices kieServices = KieServices.Factory.get();
        KieContainer kieContainer = kieServices.getKieClasspathContainer();
        KieSession kieSession = kieContainer.newKieSession();

        Location lisbon = new Location("lisbon", "low");
        Property property = new Property(1, lisbon);
        kieSession.insert(lisbon);
        kieSession.insert(property);

        kieSession.fireAllRules();
        kieSession.dispose();
    }
}
