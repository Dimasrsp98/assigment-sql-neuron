-- 1. Data Sample
SHOW TABLES;
SELECT firstName, lastName, jobTitle FROM `employees`;

-- 2. Querying Data
SELECT employeeNumber, firstName, lastName FROM `employees`;
SELECT customerNumber, customerName, country, creditLimit FROM `customers`;

-- 3. Sorting Data
SELECT employeeNumber, firstName, lastName FROM `employees` ORDER BY firstName;
SELECT customerNumber, customerName, creditLimit FROM `customers` ORDER BY creditLimit ;
SELECT * FROM `products` ORDER BY buyPrice ASC;

-- 4. Filtering Data
SELECT productCode, productName, quantityInStock, buyPrice FROM `products` WHERE quantityInStock < 80 ORDER BY quantityInStock ASC;
SELECT firstName, lastName, officeCode FROM employees WHERE officeCode IN(5,6,7,8) ORDER BY officeCode;
SELECT orderNumber, orderDate, status, comments FROM `orders` WHERE `orderDate` BETWEEN '2004-05-01' AND '2004-05-31';
SELECT employeeNumber, firstName, lastName, officeCode FROM employees WHERE officeCode = 4 ORDER BY firstName;

-- 5. Join
SELECT employeeNumber, firstName, lastName, city FROM employees INNER JOIN offices ON offices.officeCode = employees.officeCode ORDER BY firstName;
SELECT employeeNumber, firstName, lastName, jobTitle, offices.city, offices.country FROM `employees` INNER JOIN offices ON offices.officeCode = employees.officeCode ORDER BY employeeNumber;

-- 6. Agregate 
SELECT employees.firstName, employees.lastName, AVG(creditLimit) FROM customers INNER JOIN employees ON employees.employeeNumber = customers.salesRepEmployeeNumber GROUP BY salesRepEmployeeNumber;
SELECT officeCode, COUNT(*) as 'Total of Employees' FROM employees GROUP BY officeCode;

-- 7. Cursor

DELIMITER $$
CREATE PROCEDURE TampilkanAvgAmount() 
BEGIN 
DECLARE avgAmount DECIMAL; 
DECLARE curAvgAmount CURSOR FOR SELECT AVG(amount) FROM payments; 
OPEN curAvgAmount; 
FETCH curAvgAmount INTO avgAmount; 
SELECT avgAmount; 
CLOSE curAvgAmount; 
END$$
DELIMITER ;

CALL TampilkanAvgAmount;