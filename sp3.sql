/* Retrieve the names of all borrowers who do not have any books checked out. */

USE db_library
GO

CREATE PROCEDURE dbo.uspDateOutNull

AS

SELECT a.Name AS 'Name:'
FROM BORROWER a
INNER JOIN BOOK_LOANS b ON a.CardNo = b.CardNo
WHERE a.CardNo NOT LIKE b.CardNo 

SELECT a.CardNo
FROM BORROWER a
EXCEPT 
SELECT b.CardNo 
FROM BOOK_LOANS b

GO