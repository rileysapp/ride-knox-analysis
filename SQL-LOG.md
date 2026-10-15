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

```
## Part 3
```
```
## Part 4
```
```
## Part 5
```
```
## Part 6
```
```
## AI Disclosure
```
I used AI in part 1a to troubleshoot why stations was not loading; I needed to convert the XLSX to a CSV to import it as a table. I also used it in part 1c to troubleshoot my syntax (I had added too many parentheses). I also used it in part 1d to troubleshoot how to correctly use "CASE WHEN" (I had been trying to use a regular WHEN statement).