#1. The population of 'France'. Strings should be in 'single quotes'

SELECT population FROM bbc
  WHERE name = 'France'
  
#2. The names and population densities for the very large countries.

SELECT name, population/area 
 FROM bbc
  WHERE area > 5000000
  
#3. Where to find some very small, very rich countries.

SELECT name , region
  FROM bbc
  WHERE area < 2000
    AND gdp > 5000000000
    
#4. Which of Ceylon, Iran, Persia and Sri Lanka is the name of a country?

SELECT name FROM bbc
  WHERE name IN ('Sri Lanka', 'Ceylon',
                 'Persia',    'Iran')
                 
#5. What are the countries beginning with D?

SELECT name FROM bbc
  WHERE name LIKE 'D%'
  
#6. Which countries are not too small and not too big?

SELECT name, area FROM bbc
  WHERE area BETWEEN 207600 AND 244820
  
