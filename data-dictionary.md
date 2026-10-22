## Data description

# stations: Existing stations in operation by Ride Knox
```
station_id: Primary key
station_name: Name of station
neighborhood: Station neighborhood location
docks: Number of docks located at a station (must be more than 0)
latitude: Latitude of location
longitude: Longitude of location
year_installed: Year that station was installed
```
# trips: Recorded trips by customers; checks if end_time is null or if the end time is earlier than the start_time to ensure the trip is a possible trip
```
trip_id: Primary key
start_time: Text; the time the trip began
end_time: the time the trip ended (can be null)
start_station_id: Station ID of start (references stations)
end_station_id: Station ID of end (references stations)
rider_type: Whether a rider is a day pass, a casual rider, or a member
bike_type: Whether a bike is classic or electric
Note: To solve the rider-product problem, I chose to widen the CHECK. I did this because Ride Knox does not frequently add new rider types, so adding it to the CHECK prevents an extra join in every query. However, this would pose a problem if Ride Knox decided to add more products in the future, as this data would not be automatically added to the schema.
```

# dock_changes: The changes in dock count per station after the effective date; only shows stations that changed
```
change_id: Primary key
station_id: Which station was affected
effective_date: When the docks were changed
docks_before: The number of docks prior to the change
docks_after: The number of docks after the change
reason: Why the docks were changed (if none given, defaults to "ops request")