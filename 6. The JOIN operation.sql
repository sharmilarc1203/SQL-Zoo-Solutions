# The JOIN operation

#1.The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtimeModify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

SELECT * FROM goal 
  WHERE player LIKE '%Bender'


#2.From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.Show id, stadium, team1, team2 for just game 1012

SELECT id, stadium, team1, team2 
FROM game
WHERE id = 1012

#3. Modify it to show the player, teamid, stadium and mdate for every German goal.

SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM game 
JOIN goal ON (id=matchid)
WHERE goal.teamid = 'GER'

# 4.Use the same JOIN as in the previous question. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT game.team1, game.team2, goal.player
FROM game 
JOIN goal ON (id=matchid)
WHERE goal.player LIKE 'Mario%'

#5.The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal 
JOIN eteam ON(eteam.id = goal.teamid)
WHERE goal.gtime<=10

#6.To JOIN game with eteam you could use either game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id). Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id. List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT game.mdate, eteam.teamname
FROM game
JOIN eteam ON(game.team1 = eteam.id)
WHERE eteam.coach ='Fernando Santos'

#7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT goal.player
FROM goal
JOIN game ON (game.id = goal.matchid)
WHERE game.stadium = 'National Stadium, Warsaw'

#8. Show the name of all players who scored a goal against Germany.

SELECT DISTINCT player
FROM goal JOIN game ON matchid = id 
WHERE (teamid = team1 AND team2 = 'GER') OR (teamid = team2 AND team1 = 'GER');

#9. Show teamname and the total number of goals scored.

SELECT eteam.teamname, count(goal.gtime)
FROM eteam
JOIN goal ON ( goal.teamid = eteam.id)
GROUP BY eteam.teamname

#10. Show the stadium and the number of goals scored in each stadium.
SELECT game.stadium, count(goal.gtime)
FROM game
JOIN goal ON game.id = goal.matchid
GROUP BY game.stadium

#11. For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, game.mdate, COUNT(teamid)
FROM game JOIN goal ON id = matchid 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, game.mdate

#12.For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT goal.matchid,  mdate, count(gtime)
FROM   goal
JOIN game ON game.id = goal.matchid
WHERE (teamid = 'GER')
GROUP BY goal.matchid, game.mdate

#13. List every match with the goals scored by each team as shown. Sort your result by mdate, matchid, team1 and team2.
SELECT mdate, team1,
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game 
LEFT OUTER JOIN goal ON id = matchid
GROUP BY id, game.mdate, team1,team2
ORDER BY mdate, matchid, team1, team2;

