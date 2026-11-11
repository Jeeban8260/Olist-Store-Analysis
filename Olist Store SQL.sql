CREATE DATABASE IF NOT EXISTS olist_ecommerce;
USE olist_ecommerce;

-- KPI 1: Weekday vs Weekend Payment Statistics
SELECT
    CASE
        WHEN DAYOFWEEK(o.order_purchase_timestamp) IN (1, 7)
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    ROUND(SUM(p.payment_value), 2) AS total_payment
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p
    ON o.order_id = p.order_id
GROUP BY day_type;

-- KPI 2: Five-Star Reviews with Credit Card Payments
SELECT COUNT(DISTINCT r.order_id) AS five_star_credit_card_orders
FROM olist_order_reviews_dataset r
JOIN olist_order_payments_dataset p
    ON r.order_id = p.order_id
WHERE r.review_score = 5
  AND p.payment_type = 'credit_card';


-- KPI 3: Average Delivery Days for Pet Shop Products

SELECT
    ROUND(AVG(delivery_days), 2) AS average_delivery_days
FROM (
    SELECT DISTINCT
        o.order_id,
        DATEDIFF(
            o.order_delivered_customer_date,
            o.order_purchase_timestamp
        ) AS delivery_days
    FROM olist_orders_dataset o
    JOIN olist_order_items_dataset oi
        ON o.order_id = oi.order_id
    JOIN olist_products_dataset p
        ON oi.product_id = p.product_id
    JOIN product_category_name_translation ct
        ON p.product_category_name = ct.product_category_name
    WHERE ct.product_category_name_english = 'pet_shop'
      AND o.order_delivered_customer_date IS NOT NULL
) AS pet_orders;


-- KPI 4: Average Product Price and Payment Value
-- for Customers in Sao Paulo

SELECT
    ROUND(AVG(oi.price), 2) AS average_product_price,
    ROUND(AVG(p.payment_value), 2) AS average_payment_value
FROM olist_customers_dataset c
JOIN olist_orders_dataset o
    ON c.customer_id = o.customer_id
JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
JOIN olist_order_payments_dataset p
    ON o.order_id = p.order_id
WHERE LOWER(TRIM(c.customer_city)) = 'sao paulo';


-- KPI 5: Shipping Days vs Customer Review Scores

SELECT
    o.order_id,
    r.review_score,
    DATEDIFF(
        o.order_delivered_customer_date,
        o.order_purchase_timestamp
    ) AS shipping_days
FROM olist_orders_dataset o
JOIN olist_order_reviews_dataset r
    ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
  AND o.order_purchase_timestamp IS NOT NULL;