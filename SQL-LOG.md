# DATA 501; Assignment 8 SQL Log

**Name:** Riley Sapp
**NetID:** rsapp4
**SQL tool used:** DB Browser for SQLite, "Execute SQL" tab

## Part 0
```
0a: 250000	246233	25	6

Q0c: "With_end_station" and "rider_type_spellings" are diagnostics. These two rows explain how many of the existing rows are real trips (as trips with no end station are not real) and whether or not returning information about rider types will be accurate (as different rider type spellings will imply a different result than if all spellings were consistent).

```
## Part 1
```
1a: 24	13.8	10	24

1b: 250600	0.47	-1.75	71.81

1c: 248825	0.28	0.02	3.0

1d: 250600	95300	38.0
 38% is electric.

Q1e: I would use 1c's average, as it is not affected by impossible outliers. Underneath it, I would note that the trips represented are out of 248,825 trips between one minute and six hours long.

Q1f: 250600	95300	38.0
SQLite did not change the outcome because both 100 and 100.0 are equivalent.

```
## Part 2
```
2a: S06	26112
S08	25044
S01	22656
S11	18983
S02	16570
Returned 25 rows for only 24 stations.

2b: 00	902
01	441
02	313
03	331
04	872
05	2628
06	6345
07	14937
08	21814
09	13379
10	12155
11	14730
12	16726
13	14740
14	14166
15	14720
16	19265
17	25245
18	21458
19	14211
20	9590
21	6289
22	3495
23	1848

2c: classic	member	98628	23.9
electric	member	60299	25.9
classic	casual	56672	34.6
electric	casual	35001	34.8

2d: classic	member	95166	24.0
electric	member	58222	25.9
classic	casual	54625	34.8
electric	casual	33770	34.4
classic	Member	1976	20.0
classic	MEMBER	1486	24.6
electric	Member	1194	27.6
classic	Casual	1193	33.0
electric	MEMBER	883	22.3
classic	CASUAL	854	27.6
electric	Casual	713	52.7
electric	CASUAL	518	36.8
The row count is 12.

Q2e: 2d returned 12 rows, with 8 describing rider types that don't really exist. GROUP BY groups values that are identical.

Q2f: SQL returns the long result, whereas you can use unstack() in pandas to get the wide version, which would have the months down and the rider types across.
```
## Part 3
```
3a: casual	56672	35001
member	98628	60299

3b: classic	casual	155300
electric	casual	95300

Q3c: 3b provided a clean-looking answer. The rider_type column provides a value that appears to be an aggregate, but really SQLite picked a random value arbitrarily, which happened to be casual.

Q3d: The grouping rules is that every expression within SELECT must appear in either GROUP BY or inside an aggregate function. If 3b was run in PostgreSQL, it would have been refused and not run at all. I would prefer this, as it would not silently run an inaccurate statement.
```
## Part 4
```
4a: S06	26112
S08	25044
S01	22656
S11	18983
S02	16570
S05	15435

4b: S08	817
S06	809
S01	695
S11	578
S02	552
S05	454
S07	419
S09	405
S04	390
S03	323

4c: 04	25651
05	29899
06	31611
07	27211

4d: Execution finished with errors.
Result: misuse of aggregate: COUNT()
At line 20:
SELECT
	strftime('%m', start_time) AS month,
	COUNT(*) AS trips
FROM trips
WHERE COUNT(*) > 25000
GROUP BY month
ORDER BY month;

Q4e: WHERE filters before GROUP BY in the logical order.

Q4f: WHERE filters stations while HAVING filters trips. WHERE discards rows before the expensive grouping; moving the bike_type condition to HAVING would be a bad idea because it occurs after GROUP BY.
```
## Part 5
```
5a: T0140894	2025-12-31 23:42:04	Fort Sanders - Laurel Ave	12
T0233859	2025-12-31 23:40:52	Old City - Jackson Ave	16
T0003228	2025-12-31 21:17:24	Old City - Jackson Ave	16
T0139742	2025-12-31 19:17:46	Old City - Jackson Ave	16
T0168422	2025-12-31 17:54:35	Old City - Jackson Ave	16
Count of 16342 rows.

5b: 246826

5c: UT Campus	78365	28.8
Downtown	49859	27.6
Fort Sanders	28475	28.9
World's Fair Park	21504	25.1
North Knoxville	17105	28.8
South Knoxville	16364	26.9
Old City	14302	30.2
UT Ag Campus	7268	30.1
West Knoxville	6662	32.8
East Knoxville	6391	26.6
Bearden	2103	32.6
Sequoyah Hills	1939	35.4

Q5d: 5b lost 3174 rows compared to the 250,000 in trips. 263 rows disappeared because they were the test station, while the other rows disappeared because they did not have an end_station_id.

Q5e: t. and s. are shorthand for the tables, being trips and stations. A column like trip_id would be ambiguous because it exists in both tables, so the database would return an error.

Q5f: Station_name would not be stored anywhere in the trips table; the join just returned it in SQL's execute tab. This means that the data is not overwritten.
```
## Part 6
```
6a: 	3774

6b: I don't know what this is asking.

6c: 
Version 1:
S01	Market Square	5
S02	Gay Street & Union Ave	7
S03	Krutch Park	4
S04	Old City - Jackson Ave	6
S05	World's Fair Park	3
S06	Hodges Library	13
S07	The Hill - Ayres Hall	3
S08	Student Union - UT	8
S09	Neyland Stadium	6
S10	Ag Campus - Morgan Hall	1
S11	Cumberland Ave & 17th St	3
S12	Fort Sanders - Laurel Ave	1
S13	Second Creek Greenway	1
S14	South Waterfront	1
S16	Ijams Nature Center	2
S17	Happy Holler	1
S18	Fourth & Gill	1
S19	Broadway & Central	1
S20	Zoo Knoxville	2
S21	Caswell Park	2
S22	Tyson Park	2
S23	Bearden - Kingston Pike	1
Returns 22 rows.

Version 2:
S01	Market Square	5
S02	Gay Street & Union Ave	7
S03	Krutch Park	4
S04	Old City - Jackson Ave	6
S05	World's Fair Park	3
S06	Hodges Library	13
S07	The Hill - Ayres Hall	3
S08	Student Union - UT	8
S09	Neyland Stadium	6
S10	Ag Campus - Morgan Hall	1
S11	Cumberland Ave & 17th St	3
S12	Fort Sanders - Laurel Ave	1
S13	Second Creek Greenway	1
S14	South Waterfront	1
S15	Suttree Landing Park	0
S16	Ijams Nature Center	2
S17	Happy Holler	1
S18	Fourth & Gill	1
S19	Broadway & Central	1
S20	Zoo Knoxville	2
S21	Caswell Park	2
S22	Tyson Park	2
S23	Bearden - Kingston Pike	1
S24	Sequoyah Hills Park	0
Returns 22 rows.
```
## AI Disclosure
```
I used AI in part 1a to troubleshoot why stations was not loading; I needed to convert the XLSX to a CSV to import it as a table. I also used it in part 1c to troubleshoot my syntax (I had added too many parentheses). I also used it in part 1d to troubleshoot how to correctly use "CASE WHEN" (I had been trying to use a regular WHEN statement). I used it in part 2c to help adjust the code from class to change the month to bike type. I used it in 4b to show where to include WHERE in the syntax. I used it for part 5c for how to combine the functions. I also used it for 6c to return how to do the syntax for version 1.