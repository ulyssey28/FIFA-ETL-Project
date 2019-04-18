use fifa_db;



SELECT * FROM player_data;


SELECT * FROM country_rankings;




Select country_rankings.country, count(country_rankings.country), country_rankings.rank
from country_rankings 
right join player_data on country_rankings.country = player_data.country
group by country_rankings.country
order by count(country_rankings.country) desc;



-- age analysis:
	select player_data.country, count(player_data.Name), avg(player_data.Age), country_rankings.rank
	from player_data
	join country_rankings on country_rankings.country = player_data.country
    where player_data.Overall >= 80
	group by player_data.country
	order by country_rankings.rank;




select * from player_data;