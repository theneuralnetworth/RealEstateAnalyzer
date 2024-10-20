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

        if (kieSession == null) {
            throw new RuntimeException("KieSession is null");
        }

        verifyKieContainer(kieContainer, true);

        Location lisbon = new Location("lisbon", "low");
        Property property = new Property(1, lisbon);

        kieSession.insert(lisbon);
        kieSession.insert(property);

        System.out.println("Number of facts: " + kieSession.getFactCount());

        int firedRules = kieSession.fireAllRules();
        System.out.println("Rules fired: " + firedRules);

        kieSession.dispose();
    }

    public static void verifyKieContainer(KieContainer kieContainer, boolean printRules) {
        Results results = kieContainer.verify();
        if (results.hasMessages(Message.Level.ERROR)) {
            System.out.println("Errors:");
            for (Message message : results.getMessages(Message.Level.ERROR)) {
                System.out.println("Error: " + message.getText());
            }
            throw new RuntimeException("KieContainer has not been initialized correctly");
        }

        if (kieContainer.getKieBase().getKiePackages().isEmpty()) {
            throw new RuntimeException("KieContainer has no packages");
        }
        if(printRules) {
            System.out.println("Loaded rules:");
            for (KiePackage kiePackage : kieContainer.getKieBase().getKiePackages()) {
                for (Rule rule : kiePackage.getRules()) {
                    System.out.println("\t- Rule: " + rule.getName());
                }
            }
        }
    }
}

