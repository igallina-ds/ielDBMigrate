use ielDBDev;
SELECT * FROM cities, addresses

DELETE FROM dbo.cities  WHERE id IS NOT NULL
DELETE FROM dbo.addresses WHERE id IS NOT NULL

SELECT * FROM cities WHERE name = REPLACE('Santa Bárbara D\'Oeste', '\'', '\'\'')
