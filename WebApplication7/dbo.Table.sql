CREATE TABLE [dbo].[Table]
(
    [UserID] INT NOT NULL IDENTITY,
	[FirstName] VARCHAR(50) NOT NULL, 
    [LastName] VARCHAR(50) NOT NULL, 
    [Contact] VARCHAR(50) NULL, 
    [Gender] VARCHAR(10) NOT NULL, 
    [Address] VARCHAR(250) NULL, 
    [Username] VARCHAR(50) NOT NULL, 
    [Password] VARCHAR(50) NOT NULL,  
    CONSTRAINT [PK_Table] PRIMARY KEY ([UserID]) 
)
