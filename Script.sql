-- Selecionar todos os registros da tabela de artistas, ordenando pelo nome em ordem alfabética.

SELECT * FROM Artist
ORDER BY Name ASC;

-- Listar todas as músicas com duração maior que 5 minutos.

SELECT * FROM Track
WHERE Milliseconds > 300000

-- Selecionar todas as músicas do gênero Rock.

SELECT 
	t.Name AS 'Música', 
	g.Name AS 'Gênero musical'
FROM Track t 
INNER JOIN Genre g 
ON t.GenreId  = g.GenreId 
WHERE g.Name = 'Rock'

-- Listar os álbuns junto com o nome do artista correspondente.

SELECT
	al.Title AS 'Álbum',
	ar.Name AS 'Artista'
FROM Album al
INNER JOIN Artist ar
ON al.ArtistId = ar.ArtistId 

-- Selecionar todas as músicas que pertencem ao álbum “Let There Be Rock”.

SELECT
	t.Name AS 'Músicas',
	a.Title AS 'Álbum'
FROM Track t 
INNER JOIN Album a
ON t.AlbumId  = a.AlbumId 
WHERE a.Title = 'Let There Be Rock'

-- Listar os clientes que moram no Brasil.

SELECT
FirstName AS 'Primeiro nome',
LastName AS 'Sobrenome',
Country  AS 'País' 
FROM Customer
WHERE Country = 'Brazil'

-- Exibir o total de músicas por gênero, ordenando do maior para o menor.

SELECT 
    g.Name AS 'Gênero',
    COUNT(t.TrackId ) AS Total
FROM Genre g 
LEFT JOIN Track t ON g.GenreId  = t.GenreId
GROUP BY g.GenreId , g.Name 
ORDER BY Total DESC;

-- Selecionar todas as músicas que possuem a palavra “Love” no nome. 

SELECT TrackId, Name FROM  Track
WHERE Name LIKE '%Love%'