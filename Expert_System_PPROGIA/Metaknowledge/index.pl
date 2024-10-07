:- dynamic fact_triggers_rules/2.

% Security
fact_triggers_rules(location_crime_rate(_, _), [1.1,1.2,1.3]).
fact_triggers_rules(location_property(_, _), [1.1,1.2,1.3,6.1,6.2,6.3,6.4,6.5,11.1,11.2,11.3,13.1,13.2,13.3]).
fact_triggers_rules(security_system(_, _), [1.4,1.5,1.6,1.7]).
fact_triggers_rules(property_crime_rate(_, _), [1.4,1.5,1.6,1.7]).

% Comfort
fact_triggers_rules(aeroport(_, _), [2.1,2.2,2.3]).
fact_triggers_rules(busy_traffic(_, _), [2.1,2.2,2.3]).
fact_triggers_rules(acoustic_insulation(_, _), [2.4,2.5,2.6,2.7]).
fact_triggers_rules(noise_level(_, _), [2.4,2.5,2.6,2.7]).
fact_triggers_rules(sound_comfort(_, _), [2.8,2.9,2.10,2.11,2.12]).
fact_triggers_rules(thermal_comfort(_, _), [2.8,2.9,2.10,2.11,2.12]).

% Accessibility
fact_triggers_rules(elevator(_, _), [3.1,3.2,3.3]).
fact_triggers_rules(ramps(_, _), [3.1,3.2,3.3]).

% Maintenance
fact_triggers_rules(swimming_pool(_, _), [4.1,4.2,4.3]).
fact_triggers_rules(garden(_, _), [4.1,4.2,4.3]).
fact_triggers_rules(commodities(_, _), [4.4,4.5,4.6]).
fact_triggers_rules(property_condition(_, _), [4.4,4.5,4.6]).

% Energy Efficiency
fact_triggers_rules(energy_rating(_, _), [5.1,5.2,5.3]).

% Services
fact_triggers_rules(nearby_schools(_, _), [6.1]).
fact_triggers_rules(nearby_public_transport(_, _), [6.2]).
fact_triggers_rules(nearby_hospitals(_, _), [6.3]).
fact_triggers_rules(nearby_supermarkets(_, _), [6.4]).
fact_triggers_rules(nearby_leisure_areas(_, _), [6.5]).
%fact_triggers_rules(services(_, _), [6.6,6.7,6.8]).

% Parking
fact_triggers_rules(parking(_, _), [11.1,11.2,11.3]).
fact_triggers_rules(garage(_, _), [11.4,11.5,11.6]).
fact_triggers_rules(public_parking(_, _), [11.4,11.5,11.6]).

% Construction Year
fact_triggers_rules(year_construction(_, _), [12.1,12.2,12.3]).

% Potential for Appreciation
fact_triggers_rules(last_5_years_increased(_, _), [13.1,13.2,13.3]).
fact_triggers_rules(services(_, _), [6.6,6.7,6.8]).

% Connectivity
fact_triggers_rules(connectivity(_, _), [7.1,7.2,7.3,7.4]).
