/* For each library branch, retrieve the branch name and the total number of 
books loaned out from that branch. */

USE db_library
GO

CREATE PROCEDURE dbo.uspTotalLoansOut

AS

SELECT a.BranchName AS 'Branch:', COUNT(b.No_Of_Copies) AS 'Total:'
FROM BOOK_LOANS C
INNER JOIN BOOK_COPIES b ON c.Bookid = b.Bookid
INNER JOIN LIBRARY_BRANCH a ON a.Branchid = c.Branchid
GROUP BY BranchName


GO


