use chinook;

SELECT
    c.first_name,
    c.last_name,
    COUNT(i.invoice_id) AS number_of_purchases,
    AVG(i.total) AS average_order_value
FROM
    customer AS c
JOIN
    invoice AS i ON c.customer_id = i.customer_id
GROUP BY
    c.customer_id
ORDER BY
    number_of_purchases DESC, average_order_value DESC;