

# 📊 Customer Behavior Analysis Using SQL

## **Overview**
This project analyzes customer behavior using transactional data. It explores spending patterns, popular product categories, and customer retention using SQL queries.

## **Datasets**
The project includes three datasets:

- **customers.csv**: Contains customer demographics and signup dates.
- **products.csv**: Contains product categories and prices.
- **transactions.csv**: Contains purchase records linking customers and products.

## **Database Schema**
The database consists of three tables:

### **1. customers**
| Column       | Data Type  | Description |
|-------------|-----------|-------------|
| customer_id | INT (PK)  | Unique ID for each customer |
| age         | INT       | Customer's age |
| gender      | VARCHAR(10) | Customer's gender |
| signup_date | DATE      | Date the customer signed up |

### **2. products**
| Column      | Data Type  | Description |
|------------|-----------|-------------|
| product_id | INT (PK)  | Unique ID for each product |
| category   | VARCHAR(50) | Product category |
| price      | DECIMAL(10,2) | Product price |

### **3. transactions**
| Column          | Data Type  | Description |
|----------------|-----------|-------------|
| transaction_id | INT (PK)  | Unique transaction ID |
| customer_id    | INT (FK)  | ID of the purchasing customer |
| product_id     | INT (FK)  | ID of the purchased product |
| transaction_date | DATE      | Date of the transaction |
| quantity       | INT       | Quantity purchased |

## **SQL Queries**
### **1️⃣ Top 5 Customers by Spending**
```sql
SELECT t.customer_id, 
       SUM(p.price * t.quantity) AS total_spent
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY t.customer_id
ORDER BY total_spent DESC
LIMIT 5;
```

### **2️⃣ Most Popular Product Categories**
```sql
SELECT p.category, 
       COUNT(t.transaction_id) AS purchase_count
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY p.category
ORDER BY purchase_count DESC;
```

### **3️⃣ Monthly Sales Trend**
```sql
SELECT DATE_TRUNC('month', transaction_date) AS month, 
       SUM(p.price * t.quantity) AS total_revenue
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY month
ORDER BY month;
```

### **4️⃣ Customer Retention Analysis**
```sql
SELECT c.signup_date, 
       COUNT(DISTINCT t.customer_id) AS returning_customers
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.signup_date
ORDER BY c.signup_date;
```

## **Setup Instructions**
1. **Create the Database**:  
   Run the SQL script to create tables.
   ```sql
   CREATE TABLE customers (...);
   CREATE TABLE products (...);
   CREATE TABLE transactions (...);
   ```

2. **Load the Data**:  
   Import CSV files into the database using:
   ```sql
   COPY customers FROM '/path/to/customers.csv' DELIMITER ',' CSV HEADER;
   COPY products FROM '/path/to/products.csv' DELIMITER ',' CSV HEADER;
   COPY transactions FROM '/path/to/transactions.csv' DELIMITER ',' CSV HEADER;
   ```

3. **Run Queries**:  
   Execute the provided SQL queries to analyze the data.

## **Key Insights**
- Identifies top-spending customers.
- Highlights the most popular product categories.
- Analyzes monthly sales trends.
- Evaluates customer retention based on sign-up dates.

---

### **Next Steps**
🔹 Extend the project by adding new queries.  
🔹 Visualize the data using Tableau, Power BI, or Python.  
🔹 Apply machine learning for customer segmentation.

---

## **Author**
**Jenny Tran**  
📍 Los Angeles, CA  
🚀 Passionate about data analytics and business intelligence.

