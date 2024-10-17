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
fact_triggers_rules(amenities(_, _), [4.4,4.5,4.6]).
fact_triggers_rules(property_condition(_, _), [4.4,4.5,4.6]).

% Energy Efficiency
fact_triggers_rules(energy_rating(_, _), [5.1,5.2,5.3]).

% Services
fact_triggers_rules(nearby_schools(_, _), [6.1]).
fact_triggers_rules(nearby_public_transport(_, _), [6.2]).
fact_triggers_rules(nearby_hospitals(_, _), [6.3]).
fact_triggers_rules(nearby_supermarkets(_, _), [6.4]).
fact_triggers_rules(nearby_leisure_areas(_, _), [6.5]).
fact_triggers_rules(services(_, _), [6.6]).
fact_triggers_rules(number_services(_,_), [6.7,6.8,6.9]).

% Parking
fact_triggers_rules(parking(_, _), [11.1,11.2,11.3]).
fact_triggers_rules(garage(_, _), [11.4,11.5,11.6]).
fact_triggers_rules(public_parking(_, _), [11.4,11.5,11.6]).

% Construction Year
fact_triggers_rules(year_construction(_, _), [12.1,12.2,12.3]).

% Potential for Appreciation
fact_triggers_rules(last_5_years_increased(_, _), [13.1,13.2,13.3]).

% Connectivity
fact_triggers_rules(optical_fiber(_, _), [7.1,7.2,7.3,7.4]).
fact_triggers_rules(smart_appliances(_,_), [7.1,7.2,7.3,7.4]).

% View
fact_triggers_rules(forest(_,_), [8.1, 8.2]).
fact_triggers_rules(beach(_,_), [8.1, 8.2]).
fact_triggers_rules(location_property(_,_), [8.1, 8.2]).
fact_triggers_rules(view_quality(_,_), [8.3,8.4,8.5,8.6,8.7,8.8]).
fact_triggers_rules(property_type(_,_), [8.3,8.4,8.5]).
fact_triggers_rules(floor_level(_, _), [8.6,8.7,8.8]).

% Area
fact_triggers_rules(area_per_room(_, _), [9.0,9.1,9.2,9.3]).

% Sun exposure
fact_triggers_rules(sun_orientation(_, _), [10.1, 10.2]).

% Score
fact_triggers_rules(meta_score(_,_), [14.1,14.2,14.3,14.4,14.5,14.6,14.7,14.8,14.9,14.10,14.11,14.12,14.13]).
fact_triggers_rules(result(_,security,_), [14.1]).
fact_triggers_rules(result(_,comfort,_), [14.2]).
fact_triggers_rules(result(_,accessibility,_), [14.3]).
fact_triggers_rules(result(_,maintenance,_), [14.4]).
fact_triggers_rules(result(_,energy_efficiency,_), [14.5]).
fact_triggers_rules(result(_,services,_), [14.6]).
fact_triggers_rules(result(_,connectivity,_), [14.7]).
fact_triggers_rules(result(_,view_quality,_), [14.8]).
fact_triggers_rules(result(_,spaciousness,_), [14.9]).
fact_triggers_rules(result(_,sun_exposure,_), [14.10]).
fact_triggers_rules(result(_,parking,_), [14.11]).
fact_triggers_rules(result(_,state,_), [14.12]).
fact_triggers_rules(result(_,potential_appreciation,_), [14.13,14.14]).
fact_triggers_rules(score(_,_,_), [14.14]).