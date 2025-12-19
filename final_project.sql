-- #1 Which invoices represent the highest purchase amounts, and how are they distributed by date and country?

SELECT
  InvoiceId,
  CustomerId,
  InvoiceDate,
  BillingCountry,
  Total
FROM Invoice
WHERE Total >= 10
ORDER BY Total DESC;

-- #2 Which countries generate the highest number of invoices, and how is sales activity distributed geographically?

SELECT
  BillingCountry,
  COUNT(*) AS num_invoices
FROM Invoice
GROUP BY BillingCountry
ORDER BY num_invoices DESC;

-- #3 Which artists generate the highest total revenue based on customer purchases?

SELECT
  ar.Name AS artist,
  ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS revenue
FROM Artist ar
JOIN Album al       ON al.ArtistId = ar.ArtistId
JOIN Track t        ON t.AlbumId = al.AlbumId
JOIN InvoiceLine il ON il.TrackId = t.TrackId
GROUP BY ar.ArtistId, ar.Name
ORDER BY revenue DESC
LIMIT 10;

-- #4 Are there customers in the database who have never made a purchase?

SELECT
  c.CustomerId,
  c.FirstName || ' ' || c.LastName AS customer,
  c.Country
FROM Customer c
LEFT JOIN Invoice i ON i.CustomerId = c.CustomerId
WHERE i.InvoiceId IS NULL;

-- # 5 Which customers have total spending above the average, and how do they compare to the rest of the customer base?


WITH customer_spend AS (
  SELECT
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS customer,
    c.Country,
    SUM(i.Total) AS total_spent
  FROM Customer c
  JOIN Invoice i ON i.CustomerId = c.CustomerId
  GROUP BY c.CustomerId
)
SELECT *
FROM customer_spend
WHERE total_spent > (
  SELECT AVG(total_spent) FROM customer_spend
)
ORDER BY total_spent DESC;
