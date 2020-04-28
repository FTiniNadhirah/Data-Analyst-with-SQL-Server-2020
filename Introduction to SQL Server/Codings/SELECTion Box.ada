 -- Exercise
 -- Simple selections
 -- It's time to begin writing your own queries! In this first coding exercise, you will use SELECT statements to retrieve columns from a database table. You'll be working with the eurovision table, which contains data relating to individual country performance at the Eurovision Song Contest from 1998 to 2012.

 -- After selecting columns, you'll also practice renaming columns, and limiting the number of rows returned.

 -- Instructions 1/4

 -- SELECT the country column FROM the eurovision table.

-- SELECT the country column FROM the eurovision table
SELECT country
FROM 
  eurovision;
  
 -- Instructions 2/4
 -- Amend your query to return the points column instead of the country column.

-- Select the points column
SELECT 
  points 
FROM 
  eurovision;
  
 -- Instructions 3/4
-- Use TOP to change the existing query so that only the first 50 rows are returned.
-- Limit the number of rows returned
SELECT 
  TOP (50) points 
FROM 
  eurovision;

 -- Instructions 4/4
 -- Return a list of unique countries using DISTINCT. Give the results an alias of unique_country.

-- Return unique countries and use an alias
SELECT 
  DISTINCT country AS unique_country 
FROM 
  eurovision;
  
-- Exercise
-- More selections
-- Now that you've practiced how to select one column at a time, it's time to practice selecting more than one column. You'll continue working with the eurovision table.

-- Instructions 1/3

-- SELECT the country and event_year columns from the eurovision table.
-- Select country and event_year from eurovision
SELECT 
  country, 
  event_year 
FROM 
  eurovision;

-- Instructions 2/3
-- Use a shortcut to amend the current query, returning ALL rows from ALL columns in the table.

-- Amend the code to select all rows and columns
SELECT 
  * 
FROM 
  eurovision;

-- Instructions 3/3
-- Return all columns, but only include the top half of the table - in other words, return 50 percent of the rows.
-- Return all columns, restricting the percent of rows returned
SELECT 
  TOP (50) PERCENT * 
FROM 
  eurovision;
  
-- Exercise
-- Order by
-- In this exercise, you'll practice the use of ORDER BY using the grid dataset. It's loaded and waiting for you! It contains a subset of wider publicly available information on US power outages.

-- Some of the main columns include:

-- description: The reason/ cause of the outage.
-- nerc_region: The North American Electricity Reliability Corporation was formed to ensure the reliability of the grid and comprises several regional entities).
-- demand_loss_mw: How much energy was not transmitted/consumed during the outage.
-- Instructions 1/2

-- Select description and event_date from grid. Your query should return the first 5 rows, ordered by event_date.
-- Select the first 5 rows from the specified columns
SELECT 
  TOP (5) description, 
  event_date 
FROM 
  grid 
  -- Order your results by the event_date column
ORDER BY 
  event_date;

-- Instructions 2/2
-- Modify your code based on the comments provided on the right.
-- Select the top 20 rows from description, nerc_region and event_date
SELECT 
  TOP (20) description, 
  nerc_region, 
  event_date 
FROM 
  grid 
  -- Order by nerc_region, affected_customers & event_date
  -- Event_date should be in descending order
ORDER BY 
  nerc_region, 
  affected_customers, 
  event_date DESC;