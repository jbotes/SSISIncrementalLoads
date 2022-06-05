-- insert script
--insert into [dbo].[Employees] select 'John', 'Albert' ,'Doctor'
--insert into [dbo].[Employees] select 'Jen', 'Jones' ,'Teacher'
--delete from [dbo].[Employees]


--step 1
SELECT [ID]
      ,[Name]
      ,[Surname]
      ,[Occupation]
	  ,'I' as Status
	  ,getdate() as insertDate
  FROM [SourceDatabase].[dbo].[Employees]

--Step 2

SELECT  [ID]
      ,[Name]
      ,[Surname]
      ,[Occupation]
      ,[Status]
      ,[insertDate]
  FROM [DestinationDB].[dbo].[Employees]


--step 3
  update [dbo].[Employees] set [Occupation] = ?, [Status] = 'U', insertDate = getdate()
  where ID = ?

    update [dbo].[Employees] set [Name] = ?, [Status] = 'U', insertDate = getdate()
  where ID = ?

  --step 4
  --deletions
  SELECT [ID]
      ,[Name]
      ,[Surname]
      ,[Occupation]
      ,[Status]
      ,[insertDate]
  FROM [DestinationDB].[dbo].[Employees]
  where [Status] <> 'D'

  --step 5 - update deletion fields

    update [dbo].[Employees] set [Status] = 'D' , insertDate = getdate()
  where ID = ?

