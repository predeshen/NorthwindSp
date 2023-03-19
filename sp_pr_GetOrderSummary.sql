USE [NORTHWND]
GO

/****** Object:  StoredProcedure [dbo].[pr_GetOrderSummary]    Script Date: 2023/03/17 10:42:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Predeshen Naidoo
-- Create date: 17/03/2023
-- Description:	Select Procedure script for order summaries 
-- =============================================

CREATE PROCEDURE [dbo].[pr_GetOrderSummary]
    @StartDate date,
    @EndDate date,
    @EmployeeID int = NULL,
    @CustomerID nvarchar(5) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        e.TitleOfCourtesy+e.FirstName+e.LastName AS 'EmployeeFullName',
        s.CompanyName AS 'ShipperCompanyName',
        c.CompanyName AS 'CustomerCompanyName',
        COUNT(DISTINCT o.OrderID) AS 'NumberOfOrders',
        o.OrderDate AS 'OrderDate',
        SUM(o.Freight) AS 'TotalFreightCost',
        COUNT(DISTINCT od.ProductID) AS 'NumberOfDifferentProducts',
        SUM(od.UnitPrice * od.Quantity) AS 'TotalOrderValue'
    FROM Orders o WITH(NOLOCK)
	INNER JOIN [Order Details] od WITH(NOLOCK)
			ON o.OrderID = od.OrderID
	INNER JOIN Employees e WITH(NOLOCK)
			ON o.EmployeeID = e.EmployeeID
    INNER JOIN Shippers s WITH(NOLOCK)
			ON o.ShipVia = s.ShipperID
    INNER JOIN Customers c WITH(NOLOCK)
			ON o.CustomerID = c.CustomerID
    WHERE 
        o.OrderDate BETWEEN @StartDate AND @EndDate
        AND 
		o.EmployeeID = @EmployeeID OR @EmployeeID IS NULL
        AND 
		o.CustomerID = @CustomerID OR @CustomerID IS NULL 
	GROUP BY 
        o.OrderDate,
        e.TitleOfCourtesy+e.FirstName+e.LastName,
        s.CompanyName,
        c.CompanyName
    ORDER BY 
        o.OrderDate,
        e.TitleOfCourtesy+e.FirstName+e.LastName,
        s.CompanyName,
        c.CompanyName;
END

GO


