/* How many copies of the book titled 
"The Lost Tribe" are owned by each library branch? */

USE db_library
GO

CREATE PROCEDURE dbo.uspGetLostTribeCount 

AS

SELECT b.BranchName, c.Title, a.No_Of_Copies
FROM BOOK_COPIES a
INNER JOIN LIBRARY_BRANCH b ON a.Branchid  = b.Branchid 
INNER JOIN BOOK c ON a.Bookid = c.Bookid
WHERE  Title = 'The Lost Tribe'

GO