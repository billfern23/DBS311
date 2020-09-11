-- ***********************
-- Name: Stephane Kamdem Kamguia
-- ID: 135736189
-- Date: Saturday, 20 June 2020
-- Purpose: Lab 04 DBS311
-- ***********************

-- Q1. Display cities that no warehouse is located in them. (use set operators to answer this
--     question)
SELECT
   city 
FROM
   locations minus 
   SELECT
      l.city 
   FROM
      locations l,
      warehouses w 
   WHERE
      l.location_id = w.location_id;

-- Q2. Display the category ID, category name, and the number of products in category 1, 2, and 5.
--       In your result, display first the number of products in category 5, then category 1 and then 2.

SELECT
   pc.category_id,
   pc.category_name,
   COUNT(product_id) 
FROM
   product_categories pc 
   JOIN
      products p 
      ON pc.category_id = p.category_id 
WHERE
   p.category_id = 5 
GROUP BY
   pc.category_id,
   pc.category_name 
UNION ALL
SELECT
   pc.category_id,
   pc.category_name,
   COUNT(product_id) 
FROM
   product_categories pc 
   JOIN
      products p 
      ON pc.category_id = p.category_id 
WHERE
   p.category_id = 1 
GROUP BY
   pc.category_id,
   pc.category_name 
UNION ALL
SELECT
   pc.category_id,
   pc.category_name,
   COUNT(product_id) 
FROM
   product_categories pc 
   JOIN
      products p 
      ON pc.category_id = p.category_id 
WHERE
   p.category_id = 2 
GROUP BY
   pc.category_id,
   pc.category_name;


-- Q3. Display product ID for products whose quantity in the inventory is less than to 5. (You
--       are not allowed to use JOIN for this question.)

SELECT
   PRODUCT_ID 
FROM
   PRODUCTS 
WHERE
   PRODUCT_ID = ANY( 
   SELECT
      PRODUCT_ID 
   FROM
      INVENTORIES 
   WHERE
      QUANTITY < 5 
   UNION
   SELECT
      PRODUCT_ID 
   FROM
      INVENTORIES 
   WHERE
      QUANTITY < 5);

-- Q4. We need a single report to display all warehouses and the state that they are located in
--        and all states regardless of whether they have warehouses in them or not. (Use set operators in you answer.)

SELECT
   warehouse_name,
   state 
FROM
   warehouses 
   LEFT JOIN
      locations 
      ON warehouses.location_id = locations.location_id 
   UNION
   SELECT
      warehouse_name,
      state 
   FROM
      warehouses 
      RIGHT JOIN
         locations 
         ON warehouses.location_id = locations.location_id;

























