# DATA 501 — Assignment 6 Collaboration Log
**Name: Riley Sapp**
**NetID: rsapp4**
## Part 0
```
0a: On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        COLLAB-LOG.md
        ride-knox-recovery/

3a8b0d2 (HEAD -> main, origin/main) Add part 9 to worklog
d03bcee Updated remaining files
b8f02b9 Updated analysis.ipynb
ee8c48b Updated worklog
15c9855 Resolved conflict with wording in report
2a23215 Reworded dock statement for 6b
db9f963 (reword-limitations) Added false sentences for Part 6
4d129ac Changed minimum duration from 1 minute to 2 minutes
de6acdb Revert "Added exaggerated claim on purpose for Part 4"
56ccefc Added exaggerated claim on purpose for Part 4

Q0: Module 5 crested a personal worklog that one person could change, but it did not create a shared-repo that a team could safely change and that a stranger could understand.
```
## Part 1
```
1a: https://github.com/rileysapp/ride-knox-analysis/issues/1 Issue #1

1b: Issue #2 Filter Impossible Durations - Some trips in trips_2025.csv have a negative duration (an end_time that occurs before a start_time). Expected: all rows should have a duration over 0. Actual: 747 trips have negative durations. Negative durations must be filtered because they are impossible and will skew data concerning travel times.

Issue #3 Clean Start Station Names - Values in start_station_name in trips_2025.csv have trailing spaces. Expected: 24 unique values. Actual: 120 unique values. These rows must be standardized so that true values are visible in the data.

1c: See M6-assignment.docx

Q1: Expected: 24 unique start_station_names. Actual: 120 unique start_station_names.
```
## Part