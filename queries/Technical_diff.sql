


-- in case of mistakes drop table to start over...
drop table player_data;
drop table top_player_data;
drop table country_rankings;


-- run this after first error 
-- at ....... _fifa_df2.to_sql(name='game_countries', con=engine, if_exists='append', index=False)
use fifa_db;

ALTER TABLE fifa_db.player_data MODIFY COLUMN Name text
CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;


ALTER TABLE fifa_db.player_data MODIFY COLUMN Club text
CHARACTER SET utf8 COLLATE utf8_general_ci;

ALTER TABLE fifa_db.player_data MODIFY COLUMN Loaned text
CHARACTER SET utf8 COLLATE utf8_general_ci;
