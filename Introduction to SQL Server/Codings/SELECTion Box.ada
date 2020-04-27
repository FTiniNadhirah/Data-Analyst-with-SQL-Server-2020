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