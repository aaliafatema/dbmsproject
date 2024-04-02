-- Create Products Table
CREATE TABLE furniture.Products (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2),
    Category VARCHAR(100),
    StockQuantity INT,
    Material VARCHAR(100),
    Manufacturer VARCHAR(255)
);

-- Create Customers Table
CREATE TABLE furniture.Customers (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255),
    ShippingAddress TEXT,
    BillingAddress TEXT,
    PhoneNumber VARCHAR(20),
    PaymentInformation TEXT
);

-- Create Orders Table
CREATE TABLE furniture.Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    PaymentStatus VARCHAR(50),
    DeliveryStatus VARCHAR(50),
    ShippingMethod VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES furniture.Customers(ID)
);

-- Create Order Items Table
CREATE TABLE furniture.OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES furniture.Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES furniture.Products(ID)
);

-- Create Reviews Table
CREATE TABLE furniture.Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    ReviewText TEXT,
    ReviewDate DATE,
    FOREIGN KEY (ProductID) REFERENCES furniture.Products(ID),
    FOREIGN KEY (CustomerID) REFERENCES furniture.Customers(ID)
);
