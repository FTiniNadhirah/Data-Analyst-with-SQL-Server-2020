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