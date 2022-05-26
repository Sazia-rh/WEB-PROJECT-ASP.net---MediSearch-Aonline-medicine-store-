create proc UserAddorEdit
	@UserID	int		,
	@FirstName	varchar(50),		
	@LastName	varchar(50),		
	@Email	varchar(50),		
	@Contact	varchar(50)	,	
	@Gender	varchar(10)	,	
	@Address	varchar(250),	
	@UserName	varchar(50)	,
	@Password	varchar(50)		
as
if @UserID = 0
begin
  insert into  userregistrationtb ( FirstName ,LastName ,Email, Contact, Gender, Address, UserName, Password)
  values (@FirstName,@LastName, @Email,@Contact,@Gender,@Address,@UserName,@Password)
end

else
begin
  update userregistrationtb
  set 
    FirstName = @FirstName,
	LastName = @LastName,
	Email = @Email,
	Contact = @Contact,
	Gender = @Gender,
	Address = @Address, 
	UserName = @UserName,
	Password = @Password

end