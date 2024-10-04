:- dynamic fact/2.

% Security
fact(1, location_crime_rate(lisboa, low)).
fact(2, location_crime_rate(porto, medium)).
fact(3, location_crime_rate(faro, high)).
fact(4, location_property(lisboa, property_1)).
fact(5, location_property(porto, property_2)).
fact(6, location_property(faro, property_3)).
fact(7, security_system(property_1, present)).
fact(8, security_system(property_2, absent)).
fact(9, security_system(property_3, absent)).

% Confort
fact(10, aeroport(porto, present)).
fact(11, aeroport(lisboa, absent)).
fact(12, aeroport(faro, absent)).
fact(13, busy_traffic(porto, present)).
fact(14, busy_traffic(lisboa, present)).
fact(15, busy_traffic(faro, absent)).
fact(16, acoustic_insulation(property_1, high)).
fact(17, acoustic_insulation(property_2, low)).
fact(18, acoustic_insulation(property_3, high)).
fact(19, thermal_comfort(property_1, high)).
fact(20, thermal_comfort(property_2, low)).
fact(21, thermal_comfort(property_3, high)).