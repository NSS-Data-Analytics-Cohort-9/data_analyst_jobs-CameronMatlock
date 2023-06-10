-- Q1 - How many rows are in the data_analyst_jobs table?

SELECT COUNT(*)
FROM data_analyst_jobs;

-- Answer - 1793 Rows

-- Q2 - Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- Answer - ExxonMobil

-- Q3 - How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT location, COUNT(location)
FROM data_analyst_jobs
WHERE location IN('TN','KY')
GROUP BY location;

-- Answer - 21 postings in Tennessee. 27 total postings in Tennessee and Kentucky.

-- Q4 - How many postings in Tennessee have a star rating above 4?

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4;

-- Answer - There are 3 postings in Tennessee that have a star rating greater than 4.

-- Q5 - How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- Answer - There are 151 total postings that have a review count between 500 and 100 reviews.

-- Q6 - Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

-- Answer - the state of Nebraska shows the highest average star rating with 4.19 stars, while the states of Wyoming, Vermont and South Dakota dont have a star rating.

-- Q7 - Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;

-- Answer - There are 881 distinct job titles posted.

-- Q8 - How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT(title)), location
FROM data_analyst_jobs
WHERE location = 'CA'
GROUP BY location;

-- Answer - There are 230 unique job titles posted in the state of California.

-- Q9 - Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, AVG(star_rating) AS average_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL
GROUP BY company;

-- Answer - There are 46 companies that have more than 5000 reviews across all locations.

-- Q10 - Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, AVG(star_rating) AS average_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL
GROUP BY company
ORDER BY average_star_rating DESC;

-- Answer - The company with the highest average star rating across all locations with more than 5000 reviews is a tie between 6 companies. These companies are American Express, General Motors, Kaiser Permanente, Microsoft, Nike and Unilever. They all have an average star rating of 4.19 stars.

-- Q11 - Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title iLIKE '%Analyst%';


-- Answer - There are a total of 774 job titles that contain the word 'Analyst'.

-- Q12 - How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT UPPER(title)
FROM data_analyst_jobs
WHERE UPPER(title) NOT LIKE '%ANALYST%'
AND UPPER(title) NOT LIKE '%ANALYTICS%';

-- Answer - All 4 remaining entries involve Tableau.

-- Bonus Question Part 1 - You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.

SELECT domain, COUNT(title) AS number_of_jobs
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
GROUP BY domain;

-- Bonus Question Part 2 - Disregard any postings where the domain is NULL.

SELECT domain, COUNT(title) AS number_of_jobs
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain;

-- Bonus Question Part 3 - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 

SELECT domain, COUNT(title) AS number_of_jobs
FROM data_analyst_jobs
WHERE skill LIKE '%SQL%'
AND days_since_posting > 21
AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC
LIMIT 4;

-- Bonus Question Part 4 - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

-- Answer 


















