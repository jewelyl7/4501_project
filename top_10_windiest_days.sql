
WITH pickup_datetime AS (
SELECT strftime("%Y-%m-%d", DATE) 
FROM daily_weather 
GROUP BY strftime("%Y-%m-%d", DATE)
ORDER by DailyAverageWindSpeed DESC  
LIMIT 10
)
SELECT (SELECT COUNT(*) FROM taxi_trips where taxi_trips.pickup_datetime==pickup_datetime ) 
+ (SELECT COUNT(*) FROM uber_trips where uber_trips.pickup_datetime==pickup_datetime) AS total
