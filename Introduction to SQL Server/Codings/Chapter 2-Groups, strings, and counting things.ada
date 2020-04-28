-- Exercise
-- Summing
-- Summing and counting are key ways of aggregating data, regardless of whether you are using a database, manipulating a spreadsheet, or using a programming language such as Python or R. Let's see how to do it in T-SQL using the grid table from Chapter 1.

-- You'll start by obtaining overall sums, focusing specifically on the 'MRO' region.

-- nerc_region map

-- Instructions

-- Obtain a grand total of the demand_loss_mw column by using the SUM function, and alias the result as MRO_demand_loss.
-- Only retrieve rows WHERE demand_loss_mw is not NULL and nerc_region is 'MRO'.
-- Sum the demand_loss_mw column
SELECT 
  SUM(demand_loss_mw) AS MRO_demand_loss 
FROM 
  grid 
WHERE
  -- demand_loss_mw should not contain NULL values
  demand_loss_mw IS NOT NULL 
  -- and nerc_region should be 'MRO';
  AND nerc_region = 'MRO';

-- Exercise
-- Counting
-- Having explored the 'MRO' region, let's now explore the 'RFC' region in more detail while learning how to use the COUNT aggregate function.

-- nerc_region map

-- Instructions 1/2
-- Return the COUNT of the grid_id column, aliasing the result as grid_total.
-- Obtain a count of 'grid_id'
SELECT 
  COUNT(grid_id) AS grid_total 
FROM 
  grid;

-- Instructions 2/2
-- Make the count more meaningful by restricting it to records where the nerc_region is 'RFC'. Name the result RFC_count.
-- Obtain a count of 'grid_id'
SELECT 
  COUNT (grid_id) AS RFC_count 
FROM 
  grid
-- Restrict to rows where the nerc_region is 'RFC'
WHERE
  nerc_region = 'RFC';

-- Exercise
-- MIN, MAX and AVG
-- Along with summing and counting, you'll frequently need to find the minimum, maximum, and average of column values. Thankfully, T-SQL has functions you can use to make the task easier!

-- Instructions 1/3
-- Find the minimum value from the affected_customers column, but only for rows where demand_loss_mw has a value. Name the result min_affected_customers.
-- Find the minimum number of affected customers
SELECT 
  MIN(affected_customers) AS min_affected_customers 
FROM 
  grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE
  demand_loss_mw IS NOT NULL;

-- Instructions 2/3
-- Amend the query to return the maximum value from the same column, this time aliasing as max_affected_customers.
-- Find the maximum number of affected customers
SELECT 
  MAX(affected_customers) AS max_affected_customers 
FROM 
  grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE 
  demand_loss_mw IS NOT NULL;

-- Instructions 3/3
-- Return the average value from the affected_customers column, this time aliasing as avg_affected_customers
-- Find the average number of affected customers
SELECT 
  AVG(affected_customers) AS avg_affected_customers 
FROM 
  grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE 
  demand_loss_mw IS NOT NULL;

-- Exercise
-- LEN'gth of a string
-- Knowing the length of a string is key to being able to manipulate it further using other functions, so what better way to start the lesson?

-- Instructions
-- Retrieve the length of the description column, returning the results as description_length.
-- Calculate the length of the description column
SELECT 
  LEN(description) AS description_length 
FROM 
  grid;
  
-- Exercise
-- Left and right
-- We can retrieve portions of a string from either the start of the string, using LEFT, or working back from the end of the string, using RIGHT.

-- Instructions 1/2

-- Retrieve the first 25 characters from the description column in the grid table. Name the results first_25_left.
-- Select the first 25 characters from the left of the description column
SELECT 
  LEFT(description, 25) AS first_25_left 
FROM 
  grid;
  
-- Instructions 2/2
-- Amend the query to retrieve the last 25 characters from the description. Name the results last_25_right.
-- Amend the query to select 25 characters from the  right of the description column
SELECT 
  RIGHT (description, 25) AS last_25_right 
FROM 
  grid;

-- Exercise
-- Stuck in the middle with you
-- You might be fortunate, and find that the interesting parts of your strings are at either end. However, chances are, you'll want to retrieve characters from somewhere around the middle. Let's see how to use RIGHT, LEN, CHARINDEX AND SUBSTRING to extract the interior portion of a text string. The description column can contain multiple reasons for power outages in each row. We want to extract any additional causes of outage whenever Weather appears in the description column.

-- Instructions 1/3
-- You can use CHARINDEX to find a specific character or pattern within a column. Edit the query to return the CHARINDEX of the string 'Weather' whenever it appears within the description column.
-- Complete the query to find `Weather` within the description column
SELECT 
  description, 
  CHARINDEX('Weather', description) 
FROM 
  grid
WHERE description LIKE '%Weather%';

-- Instructions 2/3
-- We now know where 'Weather' begins in the description column. But where does it end? We could manually count the number of characters, but, for longer strings, this is more work, especially when we can also find the length with LEN.
-- Complete the query to find the length of `Weather'
SELECT 
  description, 
  CHARINDEX('Weather', description) AS start_of_string, 
  LEN ('Weather') AS length_of_string 
FROM 
  grid
WHERE description LIKE '%Weather%'; 


-- Instructions 3/3
-- Now we use SUBSTRING to return everything after Weather for the first ten rows. The start index here is 15, because the CHARINDEX for each row is 8, and the LEN of Weather is 7.
-- Complete the substring function to begin extracting from the correct character in the description column
SELECT TOP (10)
  description, 
  CHARINDEX('Weather', description) AS start_of_string, 
  LEN ('Weather') AS length_of_string, 
  SUBSTRING(
    description, 
    15, 
    LEN(description)
  ) AS additional_description 
FROM 
  grid
WHERE description LIKE '%Weather%';

-- Exercise
-- GROUP BY
-- In an earlier exercise, you wrote a separate WHERE query to determine the amount of demand lost for a specific region. We wouldn't want to have to write individual queries for every region. Fortunately,you don't have to write individual queries for every region. With GROUP BY, you can obtain a sum of all the unique values for your chosen column, all at once.

-- You'll return to the grid table here and calculate the total lost demand for all regions.

-- Instructions

-- Select nerc_region and the sum of demand_loss_mw for each region.
-- Exclude values where demand_loss_mw is NULL.
-- Group the results by nerc_region.
-- Arrange in descending order of demand_loss.
-- Select the region column
SELECT 
  nerc_region, 
  -- Sum the demand_loss_mw column
  SUM(demand_loss_mw) AS demand_loss 
FROM 
  grid 
  -- Exclude NULL values of demand_loss
WHERE 
  demand_loss_mw IS NOT NULL 
  -- Group the results by nerc_region
GROUP BY 
  nerc_region 
  -- Order the results in descending order of demand_loss
ORDER BY 
  demand_loss DESC

-- Exercise
-- Having
-- WHERE is used to filter rows before any grouping occurs. Once you have performed a grouping operation, you may want to further restrict the number of rows returned. This is a job for HAVING. In this exercise, you will modify an existing query to use HAVING, so that only those results with a sum of over 10000 are returned.

-- Instructions

-- Modify the provided query to remove the WHERE clause.
-- Replace it with a HAVING clause so that only results with a total demand_loss_mw of greater than 10000 are returned.
SELECT 
  nerc_region, 
  SUM (demand_loss_mw) AS demand_loss 
FROM 
  grid 
  -- Remove the WHERE clause
GROUP BY 
  nerc_region 
  -- Enter a new HAVING clause so that the sum of demand_loss_mw is greater than 10000
HAVING 
  SUM(demand_loss_mw) > 10000 
ORDER BY 
  demand_loss DESC;
  
-- Exercise
-- Grouping together
-- In this final exercise, you will combine GROUP BY with aggregate functions such as MIN that you've seen earlier in this chapter.

-- To conclude this chapter, we'll return to the eurovision table from the first chapter.

-- Instructions 1/4

-- Use MIN and MAX to retrieve the minimum and maximum values for the place and points columns respectively.
-- Retrieve the minimum and maximum place values
SELECT 
  MIN(place) AS min_place, 
  MAX(place) AS max_place, 
  -- Retrieve the minimum and maximum points values
  MIN(points) AS min_points, 
  MAX(points) AS max_points 
FROM 
  eurovision;

-- Instructions 2/4
-- Let's obtain more insight from our results by adding a GROUP BY clause. Group the results by country.
-- Retrieve the minimum and maximum place values
SELECT 
  MIN(place) AS min_place, 
  MAX(place) AS max_place, 
  -- Retrieve the minimum and maximum points values
  MIN(points) AS min_points, 
  MAX(points) AS max_points 
FROM 
  eurovision
  -- Group by country
GROUP BY 
  country;
 -- Instructions 3/4
  -- The previous query results did not identify the country. Let's amend the query, returning the count of entries per country and the country column. Complete the aggregate section by finding the average place for each country.
  -- Obtain a count for each country
SELECT 
  COUNT(country) AS country_count, 
  -- Retrieve the country column
  country, 
  -- Return the average of the Place column 
  AVG(place) AS average_place, 
  AVG(points) AS avg_points, 
  MIN(points) AS min_points, 
  MAX(points) AS max_points 
FROM 
  eurovision 
GROUP BY 
  country;
  
-- Instructions 4/4
-- Finally, our results are skewed by countries who only have one entry. Apply a filter so we only return rows where the country_count is greater than 5. Then arrange by avg_place in ascending order, and avg_points in descending order.


  SELECT 
  country, 
  COUNT (country) AS country_count, 
  AVG (place) AS avg_place, 
  AVG (points) AS avg_points, 
  MIN (points) AS min_points, 
  MAX (points) AS max_points 
FROM 
  eurovision 
GROUP BY 
  country 
  -- The country column should only contain those with a count greater than 5
HAVING 
  COUNT(country) > 5 
  -- Arrange columns in the correct order
ORDER BY 
  avg_place, 
  avg_points DESC;
