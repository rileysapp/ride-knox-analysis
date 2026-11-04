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
1a.
$ cat > pipeline/check_data.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
> repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
csv="$repo_root/trips_2025.csv"

row_count=$(tail -n +2 "$csv" | awk 'END {print NR+0}')
distinct_count=$(tail -n +2 "$csv" | sort -u | awk 'END {print NR+0}')
difference=$((row_count - distinct_count))

echo "Row count: $row_count"
echo "Distinct-row count: $distinct_count"
echo "Difference: $difference"
EOF

shana@Sapp-Acer MINGW64 ~/Downloads/DATA501/ride-knox-analysis (feature/bash-week11-automation)
$ chmod +x pipeline/check_data.sh
./pipeline/check_data.sh
Row count: 250600
Distinct-row count: 250000
Difference: 600

1b. $ grep -c "NOSUCHPATTERN" trips_2025.csv > out/junk.txt
echo "Exit code: $?"
cat out/junk.txt
Exit code: 1
0

$ bash ./pipeline/check_data.sh
echo "Exit code: $?"
Row count: 250600
Distinct-row count: 250000
Difference: 600
Exit code: 0

The contents of junk.txt are just 0.

1c.
[[ "$difference" -eq 600 ]] && echo "Summary: Everything succeeded."
[[ "$difference" -eq 600 ]] || echo "Fallback"
bash: BASH_SOURCE[0]: unbound variable
Row count: 0
Distinct-row count: 0
Difference: 0
Fallback

Q1d. out/junk.txt contained only the number 0. This is worse than an empty file, because it appears to be an answer. Therefore, it would silently be wrong. This connects to the meta-rule, as a wrong pipeline returns a number (0), not an error, and a retyped pipeline returns a different number with nothing to diff.

I apologize, I do not understand any part of this assignment or unit. I will be coming to office hours.
```
## Reflection
```
AI Disclosure: I used a generative AI tool to try to troubleshoot why I was not getting pipeline/ to show up in my Untracked files in part 0a, but I did not end up using it. I also used it to troubleshoot in part 0c, as I continously had Bash exit the program when using set -e instead of returning the exit code; it explained how using set -o pipefail fixes the failures hidden inside pipelines. I used it in part 1a for how to report the row counts and difference. In 1b, I could not get the terminal to not close whenever I tried running grep -c "NOSUCHPATTERN" trips_2025.csv > out/junk.txt, so I used it to troubleshoot and fix my code. I used it in 1c to identify -eq 600 and -eq 601. I started using it in part 2a, but I could not understand what the question was asking nor what the AI was trying to direct me to do, so I did not include that in my answer.
```