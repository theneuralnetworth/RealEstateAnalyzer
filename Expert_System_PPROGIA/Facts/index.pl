:- dynamic fact/2.

% Crime Rate,
fact(1, location_crime_rate('aldoar, foz do douro e nevogilde', low)).
fact(2, location_crime_rate(bonfim, medium)).
fact(3, location_crime_rate(campanhã, medium)).
fact(4, location_crime_rate('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', low)).
fact(5, location_crime_rate('lordelo do ouro e massarelos', low)).
fact(6, location_crime_rate('matosinhos e leça da palmeira', medium)).
fact(7, location_crime_rate(paranhos, medium)).
fact(8, location_crime_rate(ramalde, medium)).
fact(9, location_crime_rate('rio tinto', high)).

% Nearby Schools,
fact(10, nearby_schools('aldoar, foz do douro e nevogilde', present)).
fact(11, nearby_schools(bonfim, present)).
fact(12, nearby_schools(campanhã, absent)).
fact(13, nearby_schools('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', present)).
fact(14, nearby_schools('lordelo do ouro e massarelos', present)).
fact(15, nearby_schools('matosinhos e leça da palmeira', present)).
fact(16, nearby_schools(paranhos, present)).
fact(17, nearby_schools(ramalde, absent)).
fact(18, nearby_schools('rio tinto', absent)).

% Nearby Public Transport,
fact(19, nearby_public_transport('aldoar, foz do douro e nevogilde', present)).
fact(20, nearby_public_transport(bonfim, present)).
fact(21, nearby_public_transport(campanhã, present)).
fact(22, nearby_public_transport('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', present)).
fact(23, nearby_public_transport('lordelo do ouro e massarelos', present)).
fact(24, nearby_public_transport('matosinhos e leça da palmeira', present)).
fact(25, nearby_public_transport(paranhos, present)).
fact(26, nearby_public_transport(ramalde, present)).
fact(27, nearby_public_transport('rio tinto', absent)).

% Nearby Hospitals,
fact(28, nearby_hospitals('aldoar, foz do douro e nevogilde', absent)).
fact(29, nearby_hospitals(bonfim, present)).
fact(30, nearby_hospitals(campanhã, absent)).
fact(31, nearby_hospitals('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', present)).
fact(32, nearby_hospitals('lordelo do ouro e massarelos', absent)).
fact(33, nearby_hospitals('matosinhos e leça da palmeira', present)).
fact(34, nearby_hospitals(paranhos, present)).
fact(35, nearby_hospitals(ramalde, absent)).
fact(36, nearby_hospitals('rio tinto', absent)).

% Nearby Supermarkets,
fact(37, nearby_supermarkets('aldoar, foz do douro e nevogilde', present)).
fact(38, nearby_supermarkets(bonfim, present)).
fact(39, nearby_supermarkets(campanhã, present)).
fact(40, nearby_supermarkets('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', present)).
fact(41, nearby_supermarkets('lordelo do ouro e massarelos', present)).
fact(42, nearby_supermarkets('matosinhos e leça da palmeira', present)).
fact(43, nearby_supermarkets(paranhos, present)).
fact(44, nearby_supermarkets(ramalde, present)).
fact(45, nearby_supermarkets('rio tinto', present)).

% Nearby Leisure Areas,
fact(46, nearby_leisure_areas('aldoar, foz do douro e nevogilde', present)).
fact(47, nearby_leisure_areas(bonfim, absent)).
fact(48, nearby_leisure_areas(campanhã, absent)).
fact(49, nearby_leisure_areas('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', present)).
fact(50, nearby_leisure_areas('lordelo do ouro e massarelos', present)).
fact(51, nearby_leisure_areas('matosinhos e leça da palmeira', present)).
fact(52, nearby_leisure_areas(paranhos, absent)).
fact(53, nearby_leisure_areas(ramalde, absent)).
fact(54, nearby_leisure_areas('rio tinto', absent)).

% Parking Availability,
fact(55, parking('aldoar, foz do douro e nevogilde', medium)).
fact(56, parking(bonfim, low)).
fact(57, parking(campanhã, high)).
fact(58, parking('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', low)).
fact(59, parking('lordelo do ouro e massarelos', medium)).
fact(60, parking('matosinhos e leça da palmeira', high)).
fact(61, parking(paranhos, medium)).
fact(62, parking(ramalde, high)).
fact(63, parking('rio tinto', high)).

% Potential for Appreciation (last 5 years increase percentage),
fact(64, last_5_years_increased('aldoar, foz do douro e nevogilde', 40)).
fact(65, last_5_years_increased(bonfim, 30)).
fact(66, last_5_years_increased(campanhã, 25)).
fact(67, last_5_years_increased('cedofeita, ildefonso, sé, miragaia, nicolau, vitória', 45)).
fact(68, last_5_years_increased('lordelo do ouro e massarelos', 35)).
fact(69, last_5_years_increased('matosinhos e leça da palmeira', 30)).
fact(70, last_5_years_increased(paranhos, 28)).
fact(71, last_5_years_increased(ramalde, 27)).
fact(72, last_5_years_increased('rio tinto', 20)).

fact(73, property(18484873, 'T4, apartamento para comprar - Rua São João Novo, Cedofeita, Santo Ildefonso, Sé, Miragaia, São Nicolau e Vitória - 18484873 • www.imovirtual.com', 'Excelente apartamento para venda com T4 em Rua São João Novo, Cedofeita, Santo Ildefonso, Sé, Miragaia, São Nicolau e Vitória, por 900 000 €. Este apartamento para venda  tem 227 m² de àrea útil e 227 m² de àrea bruta.SITE 18484873')).
fact(74, location_property(18484873, 'cedofeita, ildefonso, sé, miragaia, nicolau, vitória')).
fact(75, ramps(18484873, absent)).
fact(76, security_system(18484873, absent)).
fact(77, elevator(18484873, absent)).
fact(78, swimming_pool(18484873, absent)).
fact(79, garden(18484873, absent)).
fact(80, property_condition(18484873, 'regular')).
fact(81, price(18484873, 900000)).
fact(82, area(18484873, 227)).
fact(83, rooms(18484873, 4)).
fact(84, energy_rating(18484873, 'c')).
fact(85, year_construction(18484873, 2000)).
fact(86, garage(18484873, absent)).
fact(87, floor_level(18484873, 5)).
fact(88, area_per_room(18484873, 56.75)).
fact(89, sun_orientation(18484873, west)).
fact(90, image(18484873, 'https://ireland.apollo.olxcdn.com/v1/files/eyJmbiI6IndmZm04czJ6bjUxODItRUNPU1lTVEVNIiwidyI6W3siZm4iOiI2OW5scGE3ZWNxbTcxLUFQVCIsInMiOiIxNCIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.8KhgVjhJCcQKbYbQ7eZZaAoEZxrKECfDxwytRSpBpLk/image;s=655x491;q=80')).
fact(91, image(18484873, 'https://ireland.apollo.olxcdn.com/v1/files/eyJmbiI6Ijl0Zmdha3J6ajFpbjEtRUNPU1lTVEVNIiwidyI6W3siZm4iOiI2OW5scGE3ZWNxbTcxLUFQVCIsInMiOiIxNCIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.F0SId0NIme9HM9Fe-nINqUF-vp9qg5MnS7NEbTJFofY/image;s=655x491;q=80')).
fact(92, image(18484873, 'https://ireland.apollo.olxcdn.com/v1/files/eyJmbiI6ImxkN2d2aWdhYmN3ZC1FQ09TWVNURU0iLCJ3IjpbeyJmbiI6IjY5bmxwYTdlY3FtNzEtQVBUIiwicyI6IjE0IiwicCI6IjEwLC0xMCIsImEiOiIwIn1dfQ.UfOIdXGB_Y_eH7ZP1fx9DZTfJHgpvjumH57Lzg-bjs8/image;s=655x491;q=80')).

fact(93, property(18438091, 'T0, apartamento para comprar - Cedofeita, Santo Ildefonso, Sé, Miragaia, São Nicolau e Vitória, Porto - 18438091 • www.imovirtual.com', 'Excelente apartamento para venda com T0 em Cedofeita, Santo Ildefonso, Sé, Miragaia, São Nicolau e Vitória, Porto, por 450 000 €. Este apartamento para venda  tem 107 m² de àrea útil e 107 m² de àrea bruta. De acordo com o profissional Oporto Investments Real Estate os atributos mais importantes são ar condicionado, varanda, elevadorSITE 18438091')).
fact(94, location_property(18438091, 'cedofeita, ildefonso, sé, miragaia, nicolau, vitória')).
fact(95, ramps(18438091, absent)).
fact(96, security_system(18438091, absent)).
fact(97, elevator(18438091, present)).
fact(98, swimming_pool(18438091, absent)).
fact(99, garden(18438091, absent)).
fact(100, property_condition(18438091, 'regular')).
fact(101, price(18438091, 450000)).
fact(102, area(18438091, 107)).
fact(103, rooms(18438091, 0)).
fact(104, energy_rating(18438091, 'b')).
fact(105, year_construction(18438091, 2000)).
fact(106, garage(18438091, absent)).
fact(107, floor_level(18438091, 2)).
fact(108, area_per_room(18438091, 107)).
fact(109, sun_orientation(18438091, west)).
fact(110, image(18438091, 'https://ireland.apollo.olxcdn.com/v1/files/eyJmbiI6Inhxemp4dGVpM2dhNTMtQVBUIiwidyI6W3siZm4iOiI2OW5scGE3ZWNxbTcxLUFQVCIsInMiOiIxNCIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.Fho6UwGFYocWrBqTFJhyMy2EsNpZ4zCLG3s_GrIGsio/image;s=655x491;q=80')).
fact(111, image(18438091, 'https://ireland.apollo.olxcdn.com/v1/files/eyJmbiI6InlpamgxOTRiaTcwYTEtQVBUIiwidyI6W3siZm4iOiI2OW5scGE3ZWNxbTcxLUFQVCIsInMiOiIxNCIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.DcyJRCsZrJ0XjYDvntOZiDzHtsHJPQ2uU9aTOH5u6jE/image;s=655x491;q=80')).
fact(112, image(18438091, 'https://ireland.apollo.olxcdn.com/v1/files/eyJmbiI6InVjdjZlczVtdGRwNzEtQVBUIiwidyI6W3siZm4iOiI2OW5scGE3ZWNxbTcxLUFQVCIsInMiOiIxNCIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.G6ZA_LQ6oPUH6ix42boaf0ey8nIHMarUqG4Fx4mR-CE/image;s=655x491;q=80')).
fact(113, image(18438091, 'https://ireland.apollo.olxcdn.com/v1/files/eyJmbiI6Inc2em53cWJiamQ3ajItQVBUIiwidyI6W3siZm4iOiI2OW5scGE3ZWNxbTcxLUFQVCIsInMiOiIxNCIsInAiOiIxMCwtMTAiLCJhIjoiMCJ9XX0.ofK3Mwv5w177VDzXtSkOjcszoR6_6CA5o9yP3ticHEY/image;s=655x491;q=80')).
fact(114, image(18438091, 'https://ireland.apollo.olxcdn.com/v1/files/eyJmbiI6ImNudThvdTVycHl4OS1BUFQiLCJ3IjpbeyJmbiI6IjY5bmxwYTdlY3FtNzEtQVBUIiwicyI6IjE0IiwicCI6IjEwLC0xMCIsImEiOiIwIn1dfQ.hUuSwVYLOBnLOq-_4DbZrYQ-M0BmS9NF8cW0z1uUcMg/image;s=655x491;q=80')).

fact(115, sun_orientation(18438091, south)).
fact(116, sun_orientation(18438091, east)).

fact(117, forest(bonfim, present)).
fact(118, location_property(18438091, bonfim)).
fact(119, property_type(18438091, apartment)).
fact(120, property_type(18484873, residence)).

fact(121, optical_fiber(18438091, present)).
fact(122, smart_appliances(18438091, present)).
fact(123, optical_fiber(18484873, present)).
fact(124, smart_appliances(18484873, absent)).

fact(125, meta_score(high,1)).
fact(126, meta_score(medium,0.7)).
fact(127, meta_score(low,0.4)).