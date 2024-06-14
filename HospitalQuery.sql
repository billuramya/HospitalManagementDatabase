create database Hospital

CREATE TABLE Patient (
    Patient_Id INTEGER PRIMARY key identity(1,1),
    Patient_Name varchar(max),
	Email varchar(max),
    age INTEGER ,
    gender TEXT,
    diagnosis TEXT
);
drop table Patient



--add Patient Details

CREATE PROCEDURE AddPatient
    @Patient_Name VARCHAR(MAX),
	@Email varchar(max),
    @age INT,
    @gender NVARCHAR(10),
    @diagnosis NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Patient (Patient_Name,Email, age, gender, diagnosis)
    VALUES (@Patient_Name,@Email, @age, @gender, @diagnosis);
END;
GO


EXEC AddPatient 'John Doe','Ramya@gmail.com', 30, 'Male', 'Flu';


CREATE PROCEDURE GetAllPatient
    
AS
BEGIN
    select * from  Patient
END;



--update 
alter PROCEDURE UpdatePatient
    @Id INT,
    @Email VARCHAR(MAX) ,
    @Patient_Name VARCHAR(MAX),
    @age INT,
    @gender NVARCHAR(10),
    @diagnosis NVARCHAR(MAX)
AS
BEGIN
    UPDATE Patient
    SET 
        Email = @Email,
        Patient_Name =@Patient_Name,
        age = @age,
        gender =@gender,
        Diagnosis = @diagnosis
    WHERE Patient_Id = @Id;
END;


exec UpdatePatient 1 ,'Anu','venu',11,'ssd','asdf'
-- delete
CREATE PROCEDURE DeletePatient
    @PatientId INT
AS
BEGIN
    DELETE FROM Patient
    WHERE Patient_Id = @PatientId;
END;

--getbyId 
CREATE PROCEDURE GetPatient
    @PatientID INT
AS
BEGIN
    SELECT 
        Patient_Id AS PatientID,
        Patient_Name AS PatientName,
        Email AS PatientEmail,
        Age AS PatientAge,
        Gender,
        Diagnosis
    FROM Patient
    WHERE Patient_Id = @PatientID;
END;

exec GetPatient 1
select * from patient