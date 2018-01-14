#1. The total population and GDP of Europe.

SELECT SUM(population), SUM(gdp)
  FROM bbc
  WHERE region = 'Europe'
  
#2. What are the regions?

SELECT DISTINCT region FROM bbc

#3. Show the name and population of each country with a population of more than 100000000. Show countries in descending order of population.

SELECT name, population
  FROM bbc
  WHERE population > 100000000
  ORDER BY population DESC
  
