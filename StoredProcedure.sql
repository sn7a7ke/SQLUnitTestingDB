﻿CREATE PROCEDURE SaveDepartment
	(
	@DepartmentName nvarchar(50),
	@CompanyId numeric(18,0),
	@IsActive bit
	)
AS
BEGIN
	INSERT INTO [dbo].[Department]
           ([DepartmentName]
           ,[CompanyId]
           ,[IsActive]
           ,[CreatedDate]
           ,[ModifiedDate]
           ,[CreatedBy]
           ,[ModifiedBy])
     VALUES
           (@DepartmentName
           ,@CompanyId
           ,@IsActive
           ,getdate()
           ,null
           ,getdate()
           ,null)
END
GO