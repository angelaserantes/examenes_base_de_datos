1. SELECT productname, price from products where
price =(select min(price)  from products); 
2.SELECT ProductName, Price
FROM Products
WHERE Price >= (
  SELECT MIN(quantity) * 10
  FROM OrderDetails
);
3. SELECT productname FROM Products where
price > (select max(price) from products where productid in (3,6,9,10));
4. SELECT * from products where productid in ( select shipperid from shippers);
5.SELECT DISTINCT C.CustomerID, C.CustomerName
FROM Customers C
INNER JOIN Suppliers S ON C.City = S.City;
