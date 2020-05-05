-- mysql -uroot -h192.168.0.7 -p

CREATE USER 'world'@'localhost' IDENTIFIED BY 'world';
GRANT ALL PRIVILEGES ON * . * TO 'world'@'localhost';
FLUSH PRIVILEGES;

-- mysql -uworld -h192.168.0.7 -p

USE locate;
CREATE TABLE worldmap_latlng (
  id int(11) NOT NULL AUTO_INCREMENT,
  lat FLOAT NOT NULL,
  lng FLOAT NOT NULL,
  name VARCHAR(20) NOT NULL,
  value FLOAT NOT NULL,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
 );

SET character_set_client = utf8;
SET character_set_connection = utf8;
SET character_set_results = utf8;
SET collation_connection = utf8_general_ci;

INSERT INTO locate.worldmap_latlng
(lat,
 lng,
 name,
value,
timestamp)
VALUES
(-1.2979534,-47.9510032,
'IFPA',
1.0,
now());

INSERT INTO locate.worldmap_latlng
(lat,
 lng,
 name,
value,
timestamp)
VALUES
(-1.2965308,-47.9429827,
'PRACA DO CRISTRO',
1.0,
now());

INSERT INTO locate.worldmap_latlng
(lat,
 lng,
 name,
value,
timestamp)
VALUES
(-1.2964875,-47.9462795,
'DETRA',
1.0,
now());

INSERT INTO locate.worldmap_latlng
(lat,
 lng,
 name,
value,
timestamp)
VALUES
(-1.2947912,-47.9427303,
'Hospital_Municipal',
1.0,
now());

INSERT INTO locate.worldmap_latlng
(lat,
 lng,
 name,
value,
timestamp)
VALUES
(-1.2859852,-47.9258707,
'Praca_Estrela',
1.0,
now());

/*
SELECT
  name as name,
  value as value

FROM worldmap_latlng
WHERE $__timeFilter(timestamp)
ORDER BY timestamp ASC
*/