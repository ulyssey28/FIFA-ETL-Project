# FIFA-ETL-Project
FIFA Country Ranking Analysis: Which factors are most influential in affecting a country's ranking ?  (Based aggregate methods on various player data fields ).


FIFA ETL project: 


FIFA 19 DATA VS FIFA WORLD RANKING ANALYSIS


#BACKGROUND: 

We obtained FIFA 19 video game stats from a Kaggle CSV file and FIFA world ranking data from a Kaggle CSV as well. We converted the FIFA world ranking data csv to JSON. The primary analysis analyzed which factors had a part in influencing a countries ranking (using aggregate methods on various player data fields ).

DATA CLEANUP & ANALYSIS:

#Extract 
*Sources:
FIFA 19 Kaggle Dataset(https://www.kaggle.com/karangadiya/fifa19/version/4) (Player Data)
FIFA World Rank JSON (Country Rank Data) https://www.kaggle.com/tadhgfitzgerald/fifa-international-soccer-mens-ranking-1993now
Transform
Transformations Performed:
Renaming Pandas Dataframe columns
Dataframe column  type conversions using string manipulation techniques and conversion methods
Filtered Player Data by date and Player Ratings
Load
Database:
The final Pandas Dataframes were loaded into MySQL database with two tables.
Tables:
 “player data”
 “country rank data”
 
 
PROCESS:

Read FIFA player CSV file using Pandas (Player Data)

Read FIFA World ranking JSON file using Pandas (Country Rank Data)

Rename “Nationality” column in the player Dataframe to “country” so that we can have a common column reference for both Dataframes

Select the columns of interest within the “country rank” Dataframe (country, rank, change in rank)

Perform datatype conversions on the “Wage” column of the player Dataframe to convert the column to an integer datatype. Note the wages column was originally formatted in thousands using the abbreviations (K) (in addition to using the euro symbol)

Filter the “country rank” Dataframe for the most recent dates. (I.e 2018 data )

Filter the player Dataframe for players with ratings (80+), who we can define as  top rated players ... a sample size of 554 players
These players are approximately the top 3 percent of the players in our dataset

Filtering our data helps us get a more meaningful interpretation of our players vs country rank analyses. Specifically, we can simply relate data for the top rated players in the game to national team performance. This is more intuitive because a top german player(80+ rated) is a more likely to be on the national team than a 54 rated german player.

Filtering our player data is good because:
Ideally we could obtain a dataset with national team rosters …. But could not find such a dataset. So intuitively, the next best thing would be to analyze the top players in the game vs the ranking of their countries (as the top players are naturally more likely to represent their countries on a national level).

For example, an (average country age vs country rank) analysis has less meaningful interpretation if we average the ages of all players within the dataset for a specific country. Going back to my point, If we wanted to find out the average age of a german player and relate it to the national team’s rank, it doesn't make sense to take into account the age of a 54 rate german player simply because he is not a fair representation of a national team player. A more meaningful analysis would be one that takes the average age of “top rated” players from a country to see what might be more valuable.. (Youth or Experience)



Using Pandas “to_sql” method we uploaded our two Dataframes to MySQL as tables. A relational Database was the natural choice as we had two sets of related data and a common field to connect the two sets. 


Analyses:

Number of “Top Players” vs Rank For Each Country:
Look at percentage of top players versus rank  for each country
Examine whether having a lot of “top rated” players influences a country’s ranking

Average “Top Player” Age vs Rank For Each Country:
Examine whether countries with older players tend to be ranked highest or if younger teams tend to be ranked higher. 
Which is more valuable youth or experience? 

Average “Top Player” Rating vs Rank For Each Country: 
See if having the highest avg player ratings  is related to overall country ranking

Average “Top Player” Wage vs Rank For Each Country
See if having the most expensive players is related to overall country ranking




Other Considerations/ limitations: 
Being a “top rated” player for a country does not necessarily mean you are on the national team (for some nations the top talents don't represent on a national levels)... In that sense this is a generalized assumption that “top rated” players are a good representation of national team rosters

Likewise being a “low rated” player does not necessarily mean you are not on the national team. In that sense these analyses are idealized instances where only “top rated” players are used as a representation of national team rosters  

The rankings obtained from the json are not the most recent world rankings. Hence, our player rating vs rank analysis may not be as accurate as it could be. However the concepts applied can be applied to the appropriate world ranking data.           










