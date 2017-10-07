/* How many copies of the book titled "The Lost Tribe" 
are owned by the library branch whose name is "Sharpstown"? */

USE db_library
GO

CREATE PROCEDURE dbo.uspGetBookCopies 

AS

SELECT b.BranchName AS 'Branch:', c.Title AS 'Title:', a.No_Of_Copies AS 'Copies:'
FROM BOOK_COPIES a
INNER JOIN LIBRARY_BRANCH b ON a.Branchid  = b.Branchid 
INNER JOIN BOOK c ON a.Bookid = c.Bookid
WHERE BranchName = 'Sharpstown' AND  Title = 'The Lost Tribe'

GO