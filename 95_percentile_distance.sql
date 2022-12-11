
WITH hired_trips AS (
SELECT pickup_datetime, distance FROM taxi_trips 
WHERE strftime("%Y-%m", pickup_datetime)="2013-07" UNION ALL 
SELECT pickup_datetime, distance FROM uber_trips
WHERE strftime("%Y-%m", pickup_datetime)='2013-07'
)
SELECT distance from (SELECT
    distance,
    printf('%.2f', PERCENT_RANK() OVER( 
        ORDER BY distance 
    )) Rank FROM hired_trips ORDER BY Rank DESC)
    WHERE Rank ='0.95' LIMIT 1
