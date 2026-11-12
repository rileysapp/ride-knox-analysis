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
## Part 3
```
3a. clean <- trips |>
  distinct() |>
  filter(
    start_station_id != "S99",
    is.na(end_station_id) | end_station_id != "S99") |>
  mutate(
    rider_type = str_to_lower(str_trim(rider_type)),
    duration_min = as.numeric(difftime(end_time, start_time, units = "mins"))) |>
  filter(duration_min >= 1, duration_min <= 1440)
  > nrow(clean)
[1] 247967

3b. > clean |> filter(start_station_id == end_station_id) |> nrow()
[1] 30112
There were 30,112 round trips.

3c. > clean |> filter(end_station_id != start_station_id) |> nrow()
[1] 214129
There were 214,129 one-way trips.

3d. 3b and 3c add up to 244,241, which is a 3,726 gap from the total number of cleaned trips. R calculated trips in which the end station was equal to or not equal to the start station, but if the end station was null, it would be excluded, meaning that R did not account for trips where the end station is missing.
> clean |> filter(is.na(end_station_id) | end_station_id != start_station_id) |> nrow()
[1] 217855
> clean |> filter(is.na(end_station_id)) |> nrow()
[1] 3726
I chose to fold the end unknown trips in with one-way trips, as they are trips that are not identified as having started and ended in the same station.

3e. One-way: 30,112
Round trip: 214,129
End unknown: 3,726
30112 + 214129 + 3726 = 247967

Q3f. In R, NA != "S99" is NA, and filter() drops rows that aren't TRUE, which means that it would be dropped. A student who only ever tested their pipeline against a row count would never find it because the row count does not indicate which rows contain NA values.

Q3g. One could choose to keep 3c's number as the one-way count and create a new category for the missing end station trips, as there is no way to be certain if these trips were round trip or one-way, as the end station is not identified.
```
## Part 4
```
4a. > clean <- clean |>
+   mutate(
+     month = month(start_time),
+     hour = hour(start_time)
+     )

4b. > clean <- clean |>
+   mutate(
+     month = month(start_time, label = TRUE),
+     hour = hour(start_time)
+     )
> clean <- clean |>
+   mutate(
+     is_evening = (hour>=16)
+   )
> mean(clean$is_evening)
[1] 0.40457

Q4c. By returning a label rather than a number,  a chart with the months as an x-axis will return each month as a discrete value rather than a continuous one.

Q4d. mutate() adds or overwrites columns, and later expressions can use earlier ones, even within the same call, which is why both mutates could have been done in the same call. However, a reviewer may prefer you write it as two, so that they can more easily refer to the effectiveness of one or the other without accidentally disabling parts that they didn't mean to (similar to why you shouldn't commit multiple things at once).
```
## Part 11
## Reflection
```
AI Disclosure. I used a generative AI tool in part 3a to troubleshoot how to filter out S99 without also dropping trips with a missing end station. I used it for part 4b to explain how to make the month column return as a label instead of a number.
```