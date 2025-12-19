-- #1 Which invoices represent the highest purchase amounts, and how are they distributed by date and country?
-- Purpose: Identify high-value invoices to analyze large purchase transactions and understand how high spending is distributed across dates and countries.

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
-- Purpose: Analyze the geographic distribution of sales by determining which countries generate the highest number of invoices.

SELECT
  BillingCountry,
  COUNT(*) AS num_invoices
FROM Invoice
GROUP BY BillingCountry
ORDER BY num_invoices DESC;

-- #3 Which artists generate the highest total revenue based on customer purchases?
-- Purpose: Determine which artists generate the highest total revenue by aggregating sales data across albums, tracks, and invoice line items.

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
-- Purpose: Identify customers who are registered in the database but have never made a purchase, highlighting inactive or unconverted users.

SELECT
  c.CustomerId,
  c.FirstName || ' ' || c.LastName AS customer,
  c.Country
FROM Customer c
LEFT JOIN Invoice i ON i.CustomerId = c.CustomerId
WHERE i.InvoiceId IS NULL;

-- # 5 Which customers have total spending above the average, and how do they compare to the rest of the customer base?
-- Purpose: Identify customers whose total spending exceeds the average customer spending in order to segment and analyze high-value customers.

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
