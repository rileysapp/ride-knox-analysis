# DATA 501; Assignment 12 Analysis Log

**Name:** *Riley Sapp*
**NetID:** *rsapp4*
**R version:** *R version 4.6.2 (2026-10-29 ucrt)*
**tidyverse version:** *(tidyverse 2.0.0)*

## Part 0
```
0a. > getwd()
[1] "C:/Users/shana/Downloads/DATA501/ride-knox-analysis/ride-knox-analysis"
I did not need to type a full path to the data because the project was created inside of the existing folder.

0b.> library(tidyverse)
── Attaching core tidyverse packages ─────────────────────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.2.1     ✔ readr     2.2.0
✔ forcats   1.0.1     ✔ stringr   1.6.0
✔ ggplot2   4.0.3     ✔ tibble    3.3.1
✔ lubridate 1.9.5     ✔ tidyr     1.3.2
✔ purrr     1.2.2     
── Conflicts ───────────────────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package to force all conflicts to become errors

0c. > count(trips, rider_type, sort = TRUE)
# A tibble: 6 × 2
  rider_type      n
  <chr>       <int>
1 member     153388
2 casual      88395
3 Member       3170
4 MEMBER       2369
5 Casual       1906
6 CASUAL       1372

Q0d. install.packages() belongs in the console, not the script. This is because like module 11's reproducibility rule, which states to use the caller's value if they set one, otherwise fall back to a sane default. This allows different computers with different versions to run the project. It is also only necessary once per machine, so running it upon every start is expensive.
```
## Part 1
...
## Part 11
## Reflection
