# Northwind Stored Procedure

This guide will walk you through the process of attaching the Northwind MDF file to SQL Server Management Studio (SSMS) 
and executing the stored procedure create script. Then, you will execute the newly created script to see its results.

Prerequisites
Before starting, make sure you have the following:

SQL Server Management Studio (SSMS) installed on your machine
The Northwind MDF file which is found in the zip folder(northwind_mdf.zip).

Attaching the Northwind MDF file
Open SSMS and connect to your SQL Server instance.
Right-click the "Databases" folder in the Object Explorer and select "Attach..."
Click the "Add" button and navigate to the location where you have stored the Northwind MDF file.
Select the MDF file and click "OK".
Click "OK" again to attach the database.

Opening and executing the SQL file
In the Object Explorer, expand the folder for the database you want to use.
Right-click on the "New Query" button and select "File".
Navigate to the location where the SQL file(sp_pr_GetOrderSummary.sql) is stored and select it.
Click the "Execute" button in the toolbar to execute the SQL file.

Executing the Stored Procedure
In the Object Explorer, expand the folder for the database that contains the stored procedure you want to execute.
Expand the "Programmability" folder.
Expand the "Stored Procedures" folder.
Locate "sp_pr_GetOrderSummary" and right-click on it.
Select "Execute Stored Procedure". 
enter the values in the "Parameter Values".
Click the "OK" button to execute the stored procedure.
After executing the stored procedure, you should see the results in the "Results" pane.
