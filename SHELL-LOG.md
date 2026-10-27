# DATA 501; Assignment 10 Shell Log

**Name:** Riley Sapp
**NetID:** rsapp4
**Terminal used:** Git Bash

## Part 0
```
0a. 
$ head -1 trips_2025.csv
trip_id,start_time,end_time,start_station_id,start_station_name,end_station_id,rider_type,bike_type

$ wc -l trips_2025.csv
250601 trips_2025.csv

Q0c. Instead of rows, wc -l counts lines, which includes the header. Using tail -n +2 would include everything except the header, i.e. dropping the offending line before counting.
```
## Part 1
```
1a.
$ pwd
/c/Users/shana/Downloads/DATA501/ride-knox-analysis

$ ls -lh
total 110M
-rw-r--r-- 1 shana 197609 6.0K Sep 29 01:50 COLLAB-LOG.md
-rw-r--r-- 1 shana 197609  58K Oct 20 17:27 M9_assignment.ipynb
-rw-r--r-- 1 shana 197609 4.6K Oct 13 12:07 Module-7-SQL-LOG.md
-rw-r--r-- 1 shana 197609 5.7K Sep 29 23:52 PROJECT-LOG.md
-rw-r--r-- 1 shana 197609 3.4K Sep 29 23:45 README.md
-rw-r--r-- 1 shana 197609  663 Sep 29 23:29 RELEASE-NOTE.md
-rw-r--r-- 1 shana 197609  535 Oct 26 22:29 SHELL-LOG.md
-rw-r--r-- 1 shana 197609 6.5K Oct 14 23:39 SQL-LOG.md
-rw-r--r-- 1 shana 197609    0 Oct 21 23:33 SQL-memo.md
-rw-r--r-- 1 shana 197609  11K Oct 21 23:44 SQL-project.ipynb
-rw-r--r-- 1 shana 197609  12K Sep 22 15:10 WORKLOG.md
-rw-r--r-- 1 shana 197609  156 Oct  5 22:21 _config.yml
-rw-r--r-- 1 shana 197609 233K Sep 22 09:04 analysis.ipynb
drwxr-xr-x 1 shana 197609    0 Sep 22 07:19 charts/
-rw-r--r-- 1 shana 197609 1.7K Oct 21 20:43 data-dictionary.md
... (24 more lines)

In ls -lh, the h means "human-readable sizes"; using -h shows the size output in an easier-to-read unit than the command would otherwise output.

1c. 
$ ls -a
./                   WORKLOG.md                                        queries/
../                  _config.yml                                       report.md
.git/                analysis.ipynb                                    requirements.txt
.gitignore           charts/                                           ride-knox-analysis/
.ipynb_checkpoints/  data-dictionary.md                                ride-knox-recovery/
COLLAB-LOG.md        distribution_of_casual_bike_trip_durations.png    ride_knox.db
M9_assignment.ipynb  distribution_of_day_pass_bike_trip_durations.png  ride_knox_work.db
Module-7-SQL-LOG.md  distribution_of_member_bike_trip_durations.png    ride_knox_work.db-journal
PROJECT-LOG.md       git_project_starter_pack.zip                      sql/
README.md            image.png                                         stations.xlsx
RELEASE-NOTE.md      index.md                                          stations_2026.xlsx
SHELL-LOG.md         memo.md                                           trips_2025.csv
SQL-LOG.md           monthly_by_rider_type.png                         trips_2026_07.csv
SQL-memo.md          out/                                              trips_2026_h1.csv
SQL-project.ipynb    project.ipynb                                     trips_per_dock_by_station.png

.gitignore is visible in this listing but was not visible under plain ls.

Q1c. Output is derived and regenerable, so it belongs in .gitignore to avoid Git status nagging about it. For this week's outputs in particular, someone would need the raw data in order to regenerate them, which protects the privacy of Ride Knox's data.
```
## Part 2
```
2a.
$ wc -l trips*.csv
  250601 trips_2025.csv
   33086 trips_2026_07.csv
  137342 trips_2026_h1.csv
  421029 total

2b. 
$ ls -lh trips_2026*.csv
-rw-r--r-- 1 shana 197609 2.9M Oct 20 18:34 trips_2026_07.csv
-rw-r--r-- 1 shana 197609  13M Sep 29 22:48 trips_2026_h1.csv

2c.
$ ls -lh stations*.xlsx
-rw-r--r-- 1 shana 197609 15K Aug 27 17:29 stations.xlsx
-rw-r--r-- 1 shana 197609 15K Sep 29 22:48 stations_2026.xlsx

Q2d.
In 2a, the shell replaced the * with the matching file names before running the command, which is why rm *.csv is dangerous--it reads this as removing every file individually.

Q2e.
The half-year files contains about 54.8% of the rows as trips_2025; however, it is about 59.1% of its bytes (note: I used ls -lh trips_2025.csv to find the size of trips_2025). This tells you that the rows in the half-year contain more data than the rows in trips_2025. One kind of CSV column that would break this relationship is if a column broke normalization rule 1NF and could contain multiple values per cell: because some rows could have much more information in them than other rows, this would make it so that the rows in the half-year are necessarily more data-heavy than in 2025.
```
## Part 3
```
3a.
$ tail -3 trips_2025.csv
T0029313,2025-12-31 23:33:25,2025-12-31 23:47:31,S08,Student Union - UT,S09,CASUAL,classic
T0233859,2025-12-31 23:40:52,2025-12-31 23:51:14,S04,Old City - Jackson Ave,S04,member,electric
T0140894,2025-12-31 23:42:04,2026-01-01 00:37:04,S12,Fort Sanders - Laurel Ave,S12,casual,electric


Printing the tail of a CSV can tell you if the file finished writing; if it didn't, then you would not be able to tell only by using head.

3b.
$ head -n 504 trips_2025.csv | tail -n 5
T0193042,2025-01-02 12:56:34,2025-01-02 13:07:49,S06,HODGES LIBRARY,S08,member,classic
T0109309,2025-01-02 12:58:14,2025-01-02 13:08:04,S05,World's Fair Park,S04,casual,classic
T0017188,2025-01-02 12:59:01,2025-01-02 13:17:00,S11,Cumberland Ave & 17th St,S02,member,electric
T0004700,2025-01-02 12:59:54,2025-01-02 13:37:33,S07,The Hill - Ayres Hall,S02,member,electric
T0183710,2025-01-02 12:59:57,2025-01-02 13:14:14,S01,Market Square,S01,casual,classic

$ sed -n '500,504p' trips_2025.csv
T0193042,2025-01-02 12:56:34,2025-01-02 13:07:49,S06,HODGES LIBRARY,S08,member,classic
T0109309,2025-01-02 12:58:14,2025-01-02 13:08:04,S05,World's Fair Park,S04,casual,classic
T0017188,2025-01-02 12:59:01,2025-01-02 13:17:00,S11,Cumberland Ave & 17th St,S02,member,electric
T0004700,2025-01-02 12:59:54,2025-01-02 13:37:33,S07,The Hill - Ayres Hall,S02,member,electric
T0183710,2025-01-02 12:59:57,2025-01-02 13:14:14,S01,Market Square,S01,casual,classic

3.
$ wc -l stations.xlsx
48 stations.xlsx

Q3d.
wc -l does not return reliable data for stations.xlsx because it's a zip file, not text. Instead, it counted newline characters. To confirm this, you could convert it in Python, then the shell can work.

Q3e.
$ head -1 trips_2026_07.csv
trip_id,start_time,end_time,start_station_id,start_station_name,end_station_id,rider_type,bike_type

This replaces the .columns pandas attribute.
```
## Part 4
```
4a.
$ grep -c ",2025-09" trips_2025.csv
23202

4b.
$ grep -c "member" trips_2025.csv
153388

$ grep -c -i "member" trips_2025.csv
158927

Adding -i makes a command ignore case, so it returns output for "member", "MEMBER", and "Member" equally.

4c. 
$ grep -v -c ",S24," trips_2025.csv
246853

4d.
$ cut -d, -f7 trips_2025.csv | head -4
rider_type
casual
casual
member

Because cut counts fields by position, you can use head -1 to find out the header in each field (found in Q3e).

Q4e.
The case-insensitive number (158,927 trips) is the answer to "how many member trips are there". This is connected to the meta-rule that a wrong pipleine returns a number, not an error, because whether or not the case insensitivity was applied, Bash would return a number without any indication that something was wrong.

Q4f.
The case-insensitive number agrees with the anchor. If a classmate's did not, it is most likely that they did not use -i to make their command case insensitive.
```
## Part 5
```
5a.
$ grep ',2025-09' trips_2025.csv > out/trips_2025_09.csv

$ grep ',2025-10' trips_2025.csv > out/trips_2025_10.csv

$ grep ',2025-11' trips_2025.csv > out/trips_2025_11.csv


5b.
$ wc -l out/trips_2025_*.csv
  23202 out/trips_2025_09.csv
  19795 out/trips_2025_10.csv
  13750 out/trips_2025_11.csv
  56747 total

5c.
$ wc -l out/trips_2025_09.csv > out/summary.txt

$ wc -l out/trips_2025_10.csv >> out/summary.txt

$ wc -l out/trips_2025_11.csv >> out/summary.txt

$ cat out/summary.txt
23202 out/trips_2025_09.csv
19795 out/trips_2025_10.csv
13750 out/trips_2025_11.csv

5d.
$ grep "fake" fake.csv 2> out/errors.log

$ cat out/errors.log
grep: fake.csv: No such file or directory

Q5e. out/summary.txt would have only contained the data for the November logs (or whichever logs were inputted last), because > overwrites a file without asking rather than appending it. That is worth rereading a redirection twice, because if you had forgotten that character, then the other two files would have been overwritten.

Q5f.
Errors go to a separate stream so a broken command's complaint doesn't end up inside your results file. Keeping stderr separate, the shell helps avoid quietly corrupting a results file.
```
## Part 6
```
6a.
$ cut -d, -f8 trips_2025.csv | tail -n +2 | sort | uniq -c | sort -rn
 155300 classic
  95300 electric
The two counts sum to 250,600.

6b.
$ cut -d, -f4 trips_2025.csv | tail -n +2 | sort | uniq -c | sort -rn | head -n 5
  26112 S06
  25044 S08
  22656 S01
  18983 S11
  16570 S02

$ cut -d, -f4 trips_2025.csv | tail -n +2 | sort | uniq -c | sort -r | head -n 5
  26112 S06
  25044 S08
  22656 S01
  18983 S11
  16570 S02

Q6c.
Despite the fact that sort -r compares text and -rn compares numbers, the counts are the same because the integers happen to also be in numeric order. However, if two integers had a different number of digits between them, (e.g., 100,000 versus 9,000), then the nummber with the higher starting digit would be ranked higher in -r.

6d.
$ cut -d, -f1 trips_2025.csv | tail -n +2 | sort | uniq -d | wc -l
600

6e.
$ cut -d, -f1 trips_2025.csv | tail -n +2 | sort | uniq -d | head -n 1
T0000118

$ grep '^T0000118,' trips_2025.csv
T0000118,2025-04-23 15:56:40,2025-04-23 16:15:49,S16,Ijams Nature Center,S14,member,electric
T0000118,2025-04-23 15:56:40,2025-04-23 16:15:49,S16,Ijams Nature Center,S14,member,electric
The two trips are identical.

Q6f.
This file is carrying exact duplicates; therefore, running tail -n +2 trips_2025.csv | sort -u | wc -l would remove the duplicates. This returns 250,000, which matches the anchor.
```
## Part 7
```
7a.
$ cut -d, -f5 trips_2025.csv | tail -n +2 | grep -i 'Market Square' | sort |uniq -c | sort -rn
  20781 Market Square
    644   Market Square
    461 MARKET SQUARE
    429 Market Square
    341 market square
There are 5 spellings.

7b.
$ cut -d, -f5 trips_2025.csv | tail -n +2 | sed 's/^ *//; s/ *$//' | tr 'A-Z' 'a-z' | sort | uniq -c | sort -rn | head -n 5
  26112 hodges library
  25044 student union - ut
  22656 market square
  18983 cumberland ave & 17th st
  16570 gay street & union ave

Q7c.
The count in 7b for Market Square is 22,656, while the most common spelling in 7a is 20,781; this means that 1,875 trips would have been uncredited to Market Square if sed and tr were skipped (22,656-20,781).

Q7d.
  26112 hodges library
  25044 student union - ut
  22656 market square
  18983 cumberland ave & 17th st
  16570 gay street & union ave

  26112 S06
  25044 S08
  22656 S01
  18983 S11
  16570 S02

  If the two rankings did not match, it would mean that part 7's pipeline had missed some piece of normalization and that some station names were not being credited to their correct station ID.
```
## Part 8
```
8a.
$ grep -c "S11" trips_2025.csv
35415

$ awk -F',' '$4 == "S11"' trips_2025.csv | wc -l
18983

Q8b.
The two numbers differ by a large margin because grep returns any row in which S11 exists anywhere, while awk only returns rows in which only column 4 is S11. The additional grep matches are also the end stations.

8c.
$ awk -F, 'NR>1 && $6=="" && tolower($7)=="member" {n++} END {print n+0}' trips_2025.csv
2371

Q8d.
The share of trips with no end_station_id that were taken by members was 2371/3774 trips with no end_station_id, or 62.82% of trips with no end_station_id. This shows that a majority of trips with no end_station_id are taken by members; this may suggest that the error causing a trip to have no end_station_id may be correlated with membership. However, it cannot determine causation.

8e.
$ awk -F, 'NR>1 && tolower($8)=="electric" {c[substr($2,6,2)]++} END {for (k in c) print k, c[k]}' trips_2025.csv | sort
01 4186
02 5090
03 7526
04 9749
05 11331
06 12067
07 10447
08 9348
09 8837
10 7571
11 5287
12 3861

8f.
With -r
04 9749
08 9348
09 8837
10 7571

With -rn
06 12067
05 11331
07 10447
04 9749

Q8g.
The month that the alphabetic sort delivers is April, with 9,749; however, the numeric sort delivers June, with 12,067 trips. This is because the alphabetic version reads the first digit and determines if it is higher than the other first digits, so April's 9 is read as higher than June's 1. The numeric sort is correct. A colleague reading only the wrong version would have concluded that Ride Knox's electric fleet is much less successful, as they would assume that the most productive month only had less than 10,000 trips.
```
## Part 9
```
9a. 
$ awk -F, 'FNR>1 {c[substr($2,1,7)," " $8]++} END {for (k in c) print k, c[k]}' out/trips_2025_*.csv | sort
2025-08 classic 5
2025-08 electric 4
2025-09 classic 14360
2025-09 electric 8842
2025-10 classic 12215
2025-10 electric 7575
2025-11 classic 8456
2025-11 electric 5287


Q9b.
Instead of getting 6 groups, I got 8 groups, with two groups for August also included. This likely occurred because the files were created using grep, which locates a string anywhere within a row rather than in a specific column. Therefore, it is possible that the 9 trips that were recorded in August had a start date in August, but an end date in September (i.e., they may have started late in the night and finished the morning after). This would still cause these trips to appear in the dataset, as they have 2025-09 somewhere in the line.

Q9c.
The counts in 9a sum to 56,744, while wc -l in 5b returned 56,747. This is likely because the 3 additional rows were the headers for all 3 files, which 5b did not account for. One might also come into problems with the fact that the files were created with grep, so it counts if any of the dates existed anywhere within the line; therefore, some trips that started in August appear in the pipeline, despite the pipeline intending on only showing the trips that started in September-November. In this module, you could use an operator > or < and and && in 9a to only show trips whose start date is betweeen 09 and 11.

9d.
```
## Part 10
## Reflection
R3. AI Disclosure: I used a generative AI tool to explain how to use the asterisk wildcard, which I used for parts 2a-c. I used AI to check my code using head and tail connected by a pipe in 3b. I used it in part Q3d to explain what wc -l returns when it cannot read a xlsx file, which it returned that it counts newline characters, which I asked it to explain. I used it in part 5a to explain how to contain the selected rows when using grep. I used it in 5c to explain how to display the finished file using cat. I used it for 9a to explain how to make an awk command read multiple files rather than just one; I Was trying to use the awk arrays and NR instead of FNR with && operators, which I used AI to clean up and explain what syntax should be used instead.