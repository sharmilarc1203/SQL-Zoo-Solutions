#1. For each continent show the number of countries.

SELECT continent, COUNT(name)
  FROM world
   GROUP BY continent
   
#2. For each continent show the total population.

SELECT continent, SUM(population)
  FROM world
 GROUP BY continent
 
#3. For each relevant continent show the number of countries that have a population of at least 200000000.

SELECT continent, COUNT(name)
  FROM world
   WHERE population>200000000
    GROUP BY continent
    
#4. Show the total population of those continents with a total population of at least half a billion.

SELECT continent, SUM(population)
  FROM world
   GROUP BY continent
    HAVING SUM(population)>500000000
    
