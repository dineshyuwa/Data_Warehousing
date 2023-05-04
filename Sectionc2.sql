USE empDB
CREATE TABLE Salary
(
ID int identity(1,1) primary key NOT NULL,
SalDate datetime default GETDATE() NOT NULL,
Task BIGINT NULL,
PaidPerTask BIGINT NULL,
EmpName NCHAR(100) NOT NULL
)

CREATE TABLE SalaryLogs
(
ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
SalDate DATETIME DEFAULT GETDATE() NOT NULL,
Query NCHAR(6) NOT NULL,
OldTask BIGINT NULL,
NewTask BIGINT NULL,
OldPaidPerTask BIGINT NULL,
NewPaidPerTask BIGINT NULL,
EmpName NCHAR(100) NOT NULL
)


GO
CREATE TRIGGER salary_change
ON Salary
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
INSERT INTO SalaryLogs (Query, SalDate, OldTask, OldPaidPerTask, EmpName)
SELECT @operation, GETDATE(), d.Task, d.PaidPerTask, USER_Name()
FROM deleted d
IF @operation = 'Insert'
INSERT INTO SalaryLogs (Query, SalDate, NewTask, NewPaidPerTask, EmpName)
SELECT @operation, GETDATE(), i.Task, i.PaidPerTask, USER_Name()
FROM inserted i
IF @operation = 'Update'
INSERT INTO SalaryLogs (Query, SalDate, NewTask, OldTask, NewPaidPerTask,OldPaidPerTask, EmpName)
SELECT @operation, GETDATE(), d.Task, i.Task, d.PaidPerTask, i.PaidPerTask, USER_Name()
FROM deleted d, inserted i
END
GO

INSERT INTO Salary(SalDate,Task,PaidPerTask,EmpName)
VALUES
(2020-11-20, 4, 4000 , 'Indrajith'),
(2020-10-20, 11, 10000 , 'Kusum');
UPDATE Salary
SET EmpName = 'Janaka'
WHERE EmpName = 'Indrajith';
DELETE FROM Salary WHERE EmpName = 'Kusum';


