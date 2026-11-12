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
## Part 5
```
5a. mix <- clean |>
  group_by(month) |>
  summarise(trips = n(), casual_pct = (mean(rider_type == "casual")*100), median_min = median(duration_min), .groups = "drop")

5b. > mix |> print(n=12)
# A tibble: 12 × 4
   month trips casual_pct median_min
   <ord> <int>      <dbl>      <dbl>
 1 Jan   10791       43.5       14.1
 2 Feb   13280       42.7       14.0
 3 Mar   19725       43.4       14.3
 4 Apr   25396       44.3       14.2
 5 May   29613       44.6       14.4
 6 Jun   31279       44.2       14.2
 7 Jul   26926       33.8       13.5
 8 Aug   24611       30.4       13.4
 9 Sep   22947       27.4       13.1
10 Oct   19568       25.5       13.0
11 Nov   13587       24.4       13.0
12 Dec   10244       22.7       12.8

5c. The percentage-point drop in casual_pct from June to July is 10.4 (44.2-33.8), and the drop in median-min from June to December is 1.4 (14.2-12.8).

Q5d. The count showcases the raw number of lost trips, which in practice means that you can measure lost revenue and actual ridership numbers. However, the share showcases the loss in casual ridership in comparison with member ridership--this can be more relevant for finding if the drop in casual ridership is correlated with a drop in total ridership, or if it is solely casual ridership that is impacted.

Q5e. Because casual trips tend to be longer than member trips, the median trip length becomes skewed more toward member trips' lengths as they begin to make up a larger share of the total ridership. This causes the median trip to decrease despite individual riders' habits not changing.
```
## Part 6
```
6a. > per_station <- clean |>
+   count(end_station_id, name = "arrivals")
> per_station |> print(n=24)
# A tibble: 25 × 2
   end_station_id arrivals
   <chr>             <int>
 1 S01               22131
 2 S02               16141
 3 S03               10507
 4 S04               13922
 5 S05               15021
 ... + 20 more
NA is not a real station; it is all of the trips with a missing end_station_id. It has 3,726 trips in it.

6b. > per_station <- clean |>
+   count(end_station_id, name = "arrivals") |>
+ #per_station |> print(n=25)
+   filter(!is.na(end_station_id)) |>  
+   left_join(stations, by = c("end_station_id" = "station_id")) |>
+   mutate(arrivals_per_dock = round(arrivals / docks)) |>
+   arrange(desc(arrivals_per_dock))

6c. > per_station |> print(n=24)
# A tibble: 24 × 9
   end_station_id arrivals station_name              neighborhood  latitude longitude docks year_installed arrivals_per_dock
   <chr>             <int> <chr>                     <chr>            <dbl>     <dbl> <dbl>          <dbl>             <dbl>
 1 S11               18783 Cumberland Ave & 17th St  Fort Sanders      36.0     -83.9    16           2022              1174
 2 S07               14034 The Hill - Ayres Hall     UT Campus         36.0     -83.9    12           2022              1170
 3 S01               22131 Market Square             Downtown          36.0     -83.9    20           2022              1107
 4 S06               25301 Hodges Library            UT Campus         36.0     -83.9    24           2022              1054
 5 S08               24263 Student Union - UT        UT Campus         36.0     -83.9    24           2022              1011
 ...
 22 S21                2892 Caswell Park              East Knoxvil…     36.0     -83.9    10           2024               289
23 S24                1931 Sequoyah Hills Park       Sequoyah Hil…     35.9     -84.0    10           2025               193
24 S23                2087 Bearden - Kingston Pike   Bearden           35.9     -84.0    12           2025               174
The most pressured station is Cumberland Ave, and the least pressured station is Bearden. The ratio is 1174:174.

6d. > total_arrivals <- sum(per_station$arrivals)
> total_trips <- nrow(clean)
> (total_trips - total_arrivals)
[1] 3726
The total trips minus the total arrivals is 3,726, which is the number of trips with no end_station_id.

Q6e. One operational question that the arrival ranking answers is how many bikes end up at a station--the van will need to visit stations with higher arrivals more often to pick up bikes and distribute them to other stations with higher departures, so both are important for operational use.
```
## Part 7
```
7a. ops_theme <- theme_minimal(base_size = 14) +   theme(
  plot.title = element_text(face = "bold"),
  panel.grid.minor = element_blank()
)

7b. > ggplot(mix,aes(x = month, y = casual_pct,
+   geom_line(linewidth = 1) +
+   geom_point(size = 2) +
+   )

7c. ggplot(mix,aes(x = month, y = casual_pct,
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  geom_vline(xintercept = 7, linetype = "dashed", colour = "grey40")
  ) + annotate("text", x = 7.4, y = 4500, label = "July 1 price increase")

7d.ggplot(mix,aes(x = month, y = casual_pct)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  geom_vline(xintercept = 7, linetype = "dashed", colour = "grey40")
  + annotate("text", x = 7, y = 100, label = "July 1 price increase") +
  labs(title    = "Casual ridership dropped 10.4 percentage points in July",
       subtitle = "Casual rider share of total ridership per month by rider type, 2025",
       x = NULL, y = "Trips", colour = "Rider type",
       caption  = "n = 247,967 trips, Ride Knox export.")

7e. ops_theme <- theme_minimal(base_size = 14) +   theme(
  plot.title = element_text(face = "bold"),
  panel.grid.minor = element_blank()
)
ggplot(mix,aes(x = month, y = casual_pct)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  geom_vline(xintercept = 7, linetype = "dashed", colour = "grey40")
  + annotate("text", x = 7, y = 100, label = "July 1 price increase") +
  labs(title    = "Casual ridership dropped 10.4 percentage points in July",
       subtitle = "Casual rider share of total ridership per month by rider type, 2025",
       x = NULL, y = "Trips", colour = "Rider type",
       caption  = "n = 247,967 trips, Ride Knox export.") +
  ops_theme
The figure shows a sharp drop off in the share of casual ridership among total ridership at the dashed vertical line, which is at July.

Q7f. If the y-axis was pinned at 20, then the apparent size of the July drop would be much greater than when compared to when it is pinned at 0. This is a crime on the class ledger, as it does not accurately represent the data.
```
## Part 8
```
8a. ggplot(per_station,aes(x = arrivals_per_dock, y=reorder(station_name, arrivals_per_dock))) +
  geom_col()

8b. ggplot(per_station,aes(x = arrivals_per_dock, y=reorder(station_name, arrivals_per_dock), fill = neighborhood)) +
  geom_col(fill = "grey35")

8c. ggplot(per_station,aes(x = arrivals_per_dock, y=reorder(station_name, arrivals_per_dock), fill = neighborhood)) +
  geom_col(fill = "grey35") +
  labs(title    = "Pressure on stations varies wildly, by as much as 1174 arrivals per dock to 174 arrivals per dock",
       subtitle = "Arrivals per dock per station in 2025",
       x = NULL, y = "Trips", colour = "Rider type",
       caption  = "n = 247,967 trips, Ride Knox export.") +
  ops_theme

Q8d. A constant grey shows up well on black, but if the image is transparent, it may be placed on a grey background and would not be accessible for colorblind individuals. fill fixes this problem by making the version have a constant background, meaning it would be visible without the worry of what is underneath it.

Q8e. This would make it more difficult to read from six feet away because some fills are brighter than others, making them stand out more and distracting from the data. One change that could be made would be to make each bar a constant color and to create a high-contrast background so that the transparent image could not make the colors less contrasted.
```
## Part 9
```
9a. > clean |> group_by(bike_type) |> summarise(median(duration_min))
# A tibble: 2 × 2
  bike_type `median(duration_min)`
  <chr>                      <dbl>
1 classic                     13.7
2 electric                    13.8

9b. ggplot(clean, aes(x = bike_type, y = duration_min)) +
  geom_boxplot(outlier.shape = NA) +
  coord_cartesian(ylim = c(0, 60))

9c. ggplot(clean, aes(x = bike_type, y = duration_min)) +
  geom_boxplot(outlier.shape = NA) +
  coord_cartesian(ylim = c(0, 60)) +
  labs(title = "Without the outlier points, classic and electric bike duration is nearly identical",
       x = "Bike Type",
       y = "Trip Duration in Minutes"
  ) + ops_theme

Q9d. While classic and electric bikes seemed to have different average trip duration, this was likely due to outliers. A boxplot reveals that, without the outliers, trip duration is nearly identical between the two.

Q9e. If I wanted to make the boxes look meaningfully different, I would not exclude the outliers and a reader would conclude that riders of each bike type take drastically different trip durations, when in reality they are similar. This is a class crime because it misrepresents the data.
```
## Part 11
## Reflection
```
AI Disclosure. I used a generative AI tool in part 3a to troubleshoot how to filter out S99 without also dropping trips with a missing end station. I used it for part 4b to explain how to make the month column return as a label instead of a number. I used it in part 6a to troubleshoot why I was receiving an error for the column I was trying to create. I used AI for part 7a, because I did not know what qualified as a theme override--it gave me two examples of theme overrides that I decided to use, because I wasn't sure if geom_point() or geom_hline() were considered theme overrides. I used it for part 8a to explain how to order the y-axis by arrivals_per_dock values. I used it in part 9b for how to suppress the outlier points and changing the y-axis range by zooming.
```