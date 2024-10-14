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

% Accessibility
fact(22, elevator(property_1, absent)).
fact(23, elevator(property_2, absent)).
fact(24, elevator(property_3, present)).
fact(25, ramps(property_1, absent)).
fact(26, ramps(property_2, present)).
fact(27, ramps(property_3, present)).

% Maintenance
fact(28, swimming_pool(property_1, absent)).
fact(29, swimming_pool(property_2, absent)).
fact(30, swimming_pool(property_3, present)).
fact(31, garden(property_1, absent)).
fact(32, garden(property_2, present)).
fact(33, garden(property_3, present)).
fact(34, property_condition(property_1, regular)).
fact(35, property_condition(property_2, new)).
fact(36, property_condition(property_3, reform)).

% Energy Efficiency
fact(37, energy_rating(property_1, b)).
fact(38, energy_rating(property_2, e)).
fact(39, energy_rating(property_3, a)).

% Services
fact(40, nearby_schools(lisboa, present)).
fact(41, nearby_schools(porto, present)).
fact(42, nearby_schools(faro, absent)).
fact(43, nearby_public_transport(lisboa, absent)).
fact(44, nearby_public_transport(porto, absent)).
fact(45, nearby_public_transport(faro, present)).
fact(46, nearby_hospitals(lisboa, present)).
fact(47, nearby_hospitals(porto, present)).
fact(48, nearby_hospitals(faro, present)).
fact(49, nearby_supermarkets(lisboa, absent)).
fact(50, nearby_supermarkets(porto, present)).
fact(51, nearby_supermarkets(faro, present)).
fact(52, nearby_leisure_areas(lisboa, absent)).
fact(53, nearby_leisure_areas(porto, absent)).
fact(54, nearby_leisure_areas(faro, present)).

% Parking
fact(55, parking(lisboa, low)).
fact(56, parking(porto, medium)).
fact(57, parking(faro, high)).
fact(58, garage(property_1, absent)).
fact(59, garage(property_2, present)).
fact(60, garage(property_3, absent)).

% Construction Year
fact(61, year_construction(property_1, 2018)).
fact(62, year_construction(property_2, 1960)).
fact(63, year_construction(property_3, 2021)).

% Potential for Appreciation
fact(64, last_5_years_increased(lisboa, 70)).
fact(65, last_5_years_increased(porto, 35)).
fact(66, last_5_years_increased(faro, 10)).

% View
fact(67, floor_level(property_1, 6)).
fact(68, floor_level(property_2, 1)).
fact(69, floor_level(property_3, 4)).

% Area
fact(70, area(property_1, 100)).
fact(71, area(property_2, 100)).
fact(72, area(property_3, 48)).
fact(73, rooms(property_1, 4)).
fact(74, rooms(property_2, 3)).
fact(75, rooms(property_3, 3)).
fact(76, area_per_room(property_1, 25)).
fact(77, area_per_room(property_2, 33)).
fact(78, area_per_room(property_3, 16)).

% Sun exposure
fact(79, sun_orientation(property_1, south)).
fact(80, sun_orientation(property_1, east)).
fact(81, sun_orientation(property_2, north)).
fact(82, sun_orientation(property_3, east)).

fact(83, property_type(property_1, apartment)).
fact(84, property_type(property_2, residence)).
fact(85, property_type(property_3, apartment)).
fact(86, forest(lisbon, present)).
fact(87, forest(porto, absent)).
fact(88, beach(faro, present)).
