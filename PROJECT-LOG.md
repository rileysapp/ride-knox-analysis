**Name: Riley Sapp**
**Net ID: rsapp4**
**Updates to PROJECT-LOG.md will be committed directly to main. This is because project log is the assignment itself and not an aspect of the project; as such, it would not be edited by multiple people and can be treated as part of the simulation of using GitHub.**

## Part 0
```
Output of git status:
On branch main
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   _config.yml

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        distribution_of_casual_bike_trip_durations.png
        distribution_of_day_pass_bike_trip_durations.png
        distribution_of_member_bike_trip_durations.png
        git_project_starter_pack.zip
        memo.md
        monthly_by_rider_type.png
        project.ipynb
        ride-knox-recovery/
        trips_per_dock_by_station.png

no changes added to commit (use "git add" and/or "git commit -a")

Output of git log --oneline:
47ebf57 (HEAD -> main, origin/main, origin/HEAD) Created project log
b7cb955 Added AI disclosure and reflection
12aaf7f Complete assignment
2cf1d95 Added repository name to image embed to fix bug
650b0b6 Changed path to match that which is on GitHub
80e1679 Changed relative path of chart
222f86b Merge branch 'main' of https://github.com/rileysapp/ride-knox-analysis
3bd3274 Added chart
3af77ee Merge pull request #6 from rileysapp/chore/enable-pages
bc17679 (origin/chore/enable-pages, chore/enable-pages) Create theme
fc792e1 Completed assignment through part 4
e0b29f5 Merge pull request #5 from rileysapp/docs/project-readme
b7e2f1d (origin/docs/project-readme, docs/project-readme) Removed confl
icts
5b68c7c Reworded key findings sentence in report.md
ff7f7ea Changed verbiage in report.md headline and added README
7370b70 Merge pull request #4 from rileysapp/chore/tidy-report
e9e8894 (origin/chore/tidy-report, chore/tidy-report) Modified sentence
 about relative pressure to clarify what the pressure is relative to
e09f4f8 Completed questions through 2c
b7e1813 Added collab log
b45303d Add worklog for collaboration purposes
3a8b0d2 Add part 9 to worklog
d03bcee Updated remaining files
b8f02b9 Updated analysis.ipynb
ee8c48b Updated worklog
15c9855 Resolved conflict with wording in report
2a23215 Reworded dock statement for 6b
db9f963 (reword-limitations) Added false sentences for Part 6
4d129ac Changed minimum duration from 1 minute to 2 minutes
de6acdb Revert "Added exaggerated claim on purpose for Part 4"
56ccefc Added exaggerated claim on purpose for Part 4
9464404 Reworded line about minimum trip duration in report.md
5e293d5 Ignored checkpoint file, trips_2025, stations.xlsx
0711cc6 Added worklog memo
da40b1d Added data analysis from week 4 and associated charts
65a1b1b Added report memo from week 4
(END)
```

## Part A
```
QA1: The issue describing backing up the 2026 analysis to GitHub must be done before anything that references the 2026 analysis, such as embedding the chart. This is because the new issues reference that initial issue, and they cannot be worked on until that issue is resolved.
```
## Part B
```
On branch part_b
Your branch is up to date with 'origin/part_b'.

B: Git status paste
Your branch is up to date with 'origin/main'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   _config.yml

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        .ipynb_checkpoints/
        git_project_starter_pack.zip
        ride-knox-recovery/

no changes added to commit (use "git add" and/or "git commit -a")

Q-B1: The checkpoints must never be committed to the public repo, because they contain sensitive information. I ensured that this will not reach a public repo by adding it to gitignore.

Q-B2: The reorganization caused a conflict in .gitignore, as it was merged and out-of-date, so I had to pull from GitHub, save it locally, fix the conflict, and push.
```
## Part C
```
Rejection message: error: src refspec update-readme does not match any
error: failed to push some refs to 'https://github.com/rileysapp/ride-knox-analysis.git'
PS C:\Users\shana\Downlo

Q-C1: The difference between assignment 5 and this project is that my collaborator and I both made edits to the same line. Git does not make a decision whenever two humans disagree.

Q-C2: The problem is that both people were editing on the same branch. This conflict is aided by collaborators editing on their own branches and creating PR's instead of pushing directly.

Q-C3: The word "HEAD" marks Riley's commits, as he was the first one to make the edits. It marks the start of the conflict.
```
## Part D
```
A visitor to the Pages URL would have seen the README.
```
## Reflection + AI disclosure
```
Reflection:
Riley's rejected push and conflict happened because he was pushing on the same branch without completing PR's. He should make small commits and short-lived branches to ensure that these conflicts do not occur as often. Professionals should push and pull often to ensure they are working with up-to-date code.
AI disclosure:
I used a generative AI tool to explain what types of items to include in a requirements.txt file for part B. I also used it to troubleshoot my merge errors in part B. I also used it to ask how to add index.md to the front page and how to add a linked .md. All final answers are my own.
```