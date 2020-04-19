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


/*
SELECT
  UNIX_TIMESTAMP(timestamp) as time_sec,
  value as value,
  lat as latitude,
  lng as longitude,
  name as name
FROM worldmap_latlng
WHERE $__timeFilter(timestamp)
ORDER BY timestamp ASC


SELECT
  UNIX_TIMESTAMP(timestamp) as time_sec,
  value as value,
  lat as latitude,
  lng as longitude,
  name as name
FROM worldmap_latlng
WHERE timestamp BETWEEN FROM_UNIXTIME(1587287963) AND FROM_UNIXTIME(1587309563)
ORDER BY timestamp ASC;
*/