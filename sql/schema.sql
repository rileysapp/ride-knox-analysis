PRAGMA foreign_keys = ON;

CREATE TABLE stations (
station_id TEXT PRIMARY KEY NOT NULL,
station_name TEXT NOT NULL,
neighborhood TEXT NOT NULL,
docks INTEGER NOT NULL CHECK (docks > 0),
latitude REAL NOT NULL,
longitude REAL NOT NULL,
year_installed INTEGER NOT NULL
);


CREATE TABLE trips (
trip_id TEXT PRIMARY KEY,
start_time TEXT NOT NULL,
end_time TEXT,
start_station_id TEXT NOT NULL REFERENCES stations(station_id),
end_station_id TEXT REFERENCES stations(station_id),
rider_type TEXT NOT NULL CHECK (rider_type IN ('member','casual','day_pass')),
bike_type TEXT NOT NULL CHECK (bike_type IN ('classic','electric')),
CHECK (end_time IS NULL OR end_time > start_time)
);

CREATE TABLE dock_changes (
change_id INTEGER PRIMARY KEY,
station_id TEXT NOT NULL REFERENCES stations(station_id),
effective_date TEXT NOT NULL,
docks_before INTEGER NOT NULL CHECK (docks_before > 0),
docks_after INTEGER NOT NULL CHECK (docks_after > 0),
reason TEXT NOT NULL DEFAULT 'ops request',
CHECK (docks_after != docks_before)
);