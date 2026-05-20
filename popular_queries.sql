USE rustore;

-- 1. Count users
SELECT COUNT(*) AS users_count
FROM users;

-- 2. Product catalog with category names
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity
FROM products p
JOIN categories c ON p.category_id = c.category_id
ORDER BY p.product_id;

-- 3. Orders with customer names
SELECT
    o.order_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    o.order_date,
    o.status
FROM orders o
JOIN users u ON o.user_id = u.user_id
ORDER BY o.order_date;

-- 4. Total amount for each order
SELECT
    o.order_id,
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    SUM(oi.quantity * oi.price_at_order) AS total_sum
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, customer_name
ORDER BY o.order_id;

-- 5. Top-selling products by quantity
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC, p.product_name;

-- 6. Customers by total spending
SELECT
    CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
    SUM(oi.quantity * oi.price_at_order) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY customer_name
ORDER BY total_spent DESC;

-- 7. Products with low stock
SELECT
    product_name,
    stock_quantity
FROM products
WHERE stock_quantity < 15
ORDER BY stock_quantity ASC, product_name;

-- 8. Order, payment, and delivery status report
SELECT
    o.order_id,
    o.status AS order_status,
    p.payment_method,
    p.payment_status,
    d.delivery_status,
    d.address
FROM orders o
JOIN payments p ON o.order_id = p.order_id
JOIN deliveries d ON o.order_id = d.order_id
ORDER BY o.order_id;

-- 9. Customer ranking by total spending
SELECT
    customer_name,
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS customer_rank
FROM (
    SELECT
        CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
        SUM(oi.quantity * oi.price_at_order) AS total_spent
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY customer_name
) AS customer_totals;

-- 10. Running revenue by order date
SELECT
    order_id,
    order_date,
    order_total,
    SUM(order_total) OVER (ORDER BY order_date) AS running_revenue
FROM (
    SELECT
        o.order_id,
        o.order_date,
        SUM(oi.quantity * oi.price_at_order) AS order_total
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_id, o.order_date
) AS order_totals
ORDER BY order_date;
