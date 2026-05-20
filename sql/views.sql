USE rustore;

CREATE OR REPLACE VIEW v_order_totals AS
SELECT
    o.order_id,
    o.user_id,
    o.order_date,
    o.status,
    SUM(oi.quantity * oi.price_at_order) AS total_amount
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.user_id, o.order_date, o.status;

CREATE OR REPLACE VIEW v_product_sales AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    COALESCE(SUM(oi.quantity), 0) AS total_sold,
    COALESCE(SUM(oi.quantity * oi.price_at_order), 0) AS total_revenue
FROM products p
JOIN categories c ON p.category_id = c.category_id
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, c.category_name;
