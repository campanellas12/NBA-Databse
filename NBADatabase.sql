-- --------------- --
-- CREATING TABLES --
-- --------------- --
CREATE DATABASE IF NOT EXISTS NBA;
USE NBA;

CREATE TABLE IF NOT EXISTS Conferences (
	conference_name VARCHAR(30) PRIMARY KEY,
    conference_wins INT,
    conference_losses INT
);

CREATE TABLE IF NOT EXISTS Divisions (
	division_name VARCHAR(30) PRIMARY KEY,
    division_wins INT,
    division_losses INT,
    division_conference VARCHAR(30),
    FOREIGN KEY (division_conference) REFERENCES Conferences(conference_name)
);

CREATE TABLE IF NOT EXISTS Teams (
	team_name VARCHAR(30) PRIMARY KEY,
    team_wins INT,
    team_losses INT,
    team_location VARCHAR(30),
    year_founded INT,
    team_championships INT,
    team_conference VARCHAR(30),
    team_division VARCHAR(30),
    FOREIGN KEY (team_conference) REFERENCES Conferences(conference_name),
    FOREIGN KEY (team_division) REFERENCES Divisions(division_name)
);

CREATE TABLE IF NOT EXISTS Players (
	player_name VARCHAR(30) PRIMARY KEY,
    player_age INT,
    player_weight INT,
    player_height INT,
    player_points INT,
    player_assists INT,
    player_rebounds INT,
    player_steals INT,
    player_blocks INT,
    player_turnovers INT,
    player_team VARCHAR(30),
    FOREIGN KEY (player_team) REFERENCES Teams(team_name)
);

CREATE TABLE IF NOT EXISTS Draft_2020 (
	draft_pick_overall INT PRIMARY KEY,
    draft_pick_round_relative INT,
    draft_pick_round INT,
    draft_year INT,
    player_team VARCHAR(30),
    player_name VARCHAR(30),
    player_age INT,
    player_weight INT,
    player_height INT,
    FOREIGN KEY (player_name) REFERENCES Players(player_name)
);

-- ---------------- --
--  DDL/DML QUERIES --
-- ---------------- --

-- Conferences
INSERT INTO Conferences
VALUES 
	("East", 588, 642),
    ("West", 642, 588);
SELECT * FROM Conferences;
-- Divisions
INSERT INTO Divisions
VALUES 
	("Atlantic", 217, 193, "East"),
    ("Central", 190, 220, "East"),
    ("Southeast", 181, 229, "East"),
    ("Northwest", 242, 168, "West"),
    ("Pacific", 200, 210, "West"),
    ("Southwest", 200, 210, "West");
SELECT * FROM Divisions;
-- Teams
INSERT INTO Teams
VALUES 
	("Milwaukee Bucks", 60, 22, "Wisconsin", 1968, 2, "East", "Central"),
    ("Indiana Pacers", 48, 34, "Indiana", 1967, 0, "East", "Central"),
    ("Detroit Pistons", 41, 41, "Michigan", 1941, 3, "East", "Central"),
    ("Chicago Bulls", 22, 60, "Illinois", 1966, 6, "East", "Central"),
    ("Cleveland Cavaliers", 19, 63, "Ohio", 1970, 1, "East", "Central"),
    ("Toronto Raptors", 58, 24, "Toronto", 1995, 1, "East", "Atlantic"),
    ("Philadelphia 76ers", 51, 31, "Philadelphia", 1946, 3, "East", "Atlantic"),
    ("Boston Celtics", 49, 33, "Massachusetts", 1946, 17, "East", "Atlantic"),
    ("Brooklyn Nets", 42, 40, "New York", 1967,  0, "East", "Atlantic"),
    ("New York Knicks", 17, 65, "New York", 1946,  2, "East","Atlantic"),
    ("Orlando Magic", 42, 40, "Florida", 1989, 0, "East", "Southeast"),
    ("Charlotte Hornets", 39, 43, "North Carolina", 1988, 0, "East", "Southeast"),
    ("Miami Heat", 39, 43, "Florida", 1988, 3, "East", "Southeast"),
    ("Washington Wizards", 32, 50, "D.C", 1961, 1, "East", "Southeast"),
    ("Atlanta Hawks", 29, 53, "Georgia", 1946, 1, "East", "Southeast"),
    ("Denver Nuggets", 54, 28, "Colorado", 1967, 0, "West", "Northwest"),
    ("Portland Trailblaers", 53, 29, "Oregon", 1970, 1, "West", "Northwest"),
    ("Utah Jazz", 50, 32, "Utah", 1974, 0, "West", "Northwest"),
    ("Oklahoma City Thunder", 49, 33, "Oklahoma", 1967, 1, "West", "Northwest"),
    ("Minnesota Timberwolves", 36, 46, "Minnesota", 1989, 0, "West", "Northwest"),
    ("Golden State Warriors", 57, 25, "California", 1946, 4, "West", "Pacific"),
    ("Los Angeles Clippers", 48, 34, "California", 1970, 0, "West", "Pacific"),
    ("Sacramento Kings", 39, 43, "California", 1945, 0, "West", "Pacific"),
    ("Los Angeles Lakers", 37, 45, "California", 1946, 17, "West", "Pacific"),
    ("Phoenix Suns", 19, 63, "California", 1968, 0, "West", "Pacific"),
    ("Houston Rockets", 53, 29, "Texas", 1967, 2, "West", "Southwest"),
    ("San Antonio Spurs", 48, 34, "Texas", 1967, 5, "West", "Southwest"),
    ("Memphis Grizzlies", 33, 49, "Tenessee", 1995, 0, "West", "Southwest"),
    ("New Orleans Pelicans", 33, 49, "Lousiana", 2002, 0, "West", "Southwest"),
    ("Dallas Mavericks", 33, 49, "Texas", 1980, 1, "West", "Southwest");
SELECT * FROM Teams;

-- Players
INSERT INTO Players
VALUES 
	 -- 1
    ("Kyle Lowry", 32, 196, 72, 926, 564, 312, 91, 31, 182, "Toronto Raptors"),
    ("Kawhi Leonard", 27, 225, 79, 1596, 199, 439, 106, 24, 121, "Toronto Raptors"),
    ("Serge Ibaka", 29, 235, 81, 1112, 99, 439, 106, 24, 121, "Toronto Raptors"),
    ("Marc Gasol", 34, 255, 83, 237, 101, 172, 24, 23, 36, "Toronto Raptors"),
    ("Danny Green", 31, 215, 77, 821, 126, 317, 73, 53, 75, "Toronto Raptors"),
    -- 2
    ("Joel Embiid", 22, 280, 84, 1761, 234, 871, 46, 122, 226, "Philadelphia 76ers"),
    ("Jimmy Butler", 29, 130, 79, 1002, 220, 290, 99, 29, 81, "Philadelphia 76ers"),
    ("Ben Simmons", 22, 240, 83, 1337, 610, 697, 112, 61, 274, "Philadelphia 76ers"),
    ("JJ Reddick", 34, 200, 75, 1372, 206, 186, 32, 17, 101, "Philadelphia 76ers"),
    ("Tobias Harris", 26, 226, 80, 492, 79, 213, 11, 13, 42, "Philadelphia 76ers"),
    -- 3
    ("Kyrie Irving", 26, 195, 74, 2000, 1596, 464, 103, 34, 172, "Boston Celtics"),
    ("Jayson Tatum", 20, 210, 80, 1243, 168, 477, 84, 57, 102, "Boston Celtics"),
    ("Jaylen Brown", 22, 223, 78, 964, 100, 313, 69, 32, 99, "Boston Celtics"),
    ("Al Horford", 32, 240, 81, 925, 283, 458, 59, 86, 102, "Boston Celtics"),
    ("Gordon Hayward", 28, 225, 79, 825, 244, 322, 62, 23, 105, "Boston Celtics"),
    -- 4
    ("D'Angelo Russell", 22, 193, 76, 1712, 563, 315, 100, 20, 253, "Brooklyn Nets"),
    ("Caris Lavert", 24, 205, 78, 547, 156, 151, 42, 14, 69, "Brooklyn Nets"),
    ("Joe Harries", 27, 220, 78, 1041, 181, 291, 38, 17, 121, "Brooklyn Nets"),
    ("Jarrett Allen", 20, 243, 83, 873, 110, 672, 43, 120, 103, "Brooklyn Nets"),
    ("Spencer Dinwiddie", 25, 215, 77, 1143, 311, 166, 40, 17, 152, "Brooklyn Nets"),
    -- 5
    ("Tim Hardaway Jr.", 26, 205, 77, 880, 122, 161, 42, 6, 81, "New York Knicks"),
    ("Kevin Knox", 19, 215, 79, 963, 82, 335, 43, 24, 114, "New York Knicks"),
    ("Dennis Smith Jr.", 21, 205, 74, 308, 114, 58, 27, 9, 54, "New York Knicks"),
    ("Emmanuel Mudiay", 22, 100, 75, 873, 228, 196, 43, 19, 140, "New York Knicks"),
    ("Enes Kanter", 26, 250, 82, 614, 84, 461, 18, 17, 79, "New York Knicks"),
    -- 6
    ("Giannis Antetokounmpo", 24, 242, 83, 1994, 424, 898, 92, 110, 268, "Milwaukee Bucks"),
    ("Khris Middleton", 27, 222, 79, 1407, 331, 461, 80, 7, 174, "Milwaukee Bucks"),
    ("Brook Lopez", 30, 282, 84, 1009, 98, 396, 51, 179, 82, "Milwaukee Bucks"),
    ("Malcolm Brogdon", 26, 229, 77, 1001, 205, 288, 46, 13, 91, "Milwaukee Bucks"),
    ("Eric Bledsoe", 29, 214, 73, 1241, 430, 362, 116, 29, 165, "Milwaukee Bucks"),
    -- 7
    ("Victor Oladipo", 16, 213, 77, 675, 186, 202, 60, 11, 82, "Indiana Pacers"),
    ("Bojan Bogdanović", 29, 226, 79, 1454, 161, 333, 69, 1, 134, "Indiana Pacers"),
    ("Domantas Sabonis", 22, 240, 83, 1043, 212, 690, 48, 30, 160, "Indiana Pacers"),
    ("Thaddeus Young", 30, 235, 80, 1024, 204, 523, 123, 36, 123, "Indiana Pacers"),
    ("Myles Turner", 22, 250, 83, 984, 115, 531, 60, 199, 100, "Indiana Pacers"),
    -- 8
    ("Blake Griffin", 29, 250, 81, 1841, 402, 565, 52, 28, 253, "Detroit Pistons"),
    ("Andre Drummond", 25, 279, 82, 1370, 112, 1232, 136, 138, 175, "Detroit Pistons"),
    ("Reggie Jackson", 28, 208, 74, 1260, 334, 216, 55, 9, 148, "Detroit Pistons"),
    ("Langston Galloway", 27, 200, 73, 672, 85, 171, 37, 8, 24, "Detroit Pistons"),
    ("Luke Kennard", 22, 206, 77, 613, 114, 183, 26, 10, 57, "Detroit Pistons"),
    -- 9
    ("Zach LaVine", 23, 200, 77, 1492, 283, 294, 60, 26, 215, "Chicago Bulls"),
    ("Lauri Markkanen", 21, 240, 84, 974, 75, 470, 37, 33, 85, "Chicago Bulls"),
    ("Robin Lopez", 30, 281, 84, 704,89, 286, 11, 78, 96, "Chicago Bulls"),
    ("Jabari Parker", 23, 245, 80, 556,84, 241, 23, 14, 84, "Chicago Bulls"),
    ("Ryan Arcidiacono", 24, 195, 75, 554, 269, 219, 65, 4, 63, "Chicago Bulls"),
    -- 10
    ("Collin Sexton", 20, 190, 73, 1371, 243, 236, 44, 6, 185, "Cleveland Cavaliers"),
    ("Jordan Clarkson", 26, 194, 76, 1364, 196, 270, 57, 13, 135, "Cleveland Cavaliers"),
    ("Cedi Osman", 23, 230, 79, 991, 195, 357, 60, 11, 114, "Cleveland Cavaliers"),
    ("Larry Nance Jr.", 26, 245, 79, 627, 214, 552, 100, 40, 97, "Cleveland Cavaliers"),
    ("Rodney Hood", 26, 208, 80, 547, 92, 112, 38, 5, 36, "Cleveland Cavaliers"),
    -- 11
    ("Nikola Vucevic", 28, 260, 82, 1665, 307, 960, 81, 89, 159, "Orlando Magic"),
    ("Aaron Gordon", 23, 235, 80, 1246, 289, 547, 57, 56, 162, "Orlando Magic"),
    ("Evan Fournier", 26, 205, 79, 1226, 295, 258, 71, 12, 154, "Orlando Magic"),
    ("Terrence Ross", 27, 206, 78, 1223, 135, 280, 72, 29, 90, "Orlando Magic"),
    ("D.J. Augustin" , 31, 71, 183, 948, 426, 203, 52, 4, 128, "Orlando Magic"),
    -- 12
    ("Kemba Walker", 28, 184, 72, 2102, 484, 361, 102, 34, 211, "Charlotte Hornets"),
    ("Jeremy Lamb", 26, 180, 77, 1208, 172, 434, 88, 32, 80, "Charlotte Hornets"),
    ("Marvin William", 32, 237, 80, 756, 92, 407, 71, 61, 47, "Charlotte Hornets"),
    ("Nicolas Batum", 30, 230, 80, 699, 247, 390, 71, 43, 117, "Charlotte Hornets"),
    ("Malik Monk", 20, 200, 75, 653, 117, 137, 37, 19, 86, "Charlotte Hornets"),
	-- 13
    ("Josh Richardson", 25, 200, 77, 1209, 298, 263, 79, 34, 113, "Miami Heat"),
    ("Dwayne Wade", 37, 220, 76, 1083, 301, 285, 59, 38, 166, "Miami Heat"),
    ("Hassan Whiteside", 29, 265, 84, 887, 56, 817, 46, 136, 97, "Miami Heat"),
    ("Justise Winslow", 22, 222, 78, 830, 282, 355, 72, 19, 142, "Miami Heat"),
    ("Kelly Olynyk", 27, 240, 83, 787, 140, 375, 53, 37, 114, "Miami Heat"),
    -- 14
    ("Bradley Beal", 25, 207, 75, 2099, 448, 411, 121, 58, 224, "Washington Wizards"),
    ("Jeff Green", 32, 235, 80, 946, 137, 309, 43, 39, 101, "Washington Wizards"),
    ("Thomas Bryant", 21, 248, 82, 758, 92, 454, 25, 67, 60, "Washington Wizards"),
    ("Tomas Satoransky", 27, 210, 79, 709, 399, 279, 82, 13, 120, "Washington Wizards"),
    ("John Wall", 28, 210, 75, 663, 279, 116, 49, 29, 121, "Washington Wizards"),
    -- 15
    ("Trae Young", 20, 180, 73, 1549, 653, 301, 72, 15, 308, "Atlanta Hawks"),
    ("John Collins", 21, 235, 81, 1188, 121, 595, 22, 39, 120, "Atlanta Hawks"),
    ("Alex Len", 25, 250, 84, 854, 86, 424, 27, 69, 97, "Atlanta Hawks"),
    ("Kent Bazemore", 29, 195, 76, 779, 152, 261, 89, 42, 121, "Atlanta Hawks"),
    ("Taurean Prince", 24, 218, 79, 742, 118, 199, 53, 19, 100, "Atlanta Hawks"),
    -- 16
    ("Nikola Jokic", 23, 284, 83, 1604, 580, 865, 108, 55, 248, "Denver Nuggets"),
    ("Jamal Murray", 21, 215, 75, 1367, 363, 317, 67, 27, 158, "Denver Nuggets"),
    ("Malik Beasly", 22, 187, 76, 917, 97, 200, 55, 10, 55, "Denver Nuggets"),
    ("Paul Millsap", 33, 257, 79, 883, 141, 505, 83, 54, 95, "Denver Nuggets"),
    ("Monte Morris", 23, 183, 74, 851, 297, 194, 73, 4, 52, "Denver Nuggets"),
    -- 17
    ("Damian Lillard", 28, 195, 74, 2067, 551, 371, 88, 34, 212, "Portland Trailblazers"),
    ("CJ McCollum", 27, 190, 75, 1468, 207, 282, 55, 28, 106, "Portland Trailblazers"),
    ("Al-Farouq Aminu", 24, 220, 80, 760, 104, 610, 68, 33, 72, "Portland Trailblazers"),
    ("Seth Curry", 28, 185, 74, 581, 66, 120, 36, 12, 61, "Portland Trailblazers"),
    ("Jusuf Nurkic", 28, 290, 83, 1125, 233, 748, 71, 103, 168, "Portland Trailblazers"),
    -- 18
    ("Donovan Mitchell", 22, 215, 73, 1829, 322, 316, 106, 31, 218, "Utah Jazz"),
    ("Rudy Gobert", 26, 258, 85, 1284, 161, 1041, 66, 187, 130, "Utah Jazz"),
    ("Joe Ingles", 31, 220, 80, 994, 469, 330, 98, 20, 193, "Utah Jazz"),
    ("Jae Crowder", 28, 235, 78, 951, 133, 384, 64, 31, 85, "Utah Jazz"),
    ("Derrick Favors", 27, 265, 81, 897, 89, 560, 56, 106, 84, "Utah Jazz"),
    -- 19
    ("Paul George", 28, 220, 80, 2159, 318, 628, 170, 34, 205, "Oklahoma City Thunder"),
    ("Russel Westbrook", 30, 200, 75, 1675, 784, 807, 142, 33, 325, "Oklahoma City Thunder"),
    ("Dennis Schroder", 25, 172, 75, 1224, 323, 284, 65, 12, 172, "Oklahoma City Thunder"),
    ("Steven Adams", 25, 265, 83, 1108, 124, 760, 117, 76, 135, "Oklahoma City Thunder"),
    ("Jerami Grant", 24, 210, 80, 1090, 79, 417, 61, 100, 67, "Oklahoma City Thunder"),
	-- 20
    ("Karl-Anthony Towns", 23, 248, 83, 1880, 269, 954, 67, 125, 240, "Minnesota Timberwolves"),
    ("Andrew Wiggins", 23, 197, 79, 1321, 184, 352, 70, 48, 138, "Minnesota Timberwolves"),
    ("Derrick Rose", 30, 200, 74, 917, 220, 140, 31, 12, 82, "Minnesota Timberwolves"),
    ("Taj Gibson", 33, 232, 81, 753, 84, 458, 53, 29, 73, "Minnesota Timberwolves"),
    ("Dario Saric", 24, 225, 82, 714, 101, 371, 41, 6, 72, "Minnesota Timberwolves"),
    -- 21
    ("Kevin Durant", 30, 240, 82, 2027, 457, 487, 58, 84, 225, "Golden State Warriors"),
    ("Stephen Curry", 30, 185, 74, 1881, 361, 369, 92, 25, 192, "Golden State Warriors"),
    ("Klay thompson", 28, 215, 78, 1680, 186, 299, 84, 47, 115, "Golden State Warriors"),
    ("Quinn Cook", 25, 180, 73, 509, 116, 157, 20, 3, 50, "Golden State Warriors"),
    ("Kevon Looney", 22, 222, 81, 500, 123, 417, 46, 53, 51, "Golden State Warriors"),
    -- 22
    ("Lou Williams", 32, 165, 77, 2000, 1000, 500, 100, 100, 50, "Los Angeles Clippers"),
    ("Montrezl Harrell", 25, 165, 77, 2000, 1000, 500, 100, 100, 50, "Los Angeles Clippers"),
    ("Danilo Gallinari", 30, 165, 77, 2000, 1000, 500, 100, 100, 50, "Los Angeles Clippers"),
    ("Tobais Harris", 26, 165, 77, 2000, 1000, 500, 100, 100, 50, "Los Angeles Clippers"),
    ("Shai Gilgeous-Alexander", 20, 165, 77, 2000, 1000, 500, 100, 100, 50, "Los Angeles Clippers"),
    -- 23
    ("Buddy Hield", 26, 165, 77, 1695, 205, 412, 58, 33, 146, "Sacramento Kings"),
    ("De’Aaron Fox", 21, 165, 77, 1399, 590, 304, 133, 45, 227, "Sacramento Kings"),
    ("Bogdan Bogdanovic", 26, 165, 77, 990, 267, 243, 72, 15, 117, "Sacramento Kings"),
    ("Willie Cauley-Stein", 25, 165, 77, 965, 194, 678, 96, 51, 84, "Sacramento Kings"),
    ("Marvin Bagley III", 19, 165, 77, 923, 62, 471, 33, 59, 98, "Sacramento Kings"),
    -- 24
    ("Kyle Kuzma", 23, 165, 77, 1308, 178, 382, 41, 26, 133, "Los Angeles Lakers"),
    ("Lebron James", 34, 165, 77, 1505, 454, 465, 72, 33, 197, "Los Angeles Lakers"),
    ("Brandon Ingram", 21, 165, 77, 950, 1000, 500, 100, 100, 50, "Los Angeles Lakers"),
    ("Kentavious Caldwell-Pope", 25, 165, 77, 2000, 1000, 500, 100, 100, 50, "Los Angeles Lakers"),
    ("JaVale McGee", 31, 165, 77, 2000, 1000, 500, 100, 100, 50, "Los Angeles Lakers"),
    -- 25
    ("Devin Booker", 22, 205, 77, 1700, 433, 265, 56, 13, 264, "Phoenix Suns"),
    ("Mikal Bridges", 22, 210, 79, 684, 173, 264, 129, 38,70, "Phoenix Suns"),
    ("T.J. Warren", 25, 220, 80, 722, 64, 174, 51, 29, 52, "Phoenix Suns"),
    ("Josh Jackson", 21, 205, 80, 910, 183, 347, 74, 56, 173, "Phoenix Suns"),
    ("Deandre Ayton", 20, 250, 83, 1159, 125, 729, 61, 67, 126, "Phoenix Suns"),
    -- 26
    ("James Harden", 29, 220, 77, 2818, 586, 518, 158, 58, 387, "Houston Rockets"),
    ("Chris Paul", 33, 175, 72, 906, 473, 265, 114, 18, 152, "Houston Rockets"),
    ("P.J. Tucker", 33, 245, 77, 601, 96, 479, 132, 39, 63, "Houston Rockets"),
    ("Clint Capela", 24, 255, 82, 1114, 96, 848, 44, 102, 94, "Houston Rockets"),
    ("Eric Gordon", 30, 215, 76, 1103, 129, 148, 41, 27, 90, "Houston Rockets"),
    -- 27
    ("Demar Derozan", 29, 220, 78, 1635, 475, 462, 86, 36, 199, "San Antonio Spurs"),
    ("Lamarcus Aldridge", 33, 250, 83, 1727, 194, 744, 43, 107, 144, "San Antonio Spurs"),
    ("Bryn Forbes", 25, 195, 74, 967, 175, 239, 45, 4, 80, "San Antonio Spurs"),
    ("Rudy Gay", 32, 230, 80, 946, 182, 470, 54, 34, 114, "San Antonio Spurs"),
    ("Patty Mills", 30, 180, 73, 811, 245, 182, 49, 10, 93, "San Antonio Spurs"),
    -- 28
    ("Mike Conley", 31, 175, 73, 1478, 449, 239, 94, 22, 130, "Memphis Grizzlies"),
    ("Dillon Brooks", 34, 255, 83, 834, 248, 455, 60, 63, 119, "Memphis Grizzlies"),
    ("Jarren Jackson Jr.", 19, 240, 83, 798, 64, 272, 64, 52, 98, "Memphis Grizzlies"),
    ("Kyle Anderson", 25, 230, 81, 346, 128, 251, 54,37, 58, "Memphis Grizzlies"),
    ("Garrett Temple", 32, 195, 78, 463, 69, 152, 50, 25, 54, "Memphis Grizzlies"),
    -- 29
    ("Jrue Holiday", 28, 205, 75, 1420, 518, 334,109 ,54 ,210 , "New Orleans Pelicans"),
    ("Anthony Davis", 25, 254, 82, 1452, 218, 672, 88, 135, 112, "New Orleans Pelicans"),
    ("Julius Randle", 24, 250, 80, 1565, 229, 634, 52, 45, 208, "New Orleans Pelicans"),
    ("Elfried Payton", 24, 195, 75, 446, 320, 220, 44, 17, 112, "New Orleans Pelicans"),
    ("Darius Miller", 28, 225, 78, 567, 146, 128, 40, 23, 59, "New Orleans Pelicans"),
    -- 30
    ("Luka Doncic", 19, 230, 79, 1526, 429, 563, 77, 25, 247, "Dallas Mavericks"),
    ("DeAndre Jordan", 30, 265, 83, 551, 99, 686, 33, 53, 111, "Dallas Mavericks"),
    ("Harrison Barnes", 26, 225, 80, 866, 62, 207, 62, 33, 11, "Dallas Mavericks"),
    ("Wesley Matthews", 32, 220, 76, 575, 100, 102, 33, 12, 58, "Dallas Mavericks"),
    ("Dorian Finney-Smith", 20, 220, 79, 608, 95, 389, 69, 36, 74, "Dallas Mavericks");


SELECT * FROM Players;

-- Draft_2020
INSERT INTO Draft_2020
VALUES 
	(1, 1, 1, 2020, "Philadelphia 76ers", "Cade Cunningham", 19, 190, 80),
    (2, 2, 1, 2020, "Boston Celtics", "Jalen Green", 19, 190, 80),
    (3, 3, 1, 2020, "LA Lakers", "Evan Mobley", 19, 190, 80),
    (4, 4, 1, 2020, "LA Clippers", "Darius Garland", 19, 190, 80),
    (5, 5, 1, 2020, "New York Knicks", "Chizzelled Adonis", 19, 190, 80);
SELECT * FROM Draft_2020;

-- Additional Queries

-- Adding Column
SELECT * FROM Teams;
ALTER TABLE Teams
ADD COLUMN Team_Mascot VARCHAR(20);
SELECT * FROM Teams;

-- Dropping a Table
SET foreign_key_checks = 0; -- Had to disable for demonstration purposes as the players in the draft table don't exist in the dummy Players table
DROP TABLE Conferences;
SET foreign_key_checks = 1;

-- Deleting Data
SELECT * FROM Teams;
DELETE FROM Teams 
WHERE team_name = "Milwaukee Bucks";
SELECT * FROM Teams;

-- Updating Data
SELECT * FROM Teams;
UPDATE Teams
SET year_founded = 1999
WHERE team_name = "New York Knicks";
SELECT * FROM Teams;



-- ---------------- --
--  SPECIAL QUERIES --
-- ---------------- --

-- Check
ALTER TABLE Players
ADD CONSTRAINT Chk_Player_Age CHECK (player_age >= 17);
SELECT * FROM Players;

-- Drop Check
ALTER TABLE Players
DROP CHECK Chk_Player_Age;

-- Views
CREATE VIEW Celtics_Players AS
SELECT player_name
FROM Players
WHERE player_team = 'Boston Celtics';

SELECT * FROM Celtics_Players;

-- Nested Select Statement

SELECT * 
FROM Players
WHERE player_team IN (SELECT player_team
			FROM Players
            WHERE player_team = "Toronto Raptors" OR player_team = "Boston Celtics"
);

SELECT * FROM Players;
SELECT * FROM Teams;
SELECT * FROM Conferences;
SELECT * FROM Divisions;
SELECT * FROM Draft_2020;
