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
```
1a. > north_docks <- c(12, 10, 12)
> length(north_docks)
[1] 3
> mean(north_docks)
[1] 11.33333
> sum(north_docks)
[1] 34
I verified that sum() was the correct name by using the Help tab in RStudio and reading what the command does.

1b. > docks_share <- (north_docks / sum(north_docks)) * 100
> docks_share[1]
[1] 35.29412

1c. > north_docks > 10
[1]  TRUE FALSE  TRUE
> mean(north_docks > 10)
[1] 0.6666667
66.67% of stations in north_docks have greater than 10 docks.

Q1d. Running the vector north_docks > 10 returns boolean true and false, which are equal to 1 and 0. In mean(north_docks), the command calculates the mean of the 0s and 1s, which returns the proportion of values that meet the criteria, which ultimately returns a proportion of stations with more than 10 docks.
```
## Part 2
```
2a. > spec(trips)
cols(
  trip_id = col_character(),
  start_time = col_datetime(format = ""),
  end_time = col_datetime(format = ""),
  start_station_id = col_character(),
  start_station_name = col_character(),
  end_station_id = col_character(),
  rider_type = col_character(),
  bike_type = col_character()
)

2b. > glimpse(stations)
Rows: 24
Columns: 7
$ station_id     <chr> "S01", "S02", "S03"…
$ station_name   <chr> "Market Square", "G…
$ neighborhood   <chr> "Downtown", "Downto…
$ latitude       <dbl> 35.9649, 35.9662, 3…
$ longitude      <dbl> -83.9197, -83.9184,…
$ docks          <dbl> 20, 16, 12, 16, 20,…
$ year_installed <dbl> 2022, 2022, 2022, 2…

2c.> nrow(count(trips, start_station_name))
[1] 73

Q2d. In the Help tab, read_csv() is stated to trim white space; if trim_ws = FALSE, then the count would be 121. readr trims the white space before you look at it.

Q2e. read_csv() located start_time and end_time as <dttm>; if they were instead written in <chr>, then the mutate() call would not be able to parse specific months or hours.

Q2f. In R, both stations and trips are tibbles, and a column is called a vector.
```
## Part 11
## Reflection
