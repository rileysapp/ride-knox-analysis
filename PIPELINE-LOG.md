# DATA 501; Assignment 11 Pipeline Log

**Name:** Riley Sapp
**NetID:** rsapp4
**Shell:** GNU bash, version 5.3.15(2)-release (x86_64-pc-cygwin)
**sqlite3 version:** 3.54.1 2026-10-16 14:45:20 555e07ef33f69a0957d24d8e555b702464a131d6f1607f4c3c1e4551e8e6ca76 (64-bit)

## Part 0
```
0a. On branch feature/bash-week11-automation
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   SQL-memo.md
        modified:   queries/part3.sql
        modified:   queries/part6.sql

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        M9_assignment.ipynb
        git_project_starter_pack.zip
        out.zip
        queries/part0.db
        queries/part1.db
        queries/part1.sql.sqbpro
        queries/part2.sqbpro
        queries/part3.sqbpro
        queries/part4.sqbpro
        queries/part5.sqbpro
        queries/part6.sqbpro
        ride-knox-analysis/
        ride-knox-recovery/
        ride_knox.db
        ride_knox_work.db
        ride_knox_work.db-journal
        sql/ride_knox_v2.sqbpro
        sqldiff.exe
        sqlite3.exe
        sqlite3_analyzer.exe
        sqlite3_rsync.exe
        trips_2026_07.csv


0b. GNU bash, version 5.3.15(2)-release (x86_64-pc-cygwin)

3.54.1 2026-10-16 14:45:20 555e07ef33f69a0957d24d8e555b702464a131d6f1607f4c3c1e4551e8e6ca76 (64-bit)

0c. 
$ set -e
cat exports/nosuchfile.csv | wc -l
echo "Exit code: $?"
cat: exports/nosuchfile.csv: No such file or directory
0
Exit code: 0

$ bash -c 'set -eo pipefail; cat exports/nosuchfile.csv | wc -l'
echo "Exit code: $?"
cat: exports/nosuchfile.csv: No such file or directory
0
Exit code: 1

Q0d. One piece of syntax in part 2 that would fail on a shell that is not Bash is check_data.sh. The shebang tells the OS which interpreter to use; without it, the shell that the caller is using will fail unless they are using Bash.
```
## Part 1
```
```
## Part 9
## Reflection
```
AI Disclosure: I used a generative AI tool to try to troubleshoot why I was not getting pipeline/ to show up in my Untracked files in part 0a, but I did not end up using it. I also used it to troubleshoot in part 0c, as I continously had Bash exit the program when using set -e instead of returning the exit code; it explained how using set -o pipefail fixes the failures hidden inside pipelines.
```