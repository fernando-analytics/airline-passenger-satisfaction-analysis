-- Average delay by travel class

SELECT Travel_Class,
AVG(Departure_Delay_Minutes) AS Average_Delay
FROM airline_data
GROUP BY Travel_Class;


-- Satisfaction by travel class

SELECT Travel_Class,
Satisfaction,
COUNT(*) AS Total_Passengers
FROM airline_data
GROUP BY Travel_Class,Satisfaction;


-- Average seat comfort score

SELECT Satisfaction,
AVG(Seat_Comfort) AS Average_Comfort
FROM airline_data
GROUP BY Satisfaction;


-- Flights with high delays

SELECT *
FROM airline_data
WHERE Departure_Delay_Minutes > 60;
