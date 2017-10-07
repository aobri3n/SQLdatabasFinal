/* For each book authored (or co-authored) by "Stephen King", 
retrieve the title and the number of copies owned by the library 
branch whose name is "Central" */

USE db_library
GO

CREATE PROCEDURE dbo.uspAuthorCheck

AS


SELECT e.BranchName AS 'Branch:', a.AuthorName AS 'Author:', b.Title AS 'Title:', c.No_Of_Copies AS 'Copies:'
FROM BOOK_AUTHORS a
INNER JOIN BOOK b ON a.Bookid = b.Bookid
INNER JOIN BOOK_COPIES c ON a.Bookid = c.Bookid
INNER JOIN LIBRARY_BRANCH e ON c.Branchid = e.Branchid
WHERE AuthorName LIKE '%Stephen King%' AND BranchName = 'Central'



GO