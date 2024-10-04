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