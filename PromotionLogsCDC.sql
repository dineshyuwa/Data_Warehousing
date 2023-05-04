USE Target

CREATE TABLE PromotionLogs
(
ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Query NCHAR(6) NOT NULL,
OldName VARCHAR(50) NULL,
NewName VARCHAR(50) NULL,
OldDiscount VARCHAR(50) NULL,
NewDiscount VARCHAR(50) NULL,
)

GO
CREATE TRIGGER promotion_change
ON PromotionDim
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
DECLARE @operation CHAR(6)
SET @operation = CASE
WHEN EXISTS(SELECT * FROM inserted) AND EXISTS(SELECT * FROM deleted)
THEN 'Update'
WHEN EXISTS(SELECT * FROM inserted)
THEN 'Insert'
WHEN EXISTS(SELECT * FROM deleted)
THEN 'Delete'
ELSE NULL
END
IF @operation = 'Delete'
INSERT INTO PromotionLogs (Query, OldName, OldDiscount)
SELECT @operation,  d.name, d.discount
FROM deleted d
IF @operation = 'Insert'
INSERT INTO PromotionLogs(Query, NewName, NewDiscount)
SELECT @operation, i.name, i.discount
FROM inserted i
IF @operation = 'Update'
INSERT INTO PromotionLogs(Query, NewName, OldName, NewDiscount,OldDiscount)
SELECT @operation,  d.name, i.name, d.discount, i.discount
FROM deleted d, inserted i
END
GO

INSERT INTO PromotionDim(promotionID,name,discount)
VALUES
(6,'Diwali','35'),
(7,'NewYear','45');

UPDATE PromotionDim
SET name = 'HotSale'
WHERE name = 'Summer';

DELETE FROM PromotionDim WHERE name = 'Diwali';
