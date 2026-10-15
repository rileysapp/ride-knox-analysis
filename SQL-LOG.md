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
```
## Part 6
```
```
## AI Disclosure
```
I used AI in part 1a to troubleshoot why stations was not loading; I needed to convert the XLSX to a CSV to import it as a table. I also used it in part 1c to troubleshoot my syntax (I had added too many parentheses). I also used it in part 1d to troubleshoot how to correctly use "CASE WHEN" (I had been trying to use a regular WHEN statement). I used it in part 2c to help adjust the code from class to change the month to bike type. I used it in 4b to show where to include WHERE in the syntax.