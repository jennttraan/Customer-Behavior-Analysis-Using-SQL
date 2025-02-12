-- Top 5 customers by spending
SELECT t.customer_id, 
       SUM(p.price * t.quantity) AS total_spent
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY t.customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- Most popular product
SELECT p.category, 
       COUNT(t.transaction_id) AS purchase_count
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY p.category
ORDER BY purchase_count DESC;

-- Monthly Sales Trend
SELECT DATE_TRUNC('month', transaction_date) AS month, 
       SUM(p.price * t.quantity) AS total_revenue
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- Customer Rentention
SELECT c.signup_date, 
       COUNT(DISTINCT t.customer_id) AS returning_customers
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.signup_date
ORDER BY c.signup_date;
