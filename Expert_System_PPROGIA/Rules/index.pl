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

% Rule 4.1: If the property has either a swimming pool or a garden, but not both, then the property is classified as having medium amenities.
rule 4.1
    if [(swimming_pool(Property, present) and garden(Property, absent)) or (swimming_pool(Property, absent) and garden(Property, present))]
    then [create_fact(amenities(Property, medium))].

% Rule 4.2: If the property has both a swimming pool and a garden, then the property is classified as having high amenities.
rule 4.2
    if [swimming_pool(Property, present) and garden(Property, present)]
    then [create_fact(amenities(Property, high))].

% Rule 4.3: If the property has neither a swimming pool nor a garden, then the property is classified as having low amenities.
rule 4.3
    if [swimming_pool(Property, absent) and garden(Property, absent)]
    then [create_fact(amenities(Property, low))].

% Rule 4.4: If the property is new or has low amenities, then it is classified as requiring low maintenance.
rule 4.4
    if [property_condition(Property, new) or amenities(Property, low)]
    then [create_fact(result(Property, maintenance, low))].

% Rule 4.5: If the property is not new and has medium amenities, then it is classified as requiring medium maintenance.
rule 4.5
    if [not property_condition(Property, new) and amenities(Property, medium)]
    then [create_fact(result(Property, maintenance, medium))].

% Rule 4.6: If the property is not new and has high amenities, then it is classified as requiring high maintenance.
rule 4.6
    if [not property_condition(Property, new) and amenities(Property, high)]
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

% Rule 6.6: Calculates the number of services near the property based on the facts created by
rule 6.6
    if [services(Property,_)]
    then [create_fact(number_services(Property, operation(count,services(Property,_), _)))].

% Rule 6.7: If a property has four or more nearby services, then it is classified as having a high service level.
rule 6.7
    if [evaluate(number_services(Property, >, 4))]
    then [create_fact(result(Property, services, high))].

% Rule 6.8: If a property has two or three nearby services, then it is classified as having a medium service level.
rule 6.8
    if [evaluate(number_services(Property, >=, 2)) and evaluate(number_services(Property, =<, 4))]
    then [create_fact(result(Property, services, medium))].

% Rule 6.9: If a property has less than two nearby services, then it is classified as having a low service level.
rule 6.9
    if [evaluate(number_services(Property, <, 2))]
    then [create_fact(result(Property, services, low))].

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

%%%%%%%%%%% 8.View quality %%%%%%%%%%%

rule 8.1
    if [forest(Location, present) or beach(Location, present) and location_property(Location, Property)]
    then [create_fact(view_quality(Property, high))].

rule 8.2
    if [forest(Location, absent) and beach(Location, absent) and location_property(Location, Property)]
    then [create_fact(view_quality(Property, low))].

rule 8.3
    if [view_quality(Property, high) and property_type(Property, residence)]
    then [create_fact(result(Property, view_quality, high))].

rule 8.4
    if [view_quality(Property, low) and property_type(Property, residence)]
    then [create_fact(result(Property, view_quality, medium))].

rule 8.5
    if [view_quality(Property, low) and property_type(Property, apartment)]
    then [create_fact(result(Property, view_quality, low))].

rule 8.6
    if [view_quality(Property, high) and evaluate(floor_level(Property, >=, 4))]
    then [create_fact(result(Property, view_quality, high))].

rule 8.7
    if [view_quality(Property, high) and  evaluate(floor_level(Property, >=, 2)) and evaluate(floor_level(Property, <, 4))]
    then [create_fact(result(Property, view_quality, medium))].

rule 8.8
    if [view_quality(Property, high) and evaluate(floor_level(Property, <, 2))]
    then [create_fact(result(Property, view_quality, low))].

%%%%%%%%%%% 9.Area size %%%%%%%%%%%

rule 9.1
    if [evaluate(area_per_room(Property, >, 30))]
    then [create_fact(result(Property, spaciousness, high))].

rule 9.2
    if [evaluate(area_per_room(Property, >, 20)) and evaluate(area_per_room(Property, =<, 30))]
    then [create_fact(result(Property, spaciousness, medium))].

rule 9.3
    if [evaluate(area_per_room(Property, =<, 20))]
    then [create_fact(result(Property, spaciousness, low))].

%%%%%%%%%%% 10.Sun Exposure %%%%%%%%%%%
rule 10.1
    if [sun_orientation(Property, south) and sun_orientation(Property, east)]
    then [create_fact(result(Property, sun_exposure, high))].

rule 10.2
    if [(sun_orientation(Property, south) and not sun_orientation(Property, east)) or (sun_orientation(Property, east) and not sun_orientation(Property, south))]
    then [create_fact(result(Property, sun_exposure, medium))].

rule 10.3
    if [not sun_exposure(Property, high) and not sun_exposure(Property, medium)]
    then [create_fact(result(Property, sun_exposure, low))].

%%%%%%%%%%% 11.Parking %%%%%%%%%%%

% Rule 11.1: If the public parking availability in the location is low, then the property is classified as having low public parking.
rule 11.1
    if [parking(Location, low) and location_property(Location, Property) ]
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

%%%%%%%%%%% 14.Score %%%%%%%%%%%

% Rule 14.1: Calculates the score for security based on the meta_score of the result. The weight for security is multiplied by 10.
rule 14.1
    if [result(Property, security, X) and meta_score(X,P)]
    then [create_fact(score(Property, security, operation(multi,P, 10)))].

% Rule 14.2: Calculates the score for comfort based on the meta_score of the result. The weight for comfort is multiplied by 15.
rule 14.2
    if [result(Property, comfort, X) and meta_score(X,P)]
    then [create_fact(score(Property, comfort, operation(multi,P, 15)))].

% Rule 14.3: Calculates the score for accessibility based on the meta_score of the result. The weight for accessibility is multiplied by 8.
rule 14.3
    if [result(Property, accessibility, X) and meta_score(X,P)]
    then [create_fact(score(Property, accessibility, operation(multi,P, 8)))].

% Rule 14.4: Calculates the score for maintenance based on the meta_score of the result. The weight for maintenance is multiplied by 12.
rule 14.4
    if [result(Property, maintenance, X) and meta_score(X,P)]
    then [create_fact(score(Property, maintenance, operation(multi,P, 12)))].

% Rule 14.5: Calculates the score for energy efficiency based on the meta_score of the result. The weight for energy efficiency is multiplied by 10.
rule 14.5
    if [result(Property, energy_efficiency, X) and meta_score(X,P)]
    then [create_fact(score(Property, energy_efficiency, operation(multi,P, 10)))].

% Rule 14.6: Calculates the score for services based on the meta_score of the result. The weight for services is multiplied by 10.
rule 14.6
    if [result(Property, services, X) and meta_score(X,P)]
    then [create_fact(score(Property, services, operation(multi,P, 10)))].

% Rule 14.7: Calculates the score for connectivity based on the meta_score of the result. The weight for connectivity is multiplied by 7.
rule 14.7
    if [result(Property, connectivity, X) and meta_score(X,P)]
    then [create_fact(score(Property, connectivity, operation(multi,P, 7)))].

% Rule 14.8: Calculates the score for view quality based on the meta_score of the result. The weight for view quality is multiplied by 8.
rule 14.8
    if [result(Property, view_quality, X) and meta_score(X,P)]
    then [create_fact(score(Property, view_quality, operation(multi,P, 8)))].

% Rule 14.9: Calculates the score for spaciousness based on the meta_score of the result. The weight for spaciousness is multiplied by 10.
rule 14.9
    if [result(Property, spaciousness, X) and meta_score(X,P)]
    then [create_fact(score(Property, spaciousness, operation(multi,P, 10)))].

% Rule 14.10: Calculates the score for sun exposure based on the meta_score of the result. The weight for sun exposure is multiplied by 5.
rule 14.10
    if [result(Property, sun_exposure, X) and meta_score(X,P)]
    then [create_fact(score(Property, sun_exposure, operation(multi,P, 5)))].

% Rule 14.11: Calculates the score for parking based on the meta_score of the result. The weight for parking is multiplied by 5.
rule 14.11
    if [result(Property, parking, X) and meta_score(X,P)]
    then [create_fact(score(Property, parking, operation(multi,P, 5)))].

% Rule 14.12: Calculates the score for state of the property based on the meta_score of the result. The weight for the state is multiplied by 5.
rule 14.12
    if [result(Property, state, X) and meta_score(X,P)]
    then [create_fact(score(Property, state, operation(multi,P, 5)))].

% Rule 14.13: Calculates the score for potential appreciation based on the meta_score of the result. The weight for potential appreciation is multiplied by 5.
rule 14.13
    if [result(Property, potential_appreciation, X) and meta_score(X,P)]
    then [create_fact(score(Property, potential_appreciation, operation(multi,P, 5)))].

rule 14.14
    if [score(Property,_,_) and score(Property,security,_) and score(Property,comfort,_) and score(Property,accessibility,_) and score(Property,maintenance,_) and score(Property,energy_efficiency,_) and score(Property,services,_)  and score(Property,parking,_) and score(Property,state,_) and score(Property,potential_appreciation,_)]
    then [create_fact(final_score(Property, operation(sum_all,score(Property,_,_), _)))].