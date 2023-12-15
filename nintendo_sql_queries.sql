-- Author: Noah McMahon --

USE nintendo_game_db;

-- Prompt 1: --
-- Create a function that returns a "wish" list of all of the video games, DLCs, --
-- and game bundles that match a consumer's favorite genre. --

GO
CREATE FUNCTION fnWishList(@username VARCHAR(50))
	RETURNS TABLE
RETURN
	(SELECT vg.game_title, d.DLC_title, gb.bundle_title
	 FROM Video_Game vg
	 JOIN DLC d
	 ON vg.game_title = d.game_title
	 JOIN DLCToGameBundle dgb
	 ON d.DLC_title = dgb.DLC_title
	 JOIN Game_Bundle gb
	 ON dgb.bundle_title = gb.bundle_title
	 WHERE vg.genre1 = (SELECT fav_genre FROM Consumer WHERE username = @username) 
	 OR vg.genre2 = (SELECT fav_genre FROM Consumer WHERE username = @username) 
	 OR vg.genre3 = (SELECT fav_genre FROM Consumer WHERE username = @username));
GO

SELECT *
FROM fnWishList('Poohbear')

SELECT *
FROM fnWishList('Jeremy')

-- Prompt 2: --
-- Create a function that takes a maximum amount of money that --
-- a consumer is willing to spend and return [from their "wish list"] --
-- a list of all of the games under that amount. --

GO
CREATE FUNCTION fnUnderMax(@max_amt SMALLINT, @username VARCHAR(50))
	RETURNS TABLE
RETURN
	(SELECT DISTINCT vg.game_title, d.DLC_title, gb.bundle_title
	 FROM fnWishList(@username) wl
	 JOIN Video_Game vg
	 ON vg.game_title = wl.game_title
	 JOIN DLC d
	 ON vg.game_title = d.game_title
	 JOIN DLCToGameBundle dgb
	 ON d.DLC_title = dgb.DLC_title
	 JOIN Game_Bundle gb
	 ON dgb.bundle_title = gb.bundle_title
	 WHERE (vg.price + d.price) < @max_amt OR (gb.price) < @max_amt);
GO

SELECT *
FROM fnUnderMax(100, 'Poohbear')

SELECT *
FROM fnUnderMax(80, 'Jeremy')

-- Prompt 3: --
-- Return the number of video games and the number of DLCs that each --
-- developer developed. Order the results by the number descending. --

SELECT vg.dev_name, COUNT(vg.game_title) AS "num_games", 
(SELECT COUNT(DLC_title) FROM DLC WHERE dev_name = vg.dev_name) AS "num_DLCs"
FROM Video_Game vg
GROUP BY vg.dev_name
ORDER BY num_games DESC, num_DLCs DESC

-- Prompt 4: --
-- Create triggers to set the price of video games, DLCs, --
-- and game bundles to NULL if a negative price is inputted. --

GO
CREATE TRIGGER Video_Game_UPDATE_INSERT
	ON Video_Game
	AFTER UPDATE, INSERT
AS
	UPDATE Video_Game
	SET price = NULL
	WHERE price < 0

GO
CREATE TRIGGER DLC_UPDATE_INSERT
	ON DLC
	AFTER UPDATE, INSERT
AS
	UPDATE DLC
	SET price = NULL
	WHERE price < 0

GO
CREATE TRIGGER Game_Bundle_UPDATE_INSERT
	ON Game_Bundle
	AFTER UPDATE, INSERT
AS
	UPDATE Game_Bundle
	SET price = NULL
	WHERE price < 0

INSERT INTO Video_Game(game_title, dev_name, price, release_date, genre1, genre2, genre3, ESRB_rating)
VALUES('New Pokemon Snap', 'Nintendo', -59.99, '04/30/2021', 'Simulation', NULL, NULL, 'Everyone')

SELECT *
FROM Video_Game
WHERE game_title = 'New Pokemon Snap'

INSERT INTO DLC(DLC_title, game_title, dev_name, price, release_date, ESRB_rating)
VALUES('Extra Pokemon Snap', 'New Pokemon Snap', 'Nintendo', -9.44, '05/07/2021', 'Everyone')

SELECT *
FROM DLC
WHERE DLC_title = 'Extra Pokemon Snap'

INSERT INTO Game_Bundle(bundle_title, dev_name, price, release_date, ESRB_rating)
VALUES('New Pokemon Snap Expansion (Game + DLC)', 'Nintendo', -75.00, '03/24/2022', 'Everyone')

SELECT *
FROM Game_Bundle
WHERE bundle_title = 'New Pokemon Snap Expansion (Game + DLC)'


-- For Resetting the Database Without those Trigger Test Values --
DELETE FROM Video_Game WHERE game_title = 'New Pokemon Snap'
DELETE FROM DLC WHERE DLC_title = 'Extra Pokemon Snap'
DELETE FROM Game_Bundle WHERE bundle_title = 'New Pokemon Snap Expansion (Game + DLC)'

-- Prompt 5: --
-- Create a function that returns the number of players --
-- for a designed video game. --

GO
CREATE FUNCTION fnNumPlayers(@game_title VARCHAR(50))
	RETURNS TABLE
RETURN
	(SELECT f.func_type, f.players_min, f.players_max
	FROM Functionality f
	JOIN VideoGameToFunctionality vgf
	ON f.func_id = vgf.func_id
	WHERE vgf.game_title = @game_title);
GO

SELECT *
FROM fnNumPlayers('Super Mario Bros Wonder')

SELECT *
FROM fnNumPlayers('Super Mario RPG')

-- Prompt 6: --
-- Return the top 20 newest video games. --
-- Also, return the top 10 oldest DLCS. --

SELECT TOP 20 game_title
FROM Video_Game
ORDER BY release_date DESC

SELECT TOP 10 DLC_title
FROM DLC
ORDER BY release_date ASC