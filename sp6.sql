/* Retrieve the names, addresses, and number of books checked out for all 
borrowers who have more than five books checked out. */



USE db_library
GO

CREATE PROCEDURE dbo.uspGreaterThanFiveLoansOut

AS

SELECT a.Name AS 'Name:', a.Address AS 'Address:', COUNT(b.CardNo) AS 'Out:'
FROM BORROWER a
INNER JOIN BOOK_LOANS b ON a.CardNo = b.CardNo
GROUP BY Name, Address
HAVING COUNT(b.CardNo) > 5;


GO