-- Sales Analysis
-- Which artist has the highest total track sales?
SELECT AR.Name,
	SUM(IL.Quantity) AS 'Number Of Purchases'
FROM Artist AR
LEFT OUTER JOIN Album AL
ON AR.ArtistId = AL.ArtistId
LEFT OUTER JOIN Track T
ON AL.AlbumId = T.AlbumId
LEFT OUTER JOIN InvoiceLine IL
ON T.TrackId = IL.TrackId
GROUP BY AR.Name
ORDER BY [Number Of Purchases] DESC;

-- Which track has the highest annual sales?
SELECT YEAR(I.InvoiceDate) AS Year,
	T.Name,
	SUM(IL.Quantity) AS 'Number Of Purchases'
FROM Track T
LEFT OUTER JOIN InvoiceLine IL
ON T.TrackId = IL.TrackId
JOIN Invoice I
ON IL.InvoiceId = I.InvoiceId
GROUP BY YEAR(I.InvoiceDate) , T.Name
ORDER BY Year DESC, [Number Of Purchases] DESC;

-- Which track has the highest sales?
SELECT T.Name,
	SUM(IL.Quantity) AS 'Number Of Purchases'
FROM Track T
LEFT OUTER JOIN InvoiceLine IL
ON T.TrackId = IL.TrackId
JOIN Invoice I
ON IL.InvoiceId = I.InvoiceId
GROUP BY  T.Name
ORDER BY  [Number Of Purchases] DESC;

-- Which album has the highest total track sales?
SELECT A.Title,
	SUM(IL.Quantity) 'Number Of Purchases'
FROM Album A
LEFT OUTER JOIN Track T
ON A.AlbumId = T.AlbumId
LEFT OUTER JOIN InvoiceLine IL
ON T.TrackId = IL.TrackId
GROUP BY A.Title
ORDER BY [Number Of Purchases] DESC;

-- Profits By Year
SELECT YEAR(InvoiceDate) AS Year,
	SUM(Total)  AS 'Profits'
FROM Invoice
GROUP BY YEAR(InvoiceDate)
ORDER BY Year Desc;