
1. SELECT CustomerName FROM Customers C, Orders O WHERE OrderID = 10360 AND C.CustomerID = O.CustomerID;
2. SELECT CustomerName,ContactName FROM Customers C, Orders O WHERE OrderID IN (10360,10253,10440) AND C.CustomerID = O.CustomerID;
3. SELECT city, count (OrderID) FROM Customers C, Orders O WHERE C.CustomerID = O.CustomerID GROUP BY city;
4. SELECT city, count (OrderID) FROM Customers C, Orders O WHERE C.CustomerID = O.CustomerID GROUP BY city HAVING COUNT (OrderID) > 7 ;
5. SELECT Country, count (OrderID) FROM Customers C, Orders O WHERE C.CustomerID = O.CustomerID GROUP BY country ORDER BY COUNT (OrderID) DESC LIMIT 3;
6. SELECT 'El empleado ' || FirstName  || ' ' || LastName || ' registró  '|| count(OrderID) ||' pedidos 'as informe FROM Employees E, Orders O WHERE E.EmployeeID = O.EmployeeID GROUP BY FirstName, LastName;
7. SELECT 'El empleado ' || FirstName  || ' ' || LastName || ' registró  '|| count(OrderID) ||' pedidos 'as informe FROM Employees E, Orders O WHERE E.EmployeeID = O.EmployeeID AND FirstName LIKE 'M%' GROUP BY FirstName, LastName;
8. SELECT O.OrderID, E.FirstName, C.CustomerName
FROM Orders O
INNER JOIN Employees E ON E.EmployeeID = O.EmployeeID
INNER JOIN Customers C ON C.CustomerID = O.CustomerID;
9. SELECT C.CustomerID, C.CustomerName, E.EmployeeID, E.FirstName, COUNT(O.OrderID) AS NumerosdePedidos
FROM Customers C
INNER JOIN Orders O ON O.CustomerID = C.CustomerID
INNER JOIN Employees E ON E.EmployeeID = O.EmployeeID
GROUP BY C.CustomerID, E.EmployeeID
HAVING COUNT(O.OrderID) > 1
order by FirstName;
10.
SELECT O.CustomerID, C.CustomerName
FROM Orders O
INNER JOIN Employees E ON E.EmployeeID = O.EmployeeID
INNER JOIN Customers C ON C.CustomerID = O.CustomerID
WHERE E.FirstName = 'Margaret'
GROUP BY O.CustomerID, C.CustomerName
HAVING COUNT(*) > 1;