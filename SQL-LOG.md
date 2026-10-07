# DATA 501; Assignment 7 SQL Log

**Name:** Riley Sapp
**NetID:** rsapp4
**SQL tool used:** DB Browser for SQLite, "Execute SQL" tab

## Part 0
```
0a:
T0057984	2025-01-01 00:06:48	2025-01-01 00:19:16	S17	S16	casual	electric
T0073896	2025-01-01 00:40:20	2025-01-01 01:20:19	S09	S08	casual	classic
T0206129	2025-01-01 00:42:40	2025-01-01 01:10:30	S21	S09	member	classic
T0163585	2025-01-01 00:42:54	2025-01-01 00:57:56	S06	S06	casual	electric
T0094124	2025-01-01 01:19:33	2025-01-01 01:50:22	S04	S12	casual	electric

0b:
station_id	TEXT	0		1
station_name	TEXT	1		0
neighborhood	TEXT	0		0
latitude	REAL	0		0
longitude	REAL	0		0
The primary key is station_id.

Q0:
PRAGMA table_info(stations) tells you the data type of each column, which Excel would not tell you.

## Part 1
