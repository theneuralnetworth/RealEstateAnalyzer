:- dynamic fact_triggers_rules/2.

% Security
fact_triggers_rules(location_crime_rate(_, _), [1.1,1.2,1.3]).
fact_triggers_rules(location_property(_, _), [1.1,1.2,1.3]).
fact_triggers_rules(security_system(_, _), [1.4,1.5,1.6,1.7]).
fact_triggers_rules(property_crime_rate(_, _), [1.4,1.5,1.6,1.7]).

% Comfort
fact_triggers_rules(aeroport(_, _), [2.1,2.2,2.3]).
fact_triggers_rules(busy_traffic(_, _), [2.1,2.2,2.3]).
fact_triggers_rules(acoustic_insulation(_, _), [2.4,2.5,2.6,2.7]).
fact_triggers_rules(noise_level(_, _), [2.4,2.5,2.6,2.7]).
fact_triggers_rules(sound_comfort(_, _), [2.8,2.9,2.10,2.11,2.12]).
fact_triggers_rules(thermal_comfort(_, _), [2.8,2.9,2.10,2.11,2.12]).