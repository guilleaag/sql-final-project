# SQL Data Analysis Project

## Dataset
**Chinook SQLite Database** — a publicly available relational dataset that represents a digital music store.  
The database contains multiple related tables, including customers, invoices, invoice lines, tracks, albums, and artists, making it suitable for demonstrating relational database concepts and SQL analysis.

---

## Brief Description
This project analyzes the Chinook SQLite database using SQL queries executed in DBeaver. The analysis focuses on customer purchasing behavior, geographic distribution of sales, artist revenue, and customer segmentation. The project demonstrates core SQL concepts such as joins, aggregations, filtering, and common table expressions (CTEs) to extract meaningful insights from structured data.

---

## Project Goals
The goal of this project is to analyze a relational database using SQL in order to extract meaningful insights from structured data. Specifically, the project aims to demonstrate proficiency in:
- Writing SELECT queries with filtering and ordering
- Using INNER and LEFT JOINs across related tables
- Applying aggregation functions such as COUNT, SUM, and AVG
- Using subqueries and Common Table Expressions (CTEs)
- Interpreting query results to identify trends and patterns in the data

---

## Data Structure Overview
The Chinook database follows a relational schema with multiple interconnected tables. The main tables used in this analysis are:

- **Customer**: Stores customer information such as name, country, and contact details.
- **Invoice**: Represents customer purchases and is linked to the Customer table via `CustomerId`.
- **InvoiceLine**: Contains individual line items for each invoice and is linked to Invoice via `InvoiceId`.
- **Track**: Stores information about music tracks and is linked to InvoiceLine via `TrackId`.
- **Album**: Groups tracks into albums and is linked to Track via `AlbumId`.
- **Artist**: Stores artist information and is linked to Album via `ArtistId`.

These relationships allow for multi-table joins and enable analysis across customers, purchases, and music content.

---

## Research Questions

**Query 1 – Invoice Analysis**  
- Which invoices represent the highest purchase amounts, and how are they distributed by date and country?

**Query 2 – Sales by Country**  
- Which countries generate the highest number of invoices, and how is sales activity distributed geographically?

**Query 3 – Artist Revenue**  
- Which artists generate the highest total revenue based on customer purchases?

**Query 4 – Inactive Customers**  
- Are there customers in the database who have never made a purchase?

**Query 5 – High-Value Customers**  
- Which customers have total spending above the average, and how do they compare to the rest of the customer base?

---

## SQL Analysis
The analysis was performed using SQL queries that include SELECT statements with WHERE and ORDER BY clauses, INNER and LEFT JOIN operations across multiple tables, aggregation functions such as COUNT, SUM, and AVG, and a Common Table Expression (CTE). These techniques were used to answer the research questions and explore patterns in customer behavior and sales performance.

---

## Data Analysis

### Trends and Patterns Observed
- Sales activity is concentrated in a limited number of countries, with some countries generating significantly more invoices than others.
- A small subset of artists accounts for a large portion of total revenue, indicating that sales are driven by top-performing artists.
- Customer spending is unevenly distributed, with a small group of customers spending well above the average.
- Some registered customers have no associated purchase records.

### Unexpected Findings
- Several customers are registered in the database but have never made a purchase, suggesting gaps between registration and conversion.
- Artists with larger catalogs do not necessarily generate the highest revenue; customer demand appears to play a more significant role.

### Relation to the Original Questions
- High-value invoices helped identify purchasing patterns and large transactions.
- Grouping invoices by country revealed where most sales activity occurs.
- Multi-table joins enabled identification of the most profitable artists.
- A left join analysis confirmed the existence of inactive customers.
- Comparing customer spending against the average allowed for identification of high-value customers.

Overall, the results demonstrate how relational SQL queries can be used to analyze structured data and answer meaningful business questions.
