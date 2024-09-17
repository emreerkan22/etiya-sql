--Question 1
--SELECT * FROM Products 
--WHERE supplierid BETWEEN 1 AND 5

--Question 2
--SELECT * FROM Products 
--WHERE supplierid=1 or supplierid=2 or supplierid=4 or supplierid=5

--Question 3
--SELECT * FROM Products 
--where productname='Chang' or productname='Aniseed Syrup'

--Question 4
--SELECT * FROM Products 
--WHERE supplierid=3 or unitprice>10

--Question 5
--SELECT productname,unitprice FROM Products 

--Question 6
--SELECT UPPER(productname) FROM Products 
--WHERE productname LIKE ('%C%')

--Question 7
SELECT * FROM products 
WHERE productname LIKE 'n%' AND LENGTH(REPLACE(productname, 'n', '')) = LENGTH(productname) - 1

--Question 8
--SELECT * FROM Products 
--WHERE unitsinstock>50

--Question 9
--SELECT MAX(unitprice),MIN(unitprice) FROM Products 

--Question 10 
--SELECT * FROM Products 
--WHERE productname LIKE ('%Spice%')


