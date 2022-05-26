create proc userViewbyID
@UserID int 
as  
 select *
 from userregistrationtb
 where UserID = @UserID