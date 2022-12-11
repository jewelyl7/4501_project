SELECT strftime('%w',pickup_datetime) AS Day, count(*) AS Ct
FROM uber_trips GROUP BY strftime('%w',pickup_datetime)