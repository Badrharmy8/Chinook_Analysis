-- Customer Analysis:

-- Which customer has generated the highest number of invoices?
SELECT C.CustomerId,
	C.FirstName,
	C.LastName,
	COUNT(I.InvoiceId) AS 'Number Of Invoices'
FROM Customer C
LEFT OUTER JOIN Invoice I 
ON C.CustomerId = I.CustomerId
GROUP BY C.CustomerId, C.FirstName, C.LastName
ORDER BY [Number Of Invoices] DESC;

-- Which customer has contributed the greatest total revenue?
SELECT C.CustomerId,
	C.FirstName,
	C.LastName,
	ISNULL(SUM(I.Total) , 0) AS 'Profits'
FROM Customer C
LEFT OUTER JOIN Invoice I 
ON C.CustomerId = I.CustomerId
GROUP BY C.CustomerId, C.FirstName, C.LastName
ORDER BY Profits DESC;

-- What are the most popular music genres among customers?
SELECT G.Name,
	SUM(IL.Quantity) AS 'Number of Purchases'
FROM Invoice I
JOIN InvoiceLine IL
ON I.InvoiceId = IL.InvoiceId
JOIN Track T
ON IL.TrackId = T.TrackId
JOIN Genre G
ON T.GenreId = G.GenreId
GROUP BY G.Name
ORDER BY [Number of Purchases] DESC;

-- What is the preferred media type among customers?
SELECT MT.Name ,
	SUM(IL.Quantity) AS 'Number Of Purchases'
FROM Invoice I
JOIN InvoiceLine IL
ON I.InvoiceId = IL.InvoiceId
JOIN Track T
ON IL.TrackId = T.TrackId
JOIN MediaType MT
ON T.MediaTypeId = MT.MediaTypeId
GROUP BY MT.Name 
ORDER BY [Number Of Purchases] DESC;

-- Which composer has the highest total track sales ?
SELECT T.Composer ,
	SUM(IL.Quantity) AS 'Number Of Purchases'
FROM Track T
LEFT OUTER JOIN 
InvoiceLine IL
ON T.TrackId = IL.TrackId
WHERE Composer IS NOT NULL
GROUP BY T.Composer
ORDER BY [Number Of Purchases] DESC;