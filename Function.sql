﻿CREATE FUNCTION GetSearchTermCount
(	
	@SearchTerm varchar(50)	 
)
RETURNS int 
AS begin
    declare @Count Int
	Select @Count =  count(*) FROM DEPARTMENT WHERE DepartmentName LIKE '%' + @SearchTerm + '%'
	RETURN @Count;
end