create database shoping_analysis;
USE shoping_analysis;
select * from shopping_data;
-- what is the total revenue genrated by male vs female customers?
select gender,sum(`Purchase Amount (USD)` ) as revenue
from shopping_data
group by gender;
-- which customers used a discount but still spent more then avg puchase amount?
select `Customer ID`,`Purchase Amount (USD)`
from shopping_data 
where `Discount Applied` = 'yes' and  `Purchase Amount (USD)` >=  (SELECT AVG(`Purchase Amount (USD)`) FROM shopping_data);
-- which are the top 5 products with the highst avg review rating?
-- q4. we have to compare the avg purchase amounts between standard and express shipping?
select `Shipping Type`,
avg(`Purchase Amount (USD)`)
from shopping_data
where `Shipping Type` in ('Standard','Express')
group by `Shipping Type`;

-- q5. do subscribed customer spend more? compare avg spend and total revenue
-- between subscribers and non subscribers.
select `Subscription Status`,
count(`Customer ID`) as total_customers,
avg(`Purchase Amount (USD)`) as avg_spend,
sum(`Purchase Amount (USD)`) as total_revenue
from shopping_data
group by `Subscription Status`
order by total_revenue desc,avg_spend desc;
-- q6 which 5 prodects have the highes percentage of purchases with discounts applied?

SELECT
    `Item Purchased`,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN `Discount Applied` = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS discount_rate
FROM shopping_data
GROUP BY `Item Purchased`
ORDER BY discount_rate DESC
LIMIT 10;
-- q7 Segment customers into New, Returning, and Loyal based on their number
-- of previous purchases, and show the customer count in each segment.


WITH customer_type AS (
    SELECT
        `Customer ID`,
        `Previous Purchases`,
        CASE
            WHEN `Previous Purchases` = 1 THEN 'New'
            WHEN `Previous Purchases` BETWEEN 2 AND 10 THEN 'Returning'
            ELSE 'Loyal'
        END AS customer_segment
    FROM shopping_data
)
SELECT
    customer_segment,
    COUNT(*) AS total_customers
FROM customer_type
GROUP BY customer_segment;
-- q8 what are the top 3 most purchased  products within each categoury?

WITH product_counts AS (
    SELECT
        `Category`,
        `Item Purchased`,
        COUNT(*) AS total_purchases
    FROM shopping_data
    GROUP BY
        `Category`,
        `Item Purchased`
),
ranked_products AS (
    SELECT
        `Category`,
        `Item Purchased`,
        total_purchases,
        ROW_NUMBER() OVER (
            PARTITION BY `Category`
            ORDER BY total_purchases DESC
        ) AS product_rank
    FROM product_counts
)
SELECT
    `Category`,
    `Item Purchased`,
    total_purchases,
    product_rank
FROM ranked_products
WHERE product_rank <= 3
ORDER BY
    `Category`,
    product_rank;

-- q9. are customers who are repeat buyers (more than 5 previous puchases) also likely to subscribe?
select `Subscription Status`,
count(`Customer ID`) as repeat_buyers
from shopping_data
where `Previous Purchases` > 5
group by `Subscription Status`;
-- Q10. what is the revenue contribution of each group?
select `age_group`,
sum(`Purchase Amount (USD)`) as total_revnue
from shopping_data
group by `age_group`
order by total_revnue desc;














