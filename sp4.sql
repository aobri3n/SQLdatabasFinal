/* For each book that is loaned out from the "Sharpstown" branch and 
whose DueDate is today, retrieve the book title, the borrower's name, 
and the borrower's address. */

USE db_library
GO

CREATE PROCEDURE dbo.uspRetrieveLoanInfo

AS


SELECT f.Title AS 'Title:', b.Name AS 'Name:', b.Address AS 'Address:'
FROM BOOK_LOANS c 
INNER JOIN BORROWER b ON c.CardNo = b.CardNo
INNER JOIN LIBRARY_BRANCH e ON c.Branchid = e.Branchid
INNER JOIN BOOK f ON c.Bookid = f.Bookid

WHERE DueDate = '2017-09-06' AND BranchName = 'Sharpstown'

GO