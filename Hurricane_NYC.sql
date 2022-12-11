
WITH new_trips AS (
SELECT strftime ('%Y-%m-%d %H',pickup_datetime) AS Hr, count(*) AS Ct FROM(
SELECT pickup_datetime FROM uber_trips 
WHERE strftime('%Y-%m-%d',pickup_datetime) IN ('2012-10-22','2012-10-23','2012-10-24','2012-10-25','2012-10-26','2012-10-27','2012-10-28','2012-10-29','2012-10-30') 
UNION ALL
SELECT pickup_datetime FROM taxi_trips
WHERE strftime('%Y-%m-%d',pickup_datetime) IN ('2012-10-22','2012-10-23','2012-10-24','2012-10-25','2012-10-26','2012-10-27','2012-10-28','2012-10-29','2012-10-30') 
)
GROUP BY strftime ('%Y-%m-%d %H',pickup_datetime)
), new_weather AS(
SELECT strftime ('%Y-%m-%d %H',date) AS Hr, HourlyPrecipitation, HourlyWindSpeed FROM hourly_weather 
WHERE strftime('%Y-%m-%d', date) IN ('2012-10-22','2012-10-23','2012-10-24','2012-10-25','2012-10-26','2012-10-27','2012-10-28','2012-10-29','2012-10-30') 
GROUP BY strftime ('%Y-%m-%d %H',date)
)

SELECT  new_trips.Hr, new_trips.Ct, coalesce(new_weather.HourlyPrecipitation, 0), coalesce(new_weather.HourlyWindSpeed, 0) 
FROM new_trips LEFT JOIN new_weather ON new_weather.Hr =new_trips.Hr

