use chinook;

-- Customer DemoGraphics
-- Customers by Country
SELECT country, COUNT(*) AS customer_count
FROM customer
GROUP BY country
ORDER BY customer_count DESC;

-- Customers by City (Top 10)
SELECT country, city, COUNT(*) AS customer_count
FROM customer
GROUP BY country, city
ORDER BY customer_count DESC
LIMIT 10;

-- Customers by State
SELECT country, state, COUNT(*) AS customer_count
FROM customer
WHERE state IS NOT NULL
GROUP BY country, state
ORDER BY customer_count DESC;




