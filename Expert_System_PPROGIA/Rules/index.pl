% Rules

%%%%%%%%%%% 1.Security %%%%%%%%%%%

% Rule 1.1: If the crime rate in a location is low and the property is located there, then the property is classified as having a low crime rate.
rule 1.1
    if [location_crime_rate(Location, low) and location_property(Location, Property)]
    then [create_fact(property_crime_rate(Property, low))].

% Rule 1.2: If the crime rate in a location is medium and the property is located there, then the property is classified as having a medium crime rate.
rule 1.2
    if [location_crime_rate(Location, medium) and location_property(Location, Property)]
    then [create_fact(property_crime_rate(Property, medium))].

% Rule 1.3: If the crime rate in a location is high and the property is located there, then the property is classified as having a high crime rate.
rule 1.3
    if [location_crime_rate(Location, high) and location_property(Location, Property)]
    then [create_fact(property_crime_rate(Property, high))].

% Rule 1.4: If the property has a low crime rate and a security system is present, then the property is classified as having high security.
rule 1.4
    if [property_crime_rate(Property, low) and security_system(Property, present)]
    then [create_fact(result(Property, security, high))].

% Rule 1.5: If the property has a high crime rate and no security system is present, then the property is classified as having low security.
rule 1.5
    if [property_crime_rate(Property, high) and security_system(Property, absent)]
    then [create_fact(result(Property, security, low))].

% Rule 1.6: If the security system is absent and the property has a low or medium crime rate, then the property is classified as having medium security.
rule 1.6
    if [security_system(Property, absent) and (property_crime_rate(Property, low) or property_crime_rate(Property, medium))]
    then [create_fact(result(Property, security, medium))].

% Rule 1.7: If the property has a high crime rate and a security system is present, then the property is classified as having medium security.
rule 1.7
    if [property_crime_rate(Property, high) and security_system(Property, present)]
    then [create_fact(result(Property, security, medium))].


%%%%%%%%%%% 2.General Comfort %%%%%%%%%%%

% Rule 2.1: If the property is located in an area with an airport and busy traffic, then the property will have a high noise level.
rule 2.1
    if [location_property(Location, Property) and aeroport(Location, present) and busy_traffic(Location, present)]
    then [create_fact(noise_level(Property, high))].

% Rule 2.2: If the property is located in an area with an airport or busy traffic, then the property will have a medium noise level.
rule 2.2
    if [location_property(Location, Property) and ((aeroport(Location, present) and busy_traffic(Location, absent)) or (busy_traffic(Location, present) and aeroport(Location, absent) ))]
    then [create_fact(noise_level(Property, medium))].

% Rule 2.3: If the property is not located in an area with an airport and does not have busy traffic, then the property will have a low noise level.
rule 2.3
    if [location_property(Location, Property) and (aeroport(Location, absent) and busy_traffic(Location, absent))]
    then [create_fact(noise_level(Property, low))].

% Rule 2.4: If the property has a high noise level and low acoustic insulation, then the property will have low sound comfort.
rule 2.4
    if [noise_level(Property, high) and acoustic_insulation(Property, low)]
    then [create_fact(sound_comfort(Property, low))].

% Rule 2.5: If the property has high acoustic insulation and a low noise level, then the property will have high sound comfort.
rule 2.5
    if [acoustic_insulation(Property, high) and noise_level(Property, low)]
    then [create_fact(sound_comfort(Property, high))].

% Rule 2.6: If the property has high acoustic insulation and a high noise level, then the property will have medium sound comfort.
rule 2.6
    if [acoustic_insulation(Property, high) and noise_level(Property, high)]
    then [create_fact(sound_comfort(Property, medium))].

% Rule 2.7: If the property has medium acoustic insulation or a medium noise level, then the property will have medium sound comfort.
rule 2.7
    if [acoustic_insulation(Property, medium) or noise_level(Property, medium)]
    then [create_fact(sound_comfort(Property, medium))].

% Rule 2.8: If the property has high sound comfort and high thermal comfort, then the property will have high overall comfort.
rule 2.8
    if [sound_comfort(Property, high) and thermal_comfort(Property, high)]
    then [create_fact(result(Property, comfort, high))].

% Rule 2.9: If the property has low sound comfort and low thermal comfort, then the property will have low overall comfort.
rule 2.9
    if [sound_comfort(Property, low) and thermal_comfort(Property, low)]
    then [create_fact(result(Property, comfort, low))].

% Rule 2.10: If the property has high sound comfort and low thermal comfort, then the property will have medium overall comfort.
rule 2.10
    if [sound_comfort(Property, high) and thermal_comfort(Property, low)]
    then [create_fact(result(Property, comfort, medium))].

% Rule 2.11: If the property has low sound comfort and high thermal comfort, then the property will have medium overall comfort.
rule 2.11
    if [thermal_comfort(Property, high) and sound_comfort(Property, low)]
    then [create_fact(result(Property, comfort, medium))].

% Rule 2.12: If the property has medium sound comfort or medium thermal comfort, then the property will have medium overall comfort.
rule 2.12
    if [sound_comfort(Property, medium) or thermal_comfort(Property, medium)]
    then [create_fact(result(Property, comfort, medium))].

%%%%%%%%%%% 3.Accessibility %%%%%%%%%%%

% Rule 3.1: If the property has an elevator and ramps, then the property is classified as having high accessibility.
rule 3.1
    if [elevator(Property, present) and ramps(Property, present)]
    then [create_fact(result(Property, accessibility, high))].

% Rule 3.2: If the property does not have an elevator and ramps, then the property is classified as having low accessibility.
rule 3.2
    if [elevator(Property, absent) and ramps(Property, absent)]
    then [create_fact(result(Property, accessibility, low))].

% Rule 3.3: If the property has either an elevator or ramps, but not both, then the property is classified as having medium accessibility.
rule 3.3
    if [(elevator(Property, present) and ramps(Property, absent)) or (elevator(Property, absent) and ramps(Property, present))]
    then [create_fact(result(Property, accessibility, medium))].

%%%%%%%%%%% 4.Maintenance %%%%%%%%%%%

% Rule 4.1: If the property has either a swimming pool or a garden, but not both, then the property is classified as having medium commodities.
rule 4.1
    if [(swimming_pool(Property, present) and garden(Property, absent)) or (swimming_pool(Property, absent) and garden(Property, present))]
    then [create_fact(commodities(Property, medium))].

% Rule 4.2: If the property has both a swimming pool and a garden, then the property is classified as having high commodities.
rule 4.2
    if [swimming_pool(Property, present) and garden(Property, present)]
    then [create_fact(commodities(Property, high))].

% Rule 4.3: If the property has neither a swimming pool nor a garden, then the property is classified as having low commodities.
rule 4.3
    if [swimming_pool(Property, absent) and garden(Property, absent)]
    then [create_fact(commodities(Property, low))].

% Rule 4.4: If the property is new or has low commodities, then it is classified as requiring low maintenance.
rule 4.4
    if [property_condition(Property, new) or commodities(Property, low)]
    then [create_fact(result(Property, maintenance, low))].

% Rule 4.5: If the property is not new and has medium commodities, then it is classified as requiring medium maintenance.
rule 4.5
    if [not property_condition(Property, new) and commodities(Property, medium)]
    then [create_fact(result(Property, maintenance, medium))].

% Rule 4.6: If the property is not new and has high commodities, then it is classified as requiring high maintenance.
rule 4.6
    if [not property_condition(Property, new) and commodities(Property, high)]
    then [create_fact(result(Property, maintenance, high))].

%%%%%%%%%%% 5.Energy Efficiency %%%%%%%%%%%

% Rule 5.1: If the property has an energy rating of A++ or A+ or A, then the property is classified as having high energy efficiency.
rule 5.1
    if [energy_rating(Property, a_plus_plus) or energy_rating(Property, a_plus) or energy_rating(Property, a)]
    then [create_fact(result(Property, energy_efficiency, high))].

% Rule 5.2: If the property has an energy rating of B or C, then the property is classified as having medium energy efficiency.
rule 5.2
    if [energy_rating(Property, b) or energy_rating(Property, c)]
    then [create_fact(result(Property, energy_efficiency, medium))].

% Rule 5.3: If the property has an energy rating of D, E, or F, then the property is classified as having low energy efficiency.
rule 5.3
    if [energy_rating(Property, d) or energy_rating(Property, e) or energy_rating(Property, f)]
    then [create_fact(result(Property, energy_efficiency, low))].

%%%%%%%%%%% 6.Services %%%%%%%%%%%

% Rule 6.1: If the property is located near schools, then it is classified as having the service "nearby schools".
rule 6.1
    if [location_property(Location, Property) and nearby_schools(Location, present)]
    then [create_fact(services(Property, nearby_schools))].

% Rule 6.2: If the property is located near public transport, then it is classified as having the service "nearby public transport".
rule 6.2
    if [location_property(Location, Property) and nearby_public_transport(Location, present)]
    then [create_fact(services(Property, nearby_public_transport))].

% Rule 6.3: If the property is located near hospitals, then it is classified as having the service "nearby hospitals".
rule 6.3
    if [location_property(Location, Property) and nearby_hospitals(Location, present)]
    then [create_fact(services(Property, nearby_hospitals))].

% Rule 6.4: If the property is located near supermarkets, then it is classified as having the service "nearby supermarkets".
rule 6.4
    if [location_property(Location, Property) and nearby_supermarkets(Location, present)]
    then [create_fact(services(Property, nearby_supermarkets))].

% Rule 6.5: If the property is located near leisure areas, then it is classified as having the service "nearby leisure areas".
rule 6.5
    if [location_property(Location, Property) and nearby_leisure_areas(Location, present)]
    then [create_fact(services(Property, nearby_leisure_areas))].

/*
% Rule 6.6: If a property has four or more nearby services, then it is classified as having a high service level.
rule 6.6
    if [evaluate(_, number_of_facts(services(Property, _), >=, 4))]
    then [create_fact(result(Property, services, medium))].

% Rule 6.7: If a property has two or three nearby services, then it is classified as having a medium service level.
rule 6.7
    if [evaluate(N, number_of_facts(services(Property, _), >=, 2)) and evaluate(N, number_of_facts(services(Property, _), <, 4))]
    then [create_fact(result(Property, services, medium))].

% Rule 6.8: If a property has less than two nearby services, then it is classified as having a low service level.
rule 6.8
    if [evaluate(_, number_of_facts(services(Property, _), <, 2))]
    then [create_fact(result(Property, services, medium))].
*/

% Rule 7.1: If the property has optical fiber and smart appliances, then the property is classified as having high connectivity.
rule 7.1
    if [optical_fiber(Property, present) and smart_appliances(Property, present)]
    then [create_fact(result(Property, connectivity, high))].

% Rule 7.2: If the property has optical fiber and no smart appliances, then the property is classified as having medium connectivity.
rule 7.2
    if [optical_fiber(Property, present) and smart_appliances(Property, absent)]
    then [create_fact(result(Property, connectivity, medium))].

% Rule 7.3: If the property does not have optical fiber but has smart appliances, then the property is classified as having medium connectivity.
rule 7.3
    if [optical_fiber(Property, absent) and smart_appliances(Property, present)]
    then [create_fact(result(Property, connectivity, medium))].

% Rule 7.4: If the property does not have optical fiber or smart appliances, then the property is classified as having low connectivity.
rule 7.4
    if [optical_fiber(Property, absent) and smart_appliances(Property, absent)]
    then [create_fact(result(Property, connectivity, low))].

rule 8.1
    if [evaluate(_, floor_level(Property, >=, 4))]
    then [create_fact(result(Property, view, high))].

rule 10.1
    if [sun_orientation(Property, south) or sun_orientation(Property, east)]
    then [create_fact(result(Property, sun_exposure, good))].

rule 10.2
    if [sun_orientation(Property, north) or sun_orientation(Property, west)]
    then [create_fact(result(Property, sun_exposure, average))].

%%%%%%%%%%% 11.Parking %%%%%%%%%%%

% Rule 11.1: If the public parking availability in the location is low, then the property is classified as having low public parking.
rule 11.1
    if [parking(Location, low) and location_property(Location, Property)]
    then [create_fact(public_parking(Property, low))].

% Rule 11.2: If the public parking availability in the location is medium, then the property is classified as having medium public parking.
rule 11.2
    if [parking(Location, medium) and location_property(Location, Property)]
    then [create_fact(public_parking(Property, medium))].

% Rule 11.3: If the public parking availability in the location is high, then the property is classified as having high public parking.
rule 11.3
    if [parking(Location, high) and location_property(Location, Property)]
    then [create_fact(public_parking(Property, high))].

% Rule 11.4: If the property has a garage and the public parking availability is either high or medium, then the property is classified as having high overall parking.
rule 11.4
    if [garage(Property, present) and (public_parking(Property, high) or public_parking(Property, medium))]
    then [create_fact(result(Property, parking, high))].

% Rule 11.5: If the property does not have a garage but the public parking availability is either high or medium, then the property is classified as having medium overall parking.
rule 11.5
    if [garage(Property, absent) and (public_parking(Property, high) or public_parking(Property, medium))]
    then [create_fact(result(Property, parking, medium))].

% Rule 11.6: If the property does not have a garage and the public parking availability is low, then the property is classified as having low overall parking.
rule 11.6
    if [garage(Property, absent) and public_parking(Property, low)]
    then [create_fact(result(Property, parking, low))].

%%%%%%%%%%% 12.State %%%%%%%%%%%

% Rule 12.1: If the property was constructed after 2020, it is classified as being in a high state of condition.
rule 12.1
    if [evaluate(year_construction(Property, >, 2020))]
    then [create_fact(result(Property, state, high))].

% Rule 12.2: If the property was constructed between 1990 and 2020 (inclusive), it is classified as being in a medium state of condition.
rule 12.2
    if [evaluate(year_construction(Property, >=, 1990)) and evaluate(year_construction(Property, =<, 2020)) ]
    then [create_fact(result(Property, state, medium))].

% Rule 12.3: If the property was constructed before 1990, it is classified as being in a low state of condition.
rule 12.3
    if [evaluate(year_construction(Property, <, 1990))]
    then [create_fact(result(Property, state, low))].

%%%%%%%%%%% 13.Potential for Appreciation %%%%%%%%%%%

% Rule 13.1: If the property is located in an area where property values have increased by more than 50% in the last five years, the property is classified as having high potential for appreciation.
rule 13.1
    if [evaluate(last_5_years_increased(Location, >, 50)) and location_property(Location, Property)]
    then [create_fact(result(Property, potential_appreciation, high))].

% Rule 13.2: If the property is located in an area where property values have increased by between 20% and 50% in the last five years, the property is classified as having medium potential for appreciation.
rule 13.2
    if [evaluate(last_5_years_increased(Location, >=, 20)) and (evaluate(last_5_years_increased(Location, =<, 50)) and location_property(Location, Property))]
    then [create_fact(result(Property, potential_appreciation, medium))].

% Rule 13.3: If the property is located in an area where property values have increased by less than 20% in the last five years, the property is classified as having low potential for appreciation.
rule 13.3
    if [evaluate(last_5_years_increased(Location, <, 20)) and location_property(Location, Property)]
    then [create_fact(result(Property, potential_appreciation, low))].
