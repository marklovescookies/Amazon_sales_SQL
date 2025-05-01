SELECT * 
FROM amazon_sales_data_2025

DESCRIBE amazon_sales_data_2025;

-- format date to month/day/time
SELECT DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%m-%d-%Y') AS formatted_date
FROM amazon_sales_data_2025


-- total revenue for each category
SELECT category, SUM(price * Quantity) AS category_total_revenue
FROM amazon_sales_data_2025
GROUP BY category
ORDER BY category_total_revenue DESC

-- total revenue for each product
SELECT product, SUM(price * quantity) AS product_total_revenue
FROM amazon_sales_data_2025
GROUP BY product
ORDER BY product_total_revenue DESC

-- count of differeent payment methods
SELECT `Payment Method`, COUNT(`Payment Method`) AS Count
FROM amazon_sales_data_2025
GROUP BY `Payment Method`
ORDER BY Count DESC

-- Who spends the most
SELECT 
    `Customer Name`, 
    SUM(quantity * price) AS `Total Sales`
FROM amazon_sales_data_2025
GROUP BY `Customer Name`
ORDER BY `Total Sales` DESC;

-- where does most orders come from
SELECT `Customer Location`, COUNT(`Customer Location`) AS Count
FROM amazon_sales_data_2025
GROUP BY `Customer Location`
ORDER BY Count DESC

-- status count
SELECT Status, COUNT(Status) AS Count
FROM amazon_sales_data_2025
GROUP BY Status
ORDER BY Count DESC

-- Total Sales per day
SELECT DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%m-%d-%Y') AS formatted_date, 
       SUM(quantity * price) AS `Total Sales`
FROM amazon_sales_data_2025
GROUP BY DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%m-%d-%Y')
ORDER BY DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%m-%d-%Y')

-- Total sales per day by product 
SELECT 
    DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%m-%d-%Y') AS formatted_date,
    product,
    SUM(quantity * price) AS `Total Sales`
FROM amazon_sales_data_2025
GROUP BY 
    DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%m-%d-%Y'),
    product
ORDER BY DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%m-%d-%Y')

-- Total sales per day by category
SELECT DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%m-%d-%Y') AS formatted_date,
	category,	
    SUM(quantity * price) AS `Total Sales`
FROM amazon_sales_data_2025
GROUP BY DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%m-%d-%Y'), category
ORDER BY DATE_FORMAT(STR_TO_DATE(date, '%d-%m-%Y'), '%m-%d-%Y')

-- percentage of sales for each category
SELECT category, 
	ROUND(SUM(price * quantity) * 100.0 / (SELECT SUM(price * quantity) FROM amazon_sales_data_2025), 2) AS percentage
FROM amazon_sales_data_2025
GROUP BY category;

