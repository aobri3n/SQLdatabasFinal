/* For each library branch, retrieve the branch name and the total number of 
books loaned out from that branch. */

USE db_library
GO

CREATE PROCEDURE dbo.uspTotalLoansOut

AS

SELECT a.BranchName AS 'Branch:', COUNT(CardNo) AS 'Total:'
FROM BOOK_LOANS C
INNER JOIN LIBRARY_BRANCH a ON a.Branchid = c.Branchid
GROUP BY BranchName


GO


