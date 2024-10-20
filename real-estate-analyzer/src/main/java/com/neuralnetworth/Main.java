package com.neuralnetworth;

import org.kie.api.KieServices;
import org.kie.api.builder.KieScanner;
import org.kie.api.builder.Message;
import org.kie.api.builder.Results;
import org.kie.api.definition.KiePackage;
import org.kie.api.definition.rule.Rule;
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

        Results results = kieContainer.verify();
        if (results.hasMessages(Message.Level.ERROR)) {
            System.out.println("Errors:");
            for (Message message : results.getMessages(Message.Level.ERROR)) {
                System.out.println("Error: " + message.getText());
            }
            return;
        }

        if(kieContainer.getKieBase().getKiePackages().isEmpty()) {
            System.out.println("Kie container has no packages");
        }else {
            System.out.println("Loaded packages and rules:");
            for (KiePackage kiePackage : kieContainer.getKieBase().getKiePackages()) {
                System.out.println("Package: " + kiePackage.getName());
                for (Rule rule : kiePackage.getRules()) {
                    System.out.println("Rule: " + rule.getName());
                }
            }
        }

        Location lisbon = new Location("lisbon", "low");
        Property property = new Property(1, lisbon);

        kieSession.insert(lisbon);
        kieSession.insert(property);

        System.out.println("Number of facts: " + kieSession.getFactCount());

        int firedRules = kieSession.fireAllRules();
        System.out.println("Rules fired: " + firedRules);
        kieSession.dispose();
    }
}
