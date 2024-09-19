--Q1
SELECT Customers.CompanyName, Orders.OrderID, Orders.OrderDate from Customers
join Orders on Customers.CustomerID = Orders.CustomerID

--Q2
SELECT Suppliers.CompanyName, Products.ProductName FROM Suppliers
LEFT JOIN Products on Suppliers.SupplierID = Products.SupplierID

--Q3
SELECT Orders.OrderID, Orders.OrderDate, Concat(Employees.FirstName, ' ', Employees.LastName) as 'Employee' from Employees
RIGHT JOIN Orders on Employees.EmployeeID=Orders.EmployeeID

--Q4
SELECT Orders.OrderID, Orders.OrderDate, Customers.CompanyName FROM Customers
FULL OUTER JOIN Orders on Customers.CustomerID=Orders.CustomerID

--Q5
SELECT Products.ProductName, Categories.CategoryName FROM Products
CROSS JOIN Categories 

--Q6
SELECT Customers.CompanyName, orders.OrderID, Orders.OrderDate, Concat(Employees.FirstName, ' ', Employees.LastName) as "Employee" from Orders
INNER JOIN Customers on Orders.CustomerID= Customers.CustomerID
INNER JOIN Employees on Employees.EmployeeID=Orders.EmployeeID
WHERE Orders.OrderDate BETWEEN '1998-01-01' AND '1998-12-31'

--Q7
SELECT Customers.CompanyName, count(Orders.OrderID) as 'sayı' from Customers
inner JOIN Orders on Customers.CustomerID=Orders.CustomerID
GROUP by Customers.CompanyName
HAVING 'sayı'>5

--Q8
SELECT Products.ProductName, SUM(OrderDetails.Quantity) as miktar, sum(OrderDetails.Quantity*OrderDetails.UnitPrice) as total from OrderDetails
inner JOIN Products on OrderDetails.ProductID=Products.ProductID
GROUP BY Products.ProductName;

--Q9
SELECT Customers.CompanyName, Orders.OrderID,Orders.OrderDate FROM Customers
INNER JOIN Orders on Customers.CustomerID=Orders.CustomerID
WHERE Customers.CompanyName LIKE 'B%'

--Q10
SELECT Products.ProductName, Categories.CategoryName FROM Products
RIGHT JOIN Categories on Categories.CategoryID=Products.CategoryID
WHERE Products.ProductName is NULL

--Q11
SELECT concat(e1.FirstName,' ', e1.LastName), e1.ReportsTo, concat(e2.FirstName,' ', e2.LastName), e2.ReportsTo from Employees e1
LEFT JOIN Employees e2 on e1.ReportsTo = e2.EmployeeID

--Q12
SELECT Products.categoryid, count(DISTINCT Products.UnitPrice) FROM Products
WHERE Products.UnitPrice = ( SELECT MAX(p2.unitprice) FROM Products p2
                            WHERE p2.CategoryID = Products.CategoryID
                            )
GROUP by Products.CategoryID

--Q13
SELECT Orders.OrderID, Orders.OrderDate, OrderDetails.ProductID, OrderDetails.UnitPrice, OrderDetails.Quantity, OrderDetails.Discount FROM Orders
JOIN OrderDetails on Orders.OrderID = OrderDetails.OrderID
order BY Orders.OrderID ASC

--Q14
SELECT Employees.EmployeeID, concat( Employees.firstname, ' ',Employees.LastName), COUNT(Orders.OrderID) as 'adet' FROM Employees 
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.EmployeeID

--Q15
SELECT p1.ProductID, p1.ProductName, p1.UnitPrice, p2.ProductID,p2.ProductName, p2.UnitPrice FROM Products p1
JOIN Products p2 on p1.CategoryID=p2.CategoryID and p1.UnitPrice<p2.UnitPrice
order by p1.CategoryID, p1.UnitPrice

--Q16
SELECT Products.SupplierID,Products.ProductName,Products.UnitPrice FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Products.UnitPrice = (SELECT MAX(Products.UnitPrice) FROM Products WHERE Suppliers.SupplierID = Products.SupplierID)
ORDER BY Suppliers.SupplierID, Products.UnitPrice DESC

--Q17
SELECT Employees.EmployeeID, concat(Employees.FirstName,' ', Employees.LastName), Orders.OrderID, Orders.OrderDate FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
WHERE Orders.OrderDate = (
    SELECT MAX(o2.OrderDate)
    FROM Orders o2
    WHERE o2.EmployeeID = Employees.EmployeeID
)

--Q18
SELECT unitprice, COUNT(*) AS 'adet' FROM Products
GROUP BY unitprice HAVING unitprice > 20

--Q19
SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderDate BETWEEN '2017-01-01' AND '2018-12-31'

--Q20
SELECT Customers.CustomerID, Customers.CompanyName FROM Customers
LEFT JOIN Orders  ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL
