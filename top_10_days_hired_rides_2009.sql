 SELECT strftime('%Y-%m-%d', pickup_datetime), count(*), AVG(distance) FROM(
SELECT pickup_datetime, distance FROM uber_trips WHERE strftime('%Y', pickup_datetime)='2009'
UNION ALL
SELECT pickup_datetime, distance FROM taxi_trips WHERE strftime('%Y', pickup_datetime)='2009') 
GROUP BY strftime('%Y-%m-%d', pickup_datetime) ORDER BY count(*) DESC
LIMIT 10
;
