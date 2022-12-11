
CREATE TABLE IF NOT EXISTS hourly_weather (
    hourlyid INTEGER PRIMARY KEY AUTOINCREMENT,
    DATE DATETIME,
    HourlyPrecipitation FLOAT,
    HourlyWindSpeed FLOAT
);


CREATE TABLE IF NOT EXISTS daily_weather (
    dailyid INTEGER PRIMARY KEY AUTOINCREMENT,
    DATE DATETIME,
    DailyAverageWindSpeed FLOAT
);


CREATE TABLE IF NOT EXISTS taxi_trips (
   taxi_id INTEGER PRIMARY KEY AUTOINCREMENT,
   pickup_datetime DATETIME,
   pickup_longitude DOUBLE,
   pickup_latitude DOUBLE,
   dropoff_longitude DOUBLE,
   dropoff_latitude DOUBLE,
   tip_amount FLOAT,
   distance DOUBLE
);

CREATE TABLE IF NOT EXISTS uber_trips (
   uber_id INTEGER PRIMARY KEY AUTOINCREMENT,
   pickup_datetime DATETIME,
   pickup_longitude DOUBLE,
   pickup_latitude DOUBLE,
   dropoff_longitude DOUBLE,
   dropoff_latitude DOUBLE,
   distance DOUBLE
);
