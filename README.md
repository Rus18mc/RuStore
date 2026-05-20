# RuStore SQL Database Project

![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue.svg)
![SQL](https://img.shields.io/badge/SQL-DDL%20%2B%20DML-orange.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

An educational SQL database project for an online electronics store called **RuStore**.  
The project demonstrates relational database design, table relationships, integrity constraints, sample data, analytical SQL queries, views, and an ER diagram.

---

## Key Features

* Relational database for an online store
* 8 connected tables with primary and foreign keys
* Sample data for users, products, orders, payments, deliveries, and reviews
* Analytical SQL queries for business insights
* SQL views for reusable reports
* ER diagram showing database structure

---

## Project Goal

The goal of this project is to design and implement a structured SQL database for an online store.

The database helps store and analyze:

* customers
* product categories
* products and stock levels
* customer orders
* order items
* payments
* deliveries
* product reviews

---

## Database Entities

| Table | Purpose |
|---|---|
| `users` | Stores customer information for the online store. |
| `categories` | Stores product categories. |
| `products` | Stores products, prices, categories, and stock quantities. |
| `orders` | Stores customer orders and their statuses. |
| `order_items` | Stores the products included in each order. |
| `payments` | Stores payment details for each order. |
| `deliveries` | Stores delivery information for each order. |
| `reviews` | Stores customer reviews and product ratings. |

---

## Project Files

| File | Description |
|---|---|
| `create_database.sql` | Creates the `rustore` database and selects it for further use. |
| `schema.sql` | Creates all database tables and defines relationships between them using foreign keys. |
| `insert_mydata.sql` | Inserts sample data into the database tables. |
| `popular_queries.sql` | Contains analytical SQL queries for products, orders, customers, sales, stock levels, and statuses. |
| `views.sql` | Creates saved SQL queries as views, such as order totals and product sales statistics. |

---

## Database Relationships

The database uses foreign keys to connect related tables:

* each product belongs to one category
* each order belongs to one user
* each order can contain multiple products
* each payment is connected to one order
* each delivery is connected to one order
* each review is connected to a user and a product

---

## Analytical Queries

The project includes SQL queries for:

* listing products with their categories
* calculating total order amounts
* finding the most popular products
* ranking customers by total spending
* showing products with low stock
* checking payment and delivery statuses
* calculating running revenue using window functions

---

## Views

The project includes SQL views for easier data analysis:

| View | Description |
|---|---|
| `v_order_totals` | Calculates the total amount of each order. |
| `v_product_sales` | Shows product sales statistics, including total sold quantity and revenue. |

