/****The Ultimate Guilde 2 Querries****/


/****Functions for manipulating Data in SQL Server***/

/**Choosing the appropriate data type**/
/*1*/
SELECT 
	company, 
	company_location, 
	bean_origin, 
	cocoa_percent, 
	rating
FROM ratings
WHERE company_location = 'Belgium'
	AND rating > 3.5;

/* What is rating */

select * from ratings



/*2*/
select * from voters

SELECT 
	first_name,
	last_name,
	birthdate,
	gender,
	email,
	country,
	total_votes
FROM voters
WHERE birthdate > '1990-01-01'
  AND total_votes > 100
  AND total_votes < 200;

/*3*/
ALTER TABLE voters
ADD last_vote_date date;

/*4*/
SELECT 
	first_name,
	last_name,     
	total_votes
FROM voters
WHERE total_votes > '120';

/*5*/
SELECT 
	bean_type,
	rating
FROM ratings
WHERE rating > '3';

/*6*/
SELECT 
	first_name + ' ' + last_name + ' was born in ' + CAST(YEAR(birthdate) AS nvarchar) + '.' 
FROM voters;


/*7*/
SELECT 
	CAST(total_votes/5 AS integer)
FROM voters;

SELECT 
	CAST(total_votes/5 AS int)
FROM voters;

/*8_a*/
SELECT 
	first_name,
	last_name,
	total_votes
FROM voters
WHERE CAST(total_votes AS varchar) LIKE '5%';

/*8*/
SELECT 
	email,
    CONVERT(varchar, birthdate, 107) AS birthdate
FROM voters;


/*9*/
SELECT 
	email,
    CONVERT(varchar, birthdate, 107) AS birthdate
FROM voters;

SELECT company,bean_origin, rating FROM ratings;
SELECT company, bean_origin, CONVERT(int, rating) AS rating FROM ratings;
SELECT company, bean_origin, CONVERT(float, rating) AS rating FROM ratings;
SELECT company, bean_origin, CONVERT(decimal, rating) AS rating FROM ratings;


/*9*/
SELECT company, bean_origin, rating FROM ratings
-- Convert the rating to an integer if you are using sql server 2017 and float if you are using sql server 2014 before comparison
WHERE CONVERT(float, rating) = 3;

/*10*/
SELECT 
	first_name,
	last_name,
	gender,
	country
FROM voters
WHERE country = 'Belgium'
	AND gender = 'F'
    AND total_votes > 20;


SELECT 
	company,
    bean_origin,
    rating
FROM ratings
-- Convert the rating to an integer before comparison. This will not run because of int data type
WHERE CONVERT(int, rating) = 3;



SELECT
	first_name,
    last_name,
	CONVERT(varchar(10), birthdate, 11) AS birthdate,
    gender,
    country,
    'Voted ' + CAST(total_votes AS varchar) + ' times.' AS comments
FROM voters
WHERE country = 'Belgium'
	AND gender = 'F'
    AND total_votes > 20;


/** the local system’s date, including the timezone information.*//

SELECT 
	GETDATE() AS Timezone;

SELECT 
	CONVERT(VARCHAR(24), SYSUTCDATETIME(), 107) AS HighPrecision,
	CONVERT(VARCHAR(24), SYSDATETIMEOFFSET(), 102) AS LowPrecision,
	CONVERT(VARCHAR(24), SYSDATETIMEOFFSET(), 11) AS LowPrecision;


SELECT 
	first_name,
	last_name,
	YEAR(first_vote_date)  AS first_vote_year,
	MONTH(first_vote_date) AS first_vote_month,
	DAY(first_vote_date) AS first_vote_day
FROM voters;


SELECT 
	first_name,
	last_name,
	YEAR(first_vote_date)  AS first_vote_year,
	MONTH(first_vote_date) AS first_vote_month,
	DAY(first_vote_date)   AS first_vote_day
FROM voters
WHERE YEAR(first_vote_date) > 2015;

SELECT 
	first_name,
	last_name,
	YEAR(first_vote_date)  AS first_vote_year,
	MONTH(first_vote_date) AS first_vote_month,
	DAY(first_vote_date)   AS first_vote_day
FROM voters
WHERE YEAR(first_vote_date) > 2015
  AND DAY(first_vote_date) <> 1;


  SELECT 
	first_name,
	last_name,
	first_vote_date,
	DATENAME(month, first_vote_date) AS first_vote_month
FROM voters;




SELECT 
	first_name,
	last_name,
	first_vote_date,
	DATENAME(dayofyear, first_vote_date) AS first_vote_dayofyear
FROM voters;

SELECT 
	first_name,
	last_name,
	first_vote_date,
	DATENAME(weekday, first_vote_date) AS first_vote_dayofweek
FROM voters;

SELECT 
	first_name,
	last_name,
	DATEPART(MONTH,first_vote_date) AS first_vote_month1,
    DATENAME(MONTH,first_vote_date) AS first_vote_month2,
	DATEPART(WEEKDAY,first_vote_date) AS first_vote_weekday1,
	DATENAME(WEEKDAY,first_vote_date) AS first_vote_weekday2
FROM voters;

SELECT 
	first_name,
	last_name,
   	YEAR(first_vote_date) AS first_vote_year, 
	MONTH(first_vote_date) AS first_vote_month,
	DATEFROMPARTS(YEAR(first_vote_date), MONTH(first_vote_date), 1) AS first_vote_starting_month
FROM voters;

DECLARE @date1 datetime = '2018-12-01';
DECLARE @date2 datetime = '2030-03-03';

/* Not running*/
select
@date2 - @date1 as sub1,
@date1 + @date2 as add1,
DATEDIFF(year, @date2 - @date1, @date1 + @date2)


SELECT 
	first_name,
	birthdate,
	DATEADD(YEAR, 18, birthdate) AS eighteenth_birthday
  FROM voters;



  SELECT 
	first_name,
	first_vote_date,
	DATEADD(DAY, 5, first_vote_date) AS processing_vote_date
  FROM voters;


  SELECT
	getdate() - 476 AS date_476days_ago;


	SELECT 
	DATEDIFF(week, '2019-01-01', getdate()) AS weeks_passed;


DECLARE @date1 NVARCHAR(20) = '2018-30-12';
SET DATEFORMAT ydm;
SELECT ISDATE(@date1) AS result;


DECLARE @date1 NVARCHAR(20) = '15/2019/4';
SET DATEFORMAT dym;
SELECT ISDATE(@date1) AS result;

DECLARE @date1 NVARCHAR(20) = '10.13.2019';
SET DATEFORMAT mdy;
SELECT ISDATE(@date1) AS result;


DECLARE @date1 NVARCHAR(20) = '18.4.2019';
SET DATEFORMAT dmy;
SELECT ISDATE(@date1) AS result;

DECLARE @date1 NVARCHAR(20) = '30.03.2019';

/**2019*/
SET LANGUAGE Dutch;
SELECT
	@date1 AS initial_date,
	ISDATE(@date1) AS is_valid,
	DATENAME(MONTH, @date1) AS month_name;


/* Running */
DECLARE @date1 NVARCHAR(20) = '32/12/13';
SET LANGUAGE Croatian;
SELECT
	@date1 AS initial_date,
	ISDATE(@date1) AS is_valid,
	DATENAME(MONTH, @date1) AS month_name,
	YEAR(@date1) AS year_name;


DECLARE @date1 NVARCHAR(20) = '12/18/55';
SET LANGUAGE English;
SELECT
	@date1 AS initial_date,
	ISDATE(@date1) AS is_valid,
	DATENAME(weekday, @date1) AS week_day,
	YEAR(@date1) AS year_name;

SELECT
	first_name,
    last_name,
    birthdate,
	first_vote_date,
	DATENAME(weekday, first_vote_date) AS first_vote_weekday
FROM voters;



SELECT
	first_name,
    last_name,
    birthdate,
	first_vote_date,
	DATENAME(weekday, first_vote_date) AS first_vote_weekday,
	YEAR(first_vote_date) AS first_vote_year	
FROM voters;


SELECT
	first_name,
    last_name,
    birthdate,
	first_vote_date,
	DATENAME(weekday, first_vote_date) AS first_vote_weekday,
	YEAR(first_vote_date) AS first_vote_year,
	DATEDIFF(year, birthdate, first_vote_date) AS age_at_first_vote	
FROM voters;


SELECT
	first_name,
    last_name,
    birthdate,
	first_vote_date,
	DATENAME(weekday, first_vote_date) AS first_vote_weekday,
	YEAR(first_vote_date) AS first_vote_year,
	DATEDIFF(YEAR, birthdate, first_vote_date) AS age_at_first_vote,	
	DATEDIFF(YEAR, birthdate, getdate()) AS current_age
FROM voters;


SELECT TOP 10 
	company, 
	broad_bean_origin,
	LEN(broad_bean_origin) AS length
FROM ratings
ORDER BY LEN(broad_bean_origin) DESC;



SELECT 
	first_name,
	last_name,
	email 
FROM voters
WHERE CHARINDEX('dan', first_name) > 0;


SELECT 
	first_name,
	last_name,
	email 
FROM voters
WHERE CHARINDEX('dan', first_name) > 0 
	AND CHARINDEX('z', last_name) > 0;


SELECT 
	first_name,
	last_name,
	email 
FROM voters
WHERE CHARINDEX('dan', first_name) > 0 
	AND CHARINDEX('z', last_name) = 0;

SELECT 
	first_name,
	last_name,
	email 
FROM voters
WHERE PATINDEX('%rr%', first_name) > 0;



SELECT 
	first_name,
	last_name,
	email 
FROM voters
WHERE PATINDEX('C_r%', first_name) > 0;

SELECT 
	first_name,
	last_name,
	email 
FROM voters
WHERE PATINDEX('%a%w%', first_name) > 0;

SELECT 
	first_name,
	last_name,
	email 
FROM voters
WHERE PATINDEX('%[xwq]%', first_name) > 0;


SELECT 
	company,
	bean_type,
	broad_bean_origin,
	'The company ' +  company + ' uses beans of type "' + bean_type + '", originating from ' + broad_bean_origin + '.'
FROM ratings
WHERE
	LOWER(broad_bean_origin) NOT LIKE '%unknown%';

SELECT 
	company,
	bean_type,
	broad_bean_origin,
	'The company ' +  company + ' uses beans of type "' + bean_type + '", originating from ' + broad_bean_origin + '.'
FROM ratings
WHERE 
	LOWER(broad_bean_origin) NOT LIKE '%unknown%'
    AND LOWER(bean_type) NOT LIKE '%unknown%';

SELECT 
	company,
	bean_type,
	broad_bean_origin,
	'The company ' +  UPPER(company) + ' uses beans of type "' + bean_type + '", originating from ' + UPPER(broad_bean_origin) + '.'
FROM ratings
WHERE 
	LOWER(broad_bean_origin) NOT LIKE '%unknown%'
    AND LOWER(bean_type) NOT LIKE '%unknown%';


SELECT 
	first_name,
	last_name,
	country,
	LEFT(first_name, 3) AS part1
FROM voters;

SELECT 
	first_name,
	last_name,
	country,
	LEFT(first_name, 3) AS part1,
    RIGHT(last_name, 3) AS part2
FROM voters;


SELECT 
	first_name,
	last_name,
	country,
	LEFT(first_name, 3) AS part1,
    RIGHT(last_name, 3) AS part2,
    RIGHT(birthdate, 2) AS part3
FROM voters;


SELECT 
	first_name,
	last_name,
	country,
	LEFT(first_name, 3) AS part1,
    RIGHT(last_name, 3) AS part2,
    RIGHT(birthdate, 2) AS part3,
    LEFT(first_name, 3) + RIGHT(last_name, 3) + '_' + RIGHT(birthdate, 2) as part4
FROM voters;

SELECT 
	email,
	SUBSTRING(email, 3, 5) AS some_letters
FROM voters;


DECLARE @sentence NVARCHAR(200) = 'Apples are neither oranges nor potatoes.'
SELECT
	SUBSTRING(@sentence, 1, 6) AS fruit1,
	SUBSTRING(@sentence, 20, 7) AS fruit2;


SELECT 
	first_name,
	last_name,
	email,
	REPLACE(email, 'yahoo.com', 'live.com') AS new_email
FROM voters;


SELECT 
	company AS initial_name,
	REPLACE(company, '&', 'and') AS new_name 
FROM ratings
WHERE CHARINDEX('&', company) > 0;

SELECT 
	company AS old_company,
	REPLACE(company, '(Valrhona)', '') AS new_company,
	bean_type,
	broad_bean_origin
FROM ratings
WHERE company = 'La Maison du Chocolat (Valrhona)';

SELECT 
	company AS old_company,
	REPLACE(company, '(Valrhona)', '') AS new_company,
	bean_type,
	broad_bean_origin
FROM ratings
WHERE company = 'La Maison du Chocolat (Valrhona)';




DECLARE @string1 NVARCHAR(100) = 'Chocolate with beans from';
DECLARE @string2 NVARCHAR(100) = 'has a cocoa percentage of';

SELECT 
	bean_type,
	bean_origin,
	cocoa_percent,
	@string1 + ' ' + bean_origin + ' ' + @string2 + ' ' + CAST(cocoa_percent AS nvarchar) AS message1
FROM ratings
WHERE 
	company = 'Ambrosia' 
	AND bean_type <> 'Unknown';




DECLARE @string1 NVARCHAR(100) = 'Chocolate with beans from';
DECLARE @string2 NVARCHAR(100) = 'has a cocoa percentage of';

SELECT 
	bean_type,
	bean_origin,
	cocoa_percent,
	@string1 + ' ' + bean_origin + ' ' + @string2 + ' ' + CAST(cocoa_percent AS nvarchar) AS message1,
	CONCAT(@string1, ' ', bean_origin, ' ', @string2, ' ', CAST(cocoa_percent AS nvarchar)) AS message2
FROM ratings
WHERE 
	company = 'Ambrosia' 
	AND bean_type <> 'Unknown';





DECLARE @string1 NVARCHAR(100) = 'Chocolate with beans from';
DECLARE @string2 NVARCHAR(100) = 'has a cocoa percentage of';

SELECT 
	bean_type,
	bean_origin,
	cocoa_percent,
	@string1 + ' ' + bean_origin + ' ' + @string2 + ' ' + CAST(cocoa_percent AS nvarchar) AS message1,
	CONCAT(@string1, ' ', bean_origin, ' ', @string2, ' ', cocoa_percent) AS message2,
	CONCAT_WS(' ', @string1, bean_origin, @string2, cocoa_percent) AS message3
FROM ratings
WHERE 
	company = 'Ambrosia' 
	AND bean_type <> 'Unknown';


/*2017 server build in function*/

SELECT
	STRING_AGG(bean_origin, ',') AS bean_origins
FROM ratings
WHERE company IN ('Bar Au Chocolat', 'Chocolate Con Amor', 'East Van Roasters');

/*2017 server build in function*/

SELECT 
	company,
	STRING_AGG(bean_origin, ',') AS bean_origins
FROM ratings
WHERE company IN ('Bar Au Chocolat', 'Chocolate Con Amor', 'East Van Roasters')
GROUP BY company;


SELECT 
	company,
	STRING_AGG(bean_origin, ',') WITHIN GROUP (ORDER BY bean_origin) AS bean_origins
FROM ratings
WHERE company IN ('Bar Au Chocolat', 'Chocolate Con Amor', 'East Van Roasters')
GROUP BY company;


/*2017 server build in function*/
DECLARE @phrase NVARCHAR(MAX) = 'In the morning I brush my teeth. In the afternoon I take a nap. In the evening I watch TV.'

SELECT value
FROM STRING_SPLIT(@phrase, '.');

DECLARE @phrase NVARCHAR(MAX) = 'In the morning I brush my teeth. In the afternoon I take a nap. In the evening I watch TV.'

SELECT value
FROM STRING_SPLIT(@phrase, ' ');


SELECT
	first_name,
    last_name,
	birthdate,
	email,
	country
FROM voters
WHERE LEN(first_name) < 5
	AND PATINDEX('j_a%@yahoo.com', email) > 0;


SELECT
	CONCAT('***' , first_name, ' ', UPPER(last_name), '***') AS name,
    last_name,
	birthdate,
	email,
	country
FROM voters
WHERE LEN(first_name) < 5
	AND PATINDEX('j_a%@yahoo.com', email) > 0; 

SELECT
	CONCAT('***' , first_name, ' ', UPPER(last_name), '***') AS name,
    REPLACE(birthdate, SUBSTRING(CAST(birthdate AS varchar), 3, 2), 'XX') AS birthdate,
	email,
	country
FROM voters
WHERE LEN(first_name) < 5
	AND PATINDEX('j_a%@yahoo.com', email) > 0;    


/**requires 2017 ***/
/** Operand data type varchar is invalid for avg operator. **/
SELECT 
	gender, 
	COUNT(customer_id) AS voters,
	SUM(total_votes) AS total_votes
FROM voters
GROUP BY gender;

SELECT 
	gender, 
	COUNT(customer_id) AS voters,
	SUM(cast(total_votes,decimal)) AS total_votes
FROM voters
GROUP BY gender;

SELECT 
	company,
	AVG(cocoa_percent) AS avg_cocoa,
	MIN(rating) AS min_rating,
	MAX(rating) AS max_rating
FROM ratings
GROUP BY company;


SELECT 
	company,
	AVG(cocoa_percent) AS avg_cocoa
FROM ratings
GROUP BY company;




/** Operand data type varchar is invalid for avg operator. **/

SELECT 
	company,
	AVG(cocoa_percent) AS avg_cocoa,
	MIN(rating) AS min_rating	
FROM ratings
GROUP BY company;

/** Operand data type varchar is invalid for avg operator. **/

SELECT 
	company,
	AVG(cocoa_percent) AS avg_cocoa,
	MIN(rating) AS min_rating,
	MAX(rating) AS max_rating
FROM ratings
GROUP BY company
ORDER BY MAX(rating) DESC;


SELECT 
	first_name,
	last_name,
	total_votes AS votes,
	LEAD(total_votes) OVER (ORDER BY total_votes) AS votes_next_voter,
	LEAD(total_votes) OVER (ORDER BY total_votes) - total_votes AS votes_diff
FROM voters
WHERE country = 'France'
ORDER BY total_votes;


/*works on 2014**/


SELECT 
	broad_bean_origin AS bean_origin,
	rating,
	cocoa_percent,
	LAG(cocoa_percent) 
		OVER(PARTITION BY broad_bean_origin ORDER BY rating) AS percent_lower_rating
FROM ratings
WHERE company = 'Fruition'
ORDER BY broad_bean_origin, rating ASC;


SELECT 
	first_name + ' ' + last_name AS name,
	country,
	birthdate,
	FIRST_VALUE(birthdate) 
	OVER (PARTITION BY country ORDER BY birthdate) AS oldest_voter,
	LAST_VALUE(birthdate) 
		OVER (PARTITION BY country ORDER BY birthdate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
				) AS youngest_voter
FROM voters
WHERE country IN ('Spain', 'USA');


DECLARE @number1 DECIMAL(18,2) = -5.4;
DECLARE @number2 DECIMAL(18,2) = 7.89;
DECLARE @number3 DECIMAL(18,2) = 13.2;
DECLARE @number4 DECIMAL(18,2) = 0.003;

DECLARE @result DECIMAL(18,2) = @number1 * @number2 - @number3 - @number4;
SELECT 
	@result AS result,
	ABS(@result) AS abs_result;

DECLARE @number1 DECIMAL(18,2) = -5.4;
DECLARE @number2 DECIMAL(18,2) = 7.89;
DECLARE @number3 DECIMAL(18,2) = 13.2;
DECLARE @number4 DECIMAL(18,2) = 0.003;

DECLARE @result DECIMAL(18,2) = @number1 * @number2 - @number3 - @number4;
SELECT 
	@result AS result,
	ABS(@result) AS abs_result,
	SIGN(@result) AS sign_result;


SELECT
	rating,
	CEILING(rating) AS round_up
FROM ratings;


SELECT
	rating,
	CEILING(cast(rating as float)) AS round_up,
	FLOOR(cast(rating as float)) AS round_down
FROM ratings;


SELECT
	rating,
	CEILING(cast(rating as float)) AS round_up,
	FLOOR(cast(rating as float)) AS round_down,
	ROUND(cast(rating as float), 1) AS round_onedec
FROM ratings;


SELECT
	rating,
	CEILING(rating) AS round_up,
	FLOOR(rating) AS round_down,
	ROUND(rating, 1) AS round_onedec,
	ROUND(rating, 2) AS round_twodec
FROM ratings;

DECLARE @number DECIMAL(4, 2) = 4.5;
DECLARE @power INT = 4;

SELECT
	@number AS number,
	@power AS power,
	POWER(@number, @power) AS number_to_power,
	SQUARE(@number) num_squared,
	SQRT(@number) num_square_root;


/* requires 2017 */
SELECT 
	company, 
	COUNT(*) AS flavors,
	MIN(cast(rating as float)) AS lowest_score,
	MAX(cast(rating as float)) AS highest_score,
	AVG(cast(rating as float)) AS avg_score	  
FROM ratings
GROUP BY company
ORDER BY flavors DESC;


SELECT 
	company, 
	COUNT(*) AS flavors,
	MIN(cast(rating as float)) AS lowest_score,  
	MAX(cast(rating as float)) AS highest_score,   
	AVG(cast(rating as float)) AS avg_score,
    ROUND(AVG(cast(rating as float)), 1) AS round_avg_score	
FROM ratings
GROUP BY company
ORDER BY flavors DESC;

SELECT 
	company, 
	COUNT(*) AS flavors,
	MIN(CAST(rating AS float)) AS lowest_score,   
	MAX(cast (rating as float))AS highest_score,   
	AVG(cast (rating as float)) AS avg_score,
    ROUND(AVG(cast (rating as float)), 1) AS round_avg_score,
    CEILING(AVG(cast(rating as float))) AS round_up_avg_score,   
	FLOOR(AVG(cast(rating as float))) AS round_down_avg_score
FROM ratings
GROUP BY company
ORDER BY flavors DESC;




/* Introduction to SQL Server*/ 

/*Intermediate SQL*/
SELECT AVG(CAST(DurationSeconds AS float)) AS Average, 
       MIN(CAST(DurationSeconds AS float)) AS Minimum, 
       MAX(CAST (DurationSeconds AS float)) AS Maximum
FROM Incidents;



/* TIME SERIES IN SQL*/
SELECT
	c.Date
FROM dbo.Calendar c
WHERE
	c.MonthName = 'December'
	AND c.DayName = 'Tuesday'
	AND c.CalendarYear BETWEEN 2008 AND 2010
ORDER BY
	c.Date;



SELECT
	c.Date
FROM dbo.CalendarTable c
WHERE
	c.FiscalWeekOfYear = 29
	AND c.FiscalYear = 2019
ORDER BY
	c.Date ASC;


SELECT
	ir.IncidentDate,
	c.FiscalDayOfYear,
	c.FiscalWeekOfYear
FROM dbo.IncidentRollupTable ir
	INNER JOIN dbo.CalendarTable c
		ON ir.IncidentDate = c.Date
WHERE
	ir.IncidentTypeID = 3
	AND c.FiscalYear = 2019
	AND c.FiscalQuarter = 3;


	SELECT TOP(10)
	DATEFROMPARTS(c.CalendarYear, c.CalendarMonth, c.Day) AS CalendarDate
FROM dbo.CalendarTable c
WHERE
	c.CalendarYear = 2017
ORDER BY
	c.FiscalDayOfYear ASC;

	SELECT * FROM languages
	SELECT * FROM countries


/* Does not work on ealier version of SQL*/
SELECT SUM(meal_price * order_quantity) AS revenue
FROM meals
JOIN orders_ ON meals.meal_id = orders_.meal_id
-- Keep only the records of customer ID 15
WHERE user_id = 15;

select * from meals

/* */
SELECT SUM(cast(meal_price as decimal) * cast(order_quantity as int)) AS revenue
  FROM meals
  JOIN orders_ ON meals.meal_id = orders_.meal_id
-- Keep only the records of customer ID 15
WHERE user_id = 15;


/*b careful with data types*/

SELECT AVG(cast(DurationSeconds AS float)) AS Average, 
       MIN(cast(DurationSeconds AS float)) AS Minimum, 
       MAX(cast(DurationSeconds AS float)) AS Maximum,
	   AVG(cast(DurationSeconds AS decimal)) AS Average_1, 
       MIN(cast(DurationSeconds AS decimal)) AS Minimum_1, 
       MAX(cast(DurationSeconds AS decimal)) AS Maximum_1
FROM Incidents;
--- Not running
SELECT TerritoryName, OrderDate, 
       ROW_NUMBER() 
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS OrderCount
FROM Orders;

---- SQL 2016
SELECT OrderDate, TerritoryName, 
	   STDEV(CAST(OrderPrice AS decimal) 
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS StdDevPrice	  
FROM Orders;

--- Not running
WITH ModePrice (OrderPrice, UnitPriceFrequency)
AS
(
	SELECT OrderPrice, 
	ROW_NUMBER() 
	OVER(PARTITION BY OrderPrice ORDER BY OrderPrice) AS UnitPriceFrequency
	FROM Orders 
)


/* Intermediate SQL Server */

/*1. Summarizing Data */
/* Write a T-SQL query which will return the average, minimum, and maximum values of the DurationSeconds column.*/

/*  */
SELECT AVG
(DurationSeconds) AS Average, 
       MIN(DurationSeconds) AS Minimum, 
       MAX(DurationSeconds) AS Maximum
FROM Incidents;

/* Creating grouped aggregations */

/*Write a T-SQL query to calculate the average, minimum, and maximum values of the DurationSeconds column grouped by Shape. You need to select an additional column. What is it?*/

SELECT Shape,
       AVG(DurationSeconds) AS Average, 
       MIN(DurationSeconds) AS Minimum, 
       MAX(DurationSeconds) AS Maximum
FROM Incidents
GROUP BY Shape;


/**Update the query to return only the records where the minimum of DurationSeconds column is greater than 1.*/

SELECT Shape,
       AVG(DurationSeconds) AS Average, 
       MIN(DurationSeconds) AS Minimum, 
       MAX(DurationSeconds) AS Maximum
FROM Incidents
GROUP BY Shape
HAVING MIN(DurationSeconds) > 1

--- Removing missing values


/*Write a T-SQL query which returns only the IncidentDateTime and IncidentState columns where IncidentState is not missin*/


SELECT IncidentDateTime, IncidentState
FROM Incidents
WHERE IncidentState IS NOT NULL;

SELECT Country, IncidentDateTime, IncidentState
FROM Incidents
WHERE IncidentState IS NULL;

/* Imputing missing values (I) */

/*Write a T-SQL query which only returns rows where IncidentState is missing.

Replace all the missing values in the IncidentState column with the values in the City column and name this new column Location.
*/

SELECT IncidentState, ISNULL(IncidentState, City) AS Location
FROM Incidents
WHERE IncidentState IS NULL;

--- Not working
select * from Incidents where IncidentState IS NULL
/*Imputing missing values (II)

Replace missing values in Country with the first non-missing value from IncidentState or City, in that order. Name the new column Location.
 */


SELECT Country, COALESCE(Country, IncidentState, City) AS Location
FROM Incidents
WHERE Country IS NULL;


/* Using CASE statements */

/*Create a new column, SourceCountry, defined from these cases:

    When Country is ‘us’ then it takes the value ‘USA’.
    Otherwise it takes the value ‘International’.
	*/


SELECT Country, 
       CASE WHEN Country = 'us'  THEN 'USA'
       ELSE 'International'
       END AS SourceCountry
FROM Incidents;


/*Creating several groups with CASE
DurationSeconds	SecondGroup
<= 120	1
> 120 and <= 600	2
> 600 and <= 1200	3
> 1201 and <= 5000	4
For all other values	5

Create a new column, SecondGroup, that uses the values in the DurationSeconds column based on the ranges mentioned above.
*/

---- Fail because of version
SELECT DurationSeconds, 
      CASE WHEN (DurationSeconds <= 120) THEN 1      
       WHEN (DurationSeconds > 120 AND DurationSeconds <= 600) THEN 2      
       WHEN (DurationSeconds > 600 AND DurationSeconds <= 1200) THEN 3           
       WHEN (DurationSeconds > 1201 AND DurationSeconds <= 5000) THEN 4  
       ELSE 5 
       END AS SecondGroup   
FROM Incidents;


/* 2. Math Functions

Calculating the total

Write a T-SQL query which will return the sum of the Quantity column as Total for each type of MixDesc.*/


SELECT MixDesc, SUM(Quantity) AS Total
FROM Shipments
GROUP BY MixDesc;



/* Counting the number of rows

Create a query that returns the number of rows for each type of MixDesc.*/


SELECT MixDesc, COUNT(MixDesc)
FROM Shipments
GROUP BY MixDesc;



--- Which date function should you use?

---- Suppose you want to calculate the number of years between two different dates, DateOne and DateTwo. Which SQL statement would you use to perform that calculation?

    SELECT DATEADD(YYY, DateOne, DateTwo
    SELECT DATEDIFF(DateOne, MM, DateTwo)
    SELECT DATEDIFF(YYYY, DateOne, DateTwo)
    SELECT DATEDIFF(DateOne, DateTwo, YYYY)

/*Counting the number of days between dates

Write a query that returns the number of days between OrderDate and ShipDa*/


SELECT OrderDate, ShipDate, 
       DATEDIFF(DD, OrderDate, ShipDate) AS Duration
FROM Shipments;


/*Adding days to a date

Write a query that returns the approximate delivery date as five days after the ShipDate.*/



SELECT OrderDate, 
       DATEADD(DD, 5, ShipDate) AS DeliveryDate
FROM Shipments;


/* Rounding numbers

Write a SQL query to round the values in the Cost column to the nearest whole number.*/



SELECT Cost, 
       ROUND(Cost, 0) AS RoundedCost
FROM Shipments;


/*Truncating numbers

Write a SQL query to truncate the values in the Cost column to the nearest whole number.*/



SELECT Cost, 
       ROUND(Cost, 0, 1) AS TruncateCost
FROM Shipments;



/*Calculating the absolute value

Write a query that converts all the negative values in the DeliveryWeight column to positive values.*/


SELECT DeliveryWeight,
       ABS(DeliveryWeight) AS AbsoluteValue
FROM Shipments;



/*Calculating squares and square roots

Write a query that calculates the square and square root of the WeightValue column.*/



SELECT WeightValue, 
       SQUARE(WeightValue) AS WeightSquare, 
       SQRT(WeightValue) AS WeightSqrt
FROM Shipments;




3./* Processing Data in SQL Server
 Creating and using variables

Create an integer variable named counter.

Assign the value 20 to this variable.*/



DECLARE @counter INT
SET @counter = 20

SELECT @counter;


/*Increment the variable counter by 1 and assign it back to counter.*/


/*Creating a WHILE loop

Write a WHILE loop that increments counter by 1 until counter is less than 30.*/



DECLARE @counter INT;
SET @counter = 20;

WHILE @counter < 30
BEGIN
	SELECT @counter = @counter + 1
END;


/*Queries with derived tables (I)

Return MaxGlucose from the derived table.

Join the derived table to the main query on Age*/


SELECT a.RecordId, a.Age, a.BloodGlucoseRandom,   
       b.MaxGlucose
FROM Kidney a
JOIN (SELECT Age, MAX(BloodGlucoseRandom) AS MaxGlucose FROM Kidney GROUP BY Age) b
ON a.Age = b.Age;




/*Queries with derived tables (II)

Create a derived table

    returning Age and MaxBloodPressure; the latter is the maximum of BloodPressure.
    is taken from the kidney table.
    is grouped by Age.

Join the derived table to the main query on

    blood pressure equal to max blood pressure.
    age.*/



	SELECT *
FROM Kidney a
JOIN 
(
    SELECT Age, MAX(BloodPressure) AS MaxBloodPressure
    FROM kidney
    GROUP BY Age) b
ON a.BloodPressure = b.MaxBloodPressure
AND a.Age = b.Age;




/* CTE syntax

Select all the T-SQL keywords used to create a Common table expression.

1. DEALLOCATE
2. OPEN
3. AS
4. WITH
5. CTE

    1 and 2
    2 and 5
    2 and 4
    3 and 4

</> Creating CTEs (I)

Create a CTE BloodGlucoseRandom that returns one column (MaxGlucose) which contains the maximum BloodGlucoseRandom in the table

Join the CTE to the main table (Kidney) on BloodGlucoseRandom and MaxGlucose*/


WITH BloodGlucoseRandom (MaxGlucose) 
AS (SELECT MAX(BloodGlucoseRandom) AS MaxGlucose FROM Kidney)

SELECT a.Age, b.MaxGlucose
FROM Kidney a
JOIN BloodGlucoseRandom b
ON a.BloodGlucoseRandom = b.MaxGlucose;



/*Creating CTEs (II)

Create a CTE BloodPressure that returns one column (MaxBloodPressure) which contains the maximum BloodPressure in the table.

Join this CTE (using an alias b) to the main table (Kidney) to return information about patients with the maximum BloodPressure.*/



WITH BloodPressure
AS (SELECT MAX(CAST(BloodPressure AS decimal)) AS MaxBloodPressure FROM Kidney)

SELECT *
FROM Kidney a
JOIN BloodPressure b
ON a.BloodPressure = b.MaxBloodPressure;



4. /*Window Functions
 Window functions with aggregations (I)

Write a T-SQL query that returns the sum of OrderPrice by creating partitions for each TerritoryNam*/


SELECT OrderID, TerritoryName, 
       SUM(CAST(OrderPrice AS float)) 
       OVER(PARTITION BY TerritoryName) AS TotalPrice
FROM Orders;


 /*Window functions with aggregations (II)

Count the number of rows in each partition.

Partition the table by TerritoryName.*/


		
	/***************************************************************************************************************************************************************Tested by MucNamara Chiwaye***********************************************************************/


SELECT OrderID, TerritoryName, 
       COUNT(OrderID) 
       OVER (PARTITION BY TerritoryName) AS TotalOrders
FROM Orders;



/*Do you know window functions?

Which of the following statements is incorrect regarding window queries?

    The window functions LEAD(), LAG(), FIRST_VALUE(), and LAST_VALUE() require ORDER BY in the OVER() clause.
    The standard aggregations like SUM(), AVG(), and COUNT() require ORDER BY in the OVER() clause.
    If the query contains OVER() and PARTITION BY the table is partitioned.
    The first row in a window where the LAG() function is used is NULL.

</> First value in a window

Write a T-SQL query that returns the first OrderDate by creating partitions for each TerritoryName*/

		
	/***************************************************************************************************************************************************************Tested by MucNamara Chiwaye***********************************************************************/



SELECT TerritoryName, OrderDate, 
       FIRST_VALUE(OrderDate) 
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS FirstOrder
FROM Orders;
SELECT * FROm  orders

/*
 Previous and next values

Write a T-SQL query that for each territory:

    Shifts the values in OrderDate one row down. Call this column PreviousOrder.
    Shifts the values in OrderDate one row up. Call this column NextOrder. You will need to PARTITION BY the territory

*/

SELECT TerritoryName, OrderDate, 
       -- Specify the previous OrderDate in the window
       LAG(OrderDate) 
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS PreviousOrder,
       -- Specify the next OrderDate in the window
       LEAD(OrderDate) 
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS NextOrder
FROM Orders;


/*Creating running totals

Create the window, partition by TerritoryName and order by OrderDate to calculate a running total of OrderPrice.*/

		
	/***************************************************************************************************************************************************************Tested by MucNamara Chiwaye***********************************************************************/




SELECT TerritoryName, OrderDate, 
       SUM(CAST(OrderPrice AS decimal)) 
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS TerritoryTotal	  
FROM Orders;



/*Assigning row numbers

Write a T-SQL query that assigns row numbers to all records partitioned by TerritoryName and ordered by OrderDate.*/



		
	/***************************************************************************************************************************************************************Tested by MucNamara Chiwaye***********************************************************************/


SELECT TerritoryName, OrderDate, 
       ROW_NUMBER() 
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS OrderCount
FROM Orders;



/*Calculating standard deviation

Create the window, partition by TerritoryName and order by OrderDate to calculate a running standard deviation of OrderPrice.*/
/*tHIS WILL NOT WORK*/

SELECT OrderDate, TerritoryName, 
	   STDEV(OrderPrice AS float)) 
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS StdDevPrice	  
FROM Orders;


		
	/***************************************************************************************************************************************************************Tested by MucNamara Chiwaye***********************************************************************/


SELECT OrderDate, TerritoryName, 
	   STDEV(CAST(OrderPrice AS float)) 
       OVER(PARTITION BY TerritoryName ORDER BY OrderDate) AS StdDevPrice	  
FROM Orders;



		
	/***************************************************************************************************************************************************************Tested by MucNamara Chiwaye***********************************************************************/


/*Calculating mode (I)

Create a CTE ModePrice that returns two columns (OrderPrice and UnitPriceFrequency).

Write a query that returns all rows in this CTE.*/


WITH ModePrice (OrderPrice, UnitPriceFrequency)
AS
(
	SELECT OrderPrice, 
	ROW_NUMBER() 
	OVER(PARTITION BY OrderPrice ORDER BY OrderPrice) AS UnitPriceFrequency
	FROM Orders 
)

-- Select everything from the CTE
SELECT * FROM ModePrice;




/*Calculating mode (II)

Use the CTE ModePrice to return the value of OrderPrice with the highest row number.*/


WITH ModePrice (OrderPrice, UnitPriceFrequency)
AS
(
	SELECT OrderPrice,
	ROW_NUMBER() 
    OVER (PARTITION BY OrderPrice ORDER BY OrderPrice) AS UnitPriceFrequency
	FROM Orders
)

SELECT OrderPrice AS ModeOrderPrice
FROM ModePrice
WHERE UnitPriceFrequency IN (SELECT MAX(UnitPriceFrequency) FROM ModePrice);




/*Time Series Analysis in SQL Server
1. Working with Dates and Times
</> Break out a date into year, month, and day

Use the YEAR(), MONTH(), and DAY() functions to determine the year, month, and day for the current date and time.  */

DECLARE
	@SomeTime DATETIME2(7) = SYSUTCDATETIME();

SELECT
	YEAR(@SomeTime) AS TheYear,
	MONTH(@SomeTime) AS TheMonth,
	DAY(@SomeTime) AS TheDay;



/*Break a date and time into component parts

Using the DATEPART() function, fill in the appropriate date parts. For a list of parts, review */


DECLARE
	@BerlinWallFalls DATETIME2(7) = '1989-11-09 23:49:36.2294852';

-- Fill in each date part
SELECT
	DATEPART(YEAR, @BerlinWallFalls) AS TheYear,
	DATEPART(MONTH, @BerlinWallFalls) AS TheMonth,
	DATEPART(DAY, @BerlinWallFalls) AS TheDay,
	DATEPART(DAYOFYEAR, @BerlinWallFalls) AS TheDayOfYear,
	DATEPART(WEEKDAY, @BerlinWallFalls) AS TheDayOfWeek,
	DATEPART(WEEK, @BerlinWallFalls) AS TheWeek,
	DATEPART(SECOND, @BerlinWallFalls) AS TheSecond,
	DATEPART(NANOSECOND, @BerlinWallFalls) AS TheNanosecond;
—


/*Using the DATENAME() function, fill in the appropriate function calls.*/


DECLARE
	@BerlinWallFalls DATETIME2(7) = '1989-11-09 23:49:36.2294852';

SELECT
	DATENAME(YEAR, @BerlinWallFalls) AS TheYear,
	DATENAME(MONTH, @BerlinWallFalls) AS TheMonth,
	DATENAME(DAY, @BerlinWallFalls) AS TheDay,
	DATENAME(DAYOFYEAR, @BerlinWallFalls) AS TheDayOfYear,
	DATENAME(WEEKDAY, @BerlinWallFalls) AS TheDayOfWeek,
	DATENAME(WEEK, @BerlinWallFalls) AS TheWeek,
	DATENAME(SECOND, @BerlinWallFalls) AS TheSecond,
	DATENAME(NANOSECOND, @BerlinWallFalls) AS TheNanosecond

	/***************************************************************************************************************************************************************Tested by MucNamara Chiwaye***********************************************************************/

/*How many DATENAME() results differ from their DATEPART() counterparts?

    Zero
    One
    Two
    Three
    Four or more

</> Date math and leap years

Fill in the date parts and intervals needed to determine how SQL Server works on February 29th of a leap year.

2012 was a leap year. The leap year before it was 4 years earlier, and the leap year after it was 4 years later*/



DECLARE
	@LeapDay DATETIME2(7) = '2012-02-29 18:00:00';

SELECT
	DATEADD(DAY, -1, @LeapDay) AS PriorDay,
	DATEADD(DAY, 1, @LeapDay) AS NextDay,
	DATEADD(YEAR, -4, @LeapDay) AS PriorLeapYear,
	DATEADD(YEAR, 4, @LeapDay) AS NextLeapYear,
	DATEADD(YEAR, -1, @LeapDay) AS PriorYear;



/*Fill in the date parts and intervals needed to determine how SQL Server works on days next to a leap year.*/



DECLARE
	@PostLeapDay DATETIME2(7) = '2012-03-01 18:00:00';

SELECT
	DATEADD(DAY, -1, @PostLeapDay) AS PriorDay,
	DATEADD(DAY, 1, @PostLeapDay) AS NextDay,
	DATEADD(YEAR, -4, @PostLeapDay) AS PriorLeapYear,
	DATEADD(YEAR, 4, @PostLeapDay) AS NextLeapYear,
	DATEADD(YEAR, -1, @PostLeapDay) AS PriorYear,
	DATEADD(DAY, -1, DATEADD(YEAR, 4, @PostLeapDay)) AS NextLeapDay,
    DATEADD(DAY, -2, @PostLeapDay) AS TwoDaysAgo;


/*Taking TwoDaysAgo from the prior step, use the DATEDIFF() function to test how it handles leap years.*/



@PostLeapDay DATETIME2(7) = '2012-03-01 18:00:00',
    @TwoDaysAgo DATETIME2(7);

SELECT
	@TwoDaysAgo = DATEADD(DAY, -2, @PostLeapDay);

SELECT
	@TwoDaysAgo AS TwoDaysAgo,
	@PostLeapDay AS SomeTime,
	DATEDIFF(DAY, @TwoDaysAgo, @PostLeapDay) AS DaysDifference,
	DATEDIFF(HOUR, @TwoDaysAgo, @PostLeapDay) AS HoursDifference,
    DATEDIFF(MINUTE, @TwoDaysAgo, @PostLeapDay) AS MinutesDifferenc



	/*Rounding dates

Use DATEADD() and DATEDIFF() in conjunction with date parts to round down our time to the day, hour, and minute.*/



@SomeTime DATETIME2(7) = '2018-06-14 16:29:36.2248991';

SELECT
	DATEADD(DAY, DATEDIFF(DAY, 0, @SomeTime), 0) AS RoundedToDay,
	DATEADD(HOUR, DATEDIFF(HOUR, 0, @SomeTime), 0) AS RoundedToHour,
	DATEADD(MINUTE, DATEDIFF(MINUTE, 0, @SomeTime), 0) AS RoundedToMinute;



/* Formatting dates with CAST() and CONVERT()

Fill in the appropriate function, CAST(), for each example.

Using the aliases as a guide, fill in the appropriate variable for each example.*/

DECLARE
@CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245',
	@OlderDateType DATETIME = '2016-11-03 00:30:29.245';

SELECT
	CAST(@CubsWinWorldSeries AS DATE) AS CubsWinDateForm,
	CAST(@CubsWinWorldSeries AS NVARCHAR(30)) AS CubsWinStringForm,
	CAST(@OlderDateType AS DATE) AS OlderDateForm,
	CAST(@OlderDateType AS NVARCHAR(30)) AS OlderStringForm;



/*For the inner function, turn the date the Cubs won the World Series into a DATE data type using the CAST() function.

For the outer function, reshape this date as an NVARCHAR(30) using the CAST() function.*/



@CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245';

SELECT
	CAST(CAST(@CubsWinWorldSeries AS DATE) AS NVARCHAR(30)) AS DateStringForm;



/*Use the CONVERT() function to translate the date the Cubs won the world series into the DATE and NVARCHAR(30) data types.

The functional form for CONVERT() is CONVERT(DataType, SomeValue).*/



@CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245';

SELECT
	CONVERT(DATE, @CubsWinWorldSeries) AS CubsWinDateForm,
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries) AS CubsWinStringForm;


/*Fill in the correct function call for conversion.

The UK date formats are 3 and 103, representing two-digit year (dmy) and four-digit year (dmyyyy), respectively.

The corresponding US date formats are 1 and 101.*/





DECLARE
	@CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245';

SELECT
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 0) AS DefaultForm,
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 3) AS UK_dmy,
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 1) AS US_mdy,
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 103) AS UK_dmyyyy,
	CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 101) AS US_mdyyyy;





/* Formatting dates with FORMAT()

Fill in the function and use the ‘d’ format parameter (note that this is case sensitive!) to format as short dates. Also, fill in the culture for Japan, which in the .NET framework is jp-JP (this is not case sensitive).
*/




DECLARE
	@Python3ReleaseDate DATETIME2(3) = '2008-12-03 19:45:00.033';

SELECT
	FORMAT(@Python3ReleaseDate, 'd', 'en-US') AS US_d,
	FORMAT(@Python3ReleaseDate, 'd', 'de-DE') AS DE_d,
	FORMAT(@Python3ReleaseDate, 'd', 'jp-JP') AS JP_d,
	FORMAT(@Python3ReleaseDate, 'd', 'zh-cn') AS CN_d;




/*Use the ‘D’ format parameter (this is case sensitive!) to build long dates. Also, fill in the culture for Indonesia, which in the .NET framework is id-ID.*/




@Python3ReleaseDate DATETIME2(3) = '2008-12-03 19:45:00.033';

SELECT
	FORMAT(@Python3ReleaseDate, 'D', 'en-US') AS US_D,
	FORMAT(@Python3ReleaseDate, 'D', 'de-DE') AS DE_D,
	FORMAT(@Python3ReleaseDate, 'D', 'id-ID') AS ID_D,
	FORMAT(@Python3ReleaseDate, 'D', 'zh-cn') AS CN_D;




/*Fill in the custom format strings needed to generate the results in preceding comments. Use date parts such as yyyy, MM, MMM, and dd. Capitalization is important for the FORMAT() function! See the full list at https://bit.ly/30SGA5a.
*/




DECLARE
	@Python3ReleaseDate DATETIME2(3) = '2008-12-03 19:45:00.033';
    
SELECT
	FORMAT(@Python3ReleaseDate, 'yyyyMMdd') AS F1,
	FORMAT(@Python3ReleaseDate, 'yyyy-MM-dd') AS F2,
	FORMAT(@Python3ReleaseDate, 'MMM dd+yyyy') AS F3,
	FORMAT(@Python3ReleaseDate, 'MM yy dd') AS F4,
	FORMAT(@Python3ReleaseDate, 'dd HH:mm yyyy.ss') AS F5;




/*The benefits of calendar tables

Which of the following is not a benefit of using a calendar table?

    Calendar tables can simplify queries which perform complicated date math.
    Calendar tables can let you to perform actions you could not otherwise do in T-SQL.
    Calendar tables can improve performance when filtering on date conditions (such as finding all things which happened on the fifth Tuesday of a month).
    Calendar tables can ensure that different developers use the same sets of holidays in their queries.

 Try out a calendar table

Find the dates of all Tuesdays in December covering the calendar years 2008 through 2010.*/




c.Date
FROM dbo.Calendar c
WHERE
	c.MonthName = 'December'
	AND c.DayName = 'Tuesday'
	AND c.CalendarYear BETWEEN 2008 AND 2010
ORDER BY
	c.Date;



/*Find the dates for fiscal week 29 of fiscal year 2019.*/



/* to a calendar table

Fill in the blanks to determine which dates had type 3 incidents during the third fiscal quarter of FY2019.*/



ir.IncidentDate,
	c.FiscalDayOfYear,
	c.FiscalWeekOfYear
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
WHERE
	ir.IncidentTypeID = 3
	AND c.FiscalYear = 2019
	AND c.FiscalQuarter = 3;



/*Fill in the gaps in to determine type 4 incidents which happened on weekends in FY2019 after fiscal week 30.*/




SELECT
	ir.IncidentDate,
	c.FiscalDayOfYear,
	c.FiscalWeekOfYear
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
WHERE
	ir.IncidentTypeID = 4
	AND c.FiscalYear = 2019
	AND c.FiscalWeekOfYear > 30
	AND c.IsWeekend = 1;



 /*Converting to Dates and Times
 Build dates from parts

Create dates from component parts in the calendar table: calendar year, calendar month, and the day of the month.*/




SELECT TOP(10)
	DATEFROMPARTS(c.CalendarYear, c.CalendarMonth, c.Day) AS CalendarDate
FROM dbo.Calendar c
WHERE
	c.CalendarYear = 2017
ORDER BY
	c.FiscalDayOfYear ASC;


/*Create dates from the component parts of the calendar table. Use the calendar year, calendar month, and day of month.*/



SELECT TOP(10)
	c.CalendarQuarterName,
	c.MonthName,
	c.CalendarDayOfYear
FROM dbo.Calendar c
WHERE
	DATEFROMPARTS(c.CalendarYear, c.CalendarMonth, c.Day) >= '2018-06-01'
	AND c.DayName = 'Tuesday'
ORDER BY
	c.FiscalYear,
	c.FiscalDayOfYear ASC;




/*Build dates and times from parts

Build the date and time (using DATETIME2FROMPARTS()) that Neil and Buzz became the first people to land on the moon. Note the “2” in DATETIME2FROMPARTS(), meaning we want to build a DATETIME2 rather than a DATETIME.

Build the date and time (using DATETIMEFROMPARTS()) that Neil and Buzz took off from the moon. Note that this is for a DATETIME, not a DATETIME2.*/


DATETIME2FROMPARTS(1969, 07, 20, 20, 17, 00, 000, 0) AS TheEagleHasLanded,
	DATETIMEFROMPARTS(1969, 07, 21, 18, 54, 00, 000) AS MoonDeparture;




 /*Build dates and times with offsets from parts

Build a DATETIMEOFFSET which represents the last millisecond before the Y2.038K problem hits. The offset should be UTC.

Build a DATETIMEOFFSET which represents the moment devices hit the Y2.038K issue in UTC time. Then use the AT TIME ZONE operator to convert this to Eastern Standard Time.*/



SELECT
	DATETIMEOFFSETFROMPARTS(2038, 01, 19, 03, 14, 07, 999, 0, 0, 3) AS LastMoment,
	DATETIMEOFFSETFROMPARTS(2038, 01, 19, 03, 14, 08, 0, 0, 0, 3) AT TIME ZONE 'Eastern Standard Time' AS TimeForChaos;





/* Cast strings to dates

Cast the input string DateText in the dbo.Dates temp table to the DATE data type.*/


Cast the input string DateText in the dbo.Dates temp table to the DATETIME2(7) data type. 




d.DateText AS String,
	CAST(d.DateText AS DATE) AS StringAsDate,
	CAST(d.DateText AS DATETIME2(7)) AS StringAsDateTime2
FROM dbo.Dates d;





/*Convert strings to dates

Use the CONVERT() function to translate DateText into a date data type.

Then use the CONVERT() function to translate DateText into a DATETIME2(7) data type SET LANGUAGE 'GERMAN' */

SELECT
	d.DateText AS String,
	CONVERT(DATE, d.DateText) AS StringAsDate,
	CONVERT(DATETIME2, d.DateText) AS StringAsDateTime2
FROM dbo.Dates d;


/*
Changing a date’s offset

Fill in the appropriate function call for Brasilia, Brazil.

Fill in the appropriate function call and time zone for Chicago, Illinois. In August, Chicago is 2 hours behind Brasilia Standard Time.

Fill in the appropriate function call and time zone for New Delhi, India. India does not observe Daylight Savings Time, so in August, New Delhi is 8 1/2 hours ahead of Brasilia Standard Time. */

DECLARE
	@OlympicsUTC NVARCHAR(50) = N'2016-08-08 23:00:00';

SELECT
	SWITCHOFFSET(@OlympicsUTC, '-03:00') AS BrasiliaTime,
	SWITCHOFFSET(@OlympicsUTC, '-05:00') AS ChicagoTime,
	SWITCHOFFSET(@OlympicsUTC, '+05:30') AS NewDelhiTime;



/*Using the time zone DMV to look up times

Create a valid SQL query by dragging and dropping the items into the correct sequence*/




DECLARE @OlympicsUTC NVARCHAR(50) = N'2016-08-08 23:00:00';
SELECT
SWITCHOFFSET(@OlympicsUTC, tzi.current_utc_offset) AS NDelhiTime
FROM sys.time_zone_info AS tzi
WHERE
tzi.name = N'India Standard Time';



/*
Converting to a date offset

Fill in the time in Phoenix, Arizona, which, being Mountain Standard Time, was UTC -07:00

Fill in the time for Tuvalu, which is 12 hours ahead of UTC.*/



DECLARE
	@OlympicsClosingUTC DATETIME2(0) = '2016-08-21 23:00:00';

SELECT
	TODATETIMEOFFSET(DATEADD(HOUR, -7, @OlympicsClosingUTC), '-07:00') AS PhoenixTime,
	TODATETIMEOFFSET(DATEADD(HOUR, 12, @OlympicsClosingUTC), '+12:00') AS TuvaluTime;




 /*Try out type-safe date functions

Starting with the TRY_CONVERT() function, fill in the function name and input parameter for each example.*/



DECLARE
	@GoodDateINTL NVARCHAR(30) = '2019-03-01 18:23:27.920',
	@GoodDateDE NVARCHAR(30) = '13.4.2019',
	@GoodDateUS NVARCHAR(30) = '4/13/2019',
	@BadDate NVARCHAR(30) = N'SOME BAD DATE';

SELECT
	TRY_CONVERT(DATETIME2(3), @GoodDateINTL) AS GoodDateINTL,
	TRY_CONVERT(DATE, @GoodDateDE) AS GoodDateDE,
	TRY_CONVERT(DATE, @GoodDateUS) AS GoodDateUS,
	TRY_CONVERT(DATETIME2(3), @BadDate) AS BadDate;




/*With the prior TRY_CONVERT() solution in mind, use TRY_CAST() to see how they compare.*/


@GoodDateINTL NVARCHAR(30) = '2019-03-01 18:23:27.920',
	@GoodDateDE NVARCHAR(30) = '13.4.2019',
	@GoodDateUS NVARCHAR(30) = '4/13/2019',
	@BadDate NVARCHAR(30) = N'SOME BAD DATE';

SELECT
	TRY_CAST(@GoodDateINTL AS DATETIME2(3)) AS GoodDateINTL,
	TRY_CAST(@GoodDateDE AS DATE) AS GoodDateDE,
	TRY_CAST(@GoodDateUS AS DATE) AS GoodDateUS,
	TRY_CAST(@BadDate AS DATETIME2(3)) AS BadD



/*ne of our good dates returns NULL. Use TRY_PARSE() and specify de-de for the German date and en-us for the US date.*/




@GoodDateINTL NVARCHAR(30) = '2019-03-01 18:23:27.920',
	@GoodDateDE NVARCHAR(30) = '13.4.2019',
	@GoodDateUS NVARCHAR(30) = '4/13/2019',
	@BadDate NVARCHAR(30) = N'SOME BAD DATE';

SELECT
	TRY_PARSE(@GoodDateINTL AS DATETIME2(3)) AS GoodDateINTL,
	TRY_PARSE(@GoodDateDE AS DATE USING 'de-de') AS GoodDateDE,
	TRY_PARSE(@GoodDateUS AS DATE USING 'en-us') AS GoodDateUS,
	TRY_PARSE(@BadDate AS DATETIME2(3) USING 'sk-sk') AS BadDate;




/* Convert imported data to dates with time zones

Fill in the missing TRY_XXX() function name inside the EventDates common table expression.

Convert the EventDateOffset event dates to ‘UTC’. Call this output EventDateUTC.

Convert the EventDateOffset event dates to ‘US Eastern Standard Time’ using AT TIME ZONE. Call this output EventDateUSEast.*/

WITH EventDates AS
(
    SELECT
        TRY_CONVERT(DATETIME2(3), it.EventDate) AT TIME ZONE it.TimeZone AS EventDateOffset,
        it.TimeZone
    FROM dbo.ImportedTime it
        INNER JOIN sys.time_zone_info tzi
			ON it.TimeZone = tzi.name
)
SELECT
	CONVERT(NVARCHAR(50), ed.EventDateOffset) AS EventDateOffsetString,
	CONVERT(DATETIME2(0), ed.EventDateOffset) AS EventDateLocal,
	ed.TimeZone,
	CAST(ed.EventDateOffset AT TIME ZONE 'UTC' AS DATETIME2(0)) AS EventDateUTC,
	CAST(ed.EventDateOffset AT TIME ZONE 'US Eastern Standard Time'  AS DATETIME2(0)) AS EventDateUSEast
FROM EventDates ed;


/*Test type-safe conversion function performance

Fill in the correct conversion function based on its parameter signature.

Write down or remember the amount of time returned in the DATEDIFF() call.*/


-- Try out how fast the TRY_CAST() function is
-- by try-casting each DateText value to DATE
DECLARE @StartTimeCast DATETIME2(7) = SYSUTCDATETIME();
SELECT TRY_CAST(DateText AS DATE) AS TestDate FROM #DateText;
DECLARE @EndTimeCast DATETIME2(7) = SYSUTCDATETIME();

SELECT
    DATEDIFF(MILLISECOND, @StartTimeCast, @EndTimeCast) AS ExecutionTimeCast;



/*Fill in the correct conversion function based on its parameter signature.

Write down or remember the amount of time returned in the DATEDIFF() call.*/

 -- Try out how fast the TRY_PARSE() function is
-- by try-parsing each DateText value to DATE
DECLARE @StartTimeParse DATETIME2(7) = SYSUTCDATETIME();
SELECT TRY_PARSE(DateText AS DATE) AS TestDate FROM #DateText;
DECLARE @EndTimeParse DATETIME2(7) = SYSUTCDATETIME();

SELECT
    DATEDIFF(MILLISECOND, @StartTimeParse, @EndTimeParse) AS ExecutionTimeParse;


  /*Based on what you have learned so far, how would you compare the performance of TRY_PARSE() versus TRY_CAST() and TRY_CONVERT()?

    TRY_PARSE() is faster than both TRY_CAST() and TRY_CONVERT().
    TRY_PARSE() is faster than TRY_CAST() but slower than TRY_CONVERT().
    TRY_PARSE() is faster than TRY_CONVERT() but slower than TRY_CAST().
    TRY_CAST() and TRY_CONVERT() are both faster than TRY_PARSE().
    All three functions take approximately the same amount of time to complete.

3. Aggregating Time Series Data
</> Summarize data over a time frame

Fill in the appropriate aggregate function based on the column name. Choose from COUNT(), SUM(), 
  */

SELECT
	it.IncidentType,
	COUNT(1) AS NumberOfRows,
	SUM(ir.NumberOfIncidents) AS TotalNumberOfIncidents,
	MIN(ir.NumberOfIncidents) AS MinNumberOfIncidents,
	MAX(ir.NumberOfIncidents) AS MaxNumberOfIncidents,
	MIN(ir.IncidentDate) As MinIncidentDate,
	MAX(ir.IncidentDate) AS MaxIncidentDate
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.IncidentType it
		ON ir.IncidentTypeID = it.IncidentTypeID
WHERE
	ir.IncidentDate BETWEEN '2019-08-01' AND '2019-10-31'
GROUP BY
	it.IncidentType;

/* Calculating distinct counts

Return the count of distinct incident type IDs as NumberOfIncidentTypes

Return the count of distinct incident dates as NumberOfDaysWithIncidents

Fill in the appropriate function call and input column to determine number of unique incident types and number of days with incidents in our rollup table.
 */



 SELECT
	COUNT(DISTINCT ir.IncidentTypeID) AS NumberOfIncidentTypes,
	COUNT(DISTINCT ir.IncidentDate) AS NumberOfDaysWithIncidents
FROM dbo.IncidentRollup ir
WHERE
ir.IncidentDate BETWEEN '2019-08-01' AND '2019-10-31';



/* Calculating filtered aggregates

Fill in a CASE expression which lets us use the SUM() function to calculate the number of big-incident and small-incident days.

In the CASE expression, you should return 1 if the appropriate filter criterion is met and 0 otherwise.

Be sure to specify the alias when referencing a column, like ir.IncidentDate or it.IncidentType!
*/

SELECT
	it.IncidentType,
	SUM(CASE WHEN ir.NumberOfIncidents > 5 THEN 1 ELSE 0 END) AS NumberOfBigIncidentDays,
    SUM(CASE WHEN ir.NumberOfIncidents <= 5 THEN 1 ELSE 0 END) AS NumberOfSmallIncidentDays
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.IncidentType it
		ON ir.IncidentTypeID = it.IncidentTypeID
WHERE
	ir.IncidentDate BETWEEN '2019-08-01' AND '2019-10-31'
GROUP BY
it.IncidentType;




/*Working with statistical aggregate functions

Fill in the missing aggregate functions. For standard deviation and variance, use the sample functions rather than population functions.
 */

 SELECT
	it.IncidentType,
	AVG(ir.NumberOfIncidents) AS MeanNumberOfIncidents,
	AVG(CAST(ir.NumberOfIncidents AS DECIMAL(4,2))) AS MeanNumberOfIncidents,
	STDEV(ir.NumberOfIncidents) AS NumberOfIncidentsStandardDeviation,
	VAR(ir.NumberOfIncidents) AS NumberOfIncidentsVariance,
    COUNT(1) AS NumberOfRows
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.IncidentType it
		ON ir.IncidentTypeID = it.IncidentTypeID
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
WHERE
	c.CalendarQuarter = 2
	AND c.CalendarYear = 2020
GROUP BY
it.IncidentType;




/* Calculating median in SQL Server

Fill in the missing value for PERCENTILE_CONT().

Inside the WITHIN GROUP() clause, order by number of incidents descending.

In the OVER() clause, partition by IncidentType (the actual text value, not the ID).
 */


 SELECT DISTINCT
	it.IncidentType,
	AVG(CAST(ir.NumberOfIncidents AS DECIMAL(4,2)))
	    OVER(PARTITION BY it.IncidentType) AS MeanNumberOfIncidents,
	PERCENTILE_CONT(0.5)
    	WITHIN GROUP (ORDER BY ir.NumberOfIncidents DESC)
        OVER (PARTITION BY it.IncidentType) AS MedianNumberOfIncidents,
	COUNT(1) OVER (PARTITION BY it.IncidentType) AS NumberOfRows
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.IncidentType it
		ON ir.IncidentTypeID = it.IncidentTypeID
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
WHERE
	c.CalendarQuarter = 2
	AND c.CalendarYear = 2020;


  /* Downsample to a daily grain

Downsample customer visit start times to the daily grain and aggregate results.

Fill in the GROUP BY clause with any non-aggregated values in the SELECT clause (but without aliases like AS Day).*/



  SELECT
	CAST(dsv.CustomerVisitStart AS DATE) AS Day,
	SUM(dsv.AmenityUseInMinutes) AS AmenityUseInMinutes,
	COUNT(1) AS NumberOfAttendees
FROM dbo.DaySpaVisit dsv
WHERE
	dsv.CustomerVisitStart >= '2020-06-11'
	AND dsv.CustomerVisitStart < '2020-06-23'
GROUP BY
	CAST(dsv.CustomerVisitStart AS DATE)
ORDER BY
	Day;

/*Downsample to a weekly grain

Downsample the day spa visit data to a weekly grain using the DATEPART() function.

Find the customer with the largest customer ID for a given week.

Fill in the GROUP BY clause with any non-aggregated values in the SELECT clause (but without aliases like AS Week).*/




SELECT
	DATEPART(WEEK, dsv.CustomerVisitStart) AS Week,
	SUM(dsv.AmenityUseInMinutes) AS AmenityUseInMinutes,
	MAX(dsv.CustomerID) AS HighestCustomerID,
	COUNT(1) AS NumberOfAttendees
FROM dbo.DaySpaVisit dsv
WHERE
	dsv.CustomerVisitStart >= '2020-01-01'
	AND dsv.CustomerVisitStart < '2021-01-01'
GROUP BY
	DATEPART(WEEK, dsv.CustomerVisitStart)
ORDER BY
	Week;


/*Downsample using a calendar table

Find and include the week of the calendar year.

Include the minimum value of c.Date in each group as FirstDateOfWeek. This works because we are grouping by week.

Join the Calendar table to the DaySpaVisit table based on the calendar table’s date and each day spa customer’s date of visit. CustomerVisitStart is a DATETIME2 which includes time, so a direct join would only include visits starting at exactly midnight.

Group by the week of calendar year.*/


SELECT
	c.CalendarWeekOfYear,
	MIN(c.Date) AS FirstDateOfWeek,
	ISNULL(SUM(dsv.AmenityUseInMinutes), 0) AS AmenityUseInMinutes,
	ISNULL(MAX(dsv.CustomerID), 0) AS HighestCustomerID,
	COUNT(dsv.CustomerID) AS NumberOfAttendees
FROM dbo.Calendar c
	LEFT OUTER JOIN dbo.DaySpaVisit dsv
		ON c.Date = CAST(dsv.CustomerVisitStart AS Date)
WHERE
	c.CalendarYear = 2020
GROUP BY
	c.CalendarWeekOfYear
ORDER BY
	c.CalendarWeekOfYear;


/*Generate a summary with ROLLUP

Complete the definition for NumberOfIncidents by adding up the number of incidents over each range.

Fill out the GROUP BY segment, including the WITH ROLLUP operator.*/


SELECT
	c.CalendarYear,
	c.CalendarQuarterName,
	c.CalendarMonth,
    -- Include the sum of incidents by day over each range
	SUM(ir.NumberOfIncidents) AS NumberOfIncidents
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
WHERE
	ir.IncidentTypeID = 2
GROUP BY
	-- GROUP BY needs to include all non-aggregated columns
	c.CalendarYear,
	c.CalendarQuarterName,
	c.CalendarMonth
-- Fill in your grouping operator
WITH ROLLUP
ORDER BY
	c.CalendarYear,
	c.CalendarQuarterName,
	c.CalendarMonth;

View all aggregations with CUBE

 /*Filln the missing columns from dbo.Calendar in the SELECT clause.

Fill out the GROUP BY segment, including the CUBE operator.*/


SELECT
	ir.IncidentTypeID,
	c.CalendarQuarterName,
	c.WeekOfMonth,
	SUM(ir.NumberOfIncidents) AS NumberOfIncidents
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
WHERE
	ir.IncidentTypeID IN (3, 4)
GROUP BY
	ir.IncidentTypeID,
	c.CalendarQuarterName,
	c.WeekOfMonth
WITH CUBE
ORDER BY
	ir.IncidentTypeID,
	c.CalendarQuarterName,
	c.WeekOfMonth



/*In which quarter did we see the greatest number of incidents?

    Quarter 1
    Quarter 2
    Quarter 3
    Quarter 4

</> Generate custom groupings with GROUPING SETS

Fill out the GROUP BY segment using GROUPING SETS. We want to see:

One row for each combination of year, quarter, and month (in that hierarchical order)

One row for each year

One row with grand totals (that is, a blank group)*/




SELECT
	c.CalendarYear,
	c.CalendarQuarterName,
	c.CalendarMonth,
	SUM(ir.NumberOfIncidents) AS NumberOfIncidents
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
WHERE
	ir.IncidentTypeID = 2
GROUP BY GROUPING SETS
(
	(c.CalendarYear, c.CalendarQuarterName, c.CalendarMonth),
	(c.CalendarYear),
	()
)
ORDER BY
	c.CalendarYear,
	c.CalendarQuarterName,
	c.CalendarMonth;


/*Combine multiple aggregations in one query

Fill out the grouping sets based on our conjectures above. We want to see the following grouping sets in addition to our grand total:

    One set by calendar year and month
    One set by the day of the week
    One set by whether the date is a weekend or not*/



SELECT
	c.CalendarYear,
	c.CalendarMonth,
	c.DayOfWeek,
	c.IsWeekend,
	SUM(ir.NumberOfIncidents) AS NumberOfIncidents
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
GROUP BY GROUPING SETS
(
	(c.CalendarYear, c.CalendarMonth),
	(c.DayOfWeek),
	(c.IsWeekend),
	()
)
ORDER BY
	c.CalendarYear,
	c.CalendarMonth,
	c.DayOfWeek,
	c.IsWeekend;


/*4. Answering Time Series Questions with Window Functions
 Contrasting ROW_NUMBER(), RANK(), and DENSE_RANK()

Fill in each window function based on the column alias. You should include ROW_NUMBER(), RANK(), and DENSE_RANK() exactly once.

Fill in the OVER clause ordering by ir.NumberOfIncidents in descending order.*/



SELECT
	ir.IncidentDate,
	ir.NumberOfIncidents,
	ROW_NUMBER() OVER (ORDER BY ir.NumberOfIncidents DESC) AS rownum,
	RANK() OVER (ORDER BY ir.NumberOfIncidents DESC) AS rk,
	DENSE_RANK() OVER (ORDER BY ir.NumberOfIncidents DESC) AS dr
FROM dbo.IncidentRollup ir
WHERE
	ir.IncidentTypeID = 3
	AND ir.NumberOfIncidents >= 8
ORDER BY
	ir.NumberOfIncidents DESC;



/*Aggregate window functions

Fill in the correct aggregate function for each column in the result set.*/



ir.IncidentDate,
	ir.NumberOfIncidents,
	SUM(ir.NumberOfIncidents) OVER () AS SumOfIncidents,
	MIN(ir.NumberOfIncidents) OVER () AS LowestNumberOfIncidents,
	MAX(ir.NumberOfIncidents) OVER () AS HighestNumberOfIncidents,
	COUNT(ir.NumberOfIncidents) OVER () AS CountOfIncidents
FROM dbo.IncidentRollup ir
WHERE
	ir.IncidentDate BETWEEN '2019-07-01' AND '2019-07-31'
AND ir.IncidentTypeID = 3;



/* Running totals with SUM()

Fill in the correct window function.

Fill in the PARTITION BY clause in the window function, partitioning by incident type ID.

Fill in the ORDER BY clause in the window function, ordering by incident date (in its default, ascending order).*/



SELECT
	ir.IncidentDate,
	ir.IncidentTypeID,
	ir.NumberOfIncidents,
	SUM(ir.NumberOfIncidents) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	) AS NumberOfIncidents
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
WHERE
	c.CalendarYear = 2019
	AND c.CalendarMonth = 7
	AND ir.IncidentTypeID IN (1, 2)
ORDER BY
	ir.IncidentTypeID,
	ir.IncidentDate;



/*Investigating window frames

Running Total

    (Empty - - no frame written out)

    RANGE BETWEEN
    UNBOUNDED PRECEDING
    AND CURRENT NOW

Sum Across the Entire Range

    RANGE BETWEEN
    UNBOUNDED PRECEDING
    AND UNBOUNDED
    FOLLOWING

Row-Based Frames

    ROWS BETWEEN 3
    PRECEDING AND CURRENT
    ROW

    ROWS BETWEEN 2
    PRECEDING AND 2
    FOLLOWING

</> Calculating moving averages

Fill in the correct window function to perform a moving average starting from 6 days ago through today.

Fill in the window frame, including the ROWS clause, window frame preceding, and window frame following.*/



ir.IncidentDate,
	ir.IncidentTypeID,
	ir.NumberOfIncidents,
	AVG(ir.NumberOfIncidents) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
		ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
	) AS MeanNumberOfIncidents
FROM dbo.IncidentRollup ir
	INNER JOIN dbo.Calendar c
		ON ir.IncidentDate = c.Date
WHERE
	c.CalendarYear = 2019
	AND c.CalendarMonth IN (7, 8)
	AND ir.IncidentTypeID = 1
ORDER BY
	ir.IncidentTypeID,
	ir.IncidentDate;




/*Seeing prior and future periods

Fill in the window function to return the prior day’s number of incidents, partitioned by incident type ID and ordered by the incident date.

Fill in the window function to return the next day’s number of incidents, partitioned by incident type ID and ordered by the incident date.*/




ir.IncidentDate,
	ir.IncidentTypeID,
    -- Get the prior day's number of incidents
	LAG(ir.NumberOfIncidents, 1) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	) AS PriorDayIncidents,
	ir.NumberOfIncidents AS CurrentDayIncidents,
    -- Get the next day's number of incidents
	LEAD(ir.NumberOfIncidents, 1) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	) AS NextDayIncidents
FROM dbo.IncidentRollup ir
WHERE
	ir.IncidentDate >= '2019-07-02'
	AND ir.IncidentDate <= '2019-07-31'
	AND ir.IncidentTypeID IN (1, 2)
ORDER BY
	ir.IncidentTypeID,
	ir.IncidentDate;




/*Seeing the prior three periods

Fill in the SQL to return the number of incidents from two periods ago.

Fill in the SQL to return the number of incidents from the prior period.

Fill in the SQL to return the number of incidents from the next period.*/





SELECT
	ir.IncidentDate,
	ir.IncidentTypeID,
    -- Fill in two periods ago
	LAG(ir.NumberOfIncidents, 2) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	) AS Trailing2Day,
    -- Fill in one period ago
	LAG(ir.NumberOfIncidents, 1) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	) AS Trailing1Day,
	ir.NumberOfIncidents AS CurrentDayIncidents,
    -- Fill in next period
	LEAD(ir.NumberOfIncidents, 1) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	) AS NextDay
FROM dbo.IncidentRollup ir
WHERE
	ir.IncidentDate >= '2019-07-01'
	AND ir.IncidentDate <= '2019-07-31'
	AND ir.IncidentTypeID IN (1, 2)
ORDER BY
	ir.IncidentTypeID,
	ir.IncidentDate;




/*Calculating days elapsed between incidents

Calculate the days since the last incident using a combination of DATEDIFF() and LAG() or LEAD().

Calculate the days until the next incident using a combination of DATEDIFF() and LAG() or LEAD().

NOTE: you will not need to use the NumberOfIncidents column in this exercise */





ir.IncidentDate,
	ir.IncidentTypeID,
    -- Fill in the days since last incident
	DATEDIFF(DAY, LAG(ir.IncidentDate, 1) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	), ir.IncidentDate) AS DaysSinceLastIncident,
    -- Fill in the days until next incident
	DATEDIFF(DAY, ir.IncidentDate, LEAD(ir.IncidentDate, 1) OVER (
		PARTITION BY ir.IncidentTypeID
		ORDER BY ir.IncidentDate
	)) AS DaysUntilNextIncident
FROM dbo.IncidentRollup ir
WHERE
	ir.IncidentDate >= '2019-07-02'
	AND ir.IncidentDate <= '2019-07-31'
	AND ir.IncidentTypeID IN (1, 2)
ORDER BY
	ir.IncidentTypeID,
	ir.IncidentDate;




 /*Analyze client data for potential fraud

Split out start events and end events.

    Fill in the customer’s visit start date (dsv.CustomerVisitStart) as TimeUTC in the “entrances” part of the query.
    Fill in the window function that we alias as StartStopPoints to give us the stream of check-ins for each customer, ordered by their visit start date.
    Fill in the customer’s visit end date (dsv.CustomerVisitEnd) as TimeUTC in the “departures” part of the query.*/




dsv.CustomerID,
	dsv.CustomerVisitStart AS TimeUTC,
	1 AS EntryCount,
	ROW_NUMBER() OVER (
      PARTITION BY dsv.CustomerID
      ORDER BY dsv.CustomerVisitStart
    ) AS StartOrdinal
FROM dbo.DaySpaVisit dsv
UNION ALL
SELECT
	dsv.CustomerID,
	dsv.CustomerVisitEnd AS TimeUTC,
	-1 AS EntryCount,
	NULL AS StartOrdinal DSV,



/*Build a stream of events

Fill out the appropriate window function (ROW_NUMBER()) to create a stream of check-ins and check-outs in chronological order.

Partition by the customer ID to calculate a result per user.

Order by the event time and solve ties by using the start ordinal value.*/




SELECT s.*,
	ROW_NUMBER() OVER (
      PARTITION BY s.CustomerID
      ORDER BY s.TimeUTC, s.StartOrdinal
    ) AS StartOrEndOrdinal
FROM #StartStopPoints s;




/*Complete the fraud analysis

Fill out the HAVING clause to determine cases with more than 2 concurrent visitors.

Fill out the ORDER BY clause to show management the worst offenders: those with the highest values for MaxConcurrentCustomerVisits.*/



LECT
	s.CustomerID,
	MAX(2 * s.StartOrdinal - s.StartOrEndOrdinal) AS MaxConcurrentCustomerVisits
FROM #StartStopOrder s
WHERE s.EntryCount = 1
GROUP BY s.CustomerID
HAVING MAX(2 * s.StartOrdinal - s.StartOrEndOrdinal) > 2
ORDER BY MaxConcurrentCustomerVisits DESC;







select * from Favorite
select * from Favoritefoods
select * from people
select * from Favorite  f where exists (select 1 from  Favoritefoods ff where f.id= ff.id);
select * from Favorite  f left outer join Favoritefoods ff on f.id= ff.id
select * from Favoritefoods ff right outer join Favorite f on ff.id= f.id



























/*  */
