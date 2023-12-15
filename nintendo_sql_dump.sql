-- Author: Noah McMahon --

CREATE DATABASE nintendo_game_db;

CREATE TABLE Developer (
	dev_name VARCHAR(50) NOT NULL,
	genre VARCHAR(50),
	PRIMARY KEY (dev_name)
	);

CREATE TABLE Video_Game (
	game_title VARCHAR(50) NOT NULL,
	dev_name VARCHAR(50),
	price SMALLMONEY,
	release_date DATE,
	genre1 VARCHAR(50),
	genre2 VARCHAR(50),
	genre3 VARCHAR(50),
	ESRB_rating VARCHAR(50),
	PRIMARY KEY (game_title),
	FOREIGN KEY (dev_name) REFERENCES Developer(dev_name)
	);

CREATE TABLE DLC (
	DLC_title VARCHAR(90) NOT NULL,
	game_title VARCHAR(50),
	dev_name VARCHAR(50),
	price SMALLMONEY,
	release_date DATE,
	ESRB_rating VARCHAR(50),
	PRIMARY KEY (DLC_title),
	FOREIGN KEY (dev_name) REFERENCES Developer(dev_name),
	FOREIGN KEY (game_title) REFERENCES Video_Game(game_title)
	);

CREATE TABLE Game_Bundle (
	bundle_title VARCHAR(120) NOT NULL,
	dev_name VARCHAR(50),
	price SMALLMONEY,
	release_date DATE,
	ESRB_rating VARCHAR(50),
	PRIMARY KEY (bundle_title),
	FOREIGN KEY (dev_name) REFERENCES Developer(dev_name)
	);

CREATE TABLE Consumer (
	username VARCHAR(50) NOT NULL,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gold_points SMALLINT,
	fav_genre VARCHAR(50),
	PRIMARY KEY (username)
	);

CREATE TABLE Functionality (
	func_id SMALLINT NOT NULL,
	func_type VARCHAR(50),
	players_min SMALLINT,
	players_max SMALLINT,
	PRIMARY KEY (func_id)
	);

CREATE TABLE VideoGameToFunctionality (
	game_title VARCHAR(50) NOT NULL,
	func_id SMALLINT NOT NULL,
	PRIMARY KEY (game_title, func_id),
	FOREIGN KEY (game_title) REFERENCES Video_Game(game_title),
	FOREIGN KEY (func_id) REFERENCES Functionality(func_id)
	);

CREATE TABLE VideoGameToConsumer (
	game_title VARCHAR(50) NOT NULL,
	username VARCHAR(50) NOT NULL,
	PRIMARY KEY (game_title, username),
	FOREIGN KEY (game_title) REFERENCES Video_Game(game_title),
	FOREIGN KEY (username) REFERENCES Consumer(username)
	);

CREATE TABLE DLCToConsumer (
	DLC_title VARCHAR(90) NOT NULL,
	username VARCHAR(50) NOT NULL,
	PRIMARY KEY (DLC_title, username),
	FOREIGN KEY (DLC_title) REFERENCES DLC(DLC_title),
	FOREIGN KEY (username) REFERENCES Consumer(username)
	);

CREATE TABLE DLCToGameBundle (
	DLC_title VARCHAR(90) NOT NULL,
	bundle_title VARCHAR(120) NOT NULL,
	PRIMARY KEY (DLC_title, bundle_title),
	FOREIGN KEY (DLC_title) REFERENCES DLC(DLC_title),
	FOREIGN KEY (bundle_title) REFERENCES Game_Bundle(bundle_title)
	);

CREATE TABLE VideoGameToGameBundle (
	game_title VARCHAR(50) NOT NULL,
	bundle_title VARCHAR(120) NOT NULL,
	PRIMARY KEY (game_title, bundle_title),
	FOREIGN KEY (game_title) REFERENCES Video_Game(game_title),
	FOREIGN KEY (bundle_title) REFERENCES Game_Bundle(bundle_title)
	);

CREATE TABLE GameBundleToConsumer (
	bundle_title VARCHAR(120) NOT NULL,
	username VARCHAR(50) NOT NULL,
	PRIMARY KEY (bundle_title, username),
	FOREIGN KEY (bundle_title) REFERENCES Game_Bundle(bundle_title),
	FOREIGN KEY (username) REFERENCES Consumer(username)
	);

INSERT INTO Developer(dev_name, genre) VALUES ('Nintendo','Action');
INSERT INTO Developer(dev_name, genre) VALUES ('SQUARE ENIX','Role-Playing');
INSERT INTO Developer(dev_name, genre) VALUES ('Team17','Simulation');
INSERT INTO Developer(dev_name, genre) VALUES ('Electronic Arts','Adventure');
INSERT INTO Developer(dev_name, genre) VALUES ('Disney Electronic Content','Multiplayer');
INSERT INTO Developer(dev_name, genre) VALUES ('Mojang','Strategy');
INSERT INTO Developer(dev_name, genre) VALUES ('Epic Games','Multiplayer');
INSERT INTO Developer(dev_name, genre) VALUES ('SEGA','Role-Playing');
INSERT INTO Developer(dev_name, genre) VALUES ('BANDAI NAMCO Entertainment','Arcade');
INSERT INTO Developer(dev_name, genre) VALUES ('Hello Games','Simulation');
INSERT INTO Developer(dev_name, genre) VALUES ('Aspyr','Adventure');
INSERT INTO Developer(dev_name, genre) VALUES ('CAPCOM','Arcade');
INSERT INTO Developer(dev_name, genre) VALUES ('Bethesda','Action');
INSERT INTO Developer(dev_name, genre) VALUES ('Innersloth','Party');
INSERT INTO Developer(dev_name, genre) VALUES ('Devolver Digital','Adventure');
INSERT INTO Developer(dev_name, genre) VALUES ('Supergiant Games','Adventure');
INSERT INTO Developer(dev_name, genre) VALUES ('ConcernedApe','Role-Playing');
INSERT INTO Developer(dev_name, genre) VALUES ('StudioMDHR','Platformer');
INSERT INTO Developer(dev_name, genre) VALUES ('Team Cherry','Platformer');
INSERT INTO Developer(dev_name, genre) VALUES ('Ubisoft','Strategy');
INSERT INTO Developer(dev_name, genre) VALUES ('Game Mill','Fighting');

INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Brancine','Francine','Bush',6,'Arcade');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Correct','Rick','Wright',34,'Adventure');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Frankfurter','Mary','Frank',30,'Party');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Gardens','Suzy','Cardenas',40,'Simulation');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Jeremy','Jerome','Parker',5,'Multiplayer');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Machung','Chung','Mason',33,'Role-Playing');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Paint','Judy','Payne',12,'Fighting');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Poohbear','Noah','McMahon',10,'Strategy');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Rayray','Charles','Raymond',27,'Party');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Rednose','Zachary','Randolph',8,'Music');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Robber','James','Robertson',14,'Action');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Smithereens','John','Smith',20,'Action');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Tyrone','Antione','Tyler',25,'Adventure');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Vantage','Ina','Cervantes',22,'Platformer');
INSERT INTO Consumer(username,first_name,last_name,gold_points,fav_genre) VALUES ('Village','Joshua','Villegas',9,'Sports');

INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Advance Wars 1+2: Re-Boot Camp','Nintendo',59.99,'04-21-2023','Strategy',NULL,NULL,'Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Among Us','Innersloth',5,'12-15-2020','Multiplayer','Party','Other','Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Animal Crossing: New Horizons','Nintendo',59.99,'03-20-2020','Simulation',NULL,NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Cult of the Lamb','Devolver Digital',24.99,'08-11-2022','Action','Adventure','Strategy','Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Cuphead','StudioMDHR',19.99,'04-18-2019','Action','Arcade','Platformer','Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('DOOM Eternal','Bethesda',39.99,'12-08-2020','Action',NULL,NULL,'Mature');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Detective Pikachu Returns','Nintendo',49.99,'10-06-2023','Adventure',NULL,NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Disney llusion Island','Disney Electronic Content',39.99,'07-28-2023','Action','Adventure','Multiplayer','Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Everybody 1-2-Switch!','Nintendo',29.99,'06-30-2023','Party',NULL,NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Fall Guys','Epic Games',0,'06-21-2022','Multiplayer','Party',NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Fire Emblem Engage','Nintendo',59.99,'01-20-2023','Role-Playing','Strategy',NULL,'Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Fire Emblem: Three Houses','Nintendo',59.99,'07-26-2019','Role-Playing','Strategy',NULL,'Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Fitness Boxing 2: Rhythm & Exercise','Nintendo',49.99,'12-04-2020','Training','Sports','Music','Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Hades','Supergiant Games',24.99,'09-17-2020','Action','Adventure','Role-Playing','Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Headbangers: Rhythm Royale','Team17',19.99,'10-31-2023','Party','Multiplayer','Music','Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Hollow Knight','Team Cherry',15,'06-12-2018','Action','Adventure','Platformer','Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Hyrule Warriors: Age of Calamity','Nintendo',59.99,'11-20-2020','Action','Adventure','Fighting','Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('It Takes Two','Electronic Arts',39.99,'11-04-2022','Action','Adventure','Platformer','Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Kirby''s Dream Buffet','Nintendo',14.99,'08-17-2022','Action','Multiplayer',NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Luigi''s Mansion 3','Nintendo',59.99,'10-31-2019','Action','Adventure',NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Mario + Rabbids Sparks of Hope','Ubisoft',59.99,'10-20-2022','Strategy',NULL,NULL,'Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Mario Kart 8 Deluxe','Nintendo',59.99,'04-28-2017','Racing','Multiplayer','Other','Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Mega Man 11','CAPCOM',29.99,'10-02-2018','Action',NULL,NULL,'Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Metroid Prime Remastered','Nintendo',39.99,'02-08-2023','Adventure','Action','Platformer','Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Minecraft','Mojang',29.99,'06-28-2018','Action','Strategy','Simulation','Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Nickelodeon All-Star Brawl 2','Game Mill',49.99,'11-07-2023','Action','Fighting','Multiplayer','Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('No Man''s Sky','Hello Games',59.99,'10-07-2022','Action','Adventure','Simulation','Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Octopath Traveler II','SQUARE ENIX',59.99,'02-24-2023','Role-Playing',NULL,NULL,'Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Overcooked! 2','Team17',24.99,'08-07-2018','Strategy','Party','Simulation','Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('PAC-MAN World Re-PAC','BANDAI NAMCO Entertainment',29.99,'08-26-2022','Platformer','Arcade','Adventure','Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Persona 3 Portable','SEGA',19.99,'01-19-2023','Role-Playing',NULL,NULL,'Mature');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Persona 4 Golden','SEGA',19.99,'01-19-2023','Role-Playing',NULL,NULL,'Mature');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Persona 5 Royal','SEGA',59.99,'10-21-2022','Role-Playing',NULL,NULL,'Mature');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Persona 5 Tactica','SEGA',59.99,'11-17-2023','Role-Playing','Strategy','Simulation','Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Pokemon Brilliant Diamond','Nintendo',59.99,'11-19-2021','Adventure','Role-Playing',NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Pokemon Scarlet','Nintendo',59.99,'11-18-2022','Adventure','Role-Playing',NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Pokemon Shield','Nintendo',59.99,'11-15-2019','Adventure','Role-Playing',NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Pokemon Shining Pearl','Nintendo',59.99,'11-19-2021','Adventure','Role-Playing',NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Pokemon Sword','Nintendo',59.99,'11-15-2019','Adventure','Role-Playing',NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Pokemon Violet','Nintendo',59.99,'11-18-2022','Adventure','Role-Playing',NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('SEGA Genesis','SEGA',29.99,'12-07-2018','Arcade','Action','Platformer','Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('STAR WARS: The Force Unleashed','Aspyr',19.99,'04-20-2022','Action','Adventure',NULL,'Teen');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Sonic Origins','SEGA',29.99,'06-23-2022','Action','Platformer','Adventure','Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Splatoon 3','Nintendo',59.99,'09-09-2022','Action','Multiplayer',NULL,'Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Stardew Valley','ConcernedApe',14.99,'10-05-2017','Role-Playing','Simulation',NULL,'Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Super Mario Bros Wonder','Nintendo',59.99,'10-20-2023','Platformer','Action',NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Super Mario RPG','Nintendo',59.99,'11-17-2023','Role-Playing','Adventure',NULL,'Everyone');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Super Smash Bros. Ultimate','Nintendo',59.99,'12-07-2018','Action','Fighting','Multiplayer','Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('The Legend of Zelda: Breath of the Wild','Nintendo',59.99,'03-03-2017','Adventure','Action','Role-Playing','Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('The Legend of Zelda: Tears of the Kingdom','Nintendo',69.99,'05-12-2023','Adventure','Action','Role-Playing','Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Various Daylife','SQUARE ENIX',28.99,'09-13-2022','Role-Playing',NULL,NULL,'Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('WarioWare: Move It!','Nintendo',49.99,'11-03-2023','Action','Party',NULL,'Everyone 10+');
INSERT INTO Video_Game(game_title,dev_name,price,release_date,genre1,genre2,genre3,ESRB_rating) VALUES ('Xenoblade Chronicles 3','Nintendo',59.99,'06-29-2022','Role-Playing',NULL,NULL,'Teen');

INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Animal Crossing: New Horizons - Happy Home Paradise','Animal Crossing: New Horizons','Nintendo',24.99,'11-05-2021','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Costume Gil''s Armor and Helmet','Super Smash Bros. Ultimate','Nintendo',0.75,'10-13-2020','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Costume Heihachi Outfit and Wig','Super Smash Bros. Ultimate','Nintendo',0.75,'06-29-2020','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Costume Lloyd Outfit and Wig','Super Smash Bros. Ultimate','Nintendo',0.75,'06-29-2021','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Cult of the Lamb - Cultist Pack','Cult of the Lamb','Devolver Digital',6.99,'08-24-2022','Teen');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Cult of the Lamb - Cultist and Heretic Pack','Cult of the Lamb','Devolver Digital',11.99,'04-24-2023','Teen');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Cult of the Lamb - Heretic Pack','Cult of the Lamb','Devolver Digital',6.99,'04-24-2023','Teen');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Cuphead - The Delicious Last Course','Cuphead','StudioMDHR',7.99,'06-30-2022','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Fire Emblem: Three Houses - Expansion Pass','Fire Emblem: Three Houses','Nintendo',24.99,'11-07-2019','Teen');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Fitness Boxing 2: Nature Stages','Fitness Boxing 2: Rhythm & Exercise','Nintendo',1.49,'01-24-2023','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Fitness Boxing 2: Rock Workout','Fitness Boxing 2: Rhythm & Exercise','Nintendo',1.49,'01-24-2023','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Headbangers: Pigeon Pass','Headbangers: Rhythm Royale','Team17',11.99,'10-31-2023','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Hyrule Warriors: Age of Calamity Expansion Pass','Hyrule Warriors: Age of Calamity','Nintendo',19.99,'05-28-2021','Teen');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Luigi''s Mansion 3: Multiplayer Pack','Luigi''s Mansion 3','Nintendo',9.99,'12-17-2019','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Mario + Rabbids Sparks of Hope DLC 2: The Last Spark Hunter','Mario + Rabbids Sparks of Hope','Ubisoft',14.99,'06-21-2023','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Mario + Rabbids Sparks of Hope DLC 3: Rayman in the Phantom Show','Mario + Rabbids Sparks of Hope','Ubisoft',14.99,'08-30-2023','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Mario + Rabbids Sparks of Hope Season Pass','Mario + Rabbids Sparks of Hope','Ubisoft',29.99,'10-20-2022','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Mario Kart 8 Deluxe - Booster Course Pass','Mario Kart 8 Deluxe','Nintendo',24.99,'03-18-2022','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Nickelodeon All-Star Brawl 2 Costume Pack','Nickelodeon All-Star Brawl 2','Game Mill',19.99,'11-07-2023','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Nickelodeon All-Star Brawl 2 Season Pass','Nickelodeon All-Star Brawl 2','Game Mill',24.99,'11-07-2023','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Order of Heroes Item Set','Fire Emblem Engage','Nintendo',0,'01-20-2023','Teen');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Overcooked! 2 - Campfire Cook Off','Overcooked! 2','Team17',5.99,'04-18-2019','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Overcooked! 2 - Carnival of Chaos','Overcooked! 2','Team17',5.99,'09-12-2019','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Overcooked! 2 - Night of the Hangry Horde','Overcooked! 2','Team17',9.99,'06-13-2019','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Overcooked! 2 - Surf ''n'' Turf','Overcooked! 2','Team17',5.99,'10-03-2018','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Overcooked! 2 - Too Many Cooks Pack','Overcooked! 2','Team17',2.99,'08-07-2018','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('PAC-MAN WORLD Re-PAC - Jukebox','PAC-MAN WORLD Re-PAC','BANDAI NAMCO Entertainment',2.99,'11-16-2022','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('PAC-MAN WORLD Re-PAC Chrome Noir Chogokin Skin','PAC-MAN WORLD Re-PAC','BANDAI NAMCO Entertainment',0.99,'11-16-2022','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Persona 5 Tactica: Picaro Summoning Pack + Raoul Persona','Persona 5 Tactica','SEGA',9.99,'11-17-2023','Teen');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Persona 5 Tactica: Repaint Your Heart Challenge Pack','Persona 5 Tactica','SEGA',19.99,'11-17-2023','Teen');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Persona 5 Tactica: Weapon Pack','Persona 5 Tactica','SEGA',7.99,'11-17-2023','Teen');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Pokemon Scarlet: The Hidden Treasure of Area Zero','Pokemon Scarlet','Nintendo',34.99,'02-27-2023','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Pokemon Shield Expansion Pass','Pokemon Shield','Nintendo',29.99,'01-09-2020','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Pokemon Sword Expansion Pass','Pokemon Sword','Nintendo',29.99,'01-09-2020','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Pokemon Violet: The Hidden Treasure of Area Zero','Pokemon Violet','Nintendo',34.99,'02-27-2023','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Sonic Origins: Classic Music Pack','Sonic Origins','SEGA',3.99,'06-23-2022','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Sonic Origins: Plus Expansion Pack','Sonic Origins','SEGA',9.99,'06-23-2023','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Sonic Origins: Premium Fun Pack','Sonic Origins','SEGA',3.99,'06-23-2022','Everyone');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Splatoon 3 Expansion Pass','Splatoon 3','Nintendo',24.99,'02-08-2023','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 1','Super Smash Bros. Ultimate','Nintendo',5.99,'04-17-2019','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 10','Super Smash Bros. Ultimate','Nintendo',5.99,'06-29-2021','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 11','Super Smash Bros. Ultimate','Nintendo',5.99,'10-18-2021','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 2','Super Smash Bros. Ultimate','Nintendo',5.99,'06-30-2019','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 3','Super Smash Bros. Ultimate','Nintendo',5.99,'09-04-2019','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 4','Super Smash Bros. Ultimate','Nintendo',5.99,'11-06-2019','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 5','Super Smash Bros. Ultimate','Nintendo',5.99,'01-28-2020','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 6','Super Smash Bros. Ultimate','Nintendo',5.99,'06-29-2020','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 7','Super Smash Bros. Ultimate','Nintendo',5.99,'10-13-2020','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 8','Super Smash Bros. Ultimate','Nintendo',5.99,'12-22-2020','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 9','Super Smash Bros. Ultimate','Nintendo',5.99,'03-04-2021','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Piranha Plant Standalone Fighter','Super Smash Bros. Ultimate','Nintendo',4.99,'02-01-2019','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('The Legend of Zelda: Breath of the Wild Expansion Pass','The Legend of Zelda: Breath of the Wild','Nintendo',19.99,'03-02-2017','Everyone 10+');
INSERT INTO DLC(DLC_title,game_title,dev_name,price,release_date,ESRB_rating) VALUES ('Xenoblade Chronicles 3 Expansion Pass','Xenoblade Chronicles 3','Nintendo',29.99,'07-29-2022','Teen');

INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (1,'Single System',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (10,'Online',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (11,'Single System',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (12,'Local Wireless',2,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (13,'Online',1,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (14,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (15,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (16,'Local Wireless',2,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (17,'Online',2,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (18,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (19,'Local Wireless',2,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (2,'Online',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (20,'Online',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (21,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (22,'Local Wireless',2,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (23,'Online',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (24,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (25,'Single System',1,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (26,'Local Wireless',2,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (27,'Online',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (28,'Single System',2,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (29,'Local Wireless',2,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (3,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (30,'Online',2,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (31,'Single System',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (32,'Single System',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (33,'Local Wireless',2,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (34,'Online',2,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (35,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (36,'Online',1,60);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (37,'Single System',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (38,'Local Wireless',2,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (39,'Online',2,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (4,'Single System',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (40,'Single System',1,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (41,'Online',2,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (42,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (43,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (44,'Single System',1,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (45,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (46,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (47,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (48,'Local Wireless',4,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (49,'Online',4,15);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (5,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (50,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (51,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (52,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (53,'Local Wireless',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (54,'Online',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (55,'Single System',1,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (56,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (57,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (58,'Single System',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (59,'Local Wireless',2,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (6,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (60,'Online',2,12);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (61,'Single System',1,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (62,'Local Wireless',2,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (63,'Online',2,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (64,'Single System',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (65,'Local Wireless',1,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (66,'Online',1,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (67,'Single System',1,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (68,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (69,'Single System',1,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (7,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (70,'Single System',1,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (71,'Local Wireless',1,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (72,'Online',1,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (73,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (74,'Single System',1,2);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (75,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (76,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (77,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (78,'Online',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (79,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (8,'Single System',2,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (80,'Online',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (81,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (82,'Local Wireless',2,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (83,'Online',1,16);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (84,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (85,'Local Wireless',2,8);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (86,'Online',1,16);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (87,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (88,'Local Wireless',2,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (89,'Online',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (9,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (90,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (91,'Local Wireless',2,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (92,'Online',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (93,'Single System',1,1);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (94,'Online',2,30);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (95,'Single System',1,4);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (96,'Online',1,12);
INSERT INTO Functionality(func_id,func_type,players_min,players_max) VALUES (97,'Single System',1,1);

INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Animal Crossing: New Horizons Bundle (Game + DLC)','Nintendo',84.98,'01-31-2023','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Brilliant Scarlet Shield','Nintendo',199.99,'11-18-2022','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Campfire Cook Off + Game','Team17',30.99,'04-18-2019','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Carnival Chaos + Game','Team17',30.99,'09-12-2019','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Cult of the Lamb: Cultist Edition','Devolver Digital',29.99,'08-24-2022','Teen');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Cult of the Lamb: Heretic Edition','Devolver Digital',34.99,'05-24-2023','Teen');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Cuphead & The Delicious Last Course','StudioMDHR',26.99,'06-30-2022','Everyone 10+');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Double Zelda','Nintendo',149.99,'05-12-2023','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Fire Emblem Engage Expansion Pass','Nintendo',29.99,'01-20-2023','Teen');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Fire Emblem: Three Houses + Expansion Pass','Nintendo',84.98,'11-07-2019','Teen');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Headbangers: Rhythm Royale - Digital Deluxe Edition','Team17',29.99,'10-31-2023','Everyone 10+');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Hyrule Warriors: Age of Calamity + Hyrule Warriors: Age of Calamity Expansion Pass','Nintendo',79.98,'05-28-2021','Teen');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('It Takes Two - Friend''s Pass','Electronic Arts',0,'11-04-2022','Teen');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Luigi''s Mansion 3 + Multiplayer Pack Set','Nintendo',69.98,'12-17-2019','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Mario + Rabbids Sparks of Hope Gold Edition','Ubisoft',89.99,'10-20-2022','Everyone 10+');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Mario + Rabbids Sparks of Hope: + Rayman Edition','Ubisoft',69.99,'08-30-2023','Everyone 10+');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Mario Kart 8 Deluxe Bundle (Game + Booster Course Pass)','Nintendo',84.98,'01-27-2023','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('New Mario Titles','Nintendo',119.99,'11-17-2023','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Nickelodeon All-Star Brawl 2 Deluxe Edition','Game Mill',69.99,'11-07-2023','Everyone 10+');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Nickelodeon All-Star Brawl 2 Ultimate Edition','Game Mill',79.99,'11-07-2023','Everyone 10+');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Night of the Hangry Horde + Game','Team17',34.99,'06-13-2019','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Octopath Traveler II + Various Daylife Bundle','SQUARE ENIX',64.99,'09-12-2023','Teen');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Overcooked! 2 - Gourmet Edition','Team17',48.49,'04-07-2020','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Persona 3 Portable & Persona 4 Golden Bundle','SEGA',34.49,'01-19-2023','Mature');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Persona 5 Tactica: Digital Deluxe Edition','SEGA',79.99,'11-17-2023','Teen');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Persona 5 Time','SEGA',56.99,'11-20-2023','Mature');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Persona Collection','SEGA',89.99,'10-06-2023','Mature');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Pokemon Brilliant Diamond and Pokemon Shining Pearl Double Pack','Nintendo',119.99,'11-19-2021','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Pokemon Scarlet Bundle (Game + DLC)','Nintendo',94.99,'02-27-2023','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Pokemon Scarlet and Pokemon Violet Double Pack','Nintendo',119.99,'11-18-2022','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Pokemon Shield + Expansion Pass','Nintendo',89.98,'01-09-2020','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Pokemon Sword + Expansion Pass','Nintendo',89.98,'01-09-2020','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Pokemon Sword and Pokemon Shield Double Pack Digital Version','Nintendo',119.99,'11-15-2019','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Pokemon Violet Bundle (Game + DLC)','Nintendo',94.99,'02-27-2023','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Shining Violet Sword','Nintendo',199.99,'11-18-2022','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Sonic Origins Plus','SEGA',39.99,'06-23-2023','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Splatoon 3 Bundle (Game + Expansion Pass)','Nintendo',84.98,'02-08-2023','Everyone 10+');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Fighters Pass','Nintendo',24.99,'12-07-2018','Everyone 10+');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Super Smash Bros. Ultimate: Fighters Pass Vol. 2','Nintendo',29.99,'01-28-2020','Everyone 10+');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Surf ''n'' Turf + Game','Team17',30.99,'10-03-2018','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Team17 Bundle','Team17',46.99,'10-31-2023','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('The Legend of Zelda: Breath of the Wild and The Legend of Zelda: Breath of the Wild Expansion Pass Bundle','Nintendo',79.98,'12-08-2017','Everyone 10+');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Three Tiers of Pokemon','Nintendo',419.99,'11-18-2022','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Too Many Cooks + Game','Team17',28.99,'08-07-2018','Everyone');
INSERT INTO Game_Bundle(bundle_title,dev_name,price,release_date,ESRB_rating) VALUES ('Xenoblade Chronicles 3 + Xenoblade Chronicles 3 Pass','Nintendo',89.98,'07-29-2022','Teen');

INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Animal Crossing: New Horizons - Happy Home Paradise','Gardens');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Cult of the Lamb - Cultist Pack','Correct');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Cult of the Lamb - Cultist Pack','Smithereens');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Cult of the Lamb - Cultist and Heretic Pack','Correct');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Cult of the Lamb - Heretic Pack','Correct');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Cult of the Lamb - Heretic Pack','Smithereens');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Cuphead - The Delicious Last Course','Brancine');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Fitness Boxing 2: Nature Stages','Village');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Fitness Boxing 2: Rock Workout','Rednose');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Headbangers: Pigeon Pass','Jeremy');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Headbangers: Pigeon Pass','Rayray');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Headbangers: Pigeon Pass','Rednose');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Nickelodeon All-Star Brawl 2 Costume Pack','Jeremy');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Nickelodeon All-Star Brawl 2 Costume Pack','Robber');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Nickelodeon All-Star Brawl 2 Season Pass','Jeremy');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Nickelodeon All-Star Brawl 2 Season Pass','Robber');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Order of Heroes Item Set','Poohbear');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Overcooked! 2 - Campfire Cook Off','Frankfurter');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Overcooked! 2 - Campfire Cook Off','Poohbear');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Overcooked! 2 - Campfire Cook Off','Rayray');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Overcooked! 2 - Carnival of Chaos','Gardens');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Overcooked! 2 - Night of the Hangry Horde','Gardens');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Overcooked! 2 - Night of the Hangry Horde','Poohbear');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Overcooked! 2 - Night of the Hangry Horde','Rayray');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Overcooked! 2 - Surf ''n'' Turf','Frankfurter');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Overcooked! 2 - Too Many Cooks Pack','Frankfurter');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('PAC-MAN WORLD Re-PAC - Jukebox','Brancine');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('PAC-MAN WORLD Re-PAC Chrome Noir Chogokin Skin','Brancine');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Persona 5 Tactica: Picaro Summoning Pack + Raoul Persona','Machung');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Persona 5 Tactica: Repaint Your Heart Challenge Pack','Machung');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Persona 5 Tactica: Weapon Pack','Machung');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Pokemon Scarlet: The Hidden Treasure of Area Zero','Tyrone');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Pokemon Shield Expansion Pass','Tyrone');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Pokemon Sword Expansion Pass','Tyrone');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Sonic Origins: Classic Music Pack','Robber');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Sonic Origins: Classic Music Pack','Vantage');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Sonic Origins: Plus Expansion Pack','Robber');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Sonic Origins: Plus Expansion Pack','Vantage');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Sonic Origins: Premium Fun Pack','Robber');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Sonic Origins: Premium Fun Pack','Vantage');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Splatoon 3 Expansion Pass','Smithereens');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 5','Paint');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 6','Paint');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 7','Paint');
INSERT INTO DLCToConsumer(DLC_title,username) VALUES ('The Legend of Zelda: Breath of the Wild Expansion Pass','Correct');

INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Animal Crossing: New Horizons - Happy Home Paradise','Animal Crossing: New Horizons Bundle (Game + DLC)');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Cult of the Lamb - Cultist Pack','Cult of the Lamb: Cultist Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Cult of the Lamb - Cultist and Heretic Pack','Cult of the Lamb: Heretic Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Cuphead - The Delicious Last Course','Cuphead & The Delicious Last Course');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Fire Emblem: Three Houses - Expansion Pass','Fire Emblem: Three Houses + Expansion Pass');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Headbangers: Pigeon Pass','Headbangers: Rhythm Royale - Digital Deluxe Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Hyrule Warriors: Age of Calamity Expansion Pass','Hyrule Warriors: Age of Calamity + Hyrule Warriors: Age of Calamity Expansion Pass');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Luigi''s Mansion 3: Multiplayer Pack','Luigi''s Mansion 3 + Multiplayer Pack Set');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Mario + Rabbids Sparks of Hope DLC 3: Rayman in the Phantom Show','Mario + Rabbids Sparks of Hope: + Rayman Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Mario + Rabbids Sparks of Hope Season Pass','Mario + Rabbids Sparks of Hope Gold Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Mario Kart 8 Deluxe - Booster Course Pass','Mario Kart 8 Deluxe Bundle (Game + Booster Course Pass)');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Nickelodeon All-Star Brawl 2 Costume Pack','Nickelodeon All-Star Brawl 2 Ultimate Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Nickelodeon All-Star Brawl 2 Season Pass','Nickelodeon All-Star Brawl 2 Deluxe Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Nickelodeon All-Star Brawl 2 Season Pass','Nickelodeon All-Star Brawl 2 Ultimate Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Order of Heroes Item Set','Fire Emblem Engage Expansion Pass');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Overcooked! 2 - Campfire Cook Off','Campfire Cook Off + Game');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Overcooked! 2 - Campfire Cook Off','Overcooked! 2 - Gourmet Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Overcooked! 2 - Carnival of Chaos','Carnival Chaos + Game');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Overcooked! 2 - Carnival of Chaos','Overcooked! 2 - Gourmet Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Overcooked! 2 - Night of the Hangry Horde','Night of the Hangry Horde + Game');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Overcooked! 2 - Night of the Hangry Horde','Overcooked! 2 - Gourmet Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Overcooked! 2 - Surf ''n'' Turf','Overcooked! 2 - Gourmet Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Overcooked! 2 - Surf ''n'' Turf','Surf ''n'' Turf + Game');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Overcooked! 2 - Too Many Cooks Pack','Overcooked! 2 - Gourmet Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Overcooked! 2 - Too Many Cooks Pack','Too Many Cooks + Game');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Persona 5 Tactica: Picaro Summoning Pack + Raoul Persona','Persona 5 Tactica: Digital Deluxe Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Persona 5 Tactica: Repaint Your Heart Challenge Pack','Persona 5 Tactica: Digital Deluxe Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Persona 5 Tactica: Weapon Pack','Persona 5 Tactica: Digital Deluxe Edition');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Pokemon Scarlet: The Hidden Treasure of Area Zero','Pokemon Scarlet Bundle (Game + DLC)');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Pokemon Shield Expansion Pass','Pokemon Shield + Expansion Pass');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Pokemon Sword Expansion Pass','Pokemon Sword + Expansion Pass');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Pokemon Violet: The Hidden Treasure of Area Zero','Pokemon Violet Bundle (Game + DLC)');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Sonic Origins: Plus Expansion Pack','Sonic Origins Plus');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Splatoon 3 Expansion Pass','Splatoon 3 Bundle (Game + Expansion Pass)');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 1','Super Smash Bros. Ultimate: Fighters Pass');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 10','Super Smash Bros. Ultimate: Fighters Pass Vol. 2');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 11','Super Smash Bros. Ultimate: Fighters Pass Vol. 2');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 2','Super Smash Bros. Ultimate: Fighters Pass');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 3','Super Smash Bros. Ultimate: Fighters Pass');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 4','Super Smash Bros. Ultimate: Fighters Pass');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 5','Super Smash Bros. Ultimate: Fighters Pass');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 6','Super Smash Bros. Ultimate: Fighters Pass Vol. 2');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 7','Super Smash Bros. Ultimate: Fighters Pass Vol. 2');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 8','Super Smash Bros. Ultimate: Fighters Pass Vol. 2');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Super Smash Bros. Ultimate: Challenger Pack 9','Super Smash Bros. Ultimate: Fighters Pass Vol. 2');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('The Legend of Zelda: Breath of the Wild Expansion Pass','The Legend of Zelda: Breath of the Wild and The Legend of Zelda: Breath of the Wild Expansion Pass Bundle');
INSERT INTO DLCToGameBundle(DLC_title,bundle_title) VALUES ('Xenoblade Chronicles 3 Expansion Pass','Xenoblade Chronicles 3 + Xenoblade Chronicles 3 Pass');

INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Animal Crossing: New Horizons Bundle (Game + DLC)','Gardens');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Brilliant Scarlet Shield','Correct');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Brilliant Scarlet Shield','Machung');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Carnival Chaos + Game','Frankfurter');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Cult of the Lamb: Cultist Edition','Poohbear');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Cuphead & The Delicious Last Course','Brancine');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Cuphead & The Delicious Last Course','Robber');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Cuphead & The Delicious Last Course','Vantage');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Fire Emblem: Three Houses + Expansion Pass','Poohbear');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Headbangers: Rhythm Royale - Digital Deluxe Edition','Jeremy');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Headbangers: Rhythm Royale - Digital Deluxe Edition','Rayray');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Headbangers: Rhythm Royale - Digital Deluxe Edition','Rednose');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Hyrule Warriors: Age of Calamity + Hyrule Warriors: Age of Calamity Expansion Pass','Paint');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Hyrule Warriors: Age of Calamity + Hyrule Warriors: Age of Calamity Expansion Pass','Robber');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Hyrule Warriors: Age of Calamity + Hyrule Warriors: Age of Calamity Expansion Pass','Smithereens');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('It Takes Two - Friend''s Pass','Vantage');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Luigi''s Mansion 3 + Multiplayer Pack Set','Robber');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Luigi''s Mansion 3 + Multiplayer Pack Set','Smithereens');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Nickelodeon All-Star Brawl 2 Deluxe Edition','Jeremy');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Nickelodeon All-Star Brawl 2 Deluxe Edition','Paint');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Nickelodeon All-Star Brawl 2 Deluxe Edition','Robber');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Nickelodeon All-Star Brawl 2 Ultimate Edition','Jeremy');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Nickelodeon All-Star Brawl 2 Ultimate Edition','Paint');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Nickelodeon All-Star Brawl 2 Ultimate Edition','Robber');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Night of the Hangry Horde + Game','Frankfurter');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Overcooked! 2 - Gourmet Edition','Frankfurter');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Overcooked! 2 - Gourmet Edition','Poohbear');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Persona 5 Tactica: Digital Deluxe Edition','Gardens');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Persona 5 Time','Gardens');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Pokemon Brilliant Diamond and Pokemon Shining Pearl Double Pack','Tyrone');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Pokemon Shield + Expansion Pass','Correct');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Pokemon Shield + Expansion Pass','Tyrone');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Pokemon Sword + Expansion Pass','Tyrone');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Shining Violet Sword','Correct');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Shining Violet Sword','Machung');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Sonic Origins Plus','Robber');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Sonic Origins Plus','Smithereens');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Sonic Origins Plus','Vantage');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Super Smash Bros. Ultimate: Fighters Pass','Paint');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Super Smash Bros. Ultimate: Fighters Pass Vol. 2','Paint');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Surf ''n'' Turf + Game','Rayray');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('The Legend of Zelda: Breath of the Wild and The Legend of Zelda: Breath of the Wild Expansion Pass Bundle','Robber');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Three Tiers of Pokemon','Correct');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Three Tiers of Pokemon','Machung');
INSERT INTO GameBundleToConsumer(bundle_title,username) VALUES ('Too Many Cooks + Game','Rayray');

INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Advance Wars 1+2: Re-Boot Camp','Poohbear');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Among Us','Rayray');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Cuphead','Brancine');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Detective Pikachu Returns','Tyrone');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Everybody 1-2-Switch!','Frankfurter');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Fall Guys','Frankfurter');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Fall Guys','Jeremy');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Fire Emblem Engage','Machung');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Fire Emblem Engage','Poohbear');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Fitness Boxing 2: Rhythm & Exercise','Rednose');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Fitness Boxing 2: Rhythm & Exercise','Village');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Headbangers: Rhythm Royale','Rayray');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Headbangers: Rhythm Royale','Rednose');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Hyrule Warriors: Age of Calamity','Paint');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('It Takes Two','Vantage');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Kirby''s Dream Buffet','Jeremy');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Metroid Prime Remastered','Robber');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Metroid Prime Remastered','Vantage');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Minecraft','Gardens');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Nickelodeon All-Star Brawl 2','Paint');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('No Man''s Sky','Gardens');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Overcooked! 2','Gardens');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Overcooked! 2','Poohbear');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Overcooked! 2','Rayray');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('PAC-MAN World Re-PAC','Brancine');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Pokemon Shield','Correct');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Pokemon Shining Pearl','Correct');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Pokemon Sword','Correct');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('SEGA Genesis','Brancine');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Splatoon 3','Jeremy');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Splatoon 3','Robber');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Super Mario Bros Wonder','Robber');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Super Mario Bros Wonder','Smithereens');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Super Mario Bros Wonder','Vantage');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Super Mario RPG','Correct');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Super Mario RPG','Machung');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Super Mario RPG','Tyrone');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('Super Smash Bros. Ultimate','Paint');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('The Legend of Zelda: Tears of the Kingdom','Machung');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('The Legend of Zelda: Tears of the Kingdom','Robber');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('The Legend of Zelda: Tears of the Kingdom','Smithereens');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('The Legend of Zelda: Tears of the Kingdom','Tyrone');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('WarioWare: Move It!','Frankfurter');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('WarioWare: Move It!','Robber');
INSERT INTO VideoGameToConsumer(game_title,username) VALUES ('WarioWare: Move It!','Smithereens');

INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Advance Wars 1+2: Re-Boot Camp',11);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Advance Wars 1+2: Re-Boot Camp',12);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Advance Wars 1+2: Re-Boot Camp',13);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Among Us',47);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Among Us',48);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Among Us',49);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Animal Crossing: New Horizons',64);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Animal Crossing: New Horizons',65);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Animal Crossing: New Horizons',66);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Cult of the Lamb',50);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Cuphead',55);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('DOOM Eternal',46);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Detective Pikachu Returns',5);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Disney llusion Island',31);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Everybody 1-2-Switch!',8);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Fall Guys',35);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Fall Guys',36);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Fire Emblem Engage',9);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Fire Emblem Engage',10);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Fire Emblem: Three Houses',73);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Fitness Boxing 2: Rhythm & Exercise',69);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Hades',51);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Headbangers: Rhythm Royale',93);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Headbangers: Rhythm Royale',94);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Hollow Knight',56);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Hyrule Warriors: Age of Calamity',67);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('It Takes Two',28);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('It Takes Two',29);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('It Takes Two',30);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Kirby''s Dream Buffet',25);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Kirby''s Dream Buffet',26);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Kirby''s Dream Buffet',27);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Luigi''s Mansion 3',70);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Luigi''s Mansion 3',71);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Luigi''s Mansion 3',72);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Mario + Rabbids Sparks of Hope',57);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Mario Kart 8 Deluxe',58);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Mario Kart 8 Deluxe',59);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Mario Kart 8 Deluxe',60);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Mega Man 11',45);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Metroid Prime Remastered',7);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Minecraft',32);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Minecraft',33);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Minecraft',34);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Nickelodeon All-Star Brawl 2',95);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Nickelodeon All-Star Brawl 2',96);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('No Man''s Sky',43);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Octopath Traveler II',14);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Overcooked! 2',37);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Overcooked! 2',38);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Overcooked! 2',39);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('PAC-MAN World Re-PAC',42);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Persona 3 Portable',76);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Persona 4 Golden',77);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Persona 4 Golden',78);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Persona 5 Royal',79);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Persona 5 Royal',80);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Persona 5 Tactica',75);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Brilliant Diamond',81);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Brilliant Diamond',82);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Brilliant Diamond',83);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Scarlet',18);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Scarlet',19);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Scarlet',20);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Shield',87);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Shield',88);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Shield',89);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Shining Pearl',84);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Shining Pearl',85);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Shining Pearl',86);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Sword',90);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Sword',91);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Sword',92);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Violet',21);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Violet',22);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Pokemon Violet',23);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('SEGA Genesis',40);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('SEGA Genesis',41);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('STAR WARS: The Force Unleashed',44);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Sonic Origins',74);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Splatoon 3',15);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Splatoon 3',16);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Splatoon 3',17);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Stardew Valley',52);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Stardew Valley',53);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Stardew Valley',54);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Super Mario Bros Wonder',1);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Super Mario Bros Wonder',2);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Super Mario RPG',3);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Super Smash Bros. Ultimate',61);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Super Smash Bros. Ultimate',62);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Super Smash Bros. Ultimate',63);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('The Legend of Zelda: Breath of the Wild',68);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('The Legend of Zelda: Tears of the Kingdom',6);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Various Daylife',97);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('WarioWare: Move It!',4);
INSERT INTO VideoGameToFunctionality(game_title,func_id) VALUES ('Xenoblade Chronicles 3',24);

INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Animal Crossing: New Horizons','Animal Crossing: New Horizons Bundle (Game + DLC)');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Cult of the Lamb','Cult of the Lamb: Cultist Edition');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Cult of the Lamb','Cult of the Lamb: Heretic Edition');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Cuphead','Cuphead & The Delicious Last Course');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Fire Emblem Engage','Fire Emblem Engage Expansion Pass');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Fire Emblem: Three Houses','Fire Emblem: Three Houses + Expansion Pass');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Headbangers: Rhythm Royale','Headbangers: Rhythm Royale - Digital Deluxe Edition');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Headbangers: Rhythm Royale','Team17 Bundle');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Hyrule Warriors: Age of Calamity','Hyrule Warriors: Age of Calamity + Hyrule Warriors: Age of Calamity Expansion Pass');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('It Takes Two','It Takes Two - Friend''s Pass');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Luigi''s Mansion 3','Luigi''s Mansion 3 + Multiplayer Pack Set');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Mario + Rabbids Sparks of Hope','Mario + Rabbids Sparks of Hope Gold Edition');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Mario + Rabbids Sparks of Hope','Mario + Rabbids Sparks of Hope: + Rayman Edition');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Mario Kart 8 Deluxe','Mario Kart 8 Deluxe Bundle (Game + Booster Course Pass)');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Nickelodeon All-Star Brawl 2','Nickelodeon All-Star Brawl 2 Deluxe Edition');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Nickelodeon All-Star Brawl 2','Nickelodeon All-Star Brawl 2 Ultimate Edition');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Octopath Traveler II','Octopath Traveler II + Various Daylife Bundle');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Overcooked! 2','Campfire Cook Off + Game');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Overcooked! 2','Carnival Chaos + Game');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Overcooked! 2','Night of the Hangry Horde + Game');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Overcooked! 2','Overcooked! 2 - Gourmet Edition');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Overcooked! 2','Surf ''n'' Turf + Game');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Overcooked! 2','Team17 Bundle');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Overcooked! 2','Too Many Cooks + Game');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Persona 3 Portable','Persona 3 Portable & Persona 4 Golden Bundle');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Persona 3 Portable','Persona Collection');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Persona 4 Golden','Persona 3 Portable & Persona 4 Golden Bundle');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Persona 4 Golden','Persona Collection');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Persona 5 Royal','Persona 5 Time');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Persona 5 Royal','Persona Collection');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Persona 5 Tactica','Persona 5 Tactica: Digital Deluxe Edition');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Persona 5 Tactica','Persona 5 Time');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Brilliant Diamond','Brilliant Scarlet Shield');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Brilliant Diamond','Pokemon Brilliant Diamond and Pokemon Shining Pearl Double Pack');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Brilliant Diamond','Three Tiers of Pokemon');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Scarlet','Brilliant Scarlet Shield');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Scarlet','Pokemon Scarlet Bundle (Game + DLC)');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Scarlet','Pokemon Scarlet and Pokemon Violet Double Pack');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Scarlet','Three Tiers of Pokemon');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Shield','Brilliant Scarlet Shield');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Shield','Pokemon Shield + Expansion Pass');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Shield','Pokemon Sword and Pokemon Shield Double Pack Digital Version');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Shield','Three Tiers of Pokemon');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Shining Pearl','Pokemon Brilliant Diamond and Pokemon Shining Pearl Double Pack');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Shining Pearl','Shining Violet Sword');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Shining Pearl','Three Tiers of Pokemon');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Sword','Pokemon Sword + Expansion Pass');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Sword','Pokemon Sword and Pokemon Shield Double Pack Digital Version');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Sword','Shining Violet Sword');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Sword','Three Tiers of Pokemon');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Violet','Pokemon Scarlet and Pokemon Violet Double Pack');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Violet','Pokemon Violet Bundle (Game + DLC)');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Violet','Shining Violet Sword');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Pokemon Violet','Three Tiers of Pokemon');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Sonic Origins','Sonic Origins Plus');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Splatoon 3','Splatoon 3 Bundle (Game + Expansion Pass)');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Super Mario Bros. Wonder','New Mario Titles');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Super Mario RPG','New Mario Titles');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Super Smash Bros. Ultimate','Super Smash Bros. Ultimate: Fighters Pass');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Super Smash Bros. Ultimate','Super Smash Bros. Ultimate: Fighters Pass Vol. 2');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('The Legend of Zelda: Breath of the Wild','Double Zelda');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('The Legend of Zelda: Breath of the Wild','The Legend of Zelda: Breath of the Wild and The Legend of Zelda: Breath of the Wild Expansion Pass Bundle');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('The Legend of Zelda: Tears of the Kingdom','Double Zelda');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Various Daylife','Octopath Traveler II + Various Daylife Bundle');
INSERT INTO VideoGameToGameBundle(game_title,bundle_title) VALUES ('Xenoblade Chronicles 3','Xenoblade Chronicles 3 + Xenoblade Chronicles 3 Pass');