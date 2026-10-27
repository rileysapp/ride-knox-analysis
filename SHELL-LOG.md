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
## Part 10
## Reflection
