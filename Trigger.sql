﻿CREATE TRIGGER [dbo].[SubDepartment_Update] ON [dbo].[SubDepartment]
For update
AS
BEGIN
       
     declare @SubDepartmentId numeric(18,0)
	 , @subDepartmentName nvarchar(50)
	 , @DepartmentId numeric(18,0)
	 , @IsActive bit
	 , @createddate date
	 , @modifieddate date
	 , @createdby nvarchar(50)
	 , @modifiedby nvarchar(50)

	 select @SubDepartmentId=i.SubDepartmentId from inserted i; 
	 select @subDepartmentName=i.subDepartmentName from inserted i;
     select @DepartmentId=i.DepartmentId from inserted i; 
	 select @IsActive=i.IsActive from inserted i; 
	 select @createddate=i.createddate from inserted i;
     select @modifieddate=i.modifieddate from inserted i; 
	 select @createdby=i.CreatedBy from inserted i; 
	 select @modifiedby=i.ModifiedBy from inserted i;
     
	 insert into [dbo].[SubDepartmentLog] values (@SubDepartmentId, @subDepartmentName,@DepartmentId, @IsActive,
	 @createddate, @modifieddate, @createdby, @modifiedby )

END