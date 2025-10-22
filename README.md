# Chinook Music Store Analysis

**A Data-Driven Strategy to Boost Sales, Retention & Customer Loyalty**

------------------------------------------------------------------------

## Objective

The goal of this project is to analyze the **Chinook Music Store**
database to uncover key business insights about customer behavior, sales
performance, and product trends.\
Through structured SQL analysis, the project aims to:\
- Identify top-selling genres, artists, and albums.\
- Understand global and regional revenue patterns.\
- Analyze customer churn, retention, and lifetime value.\
- Recommend strategic actions to optimize marketing, inventory, and
customer loyalty.

------------------------------------------------------------------------

## Dataset Description

The **Chinook database** contains information about a digital music
store's operations --- including artists, albums, customers, invoices,
and tracks. It offers a relational data model ideal for SQL-based
business analysis.

**Data Source:** [Chinook Database (Download
Link)](https://drive.google.com/file/d/1nGhcd_eeaIiKb8_UPBykxH1_OxMupi5M/view)\
**Key Details:**\
- 11 relational tables (Tracks, Albums, Artists, Genres, Customers,
Invoices, Invoice Lines, etc.)\
- Global customer base spanning **24 countries**\
- Music catalog covering **24 genres** (Rock, Metal, Jazz, Classical,
etc.)\
- Each track linked to its album and artist for multi-level analysis

------------------------------------------------------------------------

## Tools & Technologies

  Category        Tools Used
  --------------- ------------------------------------------
  Database        MySQL (Workbench)
  Analysis        SQL (Queries, Joins, CTEs, Aggregations)
  Visualization   MS Excel

------------------------------------------------------------------------

## Methodology

1.  **Data Cleaning & Preprocessing**
    -   Replaced missing values with `N/A` or `Unknown`.\
    -   Removed duplicate records using aggregation and `DISTINCT`.\
    -   Validated data integrity across relational tables.
2.  **Exploratory Data Analysis (EDA)**
    -   Analyzed top-selling tracks, genres, and artists per country.\
    -   Calculated customer churn rate and retention patterns.\
    -   Evaluated product affinity (cross-genre co-purchases).
3.  **Customer Segmentation & CLV**
    -   Grouped customers based on purchase frequency and spend.\
    -   Calculated **Customer Lifetime Value (CLV)** and churn
        probability.
4.  **Market & Genre Performance**
    -   Compared revenue performance by genre and geography.\
    -   Highlighted premium markets (Czech Republic, Ireland).
5.  **Strategic Insight Generation**
    -   Converted analytical findings into actionable business
        recommendations.

------------------------------------------------------------------------

## Key Insights

-   **Rock Genre Dominance:**\
    Rock music accounts for **53% of U.S. sales**, leading both in
    revenue and purchase volume.

-   **High-Value Regions:**\
    Customers in **Czech Republic (\$1,591.92 avg spend)** and **Ireland
    (\$1,433.52)** spend **\~2× more** than U.S. customers.

-   **Customer Churn:**\
    Around **27% of customers** are inactive or churned --- indicating
    weak repeat purchase behavior.

-   **Product Affinity:**\
    Strong cross-selling link between **Rock, Metal, and Alternative &
    Punk** genres.

-   **Regional Market Trends:**\
    USA and Canada generate maximum orders, while Czech Republic drives
    the **highest spend per order**.

------------------------------------------------------------------------

## Strategic Recommendations

1.  **Reinforce Core Product Mix**
    -   Prioritize *Rock*, *Alternative*, and *Metal* genres in
        marketing and inventory.
2.  **Early Loyalty Program (EILP)**
    -   Introduce rewards within a customer's first five purchases to
        reduce churn.
3.  **Geo-Smart Marketing**
    -   Invest more in premium regions like **Czech Republic** and
        **Ireland** where customers show high lifetime value.
4.  **Exclusive Product Strategy**
    -   Launch limited-edition albums and collector bundles in
        high-value markets.
5.  **Cross-Selling Campaigns**
    -   Promote bundles like *Rock + Metal* or *Rock + R&B/Soul* to
        increase average order value.
6.  **Retention & Win-Back**
    -   Design personalized offers for inactive or low-frequency
        customers using past purchase patterns.
