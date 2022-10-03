
-- Query to compute convex hull
SELECT ST_AsText(ST_ConvexHull(
    ST_Collect(
            ST_GeomFromText('MULTIPOINT(-122.0098060678788 37.56061249601967, -122.01015336786747 37.560099885672805, -121.99495634781623,37.55293035424841, -122.01113575841782 37.560939520980405, -122.01282769892865 37.56148740245777, -122.01482541036073 37.56295006843806, -122.01249111284427 37.56043703523301, -121.98700909038935 37.549224137252594, -121.98626121300316	37.55038959499972, -121.98043936016235	37.553962496710405, -121.98183589069164	37.55454625246396, -121.98497338564772 37.55187316713743, -121.98837150715978 37.549257839309995 )')
            )) );


-- To compute nearest neighbours I have created a table, inserted all coordinates and used the table to compute nearest neighbours.
create table neighbours
(
  name varchar(255),
  Paths GEOMETRY
);


insert into neighbours values('MomoKebab',
point(-122.01015336786747,37.560099885672805)::geometry);
insert into neighbours values('WashingtonHighSchool',
point(-121.99495634781623,37.55293035424841)::geometry);
insert into neighbours values('CarlsJunior',
point(-122.01113575841782,37.560939520980405)::geometry);
insert into neighbours values('JackInTheBox',
point(-122.01282769892865,37.56148740245777)::geometry);
insert into neighbours values('Apollo_tutoring',
point(-122.01482541036073,37.56295006843806)::geometry);
insert into neighbours values('Texaco_GasStation',
point(-122.01249111284427,37.56043703523301)::geometry);
insert into neighbours values('Sprouts_Farmers_Market',
point(-121.98700909038935,37.549224137252594)::geometry);
insert into neighbours values('Saravana_Bhavan',
point(-121.98626121300316,37.55038959499972)::geometry);
insert into neighbours values('StateBankOfIndia',
point(-121.98043936016235,37.553962496710405)::geometry);
insert into neighbours values('Washington_hospital',
point(-121.98183589069164,37.55454625246396)::geometry);
insert into neighbours values('Fremont_CentralDowntown',
point(-121.98497338564772,37.55187316713743)::geometry);
insert into neighbours values('Fremont_Centerville',
point(-121.98837150715978,37.549257839309995)::geometry);


SELECT name, ST_Distance(ST_MakePoint(-122.0098060678788, 37.56061249601967 ), Paths) AS dist
FROM neighbours
ORDER BY dist LIMIT 3;


