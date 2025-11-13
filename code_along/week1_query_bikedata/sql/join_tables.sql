-- uppgift i klass: join_tables.sql
CREATE VIEW brands AS SELECT * FROM read_csv_auto('data/brands.csv');
CREATE VIEW categories AS SELECT * FROM read_csv_auto('data/categories.csv');
CREATE VIEW customers AS SELECT * FROM read_csv_auto('data/customers.csv');
CREATE VIEW order_items AS SELECT * FROM read_csv_auto('data/order_items.csv');
CREATE VIEW orders AS SELECT * FROM read_csv_auto('data/orders.csv');
CREATE VIEW products AS SELECT * FROM read_csv_auto('data/products.csv');
CREATE VIEW staffs AS SELECT * FROM read_csv_auto('data/staffs.csv');
CREATE VIEW stocks AS SELECT * FROM read_csv_auto('data/stocks.csv');
CREATE VIEW stores AS SELECT * FROM read_csv_auto('data/stores.csv');

-- Exempel på full join
CREATE TABLE joined_table AS
-- join data
SELECT 
  o.order_id, 
  o.order_date,
  o.customer_id,
  o.staff_id,
  o.order_status,
  o.required_date,

  c.customer_id,
  c.first_name AS customer_first_name,
  c.last_name AS customer_last_name,
  c.phone AS customer_phone,
  c.email AS customer_email,
  c.street AS customer_street,
  c.city AS customer_city,
  c.state AS customer_state,
  c.zip_code AS customer_zip_code,

  oi.product_id AS product_id,
  oi.quantity,
  oi.list_price,
  oi.discount,

  p.product_name,
  p.brand_id,
  p.category_id,
  p.model_year,

  ca.category_name,
  b.brand_name,

  s.first_name AS staff_first_name,
  s.last_name AS staff_last_name,
  s.manager_id 

FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
LEFT JOIN categories ca ON p.category_id = ca.category_id
LEFT JOIN brands b ON p.brand_id = b.brand_id
LEFT JOIN staffs s ON o.staff_id = s.staff_id;
