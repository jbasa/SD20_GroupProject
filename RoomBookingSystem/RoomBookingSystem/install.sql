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
Password varchar (30)
)
insert into tbUsers (FullName, Email, Password) values
					('Adam Kuharski','adam.kuharski@robertsoncollege.net','adam'),
					('Michael Glowa', 'michael.glowa@robertsoncollege.net','michael'),
					('John Basa', 'john.basa@robertsoncollege.net', 'john'),
					('Craig Kunz', 'craig.kunz@robertsoncollege.net', 'craig')


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
StartTime time,
EndTime time,
UserID int foreign key references tbUsers (UserID),
RoomID int foreign key references tbRoom (RoomID)
)

go
										-- Booking CRUD --
	-- Book Room --
Create proc spBookRoom
(
@StartTime time,
@EndTime time,
@UserID int,
@RoomID int
)
as begin 
	insert into tbBooking (StartTime, EndTime, UserID, RoomID) values
						(@StartTime, @EndTime, @UserID, @RoomID)
	
	select SCOPE_IDENTITY() as [NewBooking]
end
go

	-- Update Booking --
Create proc spUpdateBooking
(
@BookingID int,
@StartTime time,
@EndTime time,
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

											-- USER CRUD --

	-- Create User --
Create proc spCreateUser
(
@FullName varchar (30),
@Email varchar (60),
@Password varchar (30)
)
as begin 
	insert into tbUsers(Fullname, Email, Password) values
						(@FullName, @Email, @Password)
	
	select SCOPE_IDENTITY() as [NewUser]
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