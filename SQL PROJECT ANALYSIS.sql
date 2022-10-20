--Perform the following analysis in PostgreSQL after building the complete database:

--1.Write a SQL query to determine the year in which North America had highest video games sales.
     
SELECT g.release_year,sum(s.na_sales_in_millions) as "Total_NA_Sales"
FROM games g
JOIN sales s
ON s.games_id=g.games_id
WHERE s.na_sales_in_millions IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1


--2.Write a SQL query to determine the year in which the global sales was highest.
SELECT g.release_year,sum(s.global_sales_in_millions) total_global_sales
FROM sales as s
INNER JOIN games as g
on g.games_id = s.games_id
WHERE global_sales_in_millions IS NOT NULL
GROUP BY 1
ORDER BY 2 desc
LIMIT 1;

--3.Write a SQL query to determine the year in which the total shipped was highest.
SELECT g.release_year,sum(s.total_shipped_in_millions) total_shipped
FROM sales as s
INNER JOIN games as g
on g.games_id = s.games_id
WHERE total_shipped_in_millions IS NOT NULL
AND g.release_year IS NOT NULL
GROUP BY 1
ORDER BY 2 desc
LIMIT 1;

--4.Write a SQL query to determine the most popular video game console in North America.
SELECT c.console,sum(na_sales_in_millions) total_na_sales
	FROM sales as s
	INNER JOIN games as g
	on g.games_id = s.games_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE na_sales_in_millions IS NOT NULL
	GROUP BY 1
    ORDER BY 2 desc
	LIMIT 1;

--5.Write a SQL query to determine the most popular video game console in PAL.
SELECT c.console,sum(pal_sales_in_millions) total_pal_sales
	FROM sales as s
	INNER JOIN games as g
	on g.games_id = s.games_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE pal_sales_in_millions IS NOT NULL
	GROUP BY 1
    ORDER BY 2 desc
	LIMIT 1;
--6.Write a SQL query to determine the most popular video game console in Japan.
SELECT c.console,sum(japan_sales_in_millions) total_japan_sales
	FROM sales as s
	INNER JOIN games as g
	on g.games_id = s.games_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE japan_sales_in_millions IS NOT NULL
	GROUP BY 1
    ORDER BY 2 desc
	LIMIT 1;
--7.Write a SQL query to determine the most popular video game console in Other regions.
SELECT c.console,sum(other_sales_in_millions) total_other_sales
	FROM sales as s
	INNER JOIN games as g
	on g.games_id = s.games_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE other_sales_in_millions IS NOT NULL
	GROUP BY 1
    ORDER BY 2 desc
	LIMIT 1;
--8.Write a SQL query to determine the most popular video game console globally.
    SELECT c.console,sum(global_sales_in_millions) total_global_sales
	FROM sales as s
	INNER JOIN games as g
	on g.games_id = s.games_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE global_sales_in_millions IS NOT NULL
	GROUP BY 1
    ORDER BY 2 desc
	LIMIT 1;
--9.Write a SQL query to determine the most shipped video game console.
    SELECT c.console,sum(total_shipped_in_millions) total_shipped
	FROM sales as s
	INNER JOIN games as g
	on g.games_id = s.games_id
	INNER JOIN console as c
	on g.console_id = c.console_id
	WHERE total_shipped_in_millions IS NOT NULL
	GROUP BY c.console
	ORDER BY sum(total_shipped_in_millions) desc
	LIMIT 1;
--10.Write a SQL query to determine the most popular video game across various consoles.
        SELECT 
		game_name,
		console
	FROM games g
	JOIN console c
	ON g.console_id = c.console_id
	JOIN sales s
	ON s.games_id = g.games_id
	JOIN (
		SELECT g1.console_id, max(global_sales_in_millions) as "global_sales_in_millions"
		FROM GAMES as g1
		JOIN console as c1
		ON g1.console_id = c1.console_id
		JOIN sales as s1
		ON g1.games_id = s1.games_id
		GROUP BY g1.console_id
		ORDER BY g1.console_id) as v
	ON v.console_id = c.console_id AND
	   v.global_sales_in_millions = s.global_sales_in_millions
	ORDER BY c.console_id;
                               --OR--	
 WITH SUB AS(SELECT g1.console_id, max(global_sales_in_millions) as "global_sales_in_millions"
		FROM GAMES as g1
		JOIN console as c1
		ON g1.console_id = c1.console_id
		JOIN sales as s1
		ON g1.games_id = s1.games_id
		GROUP BY g1.console_id
		ORDER BY g1.console_id )
 SELECT game_name,console
	FROM games g
	JOIN console c
	ON g.console_id = c.console_id
	JOIN sales s
	ON s.games_id = g.games_id
 
    join SUB
    ON SUB.console_id = c.console_id AND
	   SUB.global_sales_in_millions = s.global_sales_in_millions
	ORDER BY c.console_id;
    
    
--11.Write a SQL query to determine the most popular video game across various genres.
SELECT game_name,genre
	FROM games g
	JOIN genre as gen
	ON g.genre_id = gen.genre_id
	JOIN sales as s
	ON s.games_id = g.games_id
	JOIN (
		SELECT g1.genre_id, max(global_sales_in_millions) as "global_sales_in_millions"
		FROM GAMES as g1
		JOIN genre as gen1
		ON g1.genre_id = gen1.genre_id
		JOIN sales as s1
		ON g1.games_id = s1.games_id
		GROUP BY g1.genre_id
		ORDER BY g1.genre_id) as v
	ON v.genre_id = gen.genre_id AND
	   v.global_sales_in_millions = s.global_sales_in_millions
	ORDER BY gen.genre_id;