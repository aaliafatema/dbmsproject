-- Select all products with a price between $200 and $500
SELECT * FROM furniture.Products WHERE Price BETWEEN 200 AND 500;

-- Select customers with names starting with 'J' or 'S'
SELECT * FROM furniture.Customers WHERE Name LIKE 'J%' OR Name LIKE 'S%';

-- Select orders placed by customers with IDs 1, 3, or 5
SELECT * FROM furniture.Orders WHERE CustomerID IN (1, 3, 5);

-- Select order items with quantities greater than 1
SELECT * FROM furniture.OrderItems WHERE Quantity > 1;

-- Update the price of a specific product
UPDATE furniture.Products SET Price = 1099.99 WHERE ID = 1;

-- Delete a specific order item
DELETE FROM furniture.OrderItems WHERE OrderItemID = 1;

-- Select products along with their corresponding reviews
SELECT p.*, r.* FROM furniture.Products p LEFT JOIN furniture.Reviews r ON p.ID = r.ProductID;

-- Select products and the total number of reviews for each product
SELECT p.*, COUNT(r.ReviewID) AS TotalReviews 
FROM furniture.Products p LEFT JOIN furniture.Reviews r ON p.ID = r.ProductID 
GROUP BY p.ID;

-- Select customers who have placed more than 2 orders
SELECT c.*, COUNT(o.OrderID) AS TotalOrders 
FROM furniture.Customers c INNER JOIN furniture.Orders o ON c.ID = o.CustomerID 
GROUP BY c.ID 
HAVING TotalOrders > 0;

-- Select products with their average ratings
SELECT p.*, AVG(r.Rating) AS AvgRating 
FROM furniture.Products p LEFT JOIN furniture.Reviews r ON p.ID = r.ProductID 
GROUP BY p.ID;

-- Select the total amount spent by each customer
SELECT c.*, SUM(o.TotalAmount) AS TotalSpent 
FROM furniture.Customers c INNER JOIN furniture.Orders o ON c.ID = o.CustomerID 
GROUP BY c.ID;

-- Select customers who have not placed any orders
SELECT * FROM furniture.Customers WHERE ID NOT IN (SELECT DISTINCT CustomerID FROM furniture.Orders);

-- Increase the stock quantity of a specific product
UPDATE furniture.Products SET StockQuantity = StockQuantity + 10 WHERE ID = 2;

-- Select orders with a total amount greater than $1000
SELECT * FROM furniture.Orders WHERE TotalAmount > 1000;

-- Select customers who have placed orders in March 2024
SELECT DISTINCT c.* FROM furniture.Customers c INNER JOIN furniture.Orders o ON c.ID = o.CustomerID WHERE YEAR(OrderDate) = 2024 AND MONTH(OrderDate) = 3;

-- Select products along with their manufacturers
SELECT p.*, m.Manufacturer 
FROM furniture.Products p LEFT JOIN furniture.Manufacturers m ON p.ManufacturerID = m.ManufacturerID;

-- Select the total number of orders for each shipping method
SELECT ShippingMethod, COUNT(OrderID) AS TotalOrders 
FROM furniture.Orders 
GROUP BY ShippingMethod;

-- Select the highest rated product
SELECT p.*, MAX(r.Rating) AS MaxRating 
FROM furniture.Products p LEFT JOIN furniture.Reviews r ON p.ID = r.ProductID;

-- Select customers with a phone number ending with '6666'
SELECT * FROM furniture.Customers WHERE PhoneNumber LIKE '%9999';

-- Alter the table to add a new column
ALTER TABLE furniture.Products ADD COLUMN Discount DECIMAL(10, 2);
