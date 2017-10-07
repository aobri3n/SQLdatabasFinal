/* Retrieve the names of all borrowers who do not have any books checked out. */

USE db_library
GO

CREATE PROCEDURE dbo.uspDateOutNull

AS

WITH
	cteBorrower (CardNo)
	AS
	(
		SELECT CardNo
		FROM BORROWER
		EXCEPT
		SELECT CardNo
		FROM BOOK_LOANS
	)
SELECT c.Name, c.CardNo
FROM BORROWER c
INNER JOIN cteBorrower e ON c.CardNo = e.CardNo

GO
