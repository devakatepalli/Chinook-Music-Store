use chinook;

-- Total Revenue and Invoices based on Country, State and City
SELECT
    billing_country,
    billing_state,
    billing_city,
    SUM(total) AS total_revenue,
    COUNT(invoice_id) AS number_of_invoices
FROM
    invoice
GROUP BY
    billing_country,
    billing_state,
    billing_city
ORDER BY
    billing_country,
    billing_state,
    billing_city;