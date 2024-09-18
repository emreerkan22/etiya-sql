--Q1
SELECT categoryid, COUNT(*) AS 'Ürün sayısı' FROM Products
GROUP BY categoryid;

--Q2
SELECT productname AS 'name', unitprice AS 'fiyat' FROM Products
Order BY unitprice DESC
LIMIT 5

--Q3
SELECT supplierid as 'supplier', avg(unitprice) as 'ortalama' FROM Products
GROUP by supplierid

--Q4
SELECT categoryid as 'kategori', avg(unitprice) FROM Products
WHERE unitprice>100
GROUP by categoryid

--Q5
SELECT * from OrderDetails
WHERE unitprice*quantity>1000

--Q6
SELECT orderid, shippeddate FROM Orders
WHERE shippeddate IS NOT NULL
ORDER BY shippeddate DESC
LIMIT 10

--Q7
SELECT COUNT(productid) as 'ürün adedi', avg(unitprice) as 'ortalama fiyat' FROM Products

--Q8
SELECT count(productid) as 'ürün adedi', sum(unitsinstock) as 'toplam stok' from Products
where unitprice>50

--Q9
SELECT orderid, min(shippeddate) as 'teslim tarihi' FROM Orders

--Q10
SELECT CONCAT(firstname, ' ', lastname) as 'kişi',hiredate AS 'alım tarihi', (strftime('%Y', 'now') - strftime('%Y', HireDate)) AS 'kaç yıldır' from Employees

--Q11
SELECT orderid, ROUND(SUM(UnitPrice * Quantity)) as 'birim fiyat' FROM OrderDetails
GROUP BY orderid

--Q12
SELECT COUNT(productid) as 'toplam ürün', sum(unitsinstock) 'toplam stok' from Products

--Q13
SELECT max(unitprice) as 'en yüksek fiyat', min(unitprice) as 'en düşük fiyat' FROM Products

--Q14
SELECT strftime('%Y', orderdate) AS yıl, COUNT(*) AS miktar FROM Orders
GROUP BY yıl;

--Q15
SELECT concat(firstname, ' ', lastname) as 'isim-soyisim' FROM Employees

--Q16
SELECT city, length(city) as uzunluk FROM Employees
GROUP by city

--Q17
SELECT productname as isim, round(unitprice,2) as fiyat from Products

--Q18
SELECT count(*) as 'toplam sipariş' FROM Orders

--Q19
SELECT categoryid, avg(unitprice) as ortalama FROM Products
GROUP by categoryid

--Q20
SELECT (COUNT(CASE WHEN ShippedDate IS NULL THEN 1 END) * 100.0 / COUNT(*)) AS yüzde FROM Orders;

--Q21
SELECT productid, productname, unitprice, max(unitprice)*1.10 as 'zamlı fiyat' from Products

--Q22
SELECT SUBSTR(productname,1,3) FROM Products

--Q23
SELECT strftime('%Y', orderdate) AS year, strftime('%m', orderdate) AS month, COUNT(*) AS sayı
FROM Orders
GROUP by year, month

--Q24
SELECT sum(ROUND(UnitPrice * Quantity)) as toplamdeğer FROM OrderDetails

--Q25
SELECT sum(unitprice) FROM Products
WHEre unitsinstock=0