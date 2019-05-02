﻿CREATE VIEW [FetchDetails]
AS
SELECT        
	dbo.Company.CompanyId, 
	dbo.Company.CompanyName, 
	dbo.Department.DepartmentId, 
	dbo.Department.DepartmentName, 
	dbo.SubDepartment.SubDepartmentId, 
	dbo.SubDepartment.SubDepartmentName, 
	dbo.SubDepartment.IsActive
FROM dbo.Company INNER JOIN
    dbo.Department ON dbo.Company.CompanyId = dbo.Department.CompanyId INNER JOIN
    dbo.SubDepartment ON dbo.Department.DepartmentId = dbo.SubDepartment.DepartmentId
GO