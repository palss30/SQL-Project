SELECT * From Person.EmailAddress
SELECT * From Person.PersonPhone
select * from Person.PhoneNumberType

--A.Get all the details from the person table including email ID, phonenumber and phone numbur type

SELECT EM.BusinessEntityID,	EM.EMAILADDRESS,PH.PHONENUMBER ,PHNO.NAME AS PHONENUMBERTYPE FROM  Person.EmailAddress as EM
JOIN Person.PersonPhone AS PH 
ON EM.BUSINESSENTITYID=PH.BUSINESSENTITYID
JOIN Person.PhoneNumberType AS PHNO
ON PH.PHONENUMBERTYPEID=PHNO.PHONENUMBERTYPEID

--B.Get the details of the sales header order made in May 2011

SELECT * FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate)='2011'
AND MONTH(OrderDate)='5'

--c. Get the details of the sales details order made in the month of May 2011


SELECT * FROM Sales.SalesOrderDetail AS SOD
JOIN  Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID=SOH.SalesOrderID
WHERE YEAR(OrderDate)='2011'
AND MONTH(OrderDate)='5'


--d. Get the total sales made in May 2011
SELECT SUM(LINETOTAL) AS TOTAL_SALE FROM [Sales].[SalesOrderDetail]
WHERE SalesOrderID IN(SELECT SalesOrderID FROM [Sales].[SalesOrderHeader]
WHERE MONTH(OrderDate)= '5' AND YEAR(ORDERDATE)='2011')


--e. Get the total sales made in the year 2011 by month order by INCREASED SALE

SELECT MONTH(OrderDate) AS  MONTHORDER ,SUM(TotalDue) AS Sales_Value FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate)='2011'
GROUP BY MONTH(OrderDate)
ORDER BY Sales_Value DESC


--f. Get the total sales made to the customer with FirstName='Gustavo' AND LAST NAME='aCHONG'

SELECT  *FROM Person.Person
WHERE FirstName='Gustavo' AND LastName='Achong'

SELECT  *FROM Person.Person
SELECT SalesYTD as totalsale FROM Sales.SalesPerson AS SSP
INNER JOIN Person.Person AS PP
ON SSP.BusinessEntityID=PP.BusinessEntityID
WHERE pp.FirstName='Gustavo' AND  pp.LastName='Achong'













