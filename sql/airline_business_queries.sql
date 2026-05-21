/*
=========================================================
Airline Passenger Satisfaction Analysis
SQL Business Queries

Objective:
Use SQL to analyze the key factors associated with airline
passenger satisfaction.
=========================================================
*/


/*
=========================================================
Business Question 1
What is the overall passenger satisfaction distribution?
=========================================================
*/

SELECT
    satisfaction,
    COUNT(*) AS total_passengers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_of_passengers
FROM airline_data
GROUP BY satisfaction;


/*
=========================================================
Business Question 2
Which service attributes differentiate satisfied passengers
from neutral or dissatisfied passengers?
=========================================================
*/

SELECT
    satisfaction,
    ROUND(AVG(`Online boarding`), 2) AS avg_online_boarding,
    ROUND(AVG(`Seat comfort`), 2) AS avg_seat_comfort,
    ROUND(AVG(`Inflight entertainment`), 2) AS avg_inflight_entertainment,
    ROUND(AVG(`Cleanliness`), 2) AS avg_cleanliness,
    ROUND(AVG(`Inflight service`), 2) AS avg_inflight_service
FROM airline_data
GROUP BY satisfaction;


/*
=========================================================
Business Question 3
How do flight delays differ between satisfaction groups?
=========================================================
*/

SELECT
    satisfaction,
    ROUND(AVG(`Departure Delay in Minutes`), 2) AS avg_departure_delay,
    ROUND(AVG(`Arrival Delay in Minutes`), 2) AS avg_arrival_delay
FROM airline_data
GROUP BY satisfaction;


/*
=========================================================
Business Question 4
How does passenger satisfaction vary by travel class?
=========================================================
*/

SELECT
    Class,
    COUNT(*) AS total_passengers,
    SUM(CASE WHEN satisfaction = 'satisfied' THEN 1 ELSE 0 END) AS satisfied_passengers,
    ROUND(
        SUM(CASE WHEN satisfaction = 'satisfied' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS satisfaction_rate
FROM airline_data
GROUP BY Class
ORDER BY satisfaction_rate DESC;


/*
=========================================================
Business Question 5
Are loyal customers more satisfied than disloyal customers?
=========================================================
*/

SELECT
    `Customer Type`,
    COUNT(*) AS total_passengers,
    SUM(CASE WHEN satisfaction = 'satisfied' THEN 1 ELSE 0 END) AS satisfied_passengers,
    ROUND(
        SUM(CASE WHEN satisfaction = 'satisfied' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS satisfaction_rate
FROM airline_data
GROUP BY `Customer Type`
ORDER BY satisfaction_rate DESC;


/*
=========================================================
Additional Analysis
Which travel class experiences the highest average delays?
=========================================================
*/

SELECT
    Class,
    ROUND(AVG(`Departure Delay in Minutes`), 2) AS avg_departure_delay,
    ROUND(AVG(`Arrival Delay in Minutes`), 2) AS avg_arrival_delay
FROM airline_data
GROUP BY Class
ORDER BY avg_arrival_delay DESC;
