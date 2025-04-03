-- SALES AND REVENUE ANALYSIS

--Identify top performing branches and cities

--which branch had the most high-value sales
WITH high_value_trasactions AS 
        (SELECT *
         FROM [SuperStore sales]
         WHERE total_price > (SELECT AVG(total_price)
                              FROM [SuperStore sales]
                             ) 
        )
SELECT branch,COUNT(branch)transactions
FROM high_value_trasactions
GROUP BY branch

--what branch has the highest total sales
SELECT branch, SUM(total_price) Branch_revenue
FROM [SuperStore sales]
GROUP BY branch

--what cities have the highest revenues
SELECT city, SUM(total_price) revenue
FROM [SuperStore sales]
GROUP BY city 
ORDER BY SUM(total_price) DESC

--what is the distribution of customer types
SELECT customer_type, COUNT(customer_type) customers
FROM [SuperStore sales]
GROUP BY customer_type

--what is the average sale value per branch and how does it compare across different customer types
SELECT *
FROM (SELECT branch, AVG(total_price) avg_sale_value_member
     FROM [SuperStore sales]
     WHERE customer_type = 'member' 
     GROUP BY branch
     ) table_1
JOIN (SELECT branch, AVG(total_price) avg_sale_value_normal
     FROM [SuperStore sales]
     WHERE customer_type = 'normal'
     GROUP BY branch
     ) table_2
ON table_1.branch = table_2.branch



                    
--CUSTOMER & SALES BEHAVIOUR ANALYSIS

--which customer type purchases the highest average quantity per transaction
SELECT customer_type, AVG(quantity) quantity
FROM [SuperStore sales]
GROUP BY customer_type  --both customer types purchase the equal quantity of goods on an average

--What is the average total price per transaction for male vs. female customers, and how does it differ across branches? 
SELECT *
FROM (SELECT gender, AVG(total_price) avg_price_A
      FROM [SuperStore sales]
      WHERE branch = 'A'
      GROUP BY gender
     ) table_A
JOIN (SELECT gender, AVG(total_price) avg_price_B
      FROM [SuperStore sales]
      WHERE branch = 'B'
      GROUP BY gender
     ) table_B
ON table_A.gender = table_B.gender

--What are the top 3 products who have earned the highest total reward points along with their total sales ?
WITH CTE_1 AS 
            (SELECT product_name, MAX(reward_points)points
            FROM [SuperStore sales]
            GROUP BY product_name
            ),
CTE_2 AS (SELECT product_name, SUM(total_price) total_sales
          FROM [SuperStore sales]
          GROUP BY product_name
         )
SELECT TOP 3 CTE_1.product_name,CTE_2.total_sales
FROM CTE_1
JOIN CTE_2
ON CTE_1.product_name = CTE_2.product_name


--	What is the total revenue per customer type (Member vs. Normal) across different branches? 
SELECT branch,
       customer_type,
       total_price, 
       SUM(total_price) OVER (PARTITION BY branch, customer_type ORDER BY sale_id) AS rolling_total
FROM [SuperStore sales] --rolling total of sales for both customer types in each branch

SELECT *
FROM (SELECT customer_type, SUM(total_price) total_revenue_A
        FROM [SuperStore sales]
        WHERE branch = 'A'
        GROUP BY customer_type
     ) a
JOIN (SELECT customer_type, SUM(total_price) total_revenue_B
        FROM [SuperStore sales]
        WHERE branch = 'B'
        GROUP BY customer_type
     ) b
ON a.customer_type = b.customer_type







--PRODUCT PERFORMANCE ANALYSIS

--What product categories contribute most to the overall total sales

SELECT TOP 2 product_category, SUM(total_price)
FROM [SuperStore sales]
GROUP BY product_category

--What is the best selling and least selling products in each branch

SELECT product_name, SUM(quantity) total_qty_A
FROM [SuperStore sales]
WHERE branch = 'A'
GROUP BY product_name 
ORDER BY total_qty_A ASC  

SELECT product_name, SUM(quantity) total_qty_B 
FROM [SuperStore sales]
WHERE branch = 'B'
GROUP BY product_name
ORDER BY total_qty_B ASC    

WITH CTE_A AS (SELECT product_name, SUM(quantity) total_qty_A
               FROM [SuperStore sales]
               WHERE branch = 'A'
               GROUP BY product_name   
              )
SELECT MIN(CTE_A.total_qty_A) min_qty_A, MAX(CTE_A.total_qty_A) max_qty_A
FROM CTE_A --HIGHEST AND LOWEST QUANTITY OF PRODUCTS SOLD IN BRANCH A


WITH CTE_B AS (SELECT product_name, SUM(quantity) total_qty_B 
               FROM [SuperStore sales]
               WHERE branch = 'B'
               GROUP BY product_name 
              ) 
SELECT MIN(CTE_B.total_qty_B) min_qty_B, MAX(CTE_B.total_qty_B) max_qty_B
FROM CTE_B --HIGHEST AND LOWEST QUANTITY OF PRODUCTS SOLD IN BRANCH B


-- Which product is most frequently purchased by Members vs. Normal customers.

SELECT product_name, COUNT(product_name) purchases
FROM [SuperStore sales]
WHERE customer_type = 'Member'
GROUP BY product_name
ORDER BY purchases DESC

SELECT product_name, COUNT(product_name) purchases
FROM [SuperStore sales]
WHERE customer_type = 'Normal'
GROUP BY product_name
ORDER BY purchases DESC

--	What is the average revenue per product category, and which categories perform best in different branches? 

SELECT product_category, AVG(total_price) avg_revenue_A
FROM [SuperStore sales]
WHERE branch = 'A'
GROUP BY product_category
ORDER BY avg_revenue_A DESC --BRANCH A

SELECT product_category, AVG(total_price) avg_revenue_B
FROM [SuperStore sales]
WHERE branch = 'B'
GROUP BY product_category
ORDER BY avg_revenue_B DESC --BRANCH B





--BUSINNES STRATEGY AND OPTIMIZATION 

-- Calculate the customer retention rate based on whether Members contribute consistently higher revenue than Normal customers

SELECT customer_type, SUM(total_price) revenue
FROM [SuperStore sales]
GROUP BY customer_type

-- Which branch has the higher concentration of high-spending customers

SELECT branch, COUNT(total_price)
FROM [SuperStore sales]
WHERE total_price > (SELECT AVG(total_price)
                     FROM [SuperStore sales]
                    )
GROUP BY branch

-- Which branch has the highest total reward points redeemed from sales transactions

SELECT branch, SUM(reward_points)
FROM [SuperStore sales]
GROUP BY branch

