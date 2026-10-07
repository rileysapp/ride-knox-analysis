# DATA 501; Assignment 7 SQL Log

**Name:** Riley Sapp
**NetID:** rsapp4
**SQL tool used:** DB Browser for SQLite, "Execute SQL" tab

## Part 0
```
0a:
T0057984	2025-01-01 00:06:48	2025-01-01 00:19:16	S17	S16	casual	electric
T0073896	2025-01-01 00:40:20	2025-01-01 01:20:19	S09	S08	casual	classic
T0206129	2025-01-01 00:42:40	2025-01-01 01:10:30	S21	S09	member	classic
T0163585	2025-01-01 00:42:54	2025-01-01 00:57:56	S06	S06	casual	electric
T0094124	2025-01-01 01:19:33	2025-01-01 01:50:22	S04	S12	casual	electric

0b:
station_id	TEXT	0		1
station_name	TEXT	1		0
neighborhood	TEXT	0		0
latitude	REAL	0		0
longitude	REAL	0		0
The primary key is station_id.

Q0:
PRAGMA table_info(stations) tells you the data type of each column, which Excel would not tell you.
```

## Part 1
```
1a: Primary key:
trips.trip_id --> T0057984
stations.station_id --> S06
trips.start_station_id --> stations.station_id
trips.end_station_id --> stations.station_id

1b: The database does not contain start_station_names because it uses the relational model, where it stores a fact once and refers to it everywhere else. In module 2, there were 121 distinct spellings of start_station_name for only 24 real stations because it distinctly copied the station's name onto all 250,600 rows.

1c: Because the database is relational, only two rows need to change (the latitude and longitude rows); all other instances will refer to those rows. This is different from a flat CSV, where all 250,600 rows would need to be changed.

Q1d: The 600 rows were rejected because the database was referring to primary keys that uniquely identify each row; the remaining 600 rows were duplicates, so they were not counted. This is better than the drop_duplicates() in module 3 because it relies on one primary key rather than needing all aspects of a row to be the same.
```

## Part 2
```
2a:
S01	Downtown	35.9649	-83.9197
S02	Downtown	35.9662	-83.9184
S03	Downtown	35.9636	-83.9186
S04	Old City	35.9721	-83.9151
S05	World's Fair Park	35.9622	-83.9265

2b:
S01	Market Square	4.0
S02	Gay Street & Union Ave	4.0
S03	Krutch Park	4.0
S04	Old City - Jackson Ave	4.0
S05	World's Fair Park	4.0

2c:
T0057984	2025-01-01 00:06:48	0.21
T0073896	2025-01-01 00:40:20	0.67
T0206129	2025-01-01 00:42:40	0.46
T0163585	2025-01-01 00:42:54	0.25
T0094124	2025-01-01 01:19:33	0.51

Q2d: No, age_years does not exist in stations after 2b. A result set is a new table, computed on the spot, while the original table stays the same.

Q2e: The ops should not ask for SELECT * FROM trips; and should instead ask for more specific columns because they allow the database to be cleaned and run more quickly.
```

## Part 3
```
3a:
Downtown
Old City
World's Fair Park
UT Campus
UT Ag Campus
Fort Sanders
South Knoxville
North Knoxville
East Knoxville
West Knoxville
Bearden
Sequoyah Hills

3b:
Result: 25 rows returned in 67ms
S03
S02
S01

Q3c: The station ID that does not appear is S99. This is beacause it does not have a primary key due to being a test station and not existing.

Q3d: In class, it returned six values instead of two because databases are not automatically cleaned.
```

## Part 4
```
4a:
Cumberland Ave & 17th St
Fort Sanders - Laurel Ave

4b:
Market Square	S01	20
World's Fair Park	S05	20
Hodges Library	S06	24
Student Union - UT	S08	24

4c: 
Hodges Library
Student Union - UT

4d:
[No result]

4e:
South Waterfront
Suttree Landing Park
Ijams Nature Center
Zoo Knoxville
Caswell Park

4f:
S02	Gay Street & Union Ave	16
S03	Krutch Park	12
S04	Old City - Jackson Ave	16
S07	The Hill - Ayres Hall	12
S09	Neyland Stadium	16
S10	Ag Campus - Morgan Hall	12
S11	Cumberland Ave & 17th St	16
S12	Fort Sanders - Laurel Ave	12
S14	South Waterfront	12
S17	Happy Holler	12
S19	Broadway & Central	12
S22	Tyson Park	12
S23	Bearden - Kingston Pike	12

Q4g: Using parentheses returns 2 columns, while not using parentheses does not return any columns. 4c answers the ops leader's questions and indicates that appropriate use of parentheses is important to returning relevant results.

Q4h: I would rather hand a colleague the version using BETWEEN, as it is easier to read; this way, a colleague better understand what he is looking at and can make informed decisions.
```

## Part 5
```


## Reflection + AI Disclosure
```
R1: 
R2: I used a generative AI tool to explain the differences between using DB Browser and VS Code. I also used it to troubleshoot why I was getting an error in 2c (I had misplaced a parenthesis).