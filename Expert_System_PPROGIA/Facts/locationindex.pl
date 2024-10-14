% Add these facts to the existing index.pl file

% Crime Rate
fact(82, location_crime_rate('aldoar, foz do douro e nevogilde', low)).
fact(83, location_crime_rate(bonfim, medium)).
fact(84, location_crime_rate(campanhã, medium)).
fact(85, location_crime_rate('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', low)).
fact(86, location_crime_rate('lordelo do ouro e massarelos', low)).
fact(87, location_crime_rate('matosinhos e leça da palmeira', medium)).
fact(88, location_crime_rate(paranhos, medium)).
fact(89, location_crime_rate(ramalde, medium)).
fact(90, location_crime_rate('rio tinto', high)).

% Nearby Schools
fact(91, nearby_schools('aldoar, foz do douro e nevogilde', present)).
fact(92, nearby_schools(bonfim, present)).
fact(93, nearby_schools(campanhã, absent)).
fact(94, nearby_schools('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', present)).
fact(95, nearby_schools('lordelo do ouro e massarelos', present)).
fact(96, nearby_schools('matosinhos e leça da palmeira', present)).
fact(97, nearby_schools(paranhos, present)).
fact(98, nearby_schools(ramalde, absent)).
fact(99, nearby_schools('rio tinto', absent)).

% Nearby Public Transport
fact(100, nearby_public_transport('aldoar, foz do douro e nevogilde', present)).
fact(101, nearby_public_transport(bonfim, present)).
fact(102, nearby_public_transport(campanhã, present)).
fact(103, nearby_public_transport('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', present)).
fact(104, nearby_public_transport('lordelo do ouro e massarelos', present)).
fact(105, nearby_public_transport('matosinhos e leça da palmeira', present)).
fact(106, nearby_public_transport(paranhos, present)).
fact(107, nearby_public_transport(ramalde, present)).
fact(108, nearby_public_transport('rio tinto', absent)).

% Nearby Hospitals
fact(109, nearby_hospitals('aldoar, foz do douro e nevogilde', absent)).
fact(110, nearby_hospitals(bonfim, present)).
fact(111, nearby_hospitals(campanhã, absent)).
fact(112, nearby_hospitals('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', present)).
fact(113, nearby_hospitals('lordelo do ouro e massarelos', absent)).
fact(114, nearby_hospitals('matosinhos e leça da palmeira', present)).
fact(115, nearby_hospitals(paranhos, present)).
fact(116, nearby_hospitals(ramalde, absent)).
fact(117, nearby_hospitals('rio tinto', absent)).

% Nearby Supermarkets
fact(118, nearby_supermarkets('aldoar, foz do douro e nevogilde', present)).
fact(119, nearby_supermarkets(bonfim, present)).
fact(120, nearby_supermarkets(campanhã, present)).
fact(121, nearby_supermarkets('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', present)).
fact(122, nearby_supermarkets('lordelo do ouro e massarelos', present)).
fact(123, nearby_supermarkets('matosinhos e leça da palmeira', present)).
fact(124, nearby_supermarkets(paranhos, present)).
fact(125, nearby_supermarkets(ramalde, present)).
fact(126, nearby_supermarkets('rio tinto', present)).

% Nearby Leisure Areas
fact(127, nearby_leisure_areas('aldoar, foz do douro e nevogilde', present)).
fact(128, nearby_leisure_areas(bonfim, absent)).
fact(129, nearby_leisure_areas(campanhã, absent)).
fact(130, nearby_leisure_areas('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', present)).
fact(131, nearby_leisure_areas('lordelo do ouro e massarelos', present)).
fact(132, nearby_leisure_areas('matosinhos e leça da palmeira', present)).
fact(133, nearby_leisure_areas(paranhos, absent)).
fact(134, nearby_leisure_areas(ramalde, absent)).
fact(135, nearby_leisure_areas('rio tinto', absent)).

% Parking Availability
fact(136, parking('aldoar, foz do douro e nevogilde', medium)).
fact(137, parking(bonfim, low)).
fact(138, parking(campanhã, high)).
fact(139, parking('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', low)).
fact(140, parking('lordelo do ouro e massarelos', medium)).
fact(141, parking('matosinhos e leça da palmeira', high)).
fact(142, parking(paranhos, medium)).
fact(143, parking(ramalde, high)).
fact(144, parking('rio tinto', high)).

% Potential for Appreciation (last 5 years increase percentage)
fact(145, last_5_years_increased('aldoar, foz do douro e nevogilde', 40)).
fact(146, last_5_years_increased(bonfim, 30)).
fact(147, last_5_years_increased(campanhã, 25)).
fact(148, last_5_years_increased('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', 45)).
fact(149, last_5_years_increased('lordelo do ouro e massarelos', 35)).
fact(150, last_5_years_increased('matosinhos e leça da palmeira', 30)).
fact(151, last_5_years_increased(paranhos, 28)).
fact(152, last_5_years_increased(ramalde, 27)).
fact(153, last_5_years_increased('rio tinto', 20)).