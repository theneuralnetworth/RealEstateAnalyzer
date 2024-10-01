% municipality(Name).
municipality('Amarante').
municipality('Baião').
municipality('Felgueiras').
municipality('Gondomar').
municipality('Lousada').
municipality('Maia').
municipality('Marco de Canaveses').
municipality('Matosinhos').
municipality('Paços de Ferreira').
municipality('Paredes').
municipality('Penafiel').
municipality('Porto').
municipality('Póvoa de Varzim').
municipality('Santo Tirso').
municipality('Trofa').
municipality('Valongo').
municipality('Vila do Conde').
municipality('Vila Nova de Gaia').

% crime_rate(Municipality, Rate).
crime_rate('Amarante', 2.3).
crime_rate('Baião', 1.8).
crime_rate('Felgueiras', 2.5).
crime_rate('Gondomar', 3.1).
crime_rate('Lousada', 2.0).
crime_rate('Maia', 2.8).
crime_rate('Marco de Canaveses', 2.2).
crime_rate('Matosinhos', 3.0).
crime_rate('Paços de Ferreira', 2.4).
crime_rate('Paredes', 2.6).
crime_rate('Penafiel', 2.3).
crime_rate('Porto', 3.5).
crime_rate('Póvoa de Varzim', 2.7).
crime_rate('Santo Tirso', 2.1).
crime_rate('Trofa', 2.0).
crime_rate('Valongo', 2.5).
crime_rate('Vila do Conde', 2.4).
crime_rate('Vila Nova de Gaia', 3.2).

% has_schools(Municipality).
has_schools(Municipality) :- municipality(Municipality).
has_schools('Amarante').
has_schools('Baião').
has_schools('Felgueiras').
has_schools('Gondomar').
has_schools('Lousada').
has_schools('Maia').
has_schools('Marco de Canaveses').
has_schools('Matosinhos').
has_schools('Paços de Ferreira').
has_schools('Paredes').
has_schools('Penafiel').
has_schools('Porto').
has_schools('Póvoa de Varzim').
has_schools('Santo Tirso').
has_schools('Trofa').
has_schools('Valongo').
has_schools('Vila do Conde').
has_schools('Vila Nova de Gaia').

% has_supermarket(Municipality).
has_supermarket(Municipality) :- municipality(Municipality).

% has_police_station(Municipality).
has_police_station(Municipality) :- municipality(Municipality).

% traffic_level(Municipality, Level).
traffic_level('Amarante', 4).
traffic_level('Baião', 2).
traffic_level('Felgueiras', 3).
traffic_level('Gondomar', 6).
traffic_level('Lousada', 3).
traffic_level('Maia', 7).
traffic_level('Marco de Canaveses', 4).
traffic_level('Matosinhos', 8).
traffic_level('Paços de Ferreira', 5).
traffic_level('Paredes', 5).
traffic_level('Penafiel', 4).
traffic_level('Porto', 9).
traffic_level('Póvoa de Varzim', 6).
traffic_level('Santo Tirso', 4).
traffic_level('Trofa', 3).
traffic_level('Valongo', 5).
traffic_level('Vila do Conde', 5).
traffic_level('Vila Nova de Gaia', 8).

% has_airport(Municipality).
has_airport('Maia').
has_airport('Porto').

% has_hospital(Municipality).
has_hospital('Amarante').
has_hospital('Felgueiras').
has_hospital('Gondomar').
has_hospital('Maia').
has_hospital('Marco de Canaveses').
has_hospital('Matosinhos').
has_hospital('Paços de Ferreira').
has_hospital('Paredes').
has_hospital('Penafiel').
has_hospital('Porto').
has_hospital('Póvoa de Varzim').
has_hospital('Santo Tirso').
has_hospital('Valongo').
has_hospital('Vila do Conde').
has_hospital('Vila Nova de Gaia').

% has_park(Municipality).
has_park(Municipality) :- municipality(Municipality).
has_park('Amarante').
has_park('Baião').
has_park('Felgueiras').
has_park('Gondomar').
has_park('Lousada').
has_park('Maia').
has_park('Marco de Canaveses').
has_park('Matosinhos').
has_park('Paços de Ferreira').
has_park('Paredes').
has_park('Penafiel').
has_park('Porto').
has_park('Póvoa de Varzim').
has_park('Santo Tirso').
has_park('Trofa').
has_park('Valongo').
has_park('Vila do Conde').
has_park('Vila Nova de Gaia').

% public_transport(Municipality, TransportType).
public_transport('Amarante', bus).
public_transport('Baião', bus).
public_transport('Felgueiras', bus).
public_transport('Gondomar', bus).
public_transport('Gondomar', metro).
public_transport('Lousada', bus).
public_transport('Maia', bus).
public_transport('Maia', metro).
public_transport('Marco de Canaveses', bus).
public_transport('Matosinhos', bus).
public_transport('Matosinhos', metro).
public_transport('Paços de Ferreira', bus).
public_transport('Paredes', bus).
public_transport('Penafiel', bus).
public_transport('Porto', bus).
public_transport('Porto', metro).
public_transport('Porto', train).
public_transport('Póvoa de Varzim', bus).
public_transport('Póvoa de Varzim', metro).
public_transport('Santo Tirso', bus).
public_transport('Trofa', bus).
public_transport('Valongo', bus).
public_transport('Valongo', metro).
public_transport('Vila do Conde', bus).
public_transport('Vila do Conde', metro).
public_transport('Vila Nova de Gaia', bus).
public_transport('Vila Nova de Gaia', metro).
