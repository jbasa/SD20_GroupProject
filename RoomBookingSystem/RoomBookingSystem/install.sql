use master
go
drop database dbRoomBookingSystem
go
create database dbRoomBookingSystem
go
use dbRoomBookingSystem
go

Create table tbUsers
(
UserID int primary key identity (1,1),
FullName varchar (30),
Email varchar (60),
Password varchar (30),
SecurityLevel INT
)
insert into tbUsers (FullName, Email, Password, SecurityLevel) values
					('Adam Kuharski','adam.kuharski@robertsoncollege.net','adam',2),
					('Michael Glowa', 'michael.glowa@robertsoncollege.net','michael',1),
					('John Basa', 'john.basa@robertsoncollege.net', 'john',1),
					('Craig Kunz', 'craig.kunz@robertsoncollege.net', 'craig',1)


Create table tbFloor
(
FloorID int primary key identity (0,1),
FloorNumber int
)
insert into tbFloor (FloorNumber) values
					(0),
					(1),
					(2),
					(3),
					(4),
					(5)

Create table tbRoom
(
RoomID int primary key identity (1,1),
NumberOfChairs int,
RoomName varchar (30),
FloorID int foreign key references tbFloor(FloorID)
)
insert into tbRoom (RoomName, NumberOfChairs, FloorID) values
				('PEI', 16, 0),
				('Quebec', 16, 0),
				('Newfoundland', 12, 0),
				('Ontario', 10, 1),
				('Ottawa', 16, 1),
				('Montreal', 24, 1),
				('PT Lab', 16, 2),
				('Niagara', 16, 2),
				('Dauphin', 18, 3),
				('Churchill', 16, 3),
				('Gimli', 22, 3),
				('Morden', 20, 3),
				('Calgary', 12, 4),
				('Edmonton', 12, 4),
				('Lethbridge', 16, 4),
				('Saskatoon', 12, 4),
				('Alberta', 18, 4),
				('Tofino', 10, 5),
				('Victoria/HMMP', 20, 5),
				('British Columbia', 28, 5),
				('Banff', 44, 5)
					

Create table tbBooking
(
BookingID int primary key identity (1,1),
StartTime datetime,
EndTime datetime,
UserID int foreign key references tbUsers (UserID),
RoomID int foreign key references tbRoom (RoomID)
)
insert into tbBooking (StartTime, EndTime, UserID, RoomID) values
					('2015-08-20 11:00:00', '2015-08-20 13:00:00', 1, 1),
					('2015-08-19 8:00:00', '2015-08-19 11:00:00', 2, 2),
					('2015-08-19 8:00:00', '2015-08-19 14:00:00', 3, 3),
					('2015-08-20 8:00:00', '2015-08-20 17:00:00', 4, 4)

go
										-- Booking CRUD --
	-- Book Room --
Create proc spBookRoom
(
@StartTime datetime,
@EndTime datetime,
@UserID int,
@RoomID int
)
as begin 
	insert into tbBooking (StartTime, EndTime, UserID, RoomID) values
						(@StartTime, @EndTime, @UserID, @RoomID)
	
	select SCOPE_IDENTITY() as [NewBooking]
end
go
--spBookRoom @StartTime='2015-01-12 09:30:00',  @EndTime='2015-01-12 011:30:00', @UserId=1,@RoomID=8
--SELECT * FROM tbBooking
GO
	-- Update Booking --
Create proc spUpdateBooking
(
@BookingID int,
@StartTime datetime,
@EndTime datetime,
@UserID int,
@RoomID int
)
as begin
	Update tbBooking
	Set StartTime = @StartTime,
		EndTime = @EndTime,
		UserID = @UserID,
		RoomID = @RoomID
	where BookingID = @BookingID
end
go

	-- Delete Booking --
Create proc spDeleteBooking
(
@BookingID int
)
as begin
	delete from tbBooking
	where BookingID = @BookingID
end
go

	-- Get Booking --
Create proc spGetBookings
(
@BookingID int = null
)
as begin
	select * from tbBooking
	where BookingID = ISNULL (@BookingID, BookingID)
end
go

Create proc spgetBookingUserRoom
(
@BookingID int = null
)
as begin
select tbBooking.RoomID, RoomName, NumberOfChairs, BookingID, StartTime, EndTime, tbBooking.UserID, FullName from tbBooking, tbRoom, tbUsers
where tbBooking.RoomID = tbRoom.RoomID and tbUsers.UserID = tbBooking.UserID and tbBooking.BookingID = isnull (@BookingID, BookingID)
end
go
											-- USER CRUD --

	-- Create User --
Create proc spCreateUser
(
@FullName varchar (30),
@Email varchar (60),
@Password varchar (30)
)
as begin 
	if exists (select FullName from tbUsers
	where FullName = @FullName)
begin
	select 'Error' as Message
end
else
begin
	insert into tbUsers(Fullname, Email, Password, SecurityLevel) values
						(@FullName, @Email, @Password, 1)
	Select 'Ok' as Message
	select SCOPE_IDENTITY() as [NewUser]
end
end
go

	-- Update User --
Create proc spUpdateUser
(
@UserID int,
@FullName varchar (30),
@Email varchar (60),
@Password varchar (30)
)
as begin
	Update tbUsers
	Set FullName = @FullName,
		Email = @Email,
		Password = @Password
	where UserID = @UserID
end
go

	-- Delete User --
Create proc spDeleteUser
(
@UserID int
)
as begin
	delete from tbBooking
	where UserID = @UserID
	delete from tbUsers
	where UserID= @UserID
end
go

	-- Get Users --
Create proc spGetUsers
(
@UserID int = null
)
as begin
	select * from tbUsers
	where UserID = ISNULL (@UserID, UserID)
end
go

	-- Get Floors --
Create proc spGetFloors
as begin
	select * from tbFloor
end
go

	-- Search --
Create proc spSearch
(
@FloorNumber int = null,
@NumberOfChairs int = null,
@StartTime datetime,
@EndTime datetime
)
as begin
	-- Find all rooms that match search criteria
	Select r.RoomID, RoomName, FloorNumber, NumberOfChairs
		from tbFloor f JOIN tbRoom r ON f.FloorID = r.FloorID
		where (@FloorNumber IS NULL OR f.FloorNumber = @FloorNumber)
		AND (@NumberOfChairs IS NULL OR r.NumberOfChairs >= @NumberOfChairs)
		AND r.RoomID NOT IN 
			( -- FIND ALL THE ROOMS THAT ARE BOOKED DURING THE START/END DATES.. dont join those! NOT IN NOT IN
				SELECT b.RoomId FROM tbBooking b
					WHERE	@StartTime >= StartTime AND @StartTime <= EndTime
					OR		@EndTime >= StartTime AND @EndTime <= EndTime
					OR		@StartTime <= StartTime AND @EndTime >= EndTime
			)
end
go

--SELECT * FROM tbBooking JOIN tbRoom ON tbRoom.RoomID = tbBooking.RoomID
--exec spSearch 0,15,'2015-08-20 11:00:00','2015-08-20 13:00:00'

--SELECT * FROM tbRoom

--SELECT f.FloorNumber,r.RoomName, r.NumberOfChairs, b.StartTime, b.EndTime 
--	FROM tbRoom r JOIN tbBooking b ON r.RoomID = b.RoomID
--				  JOIN tbFloor f ON f.FloorID = r.FloorID

	-- Login --
Create proc spLogin
(
@FullName varchar (60),
@Password varchar (60)
)
as begin
	select *
	from tbUsers
	where FullName = @FullName and
		  Password = @Password 
end
go

-- Admin Update User w/ Security Level-- 
Create proc spAdminUpdateUser
(
@UserID int,
@FullName varchar (30),
@Email varchar (60),
@Password varchar (30),
@SecurityLevel int
)
as begin
	Update tbUsers
	Set FullName = @FullName,
		Email = @Email,
		Password = @Password,
		SecurityLevel = @SecurityLevel
	where UserID = @UserID
end
go

-- Admin Create User w/ Security Level --
Create proc spAdminCreateUser
(
@FullName varchar (30),
@Email varchar (60),
@Password varchar (30),
@SecurityLevel int
)
as begin 
	if exists (select FullName from tbUsers
	where FullName = @FullName)
begin
	select 'Error' as Message
end
else
begin
	insert into tbUsers(Fullname, Email, Password, SecurityLevel) values
						(@FullName, @Email, @Password, @SecurityLevel)
	Select 'Ok' as Message
	select SCOPE_IDENTITY() as [NewUser]
end
end
go