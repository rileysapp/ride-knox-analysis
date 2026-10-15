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