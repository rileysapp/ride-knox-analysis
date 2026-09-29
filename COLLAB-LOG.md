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
## Part 2
```
2a: * chore/tidy-report
  main
  reword-limitations

2c: Commit message: On branch chore/tidy-report
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        ride-knox-recovery/

nothing added to commit but untracked files present (use "git add" to track)
PR description: Modified sentence about relative pressure to clarify what the pressure is relative to

2e: 7370b70 (HEAD -> main, origin/main, origin/HEAD) Merge pull request #4 from rileysapp/chore/tidy-report
e9e8894 (origin/chore/tidy-report, chore/tidy-report) Modified sentence about relative pressure to clarify what the pressure is relative to
e09f4f8 Completed questions through 2c
b7e1813 Added collab log
b45303d Add worklog for collaboration purposes
3a8b0d2 Add part 9 to worklog
d03bcee Updated remaining files
b8f02b9 Updated analysis.ipynb
:

Q2: When the PR was open but not yet merged, main was untouched.
```
## Part 3
```
Q3: I did not embed a chart. A relative path is important for someone who clones the repo because they do not have the same file locations as the creator of the repo
```
## Part 4
```
4ci: <<<<<<< HEAD
The 2026 ridership data implies that the implementation of the day pass and creation of new stations have improved ridership from and decreased bottlenecking of stations in 2025.
=======
The implementation of the day pass and creation of new stations seem to have improved ridership from and decreased bottlenecking of stations in 2025.
>>>>>>> main
4cii: The 2026 ridership data implies that the implementation of the day pass and creation of new stations have improved ridership from and decreased bottlenecking of stations in 2025.

4d: e0b29f5 (HEAD -> main, origin/main, origin/HEAD) Merge pull request #5 from rileysapp/docs/project-readme
b7e2f1d (origin/docs/project-readme, docs/project-readme) Removed conflicts
5b68c7c Reworded key findings sentence in report.md
ff7f7ea Changed verbiage in report.md headline and added README
7370b70 Merge pull request #4 from rileysapp/chore/tidy-report
e9e8894 (origin/chore/tidy-report, chore/tidy-report) Modified sentence about relative pressure to clarify what the pressure is relative to
e09f4f8 Completed questions through 2c
:

Q4: The PR allows multiple collaborators to review each others' work rather than one person making the decision; because of this, the PR required more context when making changes.
```
## Part 5
```
5a: theme: jekyll-theme-cayman
title: Ride Knox Ridership Analysis
description: Impact of creating new stations and implementing day pass

5b: https://rileysapp.github.io/ride-knox-analysis/

Q5: The theme used in this assignment was the Jekyll Theme Cayman, as opposed to the in-class Jekyll Theme Minimal.
```
## Part 6
```
Discussed after class: no partner was reachable for this project.
6b-alt: https://github.com/DATA501/ride-knox-analysis/pull/2

Q6: "Request changes" on a pull request is kinder than delivering that feedback in a meeting because the reviewer is commenting on the code, not the coder; it is less personal and instead it is expected and professional.
```
## Part 7
```
