use chinook;

WITH GenreSales AS (
    SELECT
        G.name AS genre_name,
        SUM(IL.quantity * IL.unit_price) AS total_genre_sales
    FROM
        invoice_line AS IL
    JOIN
        track AS T ON IL.track_id = T.track_id
    JOIN
        genre AS G ON T.genre_id = G.genre_id
    JOIN
        invoice AS I ON IL.invoice_id = I.invoice_id
    WHERE
        I.billing_country = 'USA'
    GROUP BY
        G.name
)
SELECT
    genre_name,
    total_genre_sales,
    RANK() OVER (ORDER BY total_genre_sales DESC) AS genre_rank
FROM
    GenreSales
ORDER BY
    genre_rank;