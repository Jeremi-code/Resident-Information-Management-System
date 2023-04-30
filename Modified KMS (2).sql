create database KRICMS
use KRICMS

create login Feleke1 with password='1234'
create login Meaza1 with password='1234'
create login Kinfe1 with password='1234'
create login Esubalew1 with password='1234'
create login Tsehay1 with password='1234'

create user Feleke1 for login Feleke
create user Meaza1 for login Meaza
create user Kinfe1 for login Kinfe
create user Tsehay1 for login Tsehay
create user Esubalew1 for login Esubalew

create role Manager
create role FinanceEmployee
create role IdCreator
create role cityAdmin 
create role DBadmin

exec  sp_addRoleMember Manager,Feleke1
exec sp_addRoleMember FinanceEmployee, Meaza1
exec sp_addRoleMember IdCreator,Kinfe1
exec sp_addRoleMember cityAdmin,Esubalew1
grant select on Transfer to IdCreator

grant select on viewsForKebeles.view_KebeleResidentID to Manager
grant select on viewsForKebeles.view_KebeleOfficials to Manager
grant select on viewsForKebeles.view_EmergencyContact to Manager
grant select on viewsForKebeles.view_ResidentAddress to Manager
grant select on viewsForKebeles.view_Resident to Manager
grant select on viewsForKebeles.view_Map to Manager
grant select on viewsForKebeles.view_HouseOwner to Manager
grant select on viewsForKebeles.view_Dependents to Manager
grant select on viewsForKebeles.view_Transfer to Manager
grant select on viewsForKebeles.view_LivingYearOfResident to Manager
grant select on viewsForKebeles.view_KebeleResidentID to Manager
grant select on viewsForKebeles.view_RenewalPayment to Manager


grant execute on Sp_AddKebeleEmployee to Manager


grant select on viewsForKebeles.view_KebeleOfficials to IdCreator
grant select on viewsForKebeles.view_EmergencyContact to IdCreator
grant select on viewsForKebeles.view_ResidentAddress to IdCreator
grant select on viewsForKebeles.view_Resident to IdCreator
grant select on viewsForKebeles.view_Map to IdCreator
grant select on viewsForKebeles.view_HouseOwner to IdCreator
grant select on viewsForKebeles.view_Dependents to IdCreator
grant select on viewsForKebeles.view_Transfer to IdCreator
grant select on viewsForKebeles.view_LivingYearOfResident to IdCreator
grant select on viewsForKebeles.view_KebeleResidentID to IdCreator
grant select on viewsForKebeles.view_RenewalPayment to IdCreator
grant select on viewsForKebeles.view_CreationPayment to IdCreator
grant select on viewsForKebeles.view_LostPayment to IdCreator




grant insert on KebeleResidentId to IdCreator
grant insert on Transfer  to IdCreator
grant insert on LostPayment to IdCreator
grant insert on RenewalPayment to IdCreator
grant insert on PaymentForIdCreation to IdCreator
grant insert on Map to IdCreator
grant insert on HouseOwner to IdCreator
grant insert on LivingYearOfResident to IdCreator
grant insert on Dependents to IdCreator
grant insert on EmergencyContact to IdCreator
grant insert on ResidentAddress to IdCreator
grant insert on Resident to IdCreator





grant execute on  AddKebeleResidentId to IdCreator
grant execute on sp_AddMap to IdCreator
grant execute on sp_AddHouseOwner to IdCreator
grant execute on Sp_AcceptanceOfTransferRequest to IdCreator
grant execute on Sp_AddEmergencyContact to IdCreator
grant execute on Sp_CheckExpirationStatus to IdCreator
grant execute on Sp_AddKebele to IdCreator
grant execute on Sp_AddResidentAddress to IdCreator
grant execute on Sp_AddKebeleEmployee to IdCreator
grant execute on Sp_RenewalPayment to IdCreator
grant execute on CheckForLostStatus to IdCreator
grant execute on PaymentForLostId to IdCreator
grant execute on Sp_addResidentToTransferTable to IdCreator
grant execute on Sp_checkApprovalStatus to IdCreator
grant execute on Sp_AddDependents to IdCreator




grant select on viewsForKebeles.view_RenewalPayment to FinanceEmployee
grant select on viewsForKebeles.view_CreationPayment to FinanceEmployee
grant select on viewsForKebeles.view_LostPayment to FinanceEmployee



grant select on Kebele to cityAdmin
grant select on Resident to cityAdmin
grant select on ResidentAddress to cityAdmin
grant select on EmergencyContact to cityAdmin
grant select on KebeleOfficials to cityAdmin
grant select on KebeleResidentID to cityAdmin
grant select on Transfer to cityAdmin
grant select on LostPayment to cityAdmin
grant select on RenewalPayment to cityAdmin
grant select on PaymentForIdCreation to cityAdmin
grant select on Map to cityAdmin
grant select on HouseOwner to cityAdmin
grant select on LivingYearOfResident to cityAdmin
grant select on Dependents to cityAdmin




grant execute on fn_AgeCalculator to cityAdmin
grant select on fn_kebelesOfSubcities to cityAdmin
grant execute on fn_NumberOfKebele_subcity to cityAdmin
grant execute on fn_CountTransferRequest to cityAdmin
grant execute on fn_CountApprovedTransferRequestsPerDay to cityAdmin
grant execute on fn_CountRejectedTransferRequestsPerDay to cityAdmin
grant select on fn_FetchDependentsOnTheSameHouseNumber to cityAdmin
grant select on fn_NameOfKebeles_Subcity to cityAdmin
grant execute on fn_NumberOfHouseinKebele to cityAdmin
grant execute on fn_NumberOfHouseinSubcity to cityAdmin
grant execute on fn_NumberOfPeopleinGivenHouse to cityAdmin
grant execute on fn_NumberOfEmployeesinKebele to cityAdmin
grant execute on fn_NumberOfEmployeesinSubcity to cityAdmin
grant select on fn_GetNumberOfStaffInEachKebele to cityAdmin
grant execute on fn_IdentityCardGivenPerDay to cityAdmin
grant execute on fn_NumberOfPeopleInSubCity to cityAdmin
grant execute on fn_NumberOfPeopleInKebele to cityAdmin
grant execute on fn_NumberOfLegalResidentsInKebele to cityAdmin



grant control to DBadmin with grant option


create table Kebele(
    kebeleCode int IDENTITY(1,1) primary key not null,
    kebeleNo int ,
    kebeleName varchar(20),
    SubCity varchar(20)

) 

--Executed

  create table Resident(
    ResidentID int IDENTITY(1, 1) primary key not null,
    Name varchar(20),
    FName varchar(20),
    GFName varchar(20),
    DOB Date,
    POB varchar(20),
    sex char,
    PhoneNo varchar(20),
    CitizenShip varchar(20),
    Job varchar(20),
    MaritialStatus varchar(10),
    BloodType varchar(5),
    MotherName varchar(10),
    Photo varbinary(max)
) 

create schema viewsForKebeles


--Executed

  create table ResidentAddress(
    RID int not null,
    SubCity varchar(20),
    kCode int ,
    HouseNo int,
    FixedLinePhoneNo varchar(20)
    constraint fk_RA foreign key (RID) references Resident(ResidentID),
    constraint fk_RA2 foreign key (kCode) references Kebele (kebeleCode)
) 

--Executed 

  create table EmergencyContact(
    RID int not null,
    EmName varchar(20),
    EmFName varchar(20),
    EmGFName varchar(20),
    EmPhone varchar(20),
    constraint fk_EC foreign key(RID) references Resident (ResidentID)
) 

--Executed


  create table KebeleOfficials(
    EID int IDENTITY(100,1) primary key not null,
    EName varchar(20),
    EFName Varchar(20),
    EGFName VARCHAR(20),
    RID int not null,
    kCode int not null,
    SubCity varchar(20) NOT NULL,
    constraint fk_KE foreign key (kcode) references Kebele(kebeleCode),
    constraint fk_KE2 foreign key (RID) REFERENCES Resident(ResidentID)
) 

--Executed

  create table KebeleResidentID(
    KRI int IDENTITY (1,1) PRIMARY KEY NOT NULL,
    RID int not null,
    EID int not null,
    kCode int not null,
    StartDate Date Default Convert(Date,GETDATE()),
    EndDate Date Default Convert( Date,DATEADD(YEAR,3,GETDATE())),
    ExpirationStatus varchar(20) Default 'Active',
    isLost int Default 0,
    constraint fk_KRI foreign key(RID) references Resident(ResidentID),
    constraint fk_KRI2 foreign key (EID ) REFERENCES KebeleOfficials(EID),
    constraint fk_KRI3 foreign key (kCode) references kebele(kebeleCode)
) 

--Executed

  create table Transfer(
    TransferID int IDENTITY(1000,100) primary key not null,
    RID int not null,
    DepartedKebele int,
    DepartedSubcity varchar(20),
    DestinationKebele int,
    DestinationSubcity varchar(20),
    GivenDate Date default convert(DATE,GETDATE()),
    ExpDate Date default convert(DATE,DATEADD(DAY,7,GETDATE())),
    ExpStatus varchar(20) Default 'Active',
    isApproved int Default 0,
    constraint fk_Me foreign key (RID) references Resident(ResidentID),
    constraint fk_Me2 foreign key (DepartedKebele) references Kebele(kebeleCode),
    constraint fk_Me3 foreign key (DestinationKebele) references Kebele(kebeleCode)
)

--Executed

 create table LostPayment(
    LPID int IDENTITY(100, 1) primary key not null,
    RID int not null,
    EID int not null,
    TotalFee int,
    constraint fk_LP foreign key(RID) references Resident(ResidentID),
    constraint fk_LP1 foreign key(EID) references KebeleOfficials(EID)
) 

--Executed

 create table RenewalPayment(
    RPID int IDENTITY(50, 1) primary key not null,
    RID int not null,
    EID int not null,
    TotalFee int,
    constraint fk_RP foreign key(RID) references Resident(ResidentID),
    constraint fk_RP1 foreign key(EID) references KebeleOfficials(EID)
) 

--Executed

 create table PaymentForIdCreation(
    CPID int IDENTITY(150, 1) primary key not null,
    RID int not null,
    EID int not null,
    TotalFee int,
    constraint fk_CP foreign key(RID) references Resident(ResidentID),
    constraint fk_CP1 foreign key(EID) references KebeleOfficials(EID)
)

--Executed
 create table Map(
    MapId int IDENTITY(1,1) primary key not null,
    RID int not null,
    kCode int not null,
    constraint fk_Map foreign key (RID) REFERENCES Resident(ResidentId),
    constraint fk_Map2 foreign key (kCode ) references Kebele(kebeleCode)
)
 
  create table HouseOwner(

    MResidentID int not null,
    MapCode int constraint fk_H02 foreign key (MapCode) References Map(MapId),
    constraint fk_HO1 foreign key(MResidentID) references Resident(ResidentID)
)


create table LivingYearOfResident(
   LYOR int IDENTITY(200,10) primary key not null,
   RID int not null,
   kCode int not null ,
   startDate Date,
   EndDate Date,
   CONSTRAINT Fk_LYOR FOREIGN key (RID) REFERENCES Resident(ResidentID),
   constraint Fk_LYOR2 foreign key(kCode) REFERENCES Kebele(kebeleCode)

)


Create table Dependents(
  DpCode int IDENTITY(1,1) primary key,
  RID int not null,
  DependentId int,
  DependencyType varchar(20)
  constraint fk_Dependents foreign key (RID) references Resident(ResidentID),
  constraint fk_Dependents1 foreign key(DependentId) references Resident(ResidentID) 
)



         --------------------------Procedures-----------------------------------
   
       --Procedure for Adding kebeles 
   
   create Procedure Sp_AddKebele(@kebeleNo int ,@kebelename varchar(20),@subname varchar(20))
      AS
      BEGIN
      insert into Kebele values (@kebeleNo,@kebelename,@subname)
      END

      exec Sp_AddKebele 01,'Midre Genet','Tana'
      exec Sp_AddKebele 03,'Hidasie','Tana'
      exec Sp_AddKebele 02,'Yetebaberut','Tana'
      exec Sp_AddKebele 05,'Hidasie','Tana'
      exec Sp_AddKebele 03,'Finote','Dagmawi Minilik'
      exec Sp_AddKebele 04,'Balegziabher','Dagmawi Minilik'
      exec Sp_AddKebele 05,'Finote','Dagmawi Minilik'
      exec Sp_AddKebele 04,'Addis Alem','Ayer Tena'
      exec Sp_AddKebele 07,'Diaspora','Ayer Tena'
      exec Sp_AddKebele 01,'Bata' , 'Belay Zeleke'
      exec Sp_AddKebele 03,'Weramit','Belay Zeleke'
      exec Sp_AddKebele 09,'Sar Mender','Belay Zeleke'

                                 
    --procedure for adding Resident of kebelles
    

    create Procedure Sp_AddResident(@name varchar(20), @fname varchar(20),@GFName varchar(20),@dob Date,@pob varchar(20),@sex char,@Phone varchar(20),@CitizenShip varchar(20),@job varchar(20),@MaritialStatus varchar(10),@BloodType varchar(5),@MotherName varchar(20))
      AS
      begin
      insert into Resident values(@name,@fname,@GFName,@dob,@pob,@sex,@phone,@CitizenShip,@job,@MaritialStatus,@BloodType,@MotherName)
      end

    insert into Resident values ('Ermias','Sintayehu','Deresse','2001-11-24','Bahir Dar','M','0936744962','Ethiopian','Software Engineer','Single','B+','Zewdie ',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Samuel','Sintayehu','Deresse','1995-10-27','Bahir Dar','M','0918266980','Ethiopian','Architect','Married','B+','Zewdie ',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Dagim','Gizachew','Astatkie','2001-03-22','Bahir Dar','M','096290648','Ethiopian','Software Engineer','single','O+','Tsgie ',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Nathnael','Theodros','Bekaffa','2001-03-10','Bahir Dar','M','0988540010','Ethiopian','Software Engineer','single','A-','Enana ',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Abaynesh','Abebe','Birhanu','1990-03-25','Addis Abeba','F','0911111111','Ethiopian','Janitor','Married','AB-','Felekech',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Aklil','Wondemagegn','Medihn','1995-04-22','Wolliso ','M','0909090909','Ethiopian ','Lecturer','Married','O-','Yamrot',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Aster ' ,'Yismaw','Woldegebriel','1970-11-02','Gondar','F','0910101015','Ethiopian','contaractor','Widowed','B-','Tsedale',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Elias','Desalegn','Taye','2001-7-30','Bahir Dar','M','0982828282','Ethiopian','Medical Doctor','single','B+','Ayalenesh ',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Amanuel','yaregal','Geremew','2003-10-27','Bahir Dar','M','0925391920','Ethiopian','Cameraman','single','A-','Eyerusalem ',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Amsalu','Tefera','Alemu','1991-10-12','Azezo','M','0918285956','Ethiopian','Merchant','single','O+','Bizualem ',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Shalom','wubu','Getahun','2002-03-10','Jemo','M','09838485','Ethiopian','Software Engineer','Married','A-','Aberash ',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Lucy','Abegaz','Demissie','1960-03-25','Debre Markos','F','0910111111','Ethiopian','Electrical Engineer','Married','AB-','Birtukan',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Gadissa','Mebratu','Medihn','1998-07-04','Ambo ','M','0909101009','Ethiopian ','Football Player','Married','O-','Lemlem',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident values ('Menen ','Dimamu','Demeke','2004-11-02','Gondar','F','0910102020','Ethiopian','Civil Servant','single','B-','mihiret',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident VALUES ('Betel','Abenet','Mesfin','2000-12-03','Hamusit','F','0912101212','Ethiopian','Merchant','single','B-','Aregash',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t))
    insert into Resident Values ( 'Helen','Habte','Eyobel','1998-12-11','Addis Abeba','F','0912191212','Ethiopian','Merchant','single','B-','Aregash',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident Values ('Fekerte','Alemayehu', 'Efrem','2008-12-11','Addis Abeba','F','0912121812','Ethiopian','Sculptor','single','B-','Aregash',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident Values ('Almaz','GebreGiorgis','Fikremariam','1998-12-11','Addis Abeba','F','0912181212','Ethiopian','Merchant','single','B-','Aregash',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 
    insert into Resident Values ( 'Eyassu', 'Estifanos', 'Metaferia', '1988-12-11','Addis Abeba','M','0912121219','Ethiopian','Merchant','single','B-','Aregash',(select * from openrowset(BULK 'D:\download.jpg',single_Blob)as t)) 


  Create  procedure Sp_AddResidentAddress(@id int,@subname varchar(20),@kebele varchar(20),@House int,@FixedLinePhone varchar(20))
    AS
    BEGIN
    insert into ResidentAddress values (@id,@subname,@kebele,@House,@FixedLinePhone)
    end
    select * from Resident
    select * from kebele 
    
     exec Sp_AddResidentAddress 1,'Tana',1,102,'+2510582209093'
     exec Sp_AddResidentAddress 2,'Tana',3,302,'+2510582209073'
     exec Sp_AddResidentAddress 3,'Dagmawi Minilik',7,39,'+2510582219093'
     exec Sp_AddResidentAddress 4,'Dagmawi Minilik',5,402,'+2510582229093'
     exec Sp_AddResidentAddress 5,'Tana',1,100,'+2510582201093'
     exec Sp_AddResidentAddress 6,'Tana',1,45,'+2510582207093'
     exec Sp_AddResidentAddress 7,'Belay Zeleke',10,506,'+2510582204093'
     exec Sp_AddResidentAddress 8,'Belay Zeleke',10,102,'+2510582203093'
     exec Sp_AddResidentAddress 9,'Ayer Tena',8,702,'+2510582209073'
     exec Sp_AddResidentAddress 10,'Ayer Tena',8,139,'+2510582219093'
     exec Sp_AddResidentAddress 11,'Ayer Tena',9,702,'+2510582229093'
     exec Sp_AddResidentAddress 12,'Dagmawi Minilik',7,100,'+2510582201093'
     exec Sp_AddResidentAddress 13,'Tana',1,42,'+2510582211093'
     exec Sp_AddResidentAddress 14,'Tana',3,206,'+2510582267193'
     exec Sp_AddResidentAddress 15,'Tana',3,206,'+2510582201093'
     exec Sp_AddResidentAddress 16,'Tana',3,206,'+2510582201812'
     exec Sp_AddResidentAddress 17,'Belay Zeleke',10,102,'+2510582261712'
     exec Sp_AddResidentAddress 18,'Ayer Tena',8,139,'+2510582201612'
    --to insert the emergency contact information of a resident undeer EmergencyContact Table
    
  create procedure Sp_AddEmergencyContact (@RID int,@EName Varchar(10),@EmFName varchar(20),@EmGFName varchar(20),@EmPhone varchar(20))
    AS
    begin
      insert into EmergencyContact values( @RID,@EName,@EmFName,@EmGFName,@EmPhone) 
    end

    Exec Sp_AddEmergencyContact 1,'Sintayehu ','Deresse ','Kassa','0911065433'
    Exec Sp_AddEmergencyContact 2,'Sintayehu ','Deresse ','Kassa','0911065433'
    Exec Sp_AddEmergencyContact 3,'Gizachew ','Astatkie ','Ejigu','0932275767'
    Exec Sp_AddEmergencyContact 4,'Enana','Bayabel ','Kassa','0988909090'
    Exec Sp_AddEmergencyContact 5,'Baye','Mekashaw','Sitoraw','0987909090'
    Exec Sp_AddEmergencyContact 6,'Fikadu','Worku ','Alebel','0972909090'
    Exec Sp_AddEmergencyContact 7,'Desalegn','Debebe ','Gurara','0968909090' 
    Exec Sp_AddEmergencyContact 8,'Desalegn','Taye ','Bimerew','0911063023'
    Exec Sp_AddEmergencyContact 9,'Yaregal ','Geremew ','Abraham','0911090909'
    Exec Sp_AddEmergencyContact 10,'Tefera ','Alemu','worku','0966314600'
    Exec Sp_AddEmergencyContact 11,'Wubu','Getahun ','Feleke','0925252525'
    Exec Sp_AddEmergencyContact 12,'Abegaz','Demissie','Ashagrie','0914909090'
    Exec Sp_AddEmergencyContact 13,'Mebratu','Medihn','Aleka','0972181790'
    Exec Sp_AddEmergencyContact 14,'Dimamu','Demeke ','Samuel','0920212223'
    Exec Sp_AddEmergencyContact 15,'Amsalu','Dibaba','Gashaw','0920212227'
    Exec Sp_AddEmergencyContact 16,'Elsabeth','Eskinder','Mekuriya','0920212228'
    Exec Sp_AddEmergencyContact 17,'Bizunesh','Isayas','Adugna','0920212229'
    Exec Sp_AddEmergencyContact 18, 'Dagmawit', 'Abiy', 'Liku', '0920212240'

      -- Procedure for adding kebeleEmployee

    CREATE PROCEDURE Sp_AddKebeleEmployee(@Ename varchar(20),@EFName varchar(20),@EGFName varchar(20),@RID int,@KCode int,@subname varchar(20))
        AS
       begin
       insert into KebeleOfficials values (@Ename,@EFName,@EGFName,@RID,@KCode,@subname)
       END

    Exec Sp_AddKebeleEmployee 'Abaynesh','Abebe','Birhanu',5,1,'Tana'
    Exec Sp_AddKebeleEmployee 'Elias','Desalegn','Taye',8,10,'Belay Zeleke'
    Exec Sp_AddKebeleEmployee 'Lucy','Abegaz','Demissie',12,7,'Dagmawi Minilik'
    Exec Sp_AddKebeleEmployee 'Amsalu','Tefera','Alemu',9,8,'Ayer Tena'

  
 -- procedure for adding values into map table 
     create procedure Sp_AddMap (@RID int,@kCode int)
         AS
        BEGIN
        insert into Map values (@RID,@kCode)
        End




   -- procedure for adding Data to House Owner table 

      create procedure Sp_AddHouseOwner (@MRID int ,@MapCode int)
         AS
        BEGIN
            insert into HouseOwner values (@MRID, @MapCode)
        END
   

   --- procedure for adding kebele resident id
     alter procedure AddKebeleResidentId(@RID int ,@EID int)
          as 
         begin
         declare @kebeleCode INT
         declare @kebeleeCode1 int
         declare @MapKebele int
         set @kebeleCode=(select kCode from viewsForKebeles.view_KebeleOfficials where EID=@EID)
         set @kebeleeCode1=(select kCode from viewsForKebeles.view_ResidentAddress where RID=@RID)
         set @MapKebele =(select kCode from viewsForKebeles.view_Map where MapId in (select MapCode from  viewsForKebeles.view_HouseOwner  where MResidentID=@RID))
         IF((@MapKebele )= (@kebeleeCode1))
              begin
           if((@kebeleCode)=(@kebeleeCode1))
               begin
                if((select RID from viewsForKebeles.view_KebeleOfficials where EID=@EID) ! =@RID)
                  insert into KebeleResidentID values (@RID,@EID,@MapKebele,convert(DATE,GETDATE()),CONVERT(DATE,DATEADD(YEAR,3,GETDATE())),'Active',0)
                 ELSE
                  PRINT 'You can not give your self an Identity card'
                end
                ELSE
                print 'The official cant give you the identity card'
           end
                else
                print 'You have not submitted appropriate Map '
          END

          Exec AddKebeleResidentId 1,100
          select * from Resident
          select * from ResidentAddress
          select * from KebeleOfficials
          select * from Map 
      insert into Map values (8,1)
      insert into HouseOwner values (1,1)
      select * from HouseOwner
      -- procedure for checking the Expiration status----------------------------

    create procedure Sp_CheckExpirationStatus (@RID INT)
         as
        BEGIN
          UPDATE KebeleResidentID set ExpirationStatus='Expired' where RID=@RID AND EndDate< convert(Date,GETDATE())
        end



    --Procedure for Renewal of identity card 

   create procedure Sp_RenewalPayment  (@RID int , @EID int)
     as 
     BEGIN
     declare @kebeleCode INT
     declare @kebeleeCode1 int
     set @kebeleCode=(select kCode from viewsForKebeles.view_KebeleOfficials where EID=@EID)
     set @kebeleeCode1=(select kCode from viewsForKebeles.view_ResidentAddress where RID=@RID)
        if((Select ExpirationStatus from viewsForKebeles.view_kebeleResidentID where RID=@RID)='Expired')
            BEGIN
           if((@kebeleCode)=(@kebeleeCode1))
              Update KebeleResidentID set EndDate=CONVERT(DATE,DATEADD(YEAR,3,GETDATE())) , ExpirationStatus='Active',EID=@EID where RID=@RID
           else
              print('The Employee and the Resident are not on the same kebele')
     END 
  
  end


   
   ---------------Procedure for checking the lost status of an Identity card-----------------------
    
    Create Procedure CheckForLostStatus(@RID int)
        AS
        BEGIN
            update KebeleResidentID set isLost=1 where RID=@RID
        end


    --------------Procedure for Lost Identity Card--------------------------------

    create Procedure  PaymentForLostId (@RID int, @EID int )
        AS
        BEGIN
        declare @kebeleCode INT
        declare @kebeleeCode1 int
        set @kebeleCode=(select kCode from viewsForKebeles.view_KebeleOfficials where EID=@EID)
        set @kebeleeCode1=(select kCode from viewsForKebeles.view_ResidentAddress where RID=@RID)
            if((Select isLost from viewsForKebeles.view_kebeleResidentID where RID=@RID)=1)
            BEGIN
                if((@kebeleCode)=(@kebeleeCode1))
                    Update KebeleResidentID set EndDate=CONVERT(DATE,DATEADD(YEAR,3,GETDATE())) ,ExpirationStatus='Active' ,isLost=0 where RID=@RID
                else
                    print('The Employee and the Resident are not on the same kebele')
        END
		end
 

         
        ----------- procedure for checking the status of Transfer Request------------------

        create procedure Sp_addResidentToTransferTable (@RID int,@DepartedKcode int ,@DepartedSubcity varchar(20),@DestKcode int ,@DestSubcity varchar(20))
          AS
            BEGIN
              insert into Transfer values (@RID,@DepartedKcode,@DepartedSubcity,@DestKcode,@DestSubcity ,Convert(DATE,GETDATE()),Convert(DATE,DATEADD(day,7,GETDATE())),'Active',0 )  
            END
            exec Sp_addResidentToTransferTable 3,7,'Dagmawi Minilik',1,'Tana'

         -------------Procedure for checking the approval status-------------------

        create procedure Sp_checkApprovalStatus(@RID INT )
          AS
           BEGIN
              update Transfer set isApproved=1 where RID=@RID
           END
           exec Sp_checkApprovalStatus 3

       ---------------Procedure for Acceptance of transfer request------------------
      
       create procedure Sp_AcceptanceOfTransferRequest(@RID int ,@EID int,@HouseNo int )
          as 
          BEGIN 
          declare @kebeleeCode1 int
          declare @MapKebele int
          set @kebeleeCode1=(select kCode from viewsForKebeles.view_ResidentAddress where RID=@RID)
          set @MapKebele =(select kCode from viewsForKebeles.view_Map where MapId in (select MapCode from  viewsForKebeles.view_HouseOwner  where MResidentID=@RID))
              if(((select isApproved from Transfer where RID=@RID )=(1)) AND ((select ExpStatus from Transfer Where RID=@RID)=('Active')))
                BEGIN
                  if((select Kcode from viewsForKebeles.view_KebeleOfficials where EID=@EID )=(select DestinationKebele from Transfer where RID=@RID))
                      Begin
       
                      if((@MapKebele )= (select DestinationKebele from Transfer where RID=@RID))
                          begin
                            update KebeleResidentID set kCode=@MapKebele ,EID=@EID , StartDate=convert(Date,GETDATE()),EndDate=convert(DATE,DATEADD(YEAR,3,GETDATE())), ExpirationStatus='Active'  where RID=@RID
                            update ResidentAddress set SubCity=(select DestinationSubcity from Transfer where RID=@RID),kCode=(select DestinationKebele from Transfer where RID=@RID ),HouseNo=@HouseNo where RID=@RID
                            end 
                      ELSE
                            print('You do not provide the necessary requirements')
                            end
                      ELSE
                            print('The employee doesnt work on the destined kebele')
                  End
              else
                  print('you are not approved from your previous kebele')

          END
          insert into Map Values (9,1)
          INSERT into HouseOwner values (3,3)
          delete from HouseOwner where MapCode=2
          select * from Map
          select * from HouseOwner
          exec Sp_AcceptanceOfTransferRequest 3,100,102
          select * from Transfer
          select * from KebeleOfficials
          select * from KebeleResidentID
          select * from view_ResidentAddress
          select * from view_KebeleResidentID
      -- Procedure for adding dependents and other kinds of relationships
      
      create procedure Sp_AddDependents(@RID int, @DependentId int, @DependencyType varchar(20))
        AS
        BEGIN
          declare @HouseNo INT
          declare @HouseNum INT
          declare @kebeleNum INT
          declare @kebeleNumber INT
          set @HouseNo=(select HouseNo from viewsForKebeles.view_ResidentAddress where RID=@RID)
          set @HouseNum=(select HouseNo from viewsForKebeles.view_ResidentAddress where RID=@DependentId)
          set @kebeleNum=(select kCode from viewsForKebeles.view_ResidentAddress where RID=@RID)
          SET @kebeleNumber=(select kCode from viewsForKebeles.view_ResidentAddress where RID=@DependentId)
            if((@kebeleNum)=(@kebeleNumber))
              BEGIN
                if((@HouseNo)=(@HouseNum))
                  insert into Dependents values (@RID,@DependentId,@DependencyType)
                 else 
                   print('You do not belong to the same House Number')
              END
            ELSE 
                print('you do not belong to the same kebele')
          END
      
      Exec Sp_AddDependents 3,7 , 'Brother'
      select * from ResidentAddress


       -------------------------Triggers --------------------------------



         --  trigger for adding person to living year of resident

            create trigger tg_AddPersonToLivingYearOfResident 
                on KebeleResidentID
                after update  
                as 
                BEGIN
                    if (update(kCode) and update(StartDate) and update(EndDate) and update(ExpirationStatus) and update(EID))
                      begin
                        declare @x int
                        declare @y int 
                        declare @TotalFee INT
                        declare @Kcode int 
                        declare @Start DATE
                        declare @End Date
                        set @TotalFee=25
                        select @x=RID ,@Kcode=  kCode, @start=StartDate, @End=EndDate  from Deleted
                        select @y=EID from inserted
                        insert into PaymentForIdCreation values(@x,@y,@TotalFee)
                        insert into LivingYearOfResident values (@x,@Kcode,@Start,@End) 
                    end
                END




          --Trigger for Id creation payment 

             create trigger tg_IdPayment
                  on KebeleResidentID
      
                  after insert as
                     begin
      
                       declare @ResidentId int
                       declare @EmployeeId int
                       declare @KRI INT
                       declare @TotalFee INT
                       set @TotalFee=25
                       select @ResidentId=RID ,@EmployeeId=EID,@KRI=KRI from inserted
                       if exists (select * from KebeleResidentID where RID = @ResidentId and KRI != @KRI)
                          begin
                            delete from KebeleResidentID where KRI = @KRI
                            raiserror('Identity card already exists', 16, 1)
                          end 
                       else
                          insert into   PaymentForIdCreation VALUES (@ResidentId,@EmployeeId,@TotalFee)
                     END


     -- trigger for renewal payment  of identity card
     
       create trigger tg_RenewalPaymentID
          on KebeleResidentID
          after UPDATE 
          as 
          BEGIN
              if(UPDATE(EndDate) and update(ExpirationStatus) and not update(isLost) and not update(kCode))
                  begin 
                    declare @ResidentId int
                    declare @EmployeeId int 
                    declare @TotalFee INT
                    set @TotalFee=10
                    select @ResidentId=RID ,@EmployeeId=EID from inserted
                    insert into RenewalPayment values(@ResidentId,@EmployeeId,@TotalFee    ) 

              end

          END

        -- trigger for Lost payment 

        create Trigger tg_PaymentForLostId
            on KebeleResidentId
            after UPDATE
            as
            BEGIN
                if(update(isLost) and update(EndDate) and update(ExpirationStatus))
                  BEGIN
                    declare @ResidentId int
                    declare @EmployeeId int 
                    declare @TotalFee INT
                    set @TotalFee=30
                    select  @ResidentId=RID , @EmployeeId=EID from inserted
                    insert into LostPayment values(@ResidentId,@EmployeeId,@TotalFee) 
                  END

            END

      ------------------triggers to avoid deleting from payment table ------------

       create trigger avoid_Deleting
         on PaymentForIdCreation 
         for Delete
         AS
         BEGIN
             PRINT 'You can not delete from this table'
             rollback TRANSACTION
             end

       create trigger avoid_Deleting_Renew
         on RenewalPayment for Delete
         AS
         BEGIN
            print 'You can not delete from this table'
            rollback transaction
         end
         
         create trigger avoid_Deleting_Lost
           on LostPayment 
           for Delete
             AS
            BEGIN
              print 'You can not delete from this table'
              ROLLBACK TRANSACTION
        
            END
          
          create trigger avoid_Deleting_Kebele
            on kebele 
            for Delete
            As 
            begin 
              print 'You can not delete from this table '
              Rollback TRANSACTION

            END

            ------------Trigger to delete the exisisting HouseOwner information-------
            
           create trigger tg_avoid_InsertingSameIdInHouseOwner
              on HouseOwner 
              after insert
              AS
              BEGIN 
                  declare @RID int
                  declare @MapCode INT
                  set @RID= (select MResidentID from inserted )
                  set @MapCode=(select MapCode from inserted)
                      if exists (Select * from HouseOwner where MResidentID=@RID and MapCode!=@MapCode)  
                        begin 
                          Delete from HouseOwner where MResidentID=@RID and MapCode!=@MapCode
                        END
               End
         


   -------------------------Views-------------------------------------------

     -------------view for storing old aged people----------

        create view AgeOfResidents
          as 
          select Name,FName,GFName from Resident where datediff(year,DOB,convert(Date,GETDATE()))
      
      
      -------------------view for storing old aged people -----------
        
        
        create view Old_Residents 
           AS
          select Name,FName ,GFName from Resident where datediff(year,DOB,convert (date,GETDATE()))> 59


      ---------------------view for storing Adult people---------------
        
        create view Adult_Resident
          AS
          select Name,FName,GFName  from Resident where datediff(year,DOB,convert (date,GETDATE()))> 40 and datediff(year,DOB,convert (date,GETDATE()))<59

      --------------------view for storing youth of a given kebele --------------

        create view youth_Residents
          AS
         select Name,FName,GFName from Resident where datediff(year,DOB,convert (date,GETDATE()))> 18 and datediff(year,DOB,convert (date,GETDATE()))<40

     select * from ResidentAddress
    select * from KebeleOfficials
    insert into KebeleResidentID values (3,102,7,'2023-02-12','2026-02-12','Active',0)
    select * from KebeleResidentID
     
     --------------------------Functions-------------------------------
     
    ---------------functions for deriving the age of a resident---------


     create function fn_AgeCalculator (@RID INT)
       returns INT
         as
         BEGIN
             declare @DOB Date
             declare @age int
             declare @givenDate Date

             set @DOB= (select DOB from Resident where ResidentID=@RID )
       
            
            return DATEDIFF(year,@DOB,Convert(Date,getDate()))
        End
         
    -------------------function for showing the kebeles of a given subcity 
       
       create function fn_kebelesOfSubcities(@SubCity varchar(20))
          returns table 
          return select * from ResidentAddress where SubCity=@SubCity
        

       ------------------function for showing the number of kebeles on a given subcity--------------
        create function fn_NumberOfKebele_subcity(@subcity varchar(20))
             returns int 
             as
             begin 
                 declare @Count int
                 set @Count=(select Count (kCode) from ResidentAddress where SubCity=@subcity )
                 return @Count 
             end


             -- Function to count the number of Transfer requests per day

         create function fn_CountTransferRequest(@Date date)
           returns int
              as
              begin
                declare @Count int
                set @Count = (select count(TransferID) from Transfer where GivenDate = @Date)
                return @Count
              end


----------- Function to count the number of approved Transfer requests per day-------------

         create function fn_CountApprovedTransferRequestsPerDay(@Date date)
            returns int
            as  
            begin
                declare @Count int
                  set @Count = (select count(TransferID) from Transfer where GivenDate=@Date and isApproved=1)
                return @Count
            end



-------------- Function to count the number of rejected transfer requests per day------------------------

        create function fn_CountRejectedTransferRequestsPerDay(@Date date)
          returns int
          as
          begin
              declare @Count int 
                 set @Count = (select count(TransferID) from Transfer where GivenDate=@Date and isApproved=0)
              return @Count
          end


--------------------------------function to fetch dependents ----------------------

          create function fn_FetchDependentsOnTheSameHouseNumber(@kCode int ,@HouseNo int)
          returns TABLE
          return (select * from ResidentAddress where HouseNo=@HouseNo and kCode=@kCode)
          


------------------------inline function for showing the KebeleName of a given subcity------------------------------------------------------
          
          create function fn_NameOfKebeles_Subcity(@subname varchar(20))
          returns table
          return select kebeleName from Kebele where SubCity=@subname
       
       --------------function for showing the number of houses in a given kebele---------

        create function fn_NumberOfHouseinKebele(@kCode int )
          returns int 
           as 
             BEGIN
                  declare @Count int
                  set @Count=(select Count(HouseNo) from ResidentAddress where kCode=@kCode) 
                  return @Count
            end
        
        --------------function for showing the number of houses in a subcity------- 

        create function fn_NumberOfHouseinSubcity(@Subname varchar(20))
           returns int 
            as
              Begin
                  declare @count int
                  set @count =(select Count(HouseNo) from ResidentAddress where SubCity=@Subname)
                  return @count
             End

      -------------------function to derive the number of people under a given subcity ---------

         create function fn_NumberOfPeopleinGivenHouse(@kCode int,@HouseNo int)
           returns int 
             as 
            Begin
              declare @count INT
              set @count =(select Count (RID) from ResidentAddress where kCode=@kCode and HouseNo=@HouseNo)
              return @count
            End

            ----------------------function to show the kebele offcials who work on a given kebele-------- 
          
          create function fn_NumberOfEmployeesinKebele (@kcode int)
            returns int
             as
                Begin
                  declare @count int 
                  set @count =(select count (EID) from KebeleOfficials where kCode=@kcode)
                  return @count
                 End 
          
          ---------function to show the number of kebele officials who work on a given subcity-------

          create function fn_NumberOfEmployeesinSubcity (@Subname varchar(20))
             returns int
             as
               Begin 
                Declare @count INT
                set @count =(select count(EID) from KebeleOfficials where SubCity=@Subname )
                 return @count
                End

          -------------function to show the summary of kebele officials in each kebele-----  
            create function fn_GetNumberOfStaffInEachKebele()
              returns @OfficialSummary table (kCode int, kebeleName varchar(50), NumberOfStaff int)
                as
                begin
                  insert into @OfficialSummary
                  select kCode,kebeleName,count(EID) from KebeleOfficials inner join Kebele on Kebele.kebeleCode = KebeleOfficials.kCode group by kCode,kebeleName
                  return
                 end

              --------------function to calculate the number of identity card given per day------

            create function fn_IdentityCardGivenPerDay(@Date Date)
                returns int
                  as
                  begin 
                    declare @count int
                    set @count= (select count(RID) from KebeleResidentID where StartDate=@Date )
                    return @count
                  end  
         
         -------------function to calculate the number of people in the subcity ------

             create function fn_NumberOfPeopleInSubCity (@subname varchar(20))
                returns int
                as 
                begin
                  declare @count int 
                  set @count=(select count (RID) from ResidentAddress where SubCity=@subname)
                  return @count
                end
              
         ----------------function to calculate the number of people in the kebele------

              create function fn_NumberOfPeopleInKebele (@kCode int)
                returns int 
                as
                begin 
                    declare @count int 
                    set @count =(select count(RID) from ResidentAddress where kCode=@kCode)
                    return @count 
                end


            create function fn_NumberOfLegalResidentsInKebele (@kCode int)
                returns int 
                as 
                begin 
                    declare @count int 
                    set @count=(Select count(RID) from KebeleResidentID where kCode=@kCode)
                    return @count
                end



                   create view viewsForKebeles.view_Resident
                         as
                      select * from Resident where ResidentID in( select RID from ResidentAddress where kCode=1)

                      SELECT * FROM view_Resident
                     
                      create view viewsForKebeles.view_ResidentAddress
                       AS
                       select * from ResidentAddress where kCode=1

                      select * from view_ResidentAddress
                 
                    create view viewsForKebeles.view_EmergencyContact 
                    as
                    select * from EmergencyContact where RID in (select RID from ResidentAddress where kCode=1)

                    create view viewsForKebeles.view_KebeleOfficials
                    as
                    select * from KebeleOfficials where kCode=1
                    select * from view_KebeleOfficials
                    create view viewsForKebeles.view_Dependents 
                    as
                    select * from Dependents where RID in (select RID from ResidentAddress where kCode=1)
                 
                    create view viewsForKebeles.view_Transfer
                    as
                    select * from Transfer where DepartedKebele=1 or DestinationKebele=1
                   
                    create view viewsForKebeles.view_KebeleResidentID 
                    as
                    select * from KebeleResidentID where kCode=1

                    select * from view_KebeleResidentID

                    create view viewsForKebeles.view_Map
                    as
                    select * from Map where kCode=1

                    create view viewsForKebeles.view_HouseOwner 
                    as
                    select * from HouseOwner where MapCode in( select MapId from Map where kCode=1)

                    create view viewsForKebeles.view_RenewalPayment
                    as
                    select * from RenewalPayment where RID in (SELECT RID from ResidentAddress where kCode=1)

                    create view viewsForKebeles.view_CreationPayment
                    as
                    select * from PaymentForIdCreation where RID in (SELECT RID from ResidentAddress where kCode=1)
                     
                     create view viewsForKebeles.view_LostPayment
                       as               
                    select * from LostPayment  where RID in (SELECT RID from ResidentAddress where kCode=1)
                          
                     
                     create view viewsForKebeles.view_LivingYearOfResident 
                     as
                     select * from LivingYearOfResident where kCode=1
                     select * from view_LivingYearOfResident

					