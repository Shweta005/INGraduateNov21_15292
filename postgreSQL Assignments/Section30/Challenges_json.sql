--Create a table 
CREATE TABLE books (
	id serial,
	bookinfo jsonb
)

--Insert some values
INSERT INTO books (bookinfo)
VALUES
('{"title": "Introduction To Data Mining",
  "author": ["Pang-ning Tan", "Michael Steinbach", "Vipin Kumar"],
  "publisher":"Addison Wesley", "date": 2006}'),
('{"title": "Deep Learning with Python", "author": "Francois Chollet", "publisher":"Manning", "date": 2018}'),
('{"title": "Neural Networks - A Visual Intro for Beginners", "author": "Michael Taylor", "publisher":"self", "date": 2017}'),
('{"title": "Big Data In Practice", "author": "Bernard Marr", "publisher":"Wiley", "date": 2016}');

--operator  -> to select the filed
 SELECT bookinfo->'author' FROM books;

--Enter the following book:
Artificial Intelligence With Uncertainty by Deyi Li and Yi Du that was published in 2008 by Chapman and Hall
And select back the titles of all the books in table
 INSERT INTO books (bookinfo) VALUES
 ('{"title": "Artificial Intelligence With Uncertainty",
     "author": ["Deyi Li", "Yi Du"],
      "publisher":"Chapman and Hall", "date": 2008}');

 SELECT bookinfo->'title' FROM books;


--Create a JSON from table
--Create a simple version of airports into json
SELECT jsonb_build_object(
	'id', air.id,
	'ident', air.ident,
	'name', air.name,
	'latitude_deg', air.latitude_deg,
	'elevation_ft', air.elevation_ft,
	'continent', air.continent,
	'iso_country', air.iso_country,
	'iso_region', air.iso_region,
	'airport_home_link', air.home_link,
	'airport_wikipedia_link', air.wikipedia_link,
	'municipality', air.municipality,
	'scheduled_service', air.scheduled_service,
	'gps_code', air.gps_code,
	'iata_code', air.iata_code,
	'airport_local_code', air.local_code
)
FROM airports AS air;


---Add the airport keywords field as an array

SELECT jsonb_build_object(
	'id', air.id,
	'ident', air.ident,
	'name', air.name,
	'latitude_deg', air.latitude_deg,
	'elevation_ft', air.elevation_ft,
	'continent', air.continent,
	'iso_country', air.iso_country,
	'iso_region', air.iso_region,
	'airport_home_link', air.home_link,
	'airport_wikipedia_link', air.wikipedia_link,
	'municipality', air.municipality,
	'scheduled_service', air.scheduled_service,
	'gps_code', air.gps_code,
	'iata_code', air.iata_code,
	'airport_local_code', air.local_code,
	'airport_keywords', to_jsonb(string_to_array(air.keywords, ','))
)
FROM airports AS air;

--Add to this query by joining countries and regions using iso_region and is_country from airports tabe.Pull back the name
,wikipedia_link and an array of keywords for both tables.
Use inner join
SELECT jsonb_build_object(
	'id', air.id,
	'ident', air.ident,
	'name', air.name,
	'latitude_deg', air.latitude_deg,
	'elevation_ft', air.elevation_ft,
	'continent', air.continent,
	'iso_country', air.iso_country,
	'iso_region', air.iso_region,
	'airport_home_link', air.home_link,
	'airport_wikipedia_link', air.wikipedia_link,
	'municipality', air.municipality,
	'scheduled_service', air.scheduled_service,
	'gps_code', air.gps_code,
	'iata_code', air.iata_code,
	'airport_local_code', air.local_code,
	'airport_keywords', to_jsonb(string_to_array(air.keywords, ',')),
	'country_name', countries.name,
	'country_wikipedia_link', countries.wikipedia_link,
	'country_keywords', to_jsonb(string_to_array(countries.keywords, ',')),
	'region_name', regions.name,
	'region_wikipedia_link', regions.wikipedia_link,
	'regions_keywords', to_jsonb(string_to_array(regions.keywords, ','))
)
FROM airports AS air
INNER JOIN regions ON air.iso_region=regions.code
INNER JOIN countries ON air.iso_country = countries.code;

-- using jsob_strip_nulls()
SELECT JSONB_STRIP_NULLS (
	 jsonb_build_object(
	'id', air.id,
	'ident', air.ident,
	'name', air.name,
	'latitude_deg', air.latitude_deg,
	'elevation_ft', air.elevation_ft,
	'continent', air.continent,
	'iso_country', air.iso_country,
	'iso_region', air.iso_region,
	'airport_home_link', air.home_link,
	'airport_wikipedia_link', air.wikipedia_link,
	'municipality', air.municipality,
	'scheduled_service', air.scheduled_service,
	'gps_code', air.gps_code,
	'iata_code', air.iata_code,
	'airport_local_code', air.local_code,
	'airport_keywords', to_jsonb(string_to_array(air.keywords, ',')),
	'country_name', countries.name,
	'country_wikipedia_link', countries.wikipedia_link,
	'country_keywords', to_jsonb(string_to_array(countries.keywords, ',')),
	'region_name', regions.name,
	'region_wikipedia_link', regions.wikipedia_link,
	'regions_keywords', to_jsonb(string_to_array(regions.keywords, ','))
))
FROM airports AS air
INNER JOIN regions ON air.iso_region=regions.code
INNER JOIN countries ON air.iso_country = countries.code;

--pull back the runways that belong to airport JRA(9 in total)
SELECT to_jsonb(runway_json) FROM
(SELECT le_ident, he_ident, length_ft, width_ft, surface, lighted AS is_lighted,
closed AS is_closed,
le_latitude_deg, le_longitude_deg,le_elevation_ft,le_displaced_threshold_ft,
he_latitude_deg,he_longitude_deg,he_elevation_ft, he_heading_degt,he_displaced_threshold_ft
FROM runways
WHERE airport_ident = 'JRA') as runway_json;

--JSON_AGG() function
SELECT JSONB_AGG(to_jsonb(runway_json)) FROM
(SELECT le_ident, he_ident, length_ft, width_ft, surface, lighted AS is_lighted,
closed AS is_closed,
le_latitude_deg, le_longitude_deg,le_elevation_ft,le_displaced_threshold_ft,
he_latitude_deg,he_longitude_deg,he_elevation_ft, he_heading_degt,he_displaced_threshold_ft
FROM runways
WHERE airport_ident = 'JRA') as runway_json;

--Do the same aggregation for the navids table for airport_ident JRA where associated)airport='CYYZ';
SELECT JSONB_AGG(to_jsonb(nav)) FROM
(SELECT name, filename, ident, type, frequency_khz,
latitude_deg, longitude_deg, elevation_ft, dme_frequency_khz,
dme_channel, dme_latitude_deg, dme_latitude_deg,dme_elevation_ft,
slaved_variation_deg, magnetic_variation_deg,usagetype, power
FROM navaids
WHERE associated_airport = 'CYYZ') AS nav

-- this took 9 minutes on my computer to run
1.Grab the json_build_object from create JSON from table
2.Make sure to rename jsonb_strip_null as airports
3.Insert the navids and runways subqueries 
4.Change the specific airport in WHERE to air.ident for both
5.Build a subquery for frequnecies
6.Test using a limit field
7.Build a table based on query(takes a long time to run)
CREATE TABLE airports_json AS (
SELECT JSONB_STRIP_NULLS (
	 jsonb_build_object(
	'id', air.id,
	'ident', air.ident,
	'name', air.name,
	'latitude_deg', air.latitude_deg,
	'elevation_ft', air.elevation_ft,
	'continent', air.continent,
	'iso_country', air.iso_country,
	'iso_region', air.iso_region,
	'airport_home_link', air.home_link,
	'airport_wikipedia_link', air.wikipedia_link,
	'municipality', air.municipality,
	'scheduled_service', air.scheduled_service,
	'gps_code', air.gps_code,
	'iata_code', air.iata_code,
	'airport_local_code', air.local_code,
	'airport_keywords', to_jsonb(string_to_array(air.keywords, ',')),
	'country_name', countries.name,
	'country_wikipedia_link', countries.wikipedia_link,
	'country_keywords', to_jsonb(string_to_array(countries.keywords, ',')),
	'region_name', regions.name,
	'region_wikipedia_link', regions.wikipedia_link,
	'regions_keywords', to_jsonb(string_to_array(regions.keywords, ',')),
	'runways', (SELECT JSONB_AGG(to_jsonb(runway_json)) FROM
		(SELECT le_ident, he_ident, length_ft, width_ft, surface,
		 	lighted AS is_lighted,closed AS is_closed,
			le_latitude_deg, le_longitude_deg,le_elevation_ft,le_displaced_threshold_ft,
			he_latitude_deg,he_longitude_deg,he_elevation_ft, he_heading_degt,he_displaced_threshold_ft
		FROM runways
		WHERE airport_ident = air.ident) as runway_json
		),
	'navaids', (SELECT JSONB_AGG(to_jsonb(nav)) FROM
				(SELECT name, filename, ident, type, frequency_khz,
					latitude_deg, longitude_deg, elevation_ft, dme_frequency_khz,
					dme_channel, dme_latitude_deg, dme_latitude_deg,dme_elevation_ft,
					slaved_variation_deg, magnetic_variation_deg,usagetype, power
				FROM navaids
				WHERE associated_airport = air.ident) AS nav
		),
	'frequencies', (SELECT JSONB_AGG(to_jsonb(nav)) FROM
				(SELECT type, description, frequency_mhz
				FROM airport_frequencies
				WHERE airport_ident = air.ident) AS nav
		)
)) AS airports

FROM airports AS air
INNER JOIN regions ON air.iso_region=regions.code
INNER JOIN countries ON air.iso_country = countries.code
);

--first runway of each record and country name
SELECT airports->'runways'->0, airports->'country_name'
FROM airports_json;

--pull text instead of json
SELECT airports->'runways'->>0, airports->>'country_name'
FROM airports_json;

--#> return json object at path
--#>> returns text of object at path
SELECT '{"a": {"b": [3, 2, 1]}}'::jsonb #> '{a,b}';

SELECT '{"a": {"b": [3, 2, 1], "c": {"d": 5}}}'::jsonb #> '{a, c, d}';

-Return 2nd frequency of each airport as json and region name as text from th eairportsjson table orderby frequencies asc to move nulls to bottom
SELECT airports->'frequencies'->1, airports->>'region_name'
FROM airports_json
ORDER BY  airports->'frequencies'->1 ASC;

--find all the airports in Brazil and the count
SELECT * FROM airports_json
WHERE airports @> '{"iso_country": "BR"}';

SELECT COUNT(*) FROM airports_json
WHERE airports->>'iso_country' = 'BR';

--How many airports are in Arkanass in United states:iso_region is US-AR
SELECT COUNT(*) FROM airports_json
WHERE airports->>'iso_region' = 'US-AR';

SELECT COUNT(*) FROM airports_json
WHERE airports @> '{"iso_region": "US-AR"}';

--find no of airports with first runway being 2000 feet long
SELECT COUNT(*) FROM airports_json
WHERE airports->'runways'-> 0 @> '{"length_ft": 2000}';

--Find the no ofairports in which the 2nd navid has a frequency of 400(remember array index start at 0)
SELECT COUNT(*) FROM airports_json
WHERE airports->'navaids'-> 1 @> '{"frequency_khz": 400}';

UPDATE airports_json
SET airports = airports || '{"nearby_lakes": ["Lake Chicot"]}'::jsonb
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';


SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports || '{"nearby_lakes": ["Lake Providence"]}'::jsonb
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports - 'nearby_lakes'
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

--put it back in so we can delete with other syntax
UPDATE airports_json
SET airports = airports || '{"nearby_lakes": ["Lake Chicot","Lake Providence"]}'::jsonb
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports #- '{"nearby_lakes", 1}'
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

SELECT airports->'nearby_lakes'
FROM airports_json
WHERE airports->>'iso_region' = 'US-AR'
		AND airports->>'municipality' = 'Lake Village';

UPDATE airports_json
SET airports = airports || '{"good_restaurants": ["La Terraza", "McDonalds"]}'
WHERE airports->>'id' = '20426';

SELECT airports->'good_restaurants'
FROM airports_json
WHERE airports->>'id' = '20426';

UPDATE airports_json
SET airports = airports #- '{"good_restaurants", 1}'
WHERE airports->>'id' = '20426';

SELECT airports->'good_restaurants'
FROM airports_json
WHERE airports->>'id' = '20426';
