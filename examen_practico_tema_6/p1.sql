
2. SELECT * FROM Customers;
--91 clientes

3. SELECT * FROM Orders;
--196 pedidos

4. SELECT COUNT(*) FROM Customers WHERE city = 'London'AND customername LIKE 'a%';
--1 cliente
5. SELECT COUNT(*) FROM Customers WHERE city = 'London';
--6 clientes

6.  SELECT CITY, COUNT (*) FROM Customers GROUP BY city;
7. SELECT * FROM Employees WHERE BirthDate > '1965-06-01';
8. SELECT 'El empleado ' || FirstName || ' ' || LastName || ' nació el ' || BirthDate AS Informe
FROM Employees;

9. SELECT 'El empleado ' || FirstName || ' ' || LastName || ' nació el ' || BirthDate AS Informe
FROM Employees WHERE EmployeeID IN (8,7,3,10);

10. SELECT Country FROM Customers group by Country HAVING count (Country) > 5 order by country;