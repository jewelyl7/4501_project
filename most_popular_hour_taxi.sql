SELECT strftime ('%H',pickup_datetime) AS Hr, count(*) AS Ct
FROM taxi_trips GROUP BY strftime ('%H',pickup_datetime)